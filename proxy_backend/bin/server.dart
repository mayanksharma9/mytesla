import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_web_socket/shelf_web_socket.dart';
import 'package:dotenv/dotenv.dart';
import 'package:proxy_backend/security_utils.dart';
import 'package:proxy_backend/tvcp_signer.dart';
import 'package:proxy_backend/tesla_api.dart';
import 'package:proxy_backend/proto/universal_message.pb.dart';
import 'package:proxy_backend/firestore_writer.dart';

// In-memory cache of TVCP signers for VINs
final Map<String, TVCPSigner> signers = {};

dynamic _safeGet(dynamic data, String key) {
  if (data is Map) return data[key];
  if (data is List && data.isNotEmpty) {
      final first = data.first;
      if (first is Map) return first[key];
  }
  return null;
}

void main(List<String> args) async {
  final env = DotEnv(includePlatformEnvironment: true)..load();
  SecurityUtils().init(env);
  final pubHex = SecurityUtils().publicKeyBytes.map((e) => e.toRadixString(16).padLeft(2, '0')).join();
  print('SecurityUtils initialized with Public Key (HEX): ${pubHex.substring(0, 16)}...');

  final firestoreWriter = FirestoreWriter(
    projectId: env['FIRESTORE_PROJECT_ID'] ?? 'myteslat',
    apiKey: env['FIRESTORE_API_KEY'] ?? '',
  );

  final app = Router();
  final teslaApi = TeslaApi();

  app.post('/api/command/<vin>/<command>', (Request request, String vin, String command) async {
    final authHeader = request.headers['authorization'];
    if (authHeader == null || !authHeader.startsWith('Bearer ')) {
      return Response.forbidden('Missing Bearer Token');
    }
    final token = authHeader.substring(7);

    // Get or create signer. A single TVCPSigner holds sessions for BOTH domains
    // (VCSEC and INFOTAINMENT) so we never lose a healthy domain when retrying.
    final vinUpper = vin.toUpperCase();
    signers.putIfAbsent(vinUpper, () => TVCPSigner(vinUpper));
    final signer = signers[vinUpper]!;

    // Regional fleet API base URL forwarded from the Flutter client.
    final fleetBaseUrl = request.headers['x-fleet-api-base-url'];

    try {
      final domain = TVCPSigner.getDomainForCommand(command);

      // Parse request body once before closures capture it.
      final bodyStr = await request.readAsString();
      Map<String, dynamic>? payload;
      if (bodyStr.isNotEmpty) {
        try { payload = jsonDecode(bodyStr) as Map<String, dynamic>; } catch (_) {}
      }

      // ---------------------------------------------------------------------------
      // doHandshakeAndSend
      // Performs the TVCP session handshake if needed, then signs and sends the
      // command. On retry, only the failing domain's session is reset so the
      // other domain's healthy session is preserved (e.g. retrying INFOTAINMENT
      // doesn't invalidate a valid VCSEC session used by lock/unlock).
      // ---------------------------------------------------------------------------
      Future<Map<String, dynamic>> doHandshakeAndSend({bool isRetry = false}) async {
        if (!signer.isSessionReady(domain) || isRetry) {
          if (isRetry) {
            print('TVCPProxy[$vin]: session rejected — re-handshaking domain=$domain only');
            signer.resetDomain(domain); // ← domain-scoped reset, keeps other domain intact
          }
          final reqMsg = await signer.createSessionInfoRequest(domain);
          final hsPayload = base64Encode(reqMsg.writeToBuffer());
          final hsRes = await teslaApi.sendSignedCommand(vin, hsPayload, token, fleetBaseUrl: fleetBaseUrl);

          // Handle vehicle-offline during handshake itself
          final hsStatusCode = _safeGet(hsRes, 'statusCode');
          final hsError = (_safeGet(hsRes, 'error') ?? '').toString().toLowerCase();
          if (hsStatusCode == 408 || hsError.contains('offline') || hsError.contains('not_present')) {
            throw _VehicleOfflineException();
          }

          final responseObj = _safeGet(hsRes, 'response');
          String? resB64;
          if (responseObj is String) {
            resB64 = responseObj;
          } else if (responseObj != null) {
            final nested = _safeGet(responseObj, 'routable_message');
            if (nested is String) resB64 = nested;
          }
          if (resB64 == null) throw Exception('Invalid handshake response from Tesla: $hsRes');
          await signer.processSessionInfoResponse(
              domain, RoutableMessage.fromBuffer(base64Decode(resB64)));
          print('TVCPProxy[$vin]: handshake ${isRetry ? "re-" : ""}established for $domain');
        }

        final signedB64 = await signer.signCommand(command, data: payload);
        print('TVCPProxy[$vin]: sending $command (domain=$domain)${isRetry ? " [retry]" : ""}');
        return teslaApi.sendSignedCommand(vin, signedB64, token, fleetBaseUrl: fleetBaseUrl);
      }

      // --- First attempt ---
      var commandRes = await doHandshakeAndSend();
      print('TVCPProxy[$vin]: $command response: $commandRes');

      // --- Classify the Tesla response error (if any) ---
      final resError = _safeGet(commandRes, 'error');
      final statusCode = _safeGet(commandRes, 'statusCode');

      if (resError != null && resError.toString().isNotEmpty) {
        final errStr = resError.toString().toLowerCase();

        // 1. Vehicle offline / sleeping → return 408 so the Flutter _executeWithWakeUp
        //    handler wakes the vehicle and retries the command automatically.
        if (statusCode == 408 ||
            errStr.contains('vehicle_is_offline') ||
            errStr.contains('vehicle is offline') ||
            errStr.contains('not_present') ||
            errStr.contains('not present')) {
          return Response(408, body: jsonEncode({
            'error': 'vehicle_offline',
            'message': 'Vehicle is not online. Wake-up required.',
          }), headers: {'Content-Type': 'application/json'});
        }

        // 2. Session / auth errors → re-handshake the failing domain once and retry.
        if (errStr.contains('unauthorized') ||
            errStr.contains('invalid_signature') ||
            errStr.contains('invalid_token_or_counter') ||
            errStr.contains('session')) {
          print('TVCPProxy[$vin]: session error "$resError" — re-handshaking $domain and retrying...');
          commandRes = await doHandshakeAndSend(isRetry: true);
          print('TVCPProxy[$vin]: retry response: $commandRes');

          // If STILL failing after re-handshake, check if it's an auth failure.
          final retryError = (_safeGet(commandRes, 'error') ?? '').toString();
          if (retryError.isNotEmpty) {
            final retryErrLow = retryError.toLowerCase();
            if (retryErrLow.contains('unauthorized') || retryErrLow.contains('key not on whitelist')) {
              // Permanent — key not registered.
              signer.resetDomain(domain);
              return Response.forbidden(jsonEncode({
                'error': retryError,
                'type': 'VirtualKeyNotRegistered',
              }), headers: {'Content-Type': 'application/json'});
            }
          }
        }

        // 3. Vehicle busy → retry after a short back-off.
        else if (errStr.contains('busy')) {
          print('TVCPProxy[$vin]: vehicle busy — retrying after 2s...');
          await Future.delayed(const Duration(seconds: 2));
          commandRes = await doHandshakeAndSend();
        }

        // 4. Command timed out → may have executed; return uncertain success
        //    so the Flutter UI doesn't retry and cause a duplicate action.
        else if (errStr.contains('timeout')) {
          print('TVCPProxy[$vin]: command $command timed out — treating as uncertain success.');
          return Response.ok(jsonEncode({
            'result': true,
            'reason': 'Command timed out but may have executed on the vehicle.',
          }), headers: {'Content-Type': 'application/json'});
        }

        // 5. Key not on whitelist (permanent) → 403.
        else if (errStr.contains('key not on whitelist') || errStr.contains('whitelist')) {
          signers.remove(vinUpper);
          return Response.forbidden(jsonEncode({
            'error': resError.toString(),
            'type': 'VirtualKeyNotRegistered',
          }), headers: {'Content-Type': 'application/json'});
        }

        // 6. Anything else — reset domain so the next request re-handshakes cleanly,
        //    but still return the error body so the client has full context.
        else {
          print('TVCPProxy[$vin]: unclassified error "$resError" — resetting domain $domain.');
          signer.resetDomain(domain);
        }
      }

      // --- Decode RoutableMessage to check vehicle-level fault status ---
      // Tesla returns HTTP 200 even when the vehicle signals an error inside
      // the RoutableMessage (e.g. MESSAGEFAULT_ERROR_INVALID_TOKEN_OR_COUNTER).
      // Decode the response and act on the fault code before returning.
      final responseB64 = commandRes['response'];
      if (responseB64 is String && responseB64.isNotEmpty) {
        try {
          final rm = RoutableMessage.fromBuffer(base64Decode(responseB64));
          if (rm.hasSignedMessageStatus()) {
            final status = rm.signedMessageStatus;
            final fault = status.hasSignedMessageFault()
                ? status.signedMessageFault
                : MessageFault_E.MESSAGEFAULT_ERROR_NONE;

            if (fault != MessageFault_E.MESSAGEFAULT_ERROR_NONE) {
              final faultName = fault.name;
              print('TVCPProxy[$vin]: vehicle fault in RoutableMessage: $faultName');

              // Session expired or counter mismatch → re-handshake once and retry
              if (fault == MessageFault_E.MESSAGEFAULT_ERROR_INVALID_TOKEN_OR_COUNTER ||
                  fault == MessageFault_E.MESSAGEFAULT_ERROR_INVALID_SIGNATURE ||
                  fault == MessageFault_E.MESSAGEFAULT_ERROR_INCORRECT_EPOCH ||
                  fault == MessageFault_E.MESSAGEFAULT_ERROR_WRONG_PERSONALIZATION ||
                  fault == MessageFault_E.MESSAGEFAULT_ERROR_TIME_EXPIRED ||
                  fault == MessageFault_E.MESSAGEFAULT_ERROR_TIME_TO_LIVE_TOO_LONG) {
                print('TVCPProxy[$vin]: session stale ($faultName) — re-handshaking and retrying...');
                commandRes = await doHandshakeAndSend(isRetry: true);
                // Re-check the retried response
                final retryB64 = commandRes['response'];
                if (retryB64 is String) {
                  try {
                    final retryRm = RoutableMessage.fromBuffer(base64Decode(retryB64));
                    if (retryRm.hasSignedMessageStatus()) {
                      final retryFault = retryRm.signedMessageStatus.hasSignedMessageFault()
                          ? retryRm.signedMessageStatus.signedMessageFault
                          : MessageFault_E.MESSAGEFAULT_ERROR_NONE;
                      if (retryFault != MessageFault_E.MESSAGEFAULT_ERROR_NONE) {
                        return Response.internalServerError(
                          body: jsonEncode({'error': retryFault.name, 'type': 'VehicleFault'}),
                          headers: {'Content-Type': 'application/json'},
                        );
                      }
                    }
                  } catch (_) {}
                }
              }

              // Virtual key not on vehicle's keychain
              else if (fault == MessageFault_E.MESSAGEFAULT_ERROR_UNKNOWN_KEY_ID ||
                       fault == MessageFault_E.MESSAGEFAULT_ERROR_INACTIVE_KEY ||
                       fault == MessageFault_E.MESSAGEFAULT_ERROR_INSUFFICIENT_PRIVILEGES ||
                       fault == MessageFault_E.MESSAGEFAULT_ERROR_KEYCHAIN_IS_FULL) {
                signers.remove(vinUpper);
                return Response.forbidden(
                  jsonEncode({'error': faultName, 'type': 'VirtualKeyNotRegistered'}),
                  headers: {'Content-Type': 'application/json'},
                );
              }

              // Vehicle busy → retry with back-off
              else if (fault == MessageFault_E.MESSAGEFAULT_ERROR_BUSY) {
                print('TVCPProxy[$vin]: vehicle busy (from RoutableMessage) — retrying after 2s...');
                await Future.delayed(const Duration(seconds: 2));
                commandRes = await doHandshakeAndSend();
              }

              // Timeout → uncertain success (command may have executed)
              else if (fault == MessageFault_E.MESSAGEFAULT_ERROR_TIMEOUT) {
                return Response.ok(
                  jsonEncode({'result': true, 'uncertain': true,
                      'reason': 'Vehicle timed out responding — command may have executed.'}),
                  headers: {'Content-Type': 'application/json'},
                );
              }

              // Anything else → return the fault name so the client can debug
              else {
                return Response.internalServerError(
                  body: jsonEncode({'error': faultName, 'type': 'VehicleFault'}),
                  headers: {'Content-Type': 'application/json'},
                );
              }
            }
          }
        } catch (e) {
          // Non-fatal: if RoutableMessage decoding fails, proceed with the raw response.
          print('TVCPProxy[$vin]: could not decode RoutableMessage for fault check: $e');
        }
      }

      return Response.ok(jsonEncode(commandRes), headers: {'Content-Type': 'application/json'});

    } on _VehicleOfflineException {
      // Raised during handshake when the vehicle is sleeping.
      return Response(408, body: jsonEncode({
        'error': 'vehicle_offline',
        'message': 'Vehicle is not online. Wake-up required.',
      }), headers: {'Content-Type': 'application/json'});

    } catch (e, stack) {
      print('TVCPProxy[$vin]: error for $command: $e');
      print(stack);

      final msg = e.toString();

      // Virtual key whitelist rejection → 403.
      if (msg.contains('whitelist') || msg.contains('Key not on')) {
        signers.remove(vinUpper);
        return Response.forbidden(jsonEncode({
          'error': msg,
          'type': 'VirtualKeyNotRegistered',
        }), headers: {'Content-Type': 'application/json'});
      }

      // Session setup failure → clear signer so next request re-handshakes.
      if (msg.contains('Session') || msg.contains('handshake')) {
        signers.remove(vinUpper);
      }

      return Response.internalServerError(body: jsonEncode({
        'error': msg,
        'type': e.runtimeType.toString(),
      }), headers: {'Content-Type': 'application/json'});
    }
  });

  // ---------------------------------------------------------------------------
  // Fleet Telemetry WebSocket endpoint
  // ---------------------------------------------------------------------------
  // Tesla connects to wss://<proxy-host>/telemetry and pushes binary protobuf
  // frames containing vehicle state updates. This handler parses each frame,
  // extracts the key telemetry fields, and writes them to Firestore so the
  // Flutter app receives real-time updates via its Firestore stream subscription.
  //
  // Configuration:
  //   POST /api/1/vehicles/{id}/fleet_telemetry_config  (via Flutter app)
  //   with hostname = <your-public-proxy-domain>
  //   and ca = <CA cert PEM that signed your proxy's TLS cert>
  //
  // The proxy must be behind TLS (e.g. via nginx reverse proxy or Cloud Run)
  // because Tesla requires a valid HTTPS/WSS endpoint.
  // ---------------------------------------------------------------------------
  app.get('/telemetry', webSocketHandler((channel, String? protocol) async {
    print('FleetTelemetry: Tesla connected');

    await for (final message in channel.stream) {
      try {
        Map<String, dynamic> fields;

        if (message is String) {
          // JSON-encoded telemetry (e.g. from test clients or JSON-configured servers)
          final decoded = jsonDecode(message) as Map<String, dynamic>;
          fields = _parseTelemetryJson(decoded);
        } else if (message is List<int> || message is Uint8List) {
          // Binary protobuf frame from Tesla Fleet Telemetry
          final bytes = message is Uint8List ? message : Uint8List.fromList(message as List<int>);
          fields = _parseTelemetryBinary(bytes);
        } else {
          continue;
        }

        final vin = fields.remove('vin') as String?;
        if (vin == null || vin.isEmpty) {
          print('FleetTelemetry: skipping frame with no VIN');
          continue;
        }

        // Add server-side timestamp and source marker
        fields['updatedAt'] = DateTime.now().toUtc().toIso8601String();
        fields['source'] = 'fleet_telemetry';
        fields['vin'] = vin;

        await firestoreWriter.writeTelemetry(vin, fields);
        print('FleetTelemetry: wrote ${fields.length} fields for VIN $vin');
      } catch (e, stack) {
        print('FleetTelemetry: frame parse error: $e\n$stack');
      }
    }

    print('FleetTelemetry: Tesla disconnected');
  }));

  app.get('/health', (Request request) {
    return Response.ok('OK');
  });

  /// Serves the proxy's EC public key in PEM format at the Tesla well-known path.
  /// Tesla fetches this URL when registering a virtual key via
  /// https://tesla.com/_ak/<domain>.
  /// This allows the proxy URL itself to act as the registered domain.
  app.get('/.well-known/appspecific/com.tesla.3p.public-key.pem', (Request request) {
    final rawBytes = SecurityUtils().publicKeyBytes;
    final oidAlgo = [0x30, 0x13,
      0x06, 0x07, 0x2a, 0x86, 0x48, 0xce, 0x3d, 0x02, 0x01,
      0x06, 0x08, 0x2a, 0x86, 0x48, 0xce, 0x3d, 0x03, 0x01, 0x07
    ];
    final bitString = [0x03, rawBytes.length + 1, 0x00, ...rawBytes];
    final spkiContent = [...oidAlgo, ...bitString];
    final spki = [0x30, spkiContent.length, ...spkiContent];
    final b64 = base64Encode(Uint8List.fromList(spki));
    final lines = <String>[];
    for (var i = 0; i < b64.length; i += 64) {
      lines.add(b64.substring(i, i + 64 > b64.length ? b64.length : i + 64));
    }
    final pem = '-----BEGIN PUBLIC KEY-----\n${lines.join('\n')}\n-----END PUBLIC KEY-----\n';
    return Response.ok(pem, headers: {'Content-Type': 'application/x-pem-file'});
  });

  /// Diagnostic endpoint: returns the proxy's EC public key in both hex and
  /// uncompressed-point format. The PEM at
  /// https://thedevelopersharma.com/.well-known/appspecific/com.tesla.3p.public-key.pem
  /// must encode the SAME 65-byte point for virtual-key registration to work.
  app.get('/public-key', (Request request) {
    final rawBytes = SecurityUtils().publicKeyBytes; // 65-byte uncompressed EC point
    final hex = rawBytes.map((e) => e.toRadixString(16).padLeft(2, '0')).join();

    // Encode as DER SubjectPublicKeyInfo for P-256 so it can be wrapped in PEM.
    // OID for ecPublicKey: 1.2.840.10045.2.1
    // OID for P-256 curve: 1.2.840.10045.3.1.7
    final oidAlgo = [0x30, 0x13,
      0x06, 0x07, 0x2a, 0x86, 0x48, 0xce, 0x3d, 0x02, 0x01,  // ecPublicKey OID
      0x06, 0x08, 0x2a, 0x86, 0x48, 0xce, 0x3d, 0x03, 0x01, 0x07  // P-256 OID
    ];
    // BIT STRING: 0x03 len 0x00 + 65 raw bytes
    final bitString = [0x03, rawBytes.length + 1, 0x00, ...rawBytes];
    final spkiContent = [...oidAlgo, ...bitString];
    final spki = [0x30, spkiContent.length, ...spkiContent];
    final b64 = base64Encode(Uint8List.fromList(spki));
    // Wrap in 64-char lines
    final lines = <String>[];
    for (var i = 0; i < b64.length; i += 64) {
      lines.add(b64.substring(i, i + 64 > b64.length ? b64.length : i + 64));
    }
    final pem = '-----BEGIN PUBLIC KEY-----\n${lines.join('\n')}\n-----END PUBLIC KEY-----';

    return Response.ok(
      jsonEncode({'hex': hex, 'pem': pem}),
      headers: {'Content-Type': 'application/json'},
    );
  });

  // ---------------------------------------------------------------------------
  // Fleet Telemetry management routes
  // ---------------------------------------------------------------------------
  // These routes proxy Fleet Telemetry API calls from the Flutter app to Tesla,
  // signing the config with the registered application private key as required.

  /// POST /api/fleet/telemetry_config
  /// Body: { "vin": "5YJ...", "config": { hostname, ca, fields, port, ... } }
  ///
  /// Signs the config with the application private key (ES256 JWS) and forwards
  /// to Tesla's fleet_telemetry_config_jws endpoint. This is the correct path
  /// for applications that use the virtual-key (non-legacy CSR) flow.
  app.post('/api/fleet/telemetry_config', (Request request) async {
    final authHeader = request.headers['authorization'];
    if (authHeader == null || !authHeader.startsWith('Bearer ')) {
      return Response.forbidden('Missing Bearer Token');
    }
    final token = authHeader.substring(7);
    final fleetBaseUrl = request.headers['x-fleet-api-base-url'];

    try {
      final body = jsonDecode(await request.readAsString()) as Map<String, dynamic>;
      final vin = body['vin'] as String?;
      final config = body['config'] as Map<String, dynamic>?;
      if (vin == null || config == null) {
        return Response(400, body: jsonEncode({'error': 'Missing vin or config'}),
            headers: {'Content-Type': 'application/json'});
      }

      // Add expiry if not provided (48 hours from now)
      if (!config.containsKey('exp')) {
        config['exp'] = (DateTime.now().millisecondsSinceEpoch ~/ 1000) + 172800;
      }

      final jwsToken = SecurityUtils().signFleetConfigJws(config);
      print('FleetTelemetry: Signed config JWS for VIN $vin, forwarding to Tesla...');

      final result = await teslaApi.postFleetTelemetryConfigJws(
        jwsToken, [vin], token, fleetBaseUrl: fleetBaseUrl);
      print('FleetTelemetry: Config response: $result');

      return Response.ok(jsonEncode(result), headers: {'Content-Type': 'application/json'});
    } catch (e) {
      print('FleetTelemetry: Config signing/forwarding failed: $e');
      return Response.internalServerError(
        body: jsonEncode({'error': e.toString()}),
        headers: {'Content-Type': 'application/json'},
      );
    }
  });

  /// GET /api/fleet/telemetry_config/<vin>
  app.get('/api/fleet/telemetry_config/<vin>', (Request request, String vin) async {
    final authHeader = request.headers['authorization'];
    if (authHeader == null || !authHeader.startsWith('Bearer ')) {
      return Response.forbidden('Missing Bearer Token');
    }
    try {
      final result = await teslaApi.getFleetTelemetryConfig(
        vin, authHeader.substring(7),
        fleetBaseUrl: request.headers['x-fleet-api-base-url'],
      );
      return Response.ok(jsonEncode(result), headers: {'Content-Type': 'application/json'});
    } catch (e) {
      return Response.internalServerError(
        body: jsonEncode({'error': e.toString()}),
        headers: {'Content-Type': 'application/json'},
      );
    }
  });

  /// DELETE /api/fleet/telemetry_config/<vin>
  app.delete('/api/fleet/telemetry_config/<vin>', (Request request, String vin) async {
    final authHeader = request.headers['authorization'];
    if (authHeader == null || !authHeader.startsWith('Bearer ')) {
      return Response.forbidden('Missing Bearer Token');
    }
    try {
      final result = await teslaApi.deleteFleetTelemetryConfig(
        vin, authHeader.substring(7),
        fleetBaseUrl: request.headers['x-fleet-api-base-url'],
      );
      return Response.ok(jsonEncode(result), headers: {'Content-Type': 'application/json'});
    } catch (e) {
      return Response.internalServerError(
        body: jsonEncode({'error': e.toString()}),
        headers: {'Content-Type': 'application/json'},
      );
    }
  });

  /// GET /api/fleet/telemetry_errors/<vin>
  app.get('/api/fleet/telemetry_errors/<vin>', (Request request, String vin) async {
    final authHeader = request.headers['authorization'];
    if (authHeader == null || !authHeader.startsWith('Bearer ')) {
      return Response.forbidden('Missing Bearer Token');
    }
    try {
      final result = await teslaApi.getFleetTelemetryErrors(
        vin, authHeader.substring(7),
        fleetBaseUrl: request.headers['x-fleet-api-base-url'],
      );
      return Response.ok(jsonEncode(result), headers: {'Content-Type': 'application/json'});
    } catch (e) {
      return Response.internalServerError(
        body: jsonEncode({'error': e.toString()}),
        headers: {'Content-Type': 'application/json'},
      );
    }
  });

  /// POST /api/fleet/status
  /// Body: { "vins": ["5YJ..."] }
  app.post('/api/fleet/status', (Request request) async {
    final authHeader = request.headers['authorization'];
    if (authHeader == null || !authHeader.startsWith('Bearer ')) {
      return Response.forbidden('Missing Bearer Token');
    }
    try {
      final body = jsonDecode(await request.readAsString()) as Map<String, dynamic>;
      final vins = (body['vins'] as List?)?.cast<String>() ?? [];
      final result = await teslaApi.getFleetStatus(
        vins, authHeader.substring(7),
        fleetBaseUrl: request.headers['x-fleet-api-base-url'],
      );
      return Response.ok(jsonEncode(result), headers: {'Content-Type': 'application/json'});
    } catch (e) {
      return Response.internalServerError(
        body: jsonEncode({'error': e.toString()}),
        headers: {'Content-Type': 'application/json'},
      );
    }
  });

  // Default Pipeline
  final handler = const Pipeline()
      .addMiddleware(logRequests())
      .addHandler(app.call);

  final portStr = env['PORT'] ?? Platform.environment['PORT'] ?? '8080';
  final port = int.parse(portStr);

  final server = await io.serve(handler, '0.0.0.0', port);
  print('TVCP Proxy listening on port ${server.port}');
}

// ---------------------------------------------------------------------------
// Fleet Telemetry frame parsers
// ---------------------------------------------------------------------------

/// Parses a JSON-format telemetry payload (used by custom/test clients).
///
/// Expected shape:
/// ```json
/// {
///   "vin": "5YJ...",
///   "data": [
///     {"key": "BatteryLevel", "value": {"doubleValue": 85.2}},
///     {"key": "ChargingState", "value": {"stringValue": "Charging"}}
///   ]
/// }
/// ```
Map<String, dynamic> _parseTelemetryJson(Map<String, dynamic> payload) {
  final result = <String, dynamic>{};

  final vin = payload['vin'] as String?;
  if (vin != null) result['vin'] = vin;

  final data = payload['data'] as List?;
  if (data == null) return result;

  for (final item in data) {
    if (item is! Map) continue;
    final key = item['key'] as String?;
    final valueMap = item['value'] as Map?;
    if (key == null || valueMap == null) continue;

    dynamic parsed;
    if (valueMap.containsKey('doubleValue')) parsed = (valueMap['doubleValue'] as num).toDouble();
    else if (valueMap.containsKey('floatValue')) parsed = (valueMap['floatValue'] as num).toDouble();
    else if (valueMap.containsKey('intValue')) parsed = (valueMap['intValue'] as num).toInt();
    else if (valueMap.containsKey('longValue')) parsed = (valueMap['longValue'] as num).toInt();
    else if (valueMap.containsKey('booleanValue')) parsed = valueMap['booleanValue'] as bool;
    else if (valueMap.containsKey('stringValue')) parsed = valueMap['stringValue'] as String;
    else if (valueMap.containsKey('locationValue')) {
      final loc = valueMap['locationValue'] as Map;
      result['latitude'] = (loc['latitude'] as num?)?.toDouble() ?? 0.0;
      result['longitude'] = (loc['longitude'] as num?)?.toDouble() ?? 0.0;
      continue;
    }

    if (parsed == null) continue;
    final firestoreKey = _telemetryKeyToFirestore(key);
    if (firestoreKey != null) result[firestoreKey] = parsed;
  }

  return result;
}

/// Parses a binary protobuf Fleet Telemetry frame from Tesla.
///
/// Tesla Fleet Telemetry sends protobuf-encoded `Payload` messages. The binary
/// wire format uses standard protobuf encoding. We decode using a generic
/// protobuf field scanner keyed on Tesla's published field tag numbers.
///
/// Field tag numbers are from Tesla's open-source fleet-telemetry repository
/// (teslamotors/fleet-telemetry, protos/vehicle_data.proto).
Map<String, dynamic> _parseTelemetryBinary(Uint8List bytes) {
  final result = <String, dynamic>{};

  try {
    // Attempt to decode as a minimal protobuf by scanning field tags.
    // The outer message is `Payload` with these fields:
    //   1: vin (string)
    //   2: created_at (int64 / timestamp seconds)
    //   3: repeated Datum
    //   4: txid (bytes)
    int pos = 0;

    while (pos < bytes.length) {
      // Read varint tag
      final tagResult = _readVarint(bytes, pos);
      if (tagResult == null) break;
      pos = tagResult.$1;
      final tag = tagResult.$2;

      final fieldNumber = tag >> 3;
      final wireType = tag & 0x7;

      if (fieldNumber == 1 && wireType == 2) {
        // VIN (string, length-delimited)
        final lenResult = _readVarint(bytes, pos);
        if (lenResult == null) break;
        pos = lenResult.$1;
        final len = lenResult.$2;
        if (pos + len > bytes.length) break;
        result['vin'] = String.fromCharCodes(bytes.sublist(pos, pos + len));
        pos += len;
      } else if (fieldNumber == 3 && wireType == 2) {
        // Datum (length-delimited sub-message)
        final lenResult = _readVarint(bytes, pos);
        if (lenResult == null) break;
        pos = lenResult.$1;
        final len = lenResult.$2;
        if (pos + len > bytes.length) break;
        final datumBytes = bytes.sublist(pos, pos + len);
        pos += len;
        _parseDatum(datumBytes, result);
      } else {
        // Skip unknown fields
        pos = _skipField(bytes, pos, wireType);
        if (pos < 0) break;
      }
    }
  } catch (e) {
    print('FleetTelemetry: binary parse warning: $e');
  }

  return result;
}

/// Parses a `Datum` sub-message:
///   1: Field key (varint enum)
///   2: Value (length-delimited sub-message with a oneof)
void _parseDatum(Uint8List bytes, Map<String, dynamic> result) {
  int pos = 0;
  int? fieldKey;

  while (pos < bytes.length) {
    final tagResult = _readVarint(bytes, pos);
    if (tagResult == null) break;
    pos = tagResult.$1;
    final tag = tagResult.$2;
    final fn = tag >> 3;
    final wt = tag & 0x7;

    if (fn == 1 && wt == 0) {
      // Field key enum (varint)
      final vResult = _readVarint(bytes, pos);
      if (vResult == null) break;
      pos = vResult.$1;
      fieldKey = vResult.$2;
    } else if (fn == 2 && wt == 2) {
      // Value sub-message (length-delimited)
      final lenResult = _readVarint(bytes, pos);
      if (lenResult == null) break;
      pos = lenResult.$1;
      final len = lenResult.$2;
      if (pos + len > bytes.length) break;
      final valueBytes = bytes.sublist(pos, pos + len);
      pos += len;

      if (fieldKey != null) {
        final firestoreKey = _telemetryFieldNumToFirestore(fieldKey);
        if (firestoreKey != null) {
          final value = _parseValue(valueBytes, firestoreKey, result);
          if (value != null) result[firestoreKey] = value;
        }
      }
    } else {
      pos = _skipField(bytes, pos, wt);
      if (pos < 0) break;
    }
  }
}

/// Parses the `Value` oneof sub-message and returns the typed Dart value.
dynamic _parseValue(Uint8List bytes, String key, Map<String, dynamic> result) {
  int pos = 0;
  while (pos < bytes.length) {
    final tagResult = _readVarint(bytes, pos);
    if (tagResult == null) break;
    pos = tagResult.$1;
    final tag = tagResult.$2;
    final fn = tag >> 3;
    final wt = tag & 0x7;

    switch (fn) {
      case 1: // float_value (fixed32)
        if (wt == 5 && pos + 4 <= bytes.length) {
          final bd = ByteData.sublistView(bytes, pos, pos + 4);
          pos += 4;
          return bd.getFloat32(0, Endian.little).toDouble();
        }
        break;
      case 2: // int_value (varint)
        if (wt == 0) {
          final vr = _readVarint(bytes, pos);
          if (vr == null) break;
          pos = vr.$1;
          return vr.$2;
        }
        break;
      case 3: // boolean_value (varint)
        if (wt == 0) {
          final vr = _readVarint(bytes, pos);
          if (vr == null) break;
          pos = vr.$1;
          return vr.$2 != 0;
        }
        break;
      case 4: // string_value (length-delimited)
        if (wt == 2) {
          final lr = _readVarint(bytes, pos);
          if (lr == null) break;
          pos = lr.$1;
          final len = lr.$2;
          if (pos + len > bytes.length) break;
          final s = String.fromCharCodes(bytes.sublist(pos, pos + len));
          pos += len;
          return s;
        }
        break;
      case 5: // long_value (varint)
        if (wt == 0) {
          final vr = _readVarint(bytes, pos);
          if (vr == null) break;
          pos = vr.$1;
          return vr.$2;
        }
        break;
      case 6: // double_value (fixed64)
        if (wt == 1 && pos + 8 <= bytes.length) {
          final bd = ByteData.sublistView(bytes, pos, pos + 8);
          pos += 8;
          return bd.getFloat64(0, Endian.little);
        }
        break;
      case 9: // location_value (sub-message)
        if (wt == 2) {
          final lr = _readVarint(bytes, pos);
          if (lr == null) break;
          pos = lr.$1;
          final len = lr.$2;
          if (pos + len > bytes.length) break;
          final locBytes = bytes.sublist(pos, pos + len);
          pos += len;
          _parseLocationValue(locBytes, result);
          return null;
        }
        break;
      default:
        pos = _skipField(bytes, pos, wt);
        if (pos < 0) return null;
    }
  }
  return null;
}

void _parseLocationValue(Uint8List bytes, Map<String, dynamic> result) {
  int pos = 0;
  while (pos < bytes.length) {
    final tagResult = _readVarint(bytes, pos);
    if (tagResult == null) break;
    pos = tagResult.$1;
    final tag = tagResult.$2;
    final fn = tag >> 3;
    final wt = tag & 0x7;

    if (fn == 1 && wt == 1 && pos + 8 <= bytes.length) {
      // latitude: double
      final bd = ByteData.sublistView(bytes, pos, pos + 8);
      result['latitude'] = bd.getFloat64(0, Endian.little);
      pos += 8;
    } else if (fn == 2 && wt == 1 && pos + 8 <= bytes.length) {
      // longitude: double
      final bd = ByteData.sublistView(bytes, pos, pos + 8);
      result['longitude'] = bd.getFloat64(0, Endian.little);
      pos += 8;
    } else {
      pos = _skipField(bytes, pos, wt);
      if (pos < 0) break;
    }
  }
}

// --- Protobuf wire-format utilities ---

/// Reads a varint from [bytes] starting at [pos].
/// Returns (newPos, value) or null on overflow/truncation.
(int, int)? _readVarint(Uint8List bytes, int pos) {
  int value = 0;
  int shift = 0;
  while (pos < bytes.length) {
    final byte = bytes[pos++];
    value |= (byte & 0x7F) << shift;
    if ((byte & 0x80) == 0) return (pos, value);
    shift += 7;
    if (shift >= 64) return null; // overflow
  }
  return null; // truncated
}

int _skipField(Uint8List bytes, int pos, int wireType) {
  switch (wireType) {
    case 0: // varint
      while (pos < bytes.length) {
        if ((bytes[pos++] & 0x80) == 0) return pos;
      }
      return -1;
    case 1: // 64-bit
      return pos + 8 <= bytes.length ? pos + 8 : -1;
    case 2: // length-delimited
      final r = _readVarint(bytes, pos);
      if (r == null) return -1;
      final newPos = r.$1 + r.$2;
      return newPos <= bytes.length ? newPos : -1;
    case 5: // 32-bit
      return pos + 4 <= bytes.length ? pos + 4 : -1;
    default:
      return -1;
  }
}

// ---------------------------------------------------------------------------
// Tesla Fleet Telemetry field mappings
// Field numbers from: teslamotors/fleet-telemetry (protos/vehicle_data.proto)
// ---------------------------------------------------------------------------

String? _telemetryFieldNumToFirestore(int fieldNum) {
  // Field numbers from: teslamotors/fleet-telemetry (protos/vehicle_data.proto)
  const map = {
    // Battery / Charging
    1:   'batteryLevel',            // BatteryLevel (% 0-100)
    2:   'odometer',                // Odometer (miles/km)
    3:   'speed',                   // VehicleSpeed
    4:   'chargingState',           // ChargingState / DetailedChargeState
    5:   'chargerPower',            // ChargerPower (kW)
    6:   'chargeEnergyAdded',       // ChargeEnergyAdded (kWh)
    7:   'timeToFullCharge',        // TimeToFullCharge (hours)
    8:   'chargeLimitSoc',          // ChargeLimitSoc (%)
    9:   'chargeCurrentRequest',    // ChargeCurrentRequest (A)
    10:  'isLocked',                // Locked
    11:  'isSentryModeOn',          // SentryModeActive
    12:  'shiftState',              // Gear (P/D/R/N)
    13:  'location',                // Location (lat/lng)
    14:  'batteryRange',            // BatteryRange (mi)
    15:  'idealBatteryRange',       // IdealBatteryRange (mi)
    16:  'insideTemp',              // InsideTempEstimate (°C)
    17:  'outsideTemp',             // OutsideTempFiltered (°C)
    18:  'isClimateOn',             // HvacAutoMode
    19:  'driverTemp',              // DriverTempSetting (°C)
    20:  'passengerTemp',           // PassengerTempSetting (°C)
    21:  'power',                   // Power (kW, negative = regen)
    22:  'heading',                 // Heading (degrees 0-360)
    23:  'chargerVoltage',          // ChargerVoltage (V)
    24:  'batteryHeaterOn',         // BatteryHeaterOn
    25:  'seatHeaterLeft',          // SeatHeaterLeft (0-3)
    26:  'seatHeaterRight',         // SeatHeaterRight (0-3)
    27:  'steeringWheelHeater',     // SteeringWheelHeatLevel
    28:  'frontTrunkState',         // FrontTrunkOpen (bool)
    29:  'rearTrunkState',          // RearTrunkOpen (bool)
    30:  'softwareVersion',         // Version (string)
    // Extended battery
    31:  'usableBatteryLevel',      // UsableBatteryLevel (%)
    32:  'chargeCurrentRequestMax', // ChargeCurrentRequestMax (A)
    33:  'fastChargerPresent',      // FastChargerPresent (bool)
    34:  'fastChargerType',         // FastChargerType (string: "Tesla","CCS",etc)
    35:  'chargePortOpen',          // ChargePortDoorOpen (bool)
    36:  'scheduledChargingMode',   // ScheduledChargingMode (string)
    37:  'scheduledChargingPending',// ScheduledChargingPending (bool)
    38:  'managedChargingActive',   // ManagedChargingActive (bool)
    // Climate extended
    39:  'seatHeaterRearLeft',      // SeatHeaterRearLeft (0-3)
    40:  'seatHeaterRearRight',     // SeatHeaterRearRight (0-3)
    41:  'seatHeaterRearCenter',    // SeatHeaterRearCenter (0-3)
    42:  'climateKeeperMode',       // ClimateKeeperMode (string: off/dog/camp)
    43:  'bioweaponDefenseMode',    // HvacBioweaponModeActive (bool)
    44:  'isPreconditioning',       // Preconditioning (bool)
    45:  'frontDefrosterOn',        // DefrostMode (bool)
    // TPMS
    46:  'tpmsPressureFl',          // TpmsPressureFl (bar)
    47:  'tpmsPressureFr',          // TpmsPressureFr (bar)
    48:  'tpmsPressureRl',          // TpmsPressureRl (bar)
    49:  'tpmsPressureRr',          // TpmsPressureRr (bar)
    // Vehicle state
    50:  'valetMode',               // ValetMode (bool)
    51:  'sentryModeAvailable',     // SentryModeAvailable (bool)
    52:  'windowsOpen',             // Any window open (bool)
    53:  'displayName',             // VehicleName (string)
    // Software update
    54:  'softwareUpdateStatus',    // SoftwareUpdateStatus (string)
    55:  'softwareUpdateVersion',   // SoftwareUpdateVersion (string)
    56:  'softwareUpdateProgress',  // SoftwareUpdateDownloadPercent (int)
    // Drive / motion
    57:  'latitude',                // GPS latitude (legacy, prefer Location)
    58:  'longitude',               // GPS longitude (legacy, prefer Location)
    59:  'estBatteryRange',         // EstBatteryRange (mi)
    60:  'chargerPhases',           // ChargerPhases (1-3)
  };
  return map[fieldNum];
}

/// Maps a JSON telemetry key name (from test/JSON clients) to a Firestore key.
/// Keys are from Tesla's vehicle_data.proto field names sent by the vehicle.
String? _telemetryKeyToFirestore(String key) {
  const map = {
    // Battery
    'BatteryLevel':          'batteryLevel',
    'Soc':                   'batteryLevel',    // alias used in newer firmware
    'EstBatteryRange':       'estBatteryRange',
    'EstimatedBatteryRange': 'estBatteryRange',
    'BatteryRange':          'batteryRange',
    'IdealBatteryRange':     'idealBatteryRange',
    'BatteryHeaterOn':       'batteryHeaterOn',
    // Charging
    'DetailedChargeState':   'chargingState',   // newer firmware field
    'ChargingState':         'chargingState',   // legacy field
    'ChargerPower':          'chargerPower',
    'ChargeAmps':            'chargeCurrentRequest',
    'ChargeCurrentRequest':  'chargeCurrentRequest',
    'ChargerVoltage':        'chargerVoltage',
    'ChargeEnergyAdded':     'chargeEnergyAdded',
    'TimeToFullCharge':      'timeToFullCharge',
    'ChargeLimitSoc':        'chargeLimitSoc',
    'ACChargingEnergyIn':    'acChargingEnergyIn',
    'DCChargingEnergyIn':    'dcChargingEnergyIn',
    // Drive
    'VehicleSpeed':          'speed',
    'Odometer':              'odometer',
    'Location':              'location',
    'Heading':               'heading',
    'Power':                 'power',
    'Gear':                  'shiftState',
    // Status
    'Locked':                'isLocked',
    'SentryModeActive':      'isSentryModeOn',
    'DoorState':             'doorState',
    'FrontTrunkOpen':        'frontTrunkState',
    'RearTrunkOpen':         'rearTrunkState',
    'VehicleName':           'displayName',
    // Climate
    'InsideTemp':            'insideTemp',
    'InsideTempEstimate':    'insideTemp',
    'OutsideTemp':           'outsideTemp',
    'OutsideTempFiltered':   'outsideTemp',
    'HvacAutoMode':          'isClimateOn',
    'ClimateKeeperMode':     'climateKeeperMode',
    'DriverTempSetting':     'driverTemp',
    'PassengerTempSetting':  'passengerTemp',
    'SeatHeaterLeft':        'seatHeaterLeft',
    'SeatHeaterRight':       'seatHeaterRight',
    'SteeringWheelHeatLevel':'steeringWheelHeater',
    // Extended charging
    'ChargeCurrentRequestMax':  'chargeCurrentRequestMax',
    'UsableBatteryLevel':       'usableBatteryLevel',
    'FastChargerPresent':       'fastChargerPresent',
    'FastChargerType':          'fastChargerType',
    'ChargePortDoorOpen':       'chargePortOpen',
    'ScheduledChargingMode':    'scheduledChargingMode',
    'ScheduledChargingPending': 'scheduledChargingPending',
    'ManagedChargingActive':    'managedChargingActive',
    'ChargerPhases':            'chargerPhases',
    // Extended climate
    'SeatHeaterRearLeft':       'seatHeaterRearLeft',
    'SeatHeaterRearRight':      'seatHeaterRearRight',
    'SeatHeaterRearCenter':     'seatHeaterRearCenter',
    'HvacBioweaponModeActive':  'bioweaponDefenseMode',
    'Preconditioning':          'isPreconditioning',
    'DefrostMode':              'frontDefrosterOn',
    'CabinOverheatProtection':  'cabinOverheatProtection',
    // TPMS
    'TpmsPressureFl':           'tpmsPressureFl',
    'TpmsPressureFr':           'tpmsPressureFr',
    'TpmsPressureRl':           'tpmsPressureRl',
    'TpmsPressureRr':           'tpmsPressureRr',
    // Vehicle state
    'ValetMode':                'valetMode',
    'SentryModeAvailable':      'sentryModeAvailable',
    'WindowState':              'windowsOpen',
    // Software update
    'SoftwareUpdateStatus':     'softwareUpdateStatus',
    'SoftwareUpdateVersion':    'softwareUpdateVersion',
    'SoftwareUpdateDownloadPercent': 'softwareUpdateProgress',
    // Meta
    'Version':                  'softwareVersion',
  };
  return map[key];
}

/// Sentinel exception used internally when the vehicle is offline during handshake.
class _VehicleOfflineException implements Exception {
  const _VehicleOfflineException();
}

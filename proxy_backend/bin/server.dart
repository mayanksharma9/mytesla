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

    // Get or Create Signer
    if (!signers.containsKey(vin)) {
      signers[vin] = TVCPSigner(vin);
    }
    final signer = signers[vin]!;

    // Optional regional fleet API base URL forwarded from the Flutter client.
    // The client sets X-Fleet-Api-Base-Url after calling updateRegion() so the
    // proxy hits the correct regional endpoint (EU/NA/APAC) instead of the
    // hardcoded NA URL.  Falls back to NA if the header is absent.
    final fleetBaseUrl = request.headers['x-fleet-api-base-url'];

    try {
      // Step 1: Ensure Session is Ready
      final domain = TVCPSigner.getDomainForCommand(command);
      if (!signer.isSessionReady(domain)) {
        print('Session not ready for $vin, initiating handshake...');
        final requestMsg = await signer.createSessionInfoRequest(domain);
        final handshakePayload = base64Encode(requestMsg.writeToBuffer());

        final handshakeRes = await teslaApi.sendSignedCommand(
          vin, handshakePayload, token, fleetBaseUrl: fleetBaseUrl);
        print('Handshake API Response: $handshakeRes');
        
        final responseObj = _safeGet(handshakeRes, 'response');
        String? resB64;
        
        if (responseObj is String) {
          // Direct string response (Common for some vehicle versions)
          resB64 = responseObj;
        } else if (responseObj != null) {
          // Nested response (Standard Fleet API)
          final nested = _safeGet(responseObj, 'routable_message');
          if (nested is String) resB64 = nested;
        }

        if (resB64 != null) {
          final routableResponse = RoutableMessage.fromBuffer(base64Decode(resB64));
          await signer.processSessionInfoResponse(domain, routableResponse);
          print('Handshake successful for $vin');
        } else {
           return Response.internalServerError(body: jsonEncode({
             'error': 'Invalid handshake routable message: $resB64', 
             'raw': handshakeRes
           }));
        }
      }

      // Step 2: Extract Body Data if present
      final body = await request.readAsString();
      Map<String, dynamic>? payload;
      if (body.isNotEmpty) {
        try {
          payload = jsonDecode(body) as Map<String, dynamic>;
        } catch (_) {}
      }

      // Step 3: Sign and Send Command
      final payloadB64 = await signer.signCommand(command, data: payload);
      print('Sending command $command to $vin...');
      final commandRes = await teslaApi.sendSignedCommand(
        vin, payloadB64, token, fleetBaseUrl: fleetBaseUrl);
      print('Command API Response: $commandRes');

      // Tesla returns HTTP 200 with {response: null, error: "Unauthorized"} when
      // the HMAC signature is rejected (wrong key or stale counter). Reset the
      // session so the next request triggers a fresh handshake with the correct key.
      final resError = _safeGet(commandRes, 'error');
      if (resError != null && resError.toString().isNotEmpty && _safeGet(commandRes, 'response') == null) {
        print('Vehicle rejected command ($resError) — resetting session for $vin to force re-handshake.');
        signers.remove(vin);
      }

      return Response.ok(jsonEncode(commandRes), headers: {'Content-Type': 'application/json'});
    } catch (e, stack) {
      print('Proxy Error for $vin: $e');
      print(stack);

      final msg = e.toString();

      // Virtual key whitelist rejection — return 403 so the Flutter client
      // surfaces it as a permanent error rather than falling back to direct API.
      if (msg.contains('whitelist') || msg.contains('Key not on')) {
        signers.remove(vin); // force re-handshake if key is added later
        return Response.forbidden(jsonEncode({
          'error': msg,
          'type': 'VirtualKeyNotRegistered',
        }), headers: {'Content-Type': 'application/json'});
      }

      // Session errors: reset signer so next attempt re-handshakes cleanly.
      if (msg.contains('Session')) {
        signers.remove(vin);
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
  const map = {
    1:   'batteryLevel',       // BatteryLevel (% as double 0-100)
    2:   'odometer',           // Odometer
    3:   'speed',              // VehicleSpeed
    4:   'chargingState',      // ChargingState (string: Charging/Stopped/etc)
    5:   'chargerPower',       // ChargerPower (kW)
    6:   'chargeEnergyAdded',  // ChargeEnergyAdded (kWh)
    7:   'timeToFullCharge',   // TimeToFullCharge (hours)
    8:   'chargeLimitSoc',     // ChargeLimitSoc (%)
    9:   'chargeCurrentRequest', // ChargeCurrentRequest (A)
    10:  'isLocked',           // Locked
    11:  'isSentryModeOn',     // SentryModeActive
    12:  'shiftState',         // Gear (P/D/R/N/null)
    13:  'location',           // Location (LocationValue)
    14:  'batteryRange',       // BatteryRange (mi)
    15:  'idealBatteryRange',  // IdealBatteryRange
    16:  'insideTemp',         // InsideTempEstimate
    17:  'outsideTemp',        // OutsideTempFiltered
    18:  'isClimateOn',        // HvacAutoMode or ClimateKeeperMode
    19:  'driverTemp',         // DriverTempSetting
    20:  'passengerTemp',      // PassengerTempSetting
    21:  'power',              // PowerValue (kW at wheels)
    22:  'heading',            // Heading
    23:  'chargerVoltage',     // ChargerVoltage
    24:  'batteryHeaterOn',    // BatteryHeaterOn
    25:  'seatHeaterLeft',     // SeatHeaterLeft
    26:  'seatHeaterRight',    // SeatHeaterRight
    27:  'steeringWheelHeater',// SteeringWheelHeatLevel
    28:  'frontTrunkState',    // FrontTrunkOpen
    29:  'rearTrunkState',     // RearTrunkOpen
    30:  'softwareVersion',    // Version
  };
  return map[fieldNum];
}

/// Maps a JSON telemetry key name (from test/JSON clients) to a Firestore key.
String? _telemetryKeyToFirestore(String key) {
  const map = {
    'BatteryLevel':          'batteryLevel',
    'Odometer':              'odometer',
    'VehicleSpeed':          'speed',
    'ChargingState':         'chargingState',
    'ChargerPower':          'chargerPower',
    'ChargeEnergyAdded':     'chargeEnergyAdded',
    'TimeToFullCharge':      'timeToFullCharge',
    'ChargeLimitSoc':        'chargeLimitSoc',
    'ChargeCurrentRequest':  'chargeCurrentRequest',
    'Locked':                'isLocked',
    'SentryModeActive':      'isSentryModeOn',
    'Gear':                  'shiftState',
    'Location':              'location',
    'BatteryRange':          'batteryRange',
    'IdealBatteryRange':     'idealBatteryRange',
    'InsideTempEstimate':    'insideTemp',
    'OutsideTempFiltered':   'outsideTemp',
    'InsideTemp':            'insideTemp',
    'OutsideTemp':           'outsideTemp',
    'HvacAutoMode':          'isClimateOn',
    'ClimateKeeperMode':     'isClimateOn',
    'DriverTempSetting':     'driverTemp',
    'PassengerTempSetting':  'passengerTemp',
    'Power':                 'power',
    'Heading':               'heading',
    'ChargerVoltage':        'chargerVoltage',
    'BatteryHeaterOn':       'batteryHeaterOn',
    'SeatHeaterLeft':        'seatHeaterLeft',
    'SeatHeaterRight':       'seatHeaterRight',
    'SteeringWheelHeatLevel':'steeringWheelHeater',
    'FrontTrunkOpen':        'frontTrunkState',
    'RearTrunkOpen':         'rearTrunkState',
    'Version':               'softwareVersion',
    'EstimatedBatteryRange': 'estBatteryRange',
  };
  return map[key];
}

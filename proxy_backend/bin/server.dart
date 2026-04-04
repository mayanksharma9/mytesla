import 'dart:convert';
import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';
import 'package:dotenv/dotenv.dart';
import 'package:proxy_backend/security_utils.dart';
import 'package:proxy_backend/tvcp_signer.dart';
import 'package:proxy_backend/tesla_api.dart';
import 'package:proxy_backend/proto/universal_message.pb.dart';

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

    try {
      // Step 1: Ensure Session is Ready
      final domain = Domain.DOMAIN_VEHICLE_SECURITY;
      if (!signer.isSessionReady(domain)) {
        print('Session not ready for $vin, initiating handshake...');
        final requestMsg = await signer.createSessionInfoRequest(domain);
        final handshakePayload = base64Encode(requestMsg.writeToBuffer());
        
        final handshakeRes = await teslaApi.sendSignedCommand(vin, handshakePayload, token);
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

      // Step 2: Sign and Send Command
      final payloadB64 = await signer.signCommand(command);
      print('Sending command $command to $vin...');
      final commandRes = await teslaApi.sendSignedCommand(vin, payloadB64, token);
      print('Command API Response: $commandRes');
      
      return Response.ok(jsonEncode(commandRes), headers: {'Content-Type': 'application/json'});
    } catch (e, stack) {
      print('Proxy Error for $vin: $e');
      print(stack);
      // If error is related to session, reset the signer
      if (e.toString().contains('Session') || e.toString().contains('whitelist')) {
        signers.remove(vin);
      }
      return Response.internalServerError(body: jsonEncode({
        'error': e.toString(),
        'type': e.runtimeType.toString()
      }));
    }
  });

  app.get('/health', (Request request) {
    return Response.ok('OK');
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

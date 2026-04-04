import 'dart:convert';
import 'dart:typed_data';
import 'dart:math';
import 'package:crypto/crypto.dart';
import '../../../features/auth/domain/security_repository.dart';

import 'proto/universal_message.pb.dart';
import 'proto/signatures.pb.dart';
import 'proto/vcsec.pb.dart' hide SignatureType;

class TVCPSession {
  final Domain domain;
  int counter = 0;
  List<int>? epoch;
  int? clockDeltaSeconds;
  Uint8List? hmacKey;
  List<int>? vehiclePublicKey;

  TVCPSession(this.domain);

  bool get isReady => epoch != null && hmacKey != null && clockDeltaSeconds != null;

  void update(SessionInfo info, Uint8List derivedHmacKey) {
    counter = info.counter;
    epoch = info.epoch;
    final now = (DateTime.now().millisecondsSinceEpoch / 1000).round();
    clockDeltaSeconds = now - info.clockTime;
    hmacKey = derivedHmacKey;
    vehiclePublicKey = info.publicKey;
  }
}

class TVCPSigner {
  final SecurityRepository _securityRepository;
  final String vin;
  final Map<Domain, TVCPSession> _sessions = {
    Domain.DOMAIN_VEHICLE_SECURITY: TVCPSession(Domain.DOMAIN_VEHICLE_SECURITY),
    Domain.DOMAIN_INFOTAINMENT: TVCPSession(Domain.DOMAIN_INFOTAINMENT),
  };
  final List<int> _routingAddress;

  TVCPSigner(this._securityRepository, this.vin) : _routingAddress = _generateRandomBytes(16);

  static List<int> _generateRandomBytes(int length) {
    final random = Random.secure();
    return List<int>.generate(length, (_) => random.nextInt(256));
  }

  /// 1. Handshake Flow: Create the Request Message 
  Future<RoutableMessage> createSessionInfoRequest(Domain domain) async {
    final pubKeyB64 = await _securityRepository.getPublicKey();
    if (pubKeyB64 == null) throw Exception('No public key found');

    final pubKeyBytes = base64Decode(pubKeyB64);

    return RoutableMessage(
      toDestination: Destination(domain: domain),
      fromDestination: Destination(routingAddress: _routingAddress),
      uuid: _generateRandomBytes(16),
      sessionInfoRequest: SessionInfoRequest(publicKey: pubKeyBytes),
    );
  }

  /// 2. Handshake Flow: Process Response and establish Session
  Future<void> processSessionInfoResponse(Domain domain, RoutableMessage response) async {
    if (!response.hasSessionInfo()) {
      throw Exception('RoutableMessage does not contain session info');
    }
    
    final info = SessionInfo.fromBuffer(response.sessionInfo);
    if (info.status == Session_Info_Status.SESSION_INFO_STATUS_KEY_NOT_ON_WHITELIST) {
      throw Exception('Key not on vehicle whitelist');
    }

    final vehiclePubKey = Uint8List.fromList(info.publicKey);
    final sharedSecret = await _securityRepository.deriveSharedSecret(vehiclePubKey);
    if (sharedSecret == null) throw Exception('Failed to derive shared secret');

    final hmac = Hmac(sha256, sharedSecret);
    final hmacKeyBytes = hmac.convert(utf8.encode('authenticated command'));
    
    _sessions[domain]!.update(info, Uint8List.fromList(hmacKeyBytes.bytes));
  }

  bool isSessionReady(Domain domain) {
    return _sessions[domain]!.isReady;
  }

  /// 3. Sign Command
  Future<String> signCommand(String commandName) async {
    final domain = Domain.DOMAIN_VEHICLE_SECURITY;
    final session = _sessions[domain]!;
    
    if (!session.isReady) {
      throw Exception('Session not ready for $domain');
    }

    List<int> payloadBytes;
    if (commandName == 'door_unlock') {
      final msg = UnsignedMessage(
        rKEAction: RKEAction_E.RKE_ACTION_UNLOCK,
      );
      payloadBytes = msg.writeToBuffer();
    } else if (commandName == 'door_lock') {
      final msg = UnsignedMessage(
        rKEAction: RKEAction_E.RKE_ACTION_LOCK,
      );
      payloadBytes = msg.writeToBuffer();
    } else if (commandName == 'actuate_trunk') {
      // Not fully implemented here, placeholder for now
      throw UnimplementedError('actuate_trunk requires payload arguments we did not wire yet in this signature');
    } else {
      throw UnimplementedError('Command $commandName not yet supported for TVCP signed command');
    }

    // Prepare metadata
    session.counter += 1;
    final now = (DateTime.now().millisecondsSinceEpoch / 1000).round();
    final expiresAt = now - session.clockDeltaSeconds! + 10; // expire in 10s

    final hmacData = HMAC_Personalized_Signature_Data(
      epoch: session.epoch,
      counter: session.counter,
      expiresAt: expiresAt,
    );

    // TAG_SIGNATURE_TYPE=00 01 06 (HMAC_PERSONALIZED=6)
    // TAG_DOMAIN=01 01 01 (DOMAIN_VEHICLE_SECURITY=1)
    // TAG_PERSONALIZATION=02 11 (17-byte VIN)
    // TAG_EPOCH=03 10 (16-byte epoch)
    // TAG_EXPIRES_AT=04 04 (4-byte uint32)
    // TAG_COUNTER=05 04 (4-byte uint32)
    // TAG_END=FF

    final metadata = BytesBuilder();
    metadata.add([Tag.TAG_SIGNATURE_TYPE.value, 1, SignatureType.SIGNATURE_TYPE_HMAC_PERSONALIZED.value]);
    metadata.add([Tag.TAG_DOMAIN.value, 1, domain.value]);
    
    final vinBytes = utf8.encode(vin);
    metadata.add([Tag.TAG_PERSONALIZATION.value, vinBytes.length]);
    metadata.add(vinBytes);

    metadata.add([Tag.TAG_EPOCH.value, session.epoch!.length]);
    metadata.add(session.epoch!);

    metadata.add([Tag.TAG_EXPIRES_AT.value, 4]);
    metadata.add(_uint32ToBytes(expiresAt));

    metadata.add([Tag.TAG_COUNTER.value, 4]);
    metadata.add(_uint32ToBytes(session.counter));

    metadata.add([Tag.TAG_END.value]);

    final metadataBytes = metadata.toBytes();
    
    // Tag = HMAC-SHA256(hmacKey, metadata || payload)
    final hmac = Hmac(sha256, session.hmacKey!);
    final tagBuilder = BytesBuilder();
    tagBuilder.add(metadataBytes);
    tagBuilder.add(payloadBytes);
    final tagDigest = hmac.convert(tagBuilder.toBytes());

    hmacData.tag = tagDigest.bytes;

    final pubKeyB64 = await _securityRepository.getPublicKey();
    final pubKeyBytes = base64Decode(pubKeyB64!);

    final signatureData = SignatureData(
      signerIdentity: KeyIdentity(publicKey: pubKeyBytes),
      hMACPersonalizedData: hmacData,
    );

    final routableMessage = RoutableMessage(
      toDestination: Destination(domain: domain),
      fromDestination: Destination(routingAddress: _routingAddress),
      protobufMessageAsBytes: payloadBytes,
      uuid: _generateRandomBytes(16),
      signatureData: signatureData,
    );

    return base64Encode(routableMessage.writeToBuffer());
  }

  static List<int> _uint32ToBytes(int value) {
    final bytes = Uint8List(4);
    final data = ByteData.view(bytes.buffer);
    data.setUint32(0, value, Endian.big);
    return bytes;
  }
}

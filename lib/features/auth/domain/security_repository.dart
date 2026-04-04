import 'dart:typed_data';

abstract class SecurityRepository {
  Future<void> generateKeyPair();
  Future<String?> getPublicKey();
  Future<String?> signPayload(String payload);
  Future<String?> signBytes(Uint8List bytes);
  Future<bool> hasKeyPair();
  Future<void> markKeyAsRegistered();
  Future<bool> isKeyAsRegistered();
  Future<Uint8List?> deriveSharedSecret(Uint8List peerPublicKey);
}

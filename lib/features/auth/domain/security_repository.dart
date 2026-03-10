abstract class SecurityRepository {
  Future<void> generateKeyPair();
  Future<String?> getPublicKey();
  Future<String?> signPayload(String payload);
  Future<bool> hasKeyPair();
  Future<void> markKeyAsRegistered();
  Future<bool> isKeyAsRegistered();
}

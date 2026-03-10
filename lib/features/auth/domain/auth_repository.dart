import 'package:voltride/features/dashboard/data/models/tesla_models.dart';

abstract class AuthRepository {
  Future<bool> login();
  Future<void> logout();
  Future<bool> refreshToken();
  Future<String?> getAccessToken();
  Future<void> saveDeveloperCredentials(String clientId, String clientSecret, String region);
  Future<bool> hasDeveloperCredentials();
  Future<Map<String, String?>> getDeveloperCredentials();
  Future<UserProfile> getUserProfile();
  Future<List<ChargingHistoryEntry>> getChargingHistory();
}

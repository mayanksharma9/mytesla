import 'package:voltride/core/network/tesla_api_client.dart';
import 'package:voltride/features/dashboard/data/models/tesla_models.dart';
import 'package:voltride/features/charging/domain/charging_repository.dart';
import 'package:voltride/features/telemetry/data/repositories/charge_session_repository.dart';

class ChargingRepositoryImpl implements ChargingRepository {
  final TeslaApiClient _apiClient;
  final ChargeSessionRepository _localSessions;

  ChargingRepositoryImpl(this._apiClient, this._localSessions);

  @override
  Future<List<ChargingLocation>> getChargingLocations() async {
    return await _apiClient.getChargingLocations();
  }

  @override
  Future<ChargingTariff?> getChargingTariffs(String locationId) async {
    return await _apiClient.getChargingTariffs(locationId);
  }

  @override
  Future<List<ChargingHistoryEntry>> getChargingHistory({int? page, int? perPage}) async {
    final response = await _apiClient.getChargingHistory(page: page, perPage: perPage);
    return response.response;
  }

  @override
  Future<List<int>> getChargingInvoice(String sessionId) async {
    return await _apiClient.getChargingInvoice(sessionId);
  }

  @override
  Future<List<ChargingSessionInfo>> getBusinessChargingSessions() async {
    final response = await _apiClient.getChargingSessions();
    return response.response;
  }

  @override
  Future<List<ChargeSession>> getLocalChargeSessions(String vin) async {
    return _localSessions.getSessionsList(vin);
  }
}

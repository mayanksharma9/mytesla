import '../../dashboard/data/models/tesla_models.dart';

abstract class ChargingRepository {
  Future<List<ChargingLocation>> getChargingLocations();
  Future<ChargingTariff?> getChargingTariffs(String locationId);
  Future<List<ChargingHistoryEntry>> getChargingHistory({int? page, int? perPage});
  Future<List<int>> getChargingInvoice(String sessionId);
  Future<List<ChargingSessionInfo>> getBusinessChargingSessions();

  /// Returns locally stored charge sessions from Hive for [vin], sorted by
  /// start time descending. This is the primary charging history source since
  /// the Tesla Fleet API /dx/charging/history endpoint requires fleet enrollment
  /// and may return empty for personal accounts.
  Future<List<ChargeSession>> getLocalChargeSessions(String vin);
}

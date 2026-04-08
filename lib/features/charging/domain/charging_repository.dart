import '../../dashboard/data/models/tesla_models.dart';

abstract class ChargingRepository {
  Future<List<ChargingLocation>> getChargingLocations();
  Future<ChargingTariff?> getChargingTariffs(String locationId);
  Future<List<ChargingHistoryEntry>> getChargingHistory({int? page, int? perPage});
  Future<List<int>> getChargingInvoice(String sessionId);
  Future<List<ChargingSessionInfo>> getBusinessChargingSessions();
}

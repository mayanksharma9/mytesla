import '../../dashboard/data/models/tesla_models.dart';

abstract class ChargingRepository {
  Future<List<ChargingLocation>> getChargingLocations();
  Future<ChargingTariff?> getChargingTariffs(String locationId);
  Future<List<ChargingHistoryEntry>> getChargingHistory({
    String? vin,
    int? pageNo,
    int? pageSize,
    String? startTime,
    String? endTime,
    String? sortBy,
    String? sortOrder,
  });

  /// Downloads PDF invoice bytes. [contentId] from [ChargingHistoryEntry.invoices].
  Future<List<int>> getChargingInvoice(String contentId);

  Future<List<ChargingSessionInfo>> getBusinessChargingSessions({
    String? vin,
    String? dateFrom,
    String? dateTo,
    int? limit,
    int? offset,
  });

  /// Returns locally stored charge sessions from Hive for [vin], sorted by
  /// start time descending. This is the primary charging history source since
  /// the Tesla Fleet API /dx/charging/history endpoint requires fleet enrollment
  /// and may return empty for personal accounts.
  Future<List<ChargeSession>> getLocalChargeSessions(String vin);
}

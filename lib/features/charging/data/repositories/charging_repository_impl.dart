import 'package:voltride/core/network/tesla_api_client.dart';
import 'package:voltride/features/dashboard/data/models/tesla_models.dart';
import 'package:voltride/features/charging/domain/charging_repository.dart';
import 'package:voltride/features/charging/data/repositories/charging_history_cache.dart';
import 'package:voltride/features/telemetry/data/repositories/charge_session_repository.dart';

class ChargingRepositoryImpl implements ChargingRepository {
  final TeslaApiClient _apiClient;
  final ChargeSessionRepository _localSessions;
  final ChargingHistoryCache _cache;

  ChargingRepositoryImpl(this._apiClient, this._localSessions, this._cache);

  @override
  Future<List<ChargingLocation>> getChargingLocations() =>
      _apiClient.getChargingLocations();

  @override
  Future<ChargingTariff?> getChargingTariffs(String locationId) =>
      _apiClient.getChargingTariffs(locationId);

  /// Returns charging history with cache-first strategy.
  ///
  /// • If cache is fresh (< 30 min) and has data for the requested page → return cache.
  /// • Otherwise fetch from API, merge into cache, return result.
  @override
  Future<List<ChargingHistoryEntry>> getChargingHistory({
    String? vin,
    int? pageNo,
    int? pageSize,
    String? startTime,
    String? endTime,
    String? sortBy,
    String? sortOrder,
  }) async {
    final page = pageNo ?? 1;
    final size = pageSize ?? 10;
    final vinKey = vin ?? 'unknown';

    // Serve from cache if fresh enough
    if (_cache.isFresh(vinKey)) {
      final cached = _cache.getPage(vinKey, page, size);
      if (cached.isNotEmpty) return cached;
    }

    // Fetch from Tesla API
    final response = await _apiClient.getChargingHistory(
      vin: vin,
      pageNo: page,
      pageSize: size,
      startTime: startTime,
      endTime: endTime,
      sortBy: sortBy,
      sortOrder: sortOrder,
    );
    if (response.response.isNotEmpty && vin != null) {
      await _cache.merge(vinKey, response.response);
    }
    return response.response;
  }

  /// Returns ALL cached entries for [vin] (used for analytics computation).
  Future<List<ChargingHistoryEntry>> getAllCachedHistory(String vin) async {
    final cached = _cache.getAll(vin);
    if (cached.isNotEmpty) return cached;
    // Seed cache with first 2 pages if empty
    for (int p = 1; p <= 2; p++) {
      final r = await _apiClient.getChargingHistory(vin: vin, pageNo: p, pageSize: 50);
      if (r.response.isEmpty) break;
      await _cache.merge(vin, r.response);
    }
    return _cache.getAll(vin);
  }

  @override
  Future<List<int>> getChargingInvoice(String contentId) =>
      _apiClient.getChargingInvoice(contentId);

  @override
  Future<List<ChargingSessionInfo>> getBusinessChargingSessions({
    String? vin,
    String? dateFrom,
    String? dateTo,
    int? limit,
    int? offset,
  }) async {
    final response = await _apiClient.getChargingSessions(
      vin: vin,
      dateFrom: dateFrom,
      dateTo: dateTo,
      limit: limit,
      offset: offset,
    );
    return response.response;
  }

  @override
  Future<List<ChargeSession>> getLocalChargeSessions(String vin) =>
      _localSessions.getSessionsList(vin);
}

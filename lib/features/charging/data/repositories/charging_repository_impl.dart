import 'package:cloud_functions/cloud_functions.dart';
import 'package:voltride/features/dashboard/data/models/tesla_models.dart';
import 'package:voltride/features/charging/domain/charging_repository.dart';
import 'package:voltride/features/charging/data/repositories/charging_history_cache.dart';
import 'package:voltride/features/telemetry/data/repositories/charge_session_repository.dart';

class ChargingRepositoryImpl implements ChargingRepository {
  final FirebaseFunctions _functions;
  final ChargeSessionRepository _localSessions;
  final ChargingHistoryCache _cache;

  ChargingRepositoryImpl(this._functions, this._localSessions, this._cache);

  @override
  Future<List<ChargingLocation>> getChargingLocations() async {
    final res = await _getGenericData('/api/1/charging/locations');
    return res.map((json) => ChargingLocation.fromJson(json)).toList();
  }

  @override
  Future<ChargingTariff?> getChargingTariffs(String locationId) async {
    final res = await _getGenericData('/api/1/charging/locations/$locationId/tariffs');
    if (res.isEmpty) return null;
    return ChargingTariff.fromJson(res.first);
  }

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

    if (_cache.isFresh(vinKey)) {
      final cached = _cache.getPage(vinKey, page, size);
      if (cached.isNotEmpty) return cached;
    }

    final params = <String, dynamic>{
      if (vin != null) 'vin': vin,
      'pageNo': page,
      'pageSize': size,
      if (startTime != null) 'startTime': startTime,
      if (endTime != null) 'endTime': endTime,
      if (sortBy != null) 'sortBy': sortBy,
      if (sortOrder != null) 'sortOrder': sortOrder,
    };

    final response = await _getGenericData('/api/1/dx/charging/history', params: params);
    final entries = response.map((e) => ChargingHistoryEntry.fromJson(e)).toList();
    
    if (entries.isNotEmpty && vin != null) {
      await _cache.merge(vinKey, entries);
    }
    return entries;
  }

  @override
  Future<List<int>> getChargingInvoice(String contentId) async {
    final result = await _functions.httpsCallable('getTeslaData').call({
      'path': '/api/1/dx/charging/invoice/$contentId',
    });
    // Assuming the Cloud Function returns a base64 string or byte list for invoices
    final data = result.data as Map;
    if (data['response'] is List) {
      return List<int>.from(data['response']);
    }
    throw Exception('Failed to fetch charging invoice');
  }

  @override
  Future<List<ChargingSessionInfo>> getBusinessChargingSessions({
    String? vin,
    String? dateFrom,
    String? dateTo,
    int? limit,
    int? offset,
  }) async {
    final params = <String, dynamic>{
      if (vin != null) 'vin': vin,
      if (dateFrom != null) 'date_from': dateFrom,
      if (dateTo != null) 'date_to': dateTo,
      if (limit != null) 'limit': limit,
      if (offset != null) 'offset': offset,
    };

    final response = await _getGenericData('/api/1/dx/charging/sessions', params: params);
    return response.map((e) => ChargingSessionInfo.fromJson(e)).toList();
  }

  @override
  Future<List<ChargeSession>> getLocalChargeSessions(String vin) =>
      _localSessions.getSessionsList(vin);

  /// Helper for Bloc analytics.
  Future<List<ChargingHistoryEntry>> getAllCachedHistory(String vin) async {
    final cached = _cache.getAll(vin);
    if (cached.isNotEmpty) return cached;
    // If cache is empty, fetch first page at least
    return getChargingHistory(vin: vin, pageNo: 1, pageSize: 50);
  }

  // --- Helper ---

  Future<List<Map<String, dynamic>>> _getGenericData(String path, {Map<String, dynamic>? params}) async {
    final result = await _functions.httpsCallable('getTeslaData').call({
      'path': path,
      if (params != null) 'params': params,
    });
    final data = result.data as Map;
    final response = data['response'];
    if (response is List) return response.map((e) => Map<String, dynamic>.from(e as Map)).toList();
    if (response is Map) return [Map<String, dynamic>.from(response)];
    return [];
  }
}

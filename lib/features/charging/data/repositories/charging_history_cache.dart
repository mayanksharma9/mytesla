import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:voltride/features/dashboard/data/models/tesla_models.dart';

/// Caches Tesla charging history entries in Hive as JSON strings.
///
/// Retention policy:
///   • Max 500 entries per VIN (oldest dropped).
///   • Entries older than 90 days are pruned on [cleanup].
///   • Cache is considered "fresh" for 30 minutes after the last API fetch.
class ChargingHistoryCache {
  static const String boxName = 'charging_history_cache';
  static const int _maxEntries = 500;
  static const Duration _freshDuration = Duration(minutes: 30);
  static const Duration _maxAge = Duration(days: 90);

  final Box _box;
  ChargingHistoryCache(this._box);

  // ---- Hive keys ----
  String _histKey(String vin) => '${vin}_h';
  String _tsKey(String vin) => '${vin}_ts';

  // ---- Write ----

  /// Merges [entries] into the cached list, deduplicates by sessionId,
  /// keeps newest first, trims to [_maxEntries].
  Future<void> merge(String vin, List<ChargingHistoryEntry> entries) async {
    final existing = getAll(vin);
    final map = <String, ChargingHistoryEntry>{
      for (final e in existing) _key(e): e,
      for (final e in entries) _key(e): e,
    };
    final sorted = map.values.toList()
      ..sort((a, b) => (b.chargeStartDateTime ?? '')
          .compareTo(a.chargeStartDateTime ?? ''));
    final trimmed = sorted.take(_maxEntries).toList();
    await _box.put(_histKey(vin), trimmed.map(_encode).toList());
    await _box.put(_tsKey(vin), DateTime.now().millisecondsSinceEpoch);
  }

  // ---- Read ----

  /// Returns all cached entries for [vin], newest first.
  List<ChargingHistoryEntry> getAll(String vin) {
    final raw = _box.get(_histKey(vin));
    if (raw == null) return [];
    try {
      return (raw as List)
          .cast<String>()
          .map((s) =>
              ChargingHistoryEntry.fromJson(jsonDecode(s) as Map<String, dynamic>))
          .toList();
    } catch (e) {
      debugPrint('ChargingHistoryCache: parse error for $vin: $e');
      return [];
    }
  }

  /// Returns [pageSize] entries starting from page [pageNo] (1-based).
  List<ChargingHistoryEntry> getPage(String vin, int pageNo, int pageSize) {
    final all = getAll(vin);
    final offset = (pageNo - 1) * pageSize;
    if (offset >= all.length) return [];
    return all.skip(offset).take(pageSize).toList();
  }

  int totalCached(String vin) => getAll(vin).length;

  /// True if data was fetched less than [_freshDuration] ago.
  bool isFresh(String vin) {
    final ts = _box.get(_tsKey(vin));
    if (ts == null) return false;
    return DateTime.now().millisecondsSinceEpoch - (ts as int) <
        _freshDuration.inMilliseconds;
  }

  // ---- Maintenance ----

  /// Prunes entries older than [_maxAge] and trims to [_maxEntries].
  /// Call once per app start (runs asynchronously, safe to fire-and-forget).
  Future<void> cleanup() async {
    final cutoff = DateTime.now().subtract(_maxAge);
    for (final rawKey in _box.keys.toList()) {
      final key = rawKey.toString();
      if (!key.endsWith('_h')) continue;
      final vin = key.substring(0, key.length - 2);
      final all = getAll(vin);
      final filtered = all.where((e) {
        if (e.chargeStartDateTime == null) return false;
        final dt = DateTime.tryParse(e.chargeStartDateTime!);
        return dt != null && dt.isAfter(cutoff);
      }).take(_maxEntries).toList();
      if (filtered.length != all.length) {
        await _box.put(_histKey(vin), filtered.map(_encode).toList());
        debugPrint(
            'ChargingHistoryCache: cleaned $vin ${all.length}→${filtered.length}');
      }
    }
  }

  // ---- Helpers ----

  String _key(ChargingHistoryEntry e) =>
      e.sessionId ??
      e.chargeStartDateTime ??
      '${e.energyKwh}_${e.totalCost}_${e.locationId}';

  String _encode(ChargingHistoryEntry e) {
    // Find the CHARGING fee to persist rate info across cache roundtrips.
    final chargingFee = e.fees.isNotEmpty
        ? e.fees.firstWhere(
            (f) => f.feeType.toUpperCase() == 'CHARGING',
            orElse: () => e.fees.first,
          )
        : null;

    return jsonEncode({
      'chargeStartDateTime': e.chargeStartDateTime,
      'chargeStopDateTime': e.chargeStopDateTime,
      'energy_kwh': e.energyKwh,
      'total_cost': e.totalCost,
      'vin': e.vin,
      'siteLocationName': e.locationId,
      'sessionId': e.sessionId,
      'currency_code': e.currencyCode,
      // Persist fee breakdown so rate display works after cache roundtrip.
      if (chargingFee != null)
        'fees': [
          {
            'feeType': chargingFee.feeType,
            'pricingType': chargingFee.pricingType,
            'usageBase': chargingFee.usageBase,
            'rateBase': chargingFee.rateBase,
            'totalDue': chargingFee.totalDue,
            'netDue': chargingFee.netDue,
            'currencyCode': chargingFee.currencyCode,
            'isPaid': chargingFee.isPaid,
            'status': chargingFee.status,
          }
        ],
    });
  }
}

import 'package:voltride/features/dashboard/data/models/tesla_models.dart';

// ---------------------------------------------------------------------------
// Data models
// ---------------------------------------------------------------------------

class MonthlyStats {
  final DateTime month;
  final double kwh;
  final double cost;
  final int sessions;

  const MonthlyStats({
    required this.month,
    required this.kwh,
    required this.cost,
    required this.sessions,
  });

  MonthlyStats copyWith({double? kwh, double? cost, int? sessions}) => MonthlyStats(
        month: month,
        kwh: kwh ?? this.kwh,
        cost: cost ?? this.cost,
        sessions: sessions ?? this.sessions,
      );
}

class StationStats {
  final String name;
  final int visits;
  final double totalKwh;
  final double totalCost;

  const StationStats({
    required this.name,
    required this.visits,
    required this.totalKwh,
    required this.totalCost,
  });

  StationStats copyWith({int? visits, double? totalKwh, double? totalCost}) => StationStats(
        name: name,
        visits: visits ?? this.visits,
        totalKwh: totalKwh ?? this.totalKwh,
        totalCost: totalCost ?? this.totalCost,
      );

  double get avgCostPerKwh => totalKwh > 0 ? totalCost / totalKwh : 0;
}

// heatmap[dayOfWeek 0=Mon…6=Sun][timeSlot 0=Morning 1=Afternoon 2=Evening 3=Night]
// Time slots: Morning 06-12, Afternoon 12-17, Evening 17-22, Night 22-06
typedef Heatmap = List<List<int>>;

class ChargingAnalytics {
  final double lifetimeKwh;
  final double lifetimeCost;
  final int lifetimeSessions;

  /// Last 6 calendar months, oldest first.
  final List<MonthlyStats> monthlyStats;

  /// [7][4] — day-of-week × time-slot session counts.
  final Heatmap heatmap;

  /// Top 5 stations by visit count.
  final List<StationStats> topStations;

  final double avgCostPerKwh;
  final double avgKwhPerSession;
  final double avgDurationMinutes;
  final String currencyCode;

  const ChargingAnalytics({
    required this.lifetimeKwh,
    required this.lifetimeCost,
    required this.lifetimeSessions,
    required this.monthlyStats,
    required this.heatmap,
    required this.topStations,
    required this.avgCostPerKwh,
    required this.avgKwhPerSession,
    required this.avgDurationMinutes,
    this.currencyCode = 'USD',
  });

  static ChargingAnalytics empty() => ChargingAnalytics(
        lifetimeKwh: 0,
        lifetimeCost: 0,
        lifetimeSessions: 0,
        monthlyStats: _emptyMonths(),
        heatmap: List.generate(7, (_) => List.filled(4, 0)),
        topStations: [],
        avgCostPerKwh: 0,
        avgKwhPerSession: 0,
        avgDurationMinutes: 0,
      );

  static List<MonthlyStats> _emptyMonths() {
    final now = DateTime.now();
    return List.generate(6, (i) {
      int month = now.month - (5 - i);
      int year = now.year;
      while (month < 1) { month += 12; year--; }
      return MonthlyStats(month: DateTime(year, month), kwh: 0, cost: 0, sessions: 0);
    });
  }

  // -------------------------------------------------------------------------
  // Core computation
  // -------------------------------------------------------------------------
  static ChargingAnalytics compute(List<ChargingHistoryEntry> all) {
    if (all.isEmpty) return empty();

    // --- Lifetime totals ---
    final totalKwh = all.fold(0.0, (s, e) => s + e.energyKwh);
    final totalCost = all.fold(0.0, (s, e) => s + e.totalCost);

    // --- Currency (from first entry that has it) ---
    final currency = all.firstWhere(
          (e) => e.currencyCode != null,
          orElse: () => all.first,
        ).currencyCode ??
        'USD';

    // --- Monthly stats (last 6 calendar months) ---
    final now = DateTime.now();
    final monthKeys = <String, MonthlyStats>{};
    for (int i = 5; i >= 0; i--) {
      int m = now.month - i;
      int y = now.year;
      while (m < 1) { m += 12; y--; }
      final key = '$y-$m';
      monthKeys[key] = MonthlyStats(month: DateTime(y, m), kwh: 0, cost: 0, sessions: 0);
    }
    for (final e in all) {
      final dt = _parseDate(e.chargeStartDateTime);
      if (dt == null) continue;
      final key = '${dt.year}-${dt.month}';
      if (monthKeys.containsKey(key)) {
        final cur = monthKeys[key]!;
        monthKeys[key] = cur.copyWith(
          kwh: cur.kwh + e.energyKwh,
          cost: cur.cost + e.totalCost,
          sessions: cur.sessions + 1,
        );
      }
    }
    final monthlyStats = monthKeys.values.toList();

    // --- Heatmap [7 days][4 time slots] ---
    // Days: 0=Mon … 6=Sun  (DateTime.weekday: Mon=1 … Sun=7)
    final heatmap = List.generate(7, (_) => List.filled(4, 0));
    for (final e in all) {
      final dt = _parseDate(e.chargeStartDateTime);
      if (dt == null) continue;
      final dayIdx = dt.weekday - 1; // 0=Mon … 6=Sun
      final slot = _timeSlot(dt.hour);
      heatmap[dayIdx][slot]++;
    }

    // --- Top stations ---
    final stationMap = <String, StationStats>{};
    for (final e in all) {
      final name = e.locationName;
      if (name == 'Tesla Supercharger') continue; // skip default fallback
      final cur = stationMap[name] ??
          StationStats(name: name, visits: 0, totalKwh: 0, totalCost: 0);
      stationMap[name] = cur.copyWith(
        visits: cur.visits + 1,
        totalKwh: cur.totalKwh + e.energyKwh,
        totalCost: cur.totalCost + e.totalCost,
      );
    }
    final topStations = (stationMap.values.toList()
          ..sort((a, b) => b.visits.compareTo(a.visits)))
        .take(5)
        .toList();

    // --- Averages ---
    // True weighted average rate: total cost / total kWh (not per-session mean).
    final ratedSessions =
        all.where((e) => e.energyKwh > 0 && e.totalCost > 0).toList();
    final ratedKwh = ratedSessions.fold(0.0, (s, e) => s + e.energyKwh);
    final ratedCost = ratedSessions.fold(0.0, (s, e) => s + e.totalCost);
    final avgRate = ratedKwh > 0 ? ratedCost / ratedKwh : 0.0;

    double totalDurationMin = 0;
    int durationCount = 0;
    for (final e in all) {
      final start = _parseDate(e.chargeStartDateTime);
      final stop = _parseDate(e.chargeStopDateTime);
      if (start != null && stop != null) {
        totalDurationMin += stop.difference(start).inMinutes;
        durationCount++;
      }
    }

    return ChargingAnalytics(
      lifetimeKwh: totalKwh,
      lifetimeCost: totalCost,
      lifetimeSessions: all.length,
      monthlyStats: monthlyStats,
      heatmap: heatmap,
      topStations: topStations,
      avgCostPerKwh: avgRate,
      avgKwhPerSession: all.isEmpty ? 0 : totalKwh / all.length,
      avgDurationMinutes: durationCount > 0 ? totalDurationMin / durationCount : 0,
      currencyCode: currency,
    );
  }

  static DateTime? _parseDate(String? s) =>
      s != null ? DateTime.tryParse(s)?.toLocal() : null;

  /// 0=Morning(6-12) 1=Afternoon(12-17) 2=Evening(17-22) 3=Night(22-6)
  static int _timeSlot(int hour) {
    if (hour >= 6 && hour < 12) return 0;
    if (hour >= 12 && hour < 17) return 1;
    if (hour >= 17 && hour < 22) return 2;
    return 3;
  }
}

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

/// Tracks battery level when the vehicle enters a parked state and measures
/// how much charge is lost while stationary (phantom/vampire drain).
///
/// A `PhantomDrainRecord` is written to Hive whenever the vehicle transitions
/// from driving → parked, and updated when the next non-parked transition is
/// detected (drive start or charge start).
class PhantomDrainRecord {
  final DateTime parkedAt;
  final int socAtPark;
  final int? socAtResume;
  final DateTime? resumedAt;

  const PhantomDrainRecord({
    required this.parkedAt,
    required this.socAtPark,
    this.socAtResume,
    this.resumedAt,
  });

  double get drainPercent => socAtResume != null ? (socAtPark - socAtResume!).toDouble() : 0;

  /// Drain rate in % per hour. Returns null if session not complete.
  double? get drainPerHour {
    if (socAtResume == null || resumedAt == null) return null;
    final hours = resumedAt!.difference(parkedAt).inMinutes / 60.0;
    if (hours <= 0) return null;
    return drainPercent / hours;
  }

  double get hoursParked {
    final end = resumedAt ?? DateTime.now();
    return end.difference(parkedAt).inMinutes / 60.0;
  }

  Map<String, dynamic> toJson() => {
    'parkedAt': parkedAt.toIso8601String(),
    'socAtPark': socAtPark,
    'socAtResume': socAtResume,
    'resumedAt': resumedAt?.toIso8601String(),
  };

  factory PhantomDrainRecord.fromJson(Map<dynamic, dynamic> map) => PhantomDrainRecord(
    parkedAt: DateTime.parse(map['parkedAt'] as String),
    socAtPark: map['socAtPark'] as int,
    socAtResume: map['socAtResume'] as int?,
    resumedAt: map['resumedAt'] != null ? DateTime.parse(map['resumedAt'] as String) : null,
  );
}

class PhantomDrainService {
  static const String _boxName = 'phantom_drain';
  static const int _maxRecords = 90;

  Box get _box => Hive.box(_boxName);

  /// Called every time we get a fresh vehicle state from the API or Firestore.
  /// [shiftState] is the current gear (null or 'P' = parked, 'D'/'R' = driving).
  /// [chargingState] is the charging state string ('Charging', 'Complete', etc.).
  void onVehicleUpdate({
    required int soc,
    required String? shiftState,
    required String? chargingState,
  }) {
    final isParked = shiftState == null || shiftState == 'P' || shiftState.isEmpty;
    final isCharging = chargingState == 'Charging' || chargingState == 'Complete';
    final activeKey = 'active_session';

    if (isParked && !isCharging) {
      // Vehicle is parked — start or continue a phantom drain session
      final existing = _box.get(activeKey);
      if (existing == null) {
        // Start new session
        final record = PhantomDrainRecord(parkedAt: DateTime.now(), socAtPark: soc);
        _box.put(activeKey, record.toJson());
      }
    } else {
      // Vehicle resumed (driving or charging) — close the active session
      final existing = _box.get(activeKey);
      if (existing != null) {
        try {
          final record = PhantomDrainRecord.fromJson(existing as Map);
          final completed = PhantomDrainRecord(
            parkedAt: record.parkedAt,
            socAtPark: record.socAtPark,
            socAtResume: soc,
            resumedAt: DateTime.now(),
          );
          _saveCompleted(completed);
        } catch (e) {
          debugPrint('PhantomDrainService: error closing session: $e');
        }
        _box.delete(activeKey);
      }
    }
  }

  void _saveCompleted(PhantomDrainRecord record) {
    // Only save sessions longer than 30 minutes with at least some drain
    if (record.hoursParked < 0.5) return;
    final key = 'drain_${record.parkedAt.millisecondsSinceEpoch}';
    _box.put(key, record.toJson());
    _trimOldRecords();
    debugPrint('PhantomDrainService: saved session '
        '${record.drainPercent.toStringAsFixed(1)}% over '
        '${record.hoursParked.toStringAsFixed(1)}h');
  }

  void _trimOldRecords() {
    final keys = _box.keys
        .where((k) => k != 'active_session')
        .toList()
      ..sort();
    if (keys.length > _maxRecords) {
      _box.deleteAll(keys.take(keys.length - _maxRecords));
    }
  }

  /// Returns completed phantom drain sessions, newest first.
  List<PhantomDrainRecord> getHistory({int limit = 30}) {
    return _box.keys
        .where((k) => k != 'active_session')
        .map((k) {
          try {
            return PhantomDrainRecord.fromJson(_box.get(k) as Map);
          } catch (_) {
            return null;
          }
        })
        .whereType<PhantomDrainRecord>()
        .where((r) => r.socAtResume != null)
        .toList()
      ..sort((a, b) => b.parkedAt.compareTo(a.parkedAt));
  }

  /// Average drain per hour over the last [days] days.
  double averageDrainPerHour({int days = 30}) {
    final cutoff = DateTime.now().subtract(Duration(days: days));
    final records = getHistory(limit: 100)
        .where((r) => r.parkedAt.isAfter(cutoff) && r.drainPerHour != null)
        .toList();
    if (records.isEmpty) return 0;
    return records.map((r) => r.drainPerHour!).reduce((a, b) => a + b) / records.length;
  }

  /// Total drain % in the last 24 hours while parked.
  double drainLast24h() {
    final cutoff = DateTime.now().subtract(const Duration(hours: 24));
    return getHistory(limit: 20)
        .where((r) => r.parkedAt.isAfter(cutoff) && r.socAtResume != null)
        .fold(0.0, (sum, r) => sum + r.drainPercent);
  }
}

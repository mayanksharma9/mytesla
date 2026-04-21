import 'package:hive/hive.dart';
import 'package:voltride/features/dashboard/data/models/tesla_models.dart';

class ChargeSessionRepository {
  final Box<ChargeSession> _chargeBox;

  ChargeSessionRepository(this._chargeBox);

  /// Returns all charge sessions for [vin], sorted by start time descending.
  Future<List<ChargeSession>> getSessionsList(String vin) async {
    final sessions = _chargeBox.values
        .where((s) => s.vin == vin || s.vin == null)
        .toList();
    sessions.sort((a, b) => b.startTime.compareTo(a.startTime));
    return sessions;
  }

  /// Returns the most recent completed charge session for [vin], or null.
  Future<ChargeSession?> getLastSession(String vin) async {
    final all = await getSessionsList(vin);
    return all.isEmpty ? null : all.first;
  }
}

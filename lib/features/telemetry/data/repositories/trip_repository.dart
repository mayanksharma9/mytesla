import 'package:hive/hive.dart';
import 'package:voltride/features/dashboard/data/models/tesla_models.dart';

class TripRepository {
  final Box<DriveSession> _tripBox;

  TripRepository(this._tripBox);

  /// Get all trips from local Hive storage, sorted by start time descending.
  Future<List<DriveSession>> getTripsList(String vin) async {
    final trips = _tripBox.values
        .where((trip) => trip.vin == vin || trip.vin == null)
        .toList();
    trips.sort((a, b) => b.startTime.compareTo(a.startTime));
    return trips;
  }

  /// Get all trips as a stream (emits current list when called).
  Stream<List<DriveSession>> getTripsStream(String vin) async* {
    yield await getTripsList(vin);
  }
}

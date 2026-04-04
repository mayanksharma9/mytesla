import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/trip_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class TripRepository {
  final FirebaseFirestore _firestore;

  TripRepository(this._firestore);

  Stream<List<TripModel>> getTripsStream(String vin) {
    return _firestore
        .collection('vehicles')
        .doc(vin)
        .collection('trips')
        .orderBy('start_time', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => TripModel.fromFirestore(doc)).toList();
    });
  }

  Future<List<TripModel>> getTripsList(String vin) async {
    final snapshot = await _firestore
        .collection('vehicles')
        .doc(vin)
        .collection('trips')
        .orderBy('start_time', descending: true)
        .get();
    return snapshot.docs.map((doc) => TripModel.fromFirestore(doc)).toList();
  }
}

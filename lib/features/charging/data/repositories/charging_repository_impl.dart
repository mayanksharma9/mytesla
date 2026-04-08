import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:voltride/core/network/tesla_api_client.dart';
import 'package:voltride/features/dashboard/data/models/tesla_models.dart';
import 'package:voltride/features/charging/domain/charging_repository.dart';

class ChargingRepositoryImpl implements ChargingRepository {
  final TeslaApiClient _apiClient;
  final FirebaseFirestore _firestore;

  ChargingRepositoryImpl(this._apiClient, this._firestore);

  @override
  Future<List<ChargingLocation>> getChargingLocations() async {
    return await _apiClient.getChargingLocations();
  }

  @override
  Future<ChargingTariff?> getChargingTariffs(String locationId) async {
    return await _apiClient.getChargingTariffs(locationId);
  }

  @override
  Future<List<ChargingHistoryEntry>> getChargingHistory({int? page, int? perPage}) async {
    final response = await _apiClient.getChargingHistory(page: page, perPage: perPage);
    final entries = response.response;

    // Sync to Firestore
    _syncToFirestore(entries);

    return entries;
  }

  @override
  Future<List<int>> getChargingInvoice(String sessionId) async {
    return await _apiClient.getChargingInvoice(sessionId);
  }

  @override
  Future<List<ChargingSessionInfo>> getBusinessChargingSessions() async {
    final response = await _apiClient.getChargingSessions();
    return response.response;
  }

  Future<void> _syncToFirestore(List<ChargingHistoryEntry> entries) async {
    try {
      final batch = _firestore.batch();
      for (var entry in entries) {
        if (entry.vin == null) continue;
        
        // Use a unique ID based on VIN and start time if possible
        final id = '${entry.vin}_${entry.chargeStartDateTime}';
        final docRef = _firestore.collection('charging_history').doc(id);
        batch.set(docRef, {
          ...entry.toJson(),
          'last_sync': FieldValue.serverTimestamp(),
        }, SetOptions(merge: true));
      }
      await batch.commit();
      print('ChargingRepository: Synced ${entries.length} charging sessions to Firestore');
    } catch (e) {
      print('ChargingRepository: Firestore sync failed: $e');
    }
  }
}

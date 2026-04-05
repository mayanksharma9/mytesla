import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:voltride/core/network/tesla_api_client.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:voltride/features/dashboard/data/models/tesla_models.dart';
import '../../domain/repositories/telemetry_repository.dart';
import '../models/telemetry_models.dart';
import '../../../auth/domain/security_repository.dart';

class TelemetryRepositoryImpl implements TelemetryRepository {
  final TeslaApiClient _apiClient;
  final SecurityRepository _securityRepository;
  final FirebaseFirestore _firestore;
  final Box<DriveSession> _tripBox;
  final Box<ChargeSession> _chargeBox;

  TelemetryRepositoryImpl(
    this._apiClient, 
    this._securityRepository, 
    this._firestore,
    this._tripBox, 
    this._chargeBox
  );

  @override
  Future<void> saveDriveSession(DriveSession session) async {
    // 1. Save to Local Hive
    await _tripBox.add(session);

    // 2. Save to Firestore
    if (session.vin != null) {
      await _firestore
          .collection('trip_history')
          .add({
            ...session.toJson(),
            'timestamp': FieldValue.serverTimestamp(),
          });
      print('TelemetryRepository: Saved drive session to Firestore for ${session.vin}');
    } else {
      print('TelemetryRepository: Skipping Firestore save for drive session: VIN is null');
    }
  }

  @override
  Future<void> saveChargeSession(ChargeSession session) async {
    // 1. Save to Local Hive
    await _chargeBox.add(session);

    // 2. Save to Firestore
    if (session.vin != null) {
      await _firestore
          .collection('charging_history')
          .add({
            ...session.toJson(),
            'timestamp': FieldValue.serverTimestamp(),
          });
      print('TelemetryRepository: Saved charge session to Firestore for ${session.vin}');
    } else {
      print('TelemetryRepository: Skipping Firestore save for charge session: VIN is null');
    }
  }

  @override
  Future<bool> configureTelemetry({
    required String vehicleId,
    required String hostname,
    required Map<String, TelemetryFieldConfig> fields,
    String? ca,
    String? deliveryPolicy,
  }) async {
    try {
      final config = TelemetryConfig(
        hostname: hostname,
        fields: fields,
        ca: ca,
        deliveryPolicy: deliveryPolicy,
      );

      final configJson = jsonEncode(config.toJson());
      
      // Sign the configuration
      final signature = await _securityRepository.signPayload(configJson);
      if (signature == null) {
        print('TelemetryRepository: Failed to sign telemetry configuration');
        return false;
      }

      // According to Tesla docs, the payload should be signed.
      // Usually, this means wrapping it or sending the signature in a header.
      // Re-reading: "The proxy will sign the configuration using the configured private key and forward the request to Fleet API."
      // "Once all pre-requisites are met, use the Fleet Telemetry configure endpoint to send the desired configuration to the vehicle."
      
      // If using Fleet API directly as a partner, you send the config.
      // The vehicle validates it against the registered public key.
      
      final response = await _apiClient.configureFleetTelemetry(vehicleId, config.toJson());
      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      print('TelemetryRepository: Error configuring telemetry: $e');
      return false;
    }
  }
}

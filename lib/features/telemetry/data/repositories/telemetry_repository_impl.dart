import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:voltride/core/network/tesla_api_client.dart';
import 'package:voltride/features/dashboard/data/models/tesla_models.dart';
import '../../domain/repositories/telemetry_repository.dart';
import '../models/telemetry_models.dart';
import '../../../auth/domain/security_repository.dart';

class TelemetryRepositoryImpl implements TelemetryRepository {
  final TeslaApiClient _apiClient;
  final SecurityRepository _securityRepository;
  final Box<DriveSession> _tripBox;
  final Box<ChargeSession> _chargeBox;

  TelemetryRepositoryImpl(
    this._apiClient, 
    this._securityRepository, 
    this._tripBox, 
    this._chargeBox,
  );

  @override
  Future<void> saveDriveSession(DriveSession session) async {
    // Save to Local Hive only
    await _tripBox.add(session);
    debugPrint('TelemetryRepository: Saved drive session locally for ${session.vin}');
  }

  @override
  Future<void> saveChargeSession(ChargeSession session) async {
    // Save to Local Hive only
    await _chargeBox.add(session);
    debugPrint('TelemetryRepository: Saved charge session locally for ${session.vin}');
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
        debugPrint('TelemetryRepository: Failed to sign telemetry configuration');
        return false;
      }

      final response = await _apiClient.configureFleetTelemetry(vehicleId, config.toJson());
      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      debugPrint('TelemetryRepository: Error configuring telemetry: $e');
      return false;
    }
  }
}

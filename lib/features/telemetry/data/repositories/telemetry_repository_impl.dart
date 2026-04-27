import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:voltride/features/dashboard/data/models/tesla_models.dart';
import '../../domain/repositories/telemetry_repository.dart';
import '../models/telemetry_models.dart';

class TelemetryRepositoryImpl implements TelemetryRepository {
  final FirebaseFunctions _functions;
  final Box<DriveSession> _tripBox;
  final Box<ChargeSession> _chargeBox;

  TelemetryRepositoryImpl(
    this._functions, 
    this._tripBox, 
    this._chargeBox,
  );

  @override
  Future<void> saveDriveSession(DriveSession session) async {
    await _tripBox.add(session);
    debugPrint('TelemetryRepository: Saved drive session locally for ${session.vin}');
  }

  @override
  Future<void> saveChargeSession(ChargeSession session) async {
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
      final config = {
        'hostname': hostname,
        'port': 443,
        'fields': fields.map((key, value) => MapEntry(key, value.toJson())),
        'ca':? ca,
        'delivery_policy':? deliveryPolicy,
      };

      // Fleet telemetry configuration now goes through Cloud Functions for server-side signing.
      // This is more secure as the vehicle_id integer is resolved to a VIN and the request is 
      // proxied correctly.
      final result = await _functions.httpsCallable('sendTeslaCommand').call({
        'vehicle_id': vehicleId,
        'command': 'fleet/telemetry_config',
        'data': {
          'vin': vehicleId, // Note: backend resolves this if it's an ID
          'config': config,
        },
      });

      final data = result.data as Map;
      return data['success'] == true || data['response'] != null;
    } catch (e) {
      debugPrint('TelemetryRepository: Error configuring telemetry: $e');
      return false;
    }
  }
}

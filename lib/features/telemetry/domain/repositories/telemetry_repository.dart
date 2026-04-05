import 'package:voltride/features/telemetry/data/models/telemetry_models.dart';
import 'package:voltride/features/dashboard/data/models/tesla_models.dart';

abstract class TelemetryRepository {
  Future<bool> configureTelemetry({
    required String vehicleId,
    required String hostname,
    required Map<String, TelemetryFieldConfig> fields,
    String? ca,
    String? deliveryPolicy,
  });

  Future<void> saveDriveSession(DriveSession session);
  Future<void> saveChargeSession(ChargeSession session);
}

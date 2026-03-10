import 'package:voltride/features/telemetry/data/models/telemetry_models.dart';

abstract class TelemetryRepository {
  Future<bool> configureTelemetry({
    required String vehicleId,
    required String hostname,
    required Map<String, TelemetryFieldConfig> fields,
    String? ca,
    String? deliveryPolicy,
  });
}

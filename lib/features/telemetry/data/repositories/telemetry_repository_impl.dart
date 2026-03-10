import 'dart:convert';
import 'package:voltride/core/network/tesla_api_client.dart';
import '../../domain/repositories/telemetry_repository.dart';
import '../models/telemetry_models.dart';
import '../../../auth/domain/security_repository.dart';

class TelemetryRepositoryImpl implements TelemetryRepository {
  final TeslaApiClient _apiClient;
  final SecurityRepository _securityRepository;

  TelemetryRepositoryImpl(this._apiClient, this._securityRepository);

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

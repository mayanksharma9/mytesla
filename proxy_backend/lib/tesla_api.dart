import 'package:dio/dio.dart';

class TeslaApi {
  final Dio _dio = Dio();
  static const String _defaultFleetUrl = 'https://fleet-api.prd.na.vn.cloud.tesla.com';

  Options _authOptions(String token) => Options(
    headers: {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'},
    validateStatus: (status) => status != null,
  );

  String _base(String? fleetBaseUrl) =>
      (fleetBaseUrl != null && fleetBaseUrl.isNotEmpty) ? fleetBaseUrl : _defaultFleetUrl;

  /// Sends a TVCP signed command to Tesla.
  Future<Map<String, dynamic>> sendSignedCommand(
    String vin,
    String routableMessageBase64,
    String token, {
    String? fleetBaseUrl,
  }) async {
    final response = await _dio.post(
      '${_base(fleetBaseUrl)}/api/1/vehicles/$vin/signed_command',
      data: {'routable_message': routableMessageBase64},
      options: _authOptions(token),
    );
    return response.data is Map<String, dynamic>
        ? response.data as Map<String, dynamic>
        : {'raw': response.data, 'statusCode': response.statusCode};
  }

  // ---------------------------------------------------------------------------
  // Fleet Telemetry endpoints (proxied to Tesla Fleet API)
  // ---------------------------------------------------------------------------

  /// POST fleet_telemetry_config_jws — sends the JWS-signed config to Tesla.
  Future<Map<String, dynamic>> postFleetTelemetryConfigJws(
    String jwsToken,
    List<String> vins,
    String token, {
    String? fleetBaseUrl,
  }) async {
    final response = await _dio.post(
      '${_base(fleetBaseUrl)}/api/1/vehicles/fleet_telemetry_config_jws',
      data: {'token': jwsToken, 'vins': vins},
      options: _authOptions(token),
    );
    return response.data is Map<String, dynamic>
        ? response.data as Map<String, dynamic>
        : {'raw': response.data, 'statusCode': response.statusCode};
  }

  /// GET fleet_telemetry_config — fetch the active config for a vehicle.
  Future<Map<String, dynamic>> getFleetTelemetryConfig(
    String vin,
    String token, {
    String? fleetBaseUrl,
  }) async {
    final response = await _dio.get(
      '${_base(fleetBaseUrl)}/api/1/vehicles/$vin/fleet_telemetry_config',
      options: _authOptions(token),
    );
    return response.data is Map<String, dynamic>
        ? response.data as Map<String, dynamic>
        : {'raw': response.data, 'statusCode': response.statusCode};
  }

  /// DELETE fleet_telemetry_config — remove the config from a vehicle.
  Future<Map<String, dynamic>> deleteFleetTelemetryConfig(
    String vin,
    String token, {
    String? fleetBaseUrl,
  }) async {
    final response = await _dio.delete(
      '${_base(fleetBaseUrl)}/api/1/vehicles/$vin/fleet_telemetry_config',
      options: _authOptions(token),
    );
    return response.data is Map<String, dynamic>
        ? response.data as Map<String, dynamic>
        : {'raw': response.data, 'statusCode': response.statusCode};
  }

  /// GET fleet_telemetry_errors — recent errors reported by the vehicle.
  Future<Map<String, dynamic>> getFleetTelemetryErrors(
    String vin,
    String token, {
    String? fleetBaseUrl,
  }) async {
    final response = await _dio.get(
      '${_base(fleetBaseUrl)}/api/1/vehicles/$vin/fleet_telemetry_errors',
      options: _authOptions(token),
    );
    return response.data is Map<String, dynamic>
        ? response.data as Map<String, dynamic>
        : {'raw': response.data, 'statusCode': response.statusCode};
  }

  /// POST fleet_status — vehicle capabilities (TVCP required, firmware, etc.)
  Future<Map<String, dynamic>> getFleetStatus(
    List<String> vins,
    String token, {
    String? fleetBaseUrl,
  }) async {
    final response = await _dio.post(
      '${_base(fleetBaseUrl)}/api/1/vehicles/fleet_status',
      data: {'vins': vins},
      options: _authOptions(token),
    );
    return response.data is Map<String, dynamic>
        ? response.data as Map<String, dynamic>
        : {'raw': response.data, 'statusCode': response.statusCode};
  }
}

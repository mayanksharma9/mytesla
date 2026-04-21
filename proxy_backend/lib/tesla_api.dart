import 'package:dio/dio.dart';

class TeslaApi {
  final Dio _dio = Dio();
  static const String _defaultFleetUrl = 'https://fleet-api.prd.na.vn.cloud.tesla.com';

  /// Sends a TVCP signed command to Tesla.
  ///
  /// [fleetBaseUrl] overrides the default NA region URL — pass the value from
  /// the `X-Fleet-Api-Base-Url` header so the proxy uses the same regional
  /// endpoint the Flutter app discovered via `updateRegion()`.
  Future<Map<String, dynamic>> sendSignedCommand(
    String vin,
    String routableMessageBase64,
    String token, {
    String? fleetBaseUrl,
  }) async {
    final baseUrl = (fleetBaseUrl != null && fleetBaseUrl.isNotEmpty)
        ? fleetBaseUrl
        : _defaultFleetUrl;

    final response = await _dio.post(
      '$baseUrl/api/1/vehicles/$vin/signed_command',
      data: {'routable_message': routableMessageBase64},
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        // Accept all statuses — let the caller inspect the body and decide.
        // Previously only accepted < 500, causing 501 to throw a DioException
        // that was caught by the proxy and returned as a generic 500, hiding
        // the real Tesla error message from the Flutter client.
        validateStatus: (status) => status != null,
      ),
    );

    return response.data is Map<String, dynamic>
        ? response.data as Map<String, dynamic>
        : {'raw': response.data, 'statusCode': response.statusCode};
  }
}

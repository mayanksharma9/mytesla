import 'package:dio/dio.dart';

class TeslaApi {
  final Dio _dio = Dio();
  static const String _fleetUrl = 'https://fleet-api.prd.na.vn.cloud.tesla.com';

  Future<Map<String, dynamic>> sendSignedCommand(
    String vin,
    String routableMessageBase64,
    String token,
  ) async {
    final response = await _dio.post(
      '$_fleetUrl/api/1/vehicles/$vin/signed_command',
      data: {'routable_message': routableMessageBase64},
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        validateStatus: (status) => status != null && status < 500, // Return on 4xx
      ),
    );

    return response.data;
  }
}

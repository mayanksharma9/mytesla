import 'package:dio/dio.dart';


class ApiClient {
final Dio _dio;
ApiClient(String baseUrl)
: _dio = Dio(BaseOptions(baseUrl: baseUrl, connectTimeout: const Duration(seconds: 10), receiveTimeout: const Duration(seconds: 10)));


Future<Response<dynamic>> get(String path, {Map<String, dynamic>? query}) => _dio.get(path, queryParameters: query);
Future<Response<dynamic>> post(String path, {dynamic data}) => _dio.post(path, data: data);
}
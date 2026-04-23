import 'package:flutter/foundation.dart';
import '../domain/auth_repository.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:voltride/core/network/tesla_api_client.dart';
import 'package:voltride/core/network/tesla_config.dart';
import 'package:voltride/features/dashboard/data/models/tesla_models.dart';
import '../domain/security_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FlutterSecureStorage _storage;
  final Dio _dio;
  final SecurityRepository _securityRepository;
  final Dio _tokenDio; // Dedicated Dio for token requests to avoid interceptor recursion
  
  static const String _expiresAtKey = 'tesla_expires_at';
  static const String _regionKey = 'tesla_region';

  AuthRepositoryImpl(this._storage, this._dio, this._securityRepository)
      : _tokenDio = Dio();

  @override
  Future<bool> login() async {
    try {
      // Use dynamic getters from TeslaConfig instead of const
      final clientId = TeslaConfig.clientId;
      final callbackUrl = TeslaConfig.callbackUrl;
      final callbackScheme = TeslaConfig.callbackScheme;

      final authUri = Uri.parse(TeslaConfig.authUrl).replace(
        queryParameters: {
          'client_id': clientId,
          'redirect_uri': callbackUrl,
          'response_type': 'code',
          'scope': TeslaConfig.scopeString,
          'state': 'vtr-${DateTime.now().millisecondsSinceEpoch}',
          // Inform users a virtual key pairing step follows login.
          'show_keypair_step': 'true',
        },
      );

      final result = await FlutterWebAuth2.authenticate(
        url: authUri.toString(),
        callbackUrlScheme: callbackScheme,
      );

      final uri = Uri.parse(result);
      final code = uri.queryParameters['code'];
      final error = uri.queryParameters['error'];
      final errorDesc = uri.queryParameters['error_description'];

      if (code != null) {
        // Exchange code for tokens.
        // Tesla docs: code exchange requires 'audience' (Fleet API base URL).
        // Must POST to fleet-auth domain, not auth.tesla.com.
        final response = await _tokenDio.post(
          TeslaConfig.tokenUrl,
          data: {
            'grant_type': 'authorization_code',
            'client_id': clientId,
            'client_secret': TeslaConfig.clientSecret,
            'code': code,
            'redirect_uri': callbackUrl,
            'audience': TeslaConfig.audience,
          },
          options: Options(contentType: Headers.formUrlEncodedContentType),
        );

        if (response.statusCode == 200) {
          final expiresIn = response.data['expires_in'] as int;
          final expiresAt = DateTime.now()
              .add(Duration(seconds: expiresIn))
              .millisecondsSinceEpoch;

          await _storage.write(key: 'access_token', value: response.data['access_token']);
          await _storage.write(key: 'refresh_token', value: response.data['refresh_token']);
          await _storage.write(key: _expiresAtKey, value: expiresAt.toString());

          // Auto region discovery — always use NA endpoint for this call.
          try {
            final regionResponse = await _dio.get(
              'https://fleet-api.prd.na.vn.cloud.tesla.com/api/1/users/region',
              options: Options(
                  headers: {'Authorization': 'Bearer ${response.data['access_token']}'}),
            );
            final regionData = regionResponse.data['response'];
            if (regionData != null) {
              final fleetUrl = regionData['fleet_api_base_url'] as String;
              debugPrint('AuthRepository: Region discovered: $fleetUrl');
              await _storage.write(key: _regionKey, value: fleetUrl);
            }
          } catch (e) {
            debugPrint('AuthRepository: Region discovery failed, using default: $e');
          }
          return true;
        } else {
          throw Exception('Token exchange failed: ${response.statusCode}');
        }
      } else if (error != null) {
        throw Exception((errorDesc ?? error).replaceAll('%20', ' '));
      } else {
        return false;
      }
    } catch (e) {
      debugPrint('AuthRepository: Login error: $e');
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    await _storage.delete(key: 'access_token');
    await _storage.delete(key: 'refresh_token');
  }

  @override
  Future<bool> refreshToken() async {
    final refreshToken = await _storage.read(key: 'refresh_token');
    if (refreshToken == null) return false;

    try {
      // Tesla docs: refresh only requires grant_type, client_id, refresh_token.
      // Must POST to fleet-auth domain.
      final response = await _tokenDio.post(
        TeslaConfig.tokenUrl,
        data: {
          'grant_type': 'refresh_token',
          'client_id': TeslaConfig.clientId,
          'refresh_token': refreshToken,
        },
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );

      if (response.statusCode == 200) {
        final expiresIn = response.data['expires_in'] as int;
        final expiresAt = DateTime.now()
            .add(Duration(seconds: expiresIn))
            .millisecondsSinceEpoch;

        await _storage.write(key: 'access_token', value: response.data['access_token']);
        // Save new refresh token — Tesla refresh tokens are single-use.
        if (response.data['refresh_token'] != null) {
          await _storage.write(key: 'refresh_token', value: response.data['refresh_token']);
        }
        await _storage.write(key: _expiresAtKey, value: expiresAt.toString());
        return true;
      }
    } catch (e) {
      debugPrint('AuthRepository: Refresh token failed: $e');
      if (e is DioException) {
        final status = e.response?.statusCode;
        final body = e.response?.data;
        final errorCode = body is Map ? body['error'] as String? : null;
        // login_required = refresh token expired or password reset — must re-auth.
        if (status == 401 || errorCode == 'login_required') {
          debugPrint('AuthRepository: Refresh token invalid — clearing session');
          await logout();
        }
      }
    }
    return false;
  }

  @override
  Future<String?> getAccessToken() => _storage.read(key: 'access_token');


  @override
  Future<UserProfile> getUserProfile() async {
    final client = TeslaApiClient(_dio, _storage, _securityRepository);
    return await client.getUserProfile();
  }
}

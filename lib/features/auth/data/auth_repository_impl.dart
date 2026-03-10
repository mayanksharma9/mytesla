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
          'audience': TeslaConfig.audience,
          'state': 'vtr-${DateTime.now().millisecondsSinceEpoch}',
        },
      );
      final url = authUri.toString();

      print('AuthRepository: Launching Tesla Auth URL: $url');

      final result = await FlutterWebAuth2.authenticate(
        url: url,
        callbackUrlScheme: callbackScheme,
      );

      print('AuthRepository: Auth Result: $result');

      final uri = Uri.parse(result);
      final code = uri.queryParameters['code'];
      final error = uri.queryParameters['error'];
      final errorDesc = uri.queryParameters['error_description'];

      if (code != null) {
        print('AuthRepository: Exchanging code for tokens...');
        
        // Exchange code for tokens using Tesla token URL
        final response = await _tokenDio.post(
          TeslaConfig.tokenUrl,
          data: {
            'grant_type': 'authorization_code',
            'client_id': clientId,
            'client_secret': TeslaConfig.clientSecret,
            'code': code,
            'redirect_uri': callbackUrl,
          },
          options: Options(
            contentType: Headers.formUrlEncodedContentType,
          ),
        );

        if (response.statusCode == 200) {
          print('AuthRepository: Login successful, saving tokens.');
          final expiresIn = response.data['expires_in'] as int;
          final expiresAt = DateTime.now().add(Duration(seconds: expiresIn)).millisecondsSinceEpoch;

          await _storage.write(key: 'access_token', value: response.data['access_token']);
          await _storage.write(key: 'refresh_token', value: response.data['refresh_token']);
          await _storage.write(key: _expiresAtKey, value: expiresAt.toString());

          // --- AUTO REGION DISCOVERY ---
          try {
            print('AuthRepository: Discovering user region...');
            final regionResponse = await _dio.get(
              'https://fleet-api.prd.na.vn.cloud.tesla.com/api/1/users/region',
              options: Options(headers: {'Authorization': 'Bearer ${response.data['access_token']}'}),
            );
            final regionData = regionResponse.data['response'];
            if (regionData != null) {
              final fleetUrl = regionData['fleet_api_base_url'] as String;
              print('AuthRepository: Region discovered: $fleetUrl');
              await _storage.write(key: _regionKey, value: fleetUrl);
            }
          } catch (e) {
            print('AuthRepository: Region discovery failed, using default: $e');
          }
          return true;
        } else {
          print('AuthRepository: Token exchange failed with status: ${response.statusCode}');
          throw Exception('Token exchange failed: ${response.statusCode}');
        }
      } else if (error != null) {
        final message = errorDesc ?? error;
        print('AuthRepository: Auth error: $message');
        throw Exception(message.replaceAll('%20', ' '));
      } else {
        print('AuthRepository: No code or error found in result.');
        return false;
      }
    } catch (e) {
      print('AuthRepository: Login error: $e');
      rethrow; // Rethrow to let Bloc handle the specific error message
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
      final response = await _tokenDio.post(
        TeslaConfig.tokenUrl,
        data: {
          'grant_type': 'refresh_token',
          'client_id': TeslaConfig.clientId,
          'client_secret': TeslaConfig.clientSecret,
          'refresh_token': refreshToken,
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );

      if (response.statusCode == 200) {
        final expiresIn = response.data['expires_in'] as int;
        final expiresAt = DateTime.now().add(Duration(seconds: expiresIn)).millisecondsSinceEpoch;

        await _storage.write(key: 'access_token', value: response.data['access_token']);
        await _storage.write(key: 'refresh_token', value: response.data['refresh_token']);
        await _storage.write(key: _expiresAtKey, value: expiresAt.toString());
        return true;
      }
    } catch (e) {
      print('AuthRepository: Refresh token failed: $e');
      if (e is DioException && (e.response?.statusCode == 403 || e.response?.statusCode == 401)) {
        print('AuthRepository: Invalid refresh token, clearing session');
        await logout();
      }
    }
    return false;
  }

  @override
  Future<String?> getAccessToken() => _storage.read(key: 'access_token');

  @override
  Future<void> saveDeveloperCredentials(String clientId, String clientSecret, String region) async {
    // This now only updates local overrides if needed, but primarily we use TeslaConfig
    await _storage.write(key: 'override_client_id', value: clientId);
    await _storage.write(key: 'override_client_secret', value: clientSecret);
    await _storage.write(key: _regionKey, value: region);
  }

  @override
  Future<bool> hasDeveloperCredentials() async {
    // In the new flow, we always have credentials via TeslaConfig
    return TeslaConfig.clientId != 'YOUR_CLIENT_ID';
  }

  @override
  Future<Map<String, String?>> getDeveloperCredentials() async {
    final overrideId = await _storage.read(key: 'override_client_id');
    return {
      'clientId': overrideId ?? TeslaConfig.clientId,
      'clientSecret': '********',
      'region': await _storage.read(key: _regionKey),
    };
  }

  @override
  Future<UserProfile> getUserProfile() async {
    final client = TeslaApiClient(_dio, _storage, _securityRepository);
    return await client.getUserProfile();
  }

  @override
  Future<List<ChargingHistoryEntry>> getChargingHistory() async {
    final client = TeslaApiClient(_dio, _storage, _securityRepository);
    final response = await client.getChargingHistory();
    return response.response;
  }
}

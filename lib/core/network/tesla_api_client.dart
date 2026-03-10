import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../features/dashboard/data/models/tesla_models.dart';
import '../../features/auth/domain/security_repository.dart';
import 'tesla_config.dart';

class TeslaApiClient {
  final Dio _dio;
  final FlutterSecureStorage _storage;
  final SecurityRepository _securityRepository;

  TeslaApiClient(this._dio, this._storage, this._securityRepository) {
    _dio.options.baseUrl = 'https://fleet-api.prd.na.vn.cloud.tesla.com';
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // 1. Regional Base URL support
          final region = await _storage.read(key: 'tesla_region');
          if (region != null && region.isNotEmpty) {
            options.baseUrl = region;
          }

          // 2. Preemptive Token Refresh (1 minute buffer)
          final expiresAtStr = await _storage.read(key: 'tesla_expires_at');
          if (expiresAtStr != null) {
            final expiresAt = int.parse(expiresAtStr);
            final now = DateTime.now().millisecondsSinceEpoch;
            // If token expires in less than 60 seconds
            if (expiresAt - now < 60000) {
              debugPrint('TeslaApiClient: Token about to expire, refreshing...');
              await _triggerInternalRefresh();
            }
          }

          final token = await _storage.read(key: 'access_token');
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (DioException e, handler) async {
          if (e.response?.statusCode == 401) {
            debugPrint('TeslaApiClient: 401 Unauthorized, refreshing token...');
            final success = await _triggerInternalRefresh();
            if (success) {
              // Retry the request
              final token = await _storage.read(key: 'access_token');
              e.requestOptions.headers['Authorization'] = 'Bearer $token';
              final retryResponse = await _dio.fetch(e.requestOptions);
              return handler.resolve(retryResponse);
            }
          }
          if (e.response?.statusCode == 408) {
            debugPrint('TeslaApiClient: 408 Device Unavailable (Vehicle Asleep)');
          }
          if (e.response?.statusCode == 429) {
            debugPrint('TeslaApiClient: 429 Rate Limited');
          }
          return handler.next(e);
        },
      ),
    );
  }

  Future<bool> _triggerInternalRefresh() async {
    try {
      final refreshToken = await _storage.read(key: 'refresh_token');
      if (refreshToken == null) return false;

      // Use a local clean Dio to avoid interceptor recursion
      final tokenDio = Dio();
      final response = await tokenDio.post(
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
        await _storage.write(key: 'tesla_expires_at', value: expiresAt.toString());
        return true;
      }
    } catch (e) {
      debugPrint('TeslaApiClient: Refresh failed: $e');
    }
    return false;
  }

  Future<void> _ensureOnline(String vehicleId) async {
    final response = await getVehicles();
    final vehicle = response.response.firstWhere((v) => v.id == vehicleId);
    if (vehicle.state != 'online') {
      debugPrint('TeslaApiClient: Vehicle is ${vehicle.state}, waking up...');
      await wakeUp(vehicleId);
      await Future.delayed(const Duration(seconds: 5));
    }
  }

  // --- Vehicle Metadata ---

  Future<TeslaVehicleResponse> getVehicles() async {
    final response = await _dio.get('/api/1/vehicles');
    return TeslaVehicleResponse.fromJson(response.data);
  }

  Future<TeslaVehicleDataResponse> getVehicleData(String vehicleId) async {
    final response = await _dio.get('/api/1/vehicles/$vehicleId/vehicle_data');
    return TeslaVehicleDataResponse.fromJson(response.data);
  }

  Future<Response> wakeUp(String vehicleId) async {
    return await _dio.post('/api/1/vehicles/$vehicleId/wake_up');
  }

  // --- Signed Commands (Security & Access) ---

  Future<Response> _postSignedCommand(String vehicleId, String command, Map<String, dynamic> data) async {
    // THIS IS A STUB for the new Virtual Key / Signed Command protocol.
    // In a full implementation, we would wrap the command in a Protobuf 'SignedMessage'
    // and sign it using the SecurityRepository.
    
    // For now, we fall back to the standard API if possible, or 
    // provide the baseline for signed commands.
    
    try {
      // Logic for signing would go here...
    } catch (e) {
      debugPrint('TeslaApiClient: Error signing command: $e');
    }

    return await _dio.post('/api/1/vehicles/$vehicleId/command/$command', data: data);
  }

  Future<Response> doorLock(String vehicleId) async {
    await _ensureOnline(vehicleId);
    return await _postSignedCommand(vehicleId, 'door_lock', {});
  }

  Future<Response> doorUnlock(String vehicleId) async {
    await _ensureOnline(vehicleId);
    return await _postSignedCommand(vehicleId, 'door_unlock', {});
  }

  Future<Response> actuateTrunk(String vehicleId, String whichTrunk) async {
    await _ensureOnline(vehicleId);
    return await _postSignedCommand(vehicleId, 'actuate_trunk', {'which_trunk': whichTrunk});
  }

  Future<Response> chargePortDoorOpen(String vehicleId) async {
    await _ensureOnline(vehicleId);
    return await _postSignedCommand(vehicleId, 'charge_port_door_open', {});
  }

  Future<Response> chargePortDoorClose(String vehicleId) async {
    await _ensureOnline(vehicleId);
    return await _postSignedCommand(vehicleId, 'charge_port_door_close', {});
  }

  // --- Climate Commands ---

  Future<Response> setTemperature(String vehicleId, double driverTemp, double passengerTemp) async {
    await _ensureOnline(vehicleId);
    return await _dio.post(
      '/api/1/vehicles/$vehicleId/command/set_temps',
      data: {
        'driver_temp': driverTemp,
        'passenger_temp': passengerTemp,
      },
    );
  }

  Future<Response> autoConditioningStart(String vehicleId) async {
    await _ensureOnline(vehicleId);
    return await _dio.post('/api/1/vehicles/$vehicleId/command/auto_conditioning_start');
  }

  Future<Response> autoConditioningStop(String vehicleId) async {
    await _ensureOnline(vehicleId);
    return await _dio.post('/api/1/vehicles/$vehicleId/command/auto_conditioning_stop');
  }

  Future<Response> remoteSeatHeaterRequest(String vehicleId, int heater, int level) async {
    await _ensureOnline(vehicleId);
    return await _dio.post(
      '/api/1/vehicles/$vehicleId/command/remote_seat_heater_request',
      data: {
        'heater': heater,
        'level': level,
      },
    );
  }

  // --- Charging Commands ---

  Future<Response> setChargeLimit(String vehicleId, int limit) async {
    await _ensureOnline(vehicleId);
    return await _dio.post(
      '/api/1/vehicles/$vehicleId/command/set_charge_limit',
      data: {'percent': limit},
    );
  }

  Future<Response> chargeStart(String vehicleId) async {
    await _ensureOnline(vehicleId);
    return await _dio.post('/api/1/vehicles/$vehicleId/command/charge_start');
  }

  Future<Response> chargeStop(String vehicleId) async {
    await _ensureOnline(vehicleId);
    return await _dio.post('/api/1/vehicles/$vehicleId/command/charge_stop');
  }

  Future<Response> setChargingAmps(String vehicleId, int amps) async {
    await _ensureOnline(vehicleId);
    return await _dio.post(
      '/api/1/vehicles/$vehicleId/command/set_charging_amps',
      data: {'charging_amps': amps},
    );
  }

  // --- Charging API (OCPI 2.2.1) ---

  Future<List<ChargingLocation>> getChargingLocations() async {
    final response = await _dio.get('/api/1/charging/locations');
    final List<dynamic> data = response.data['response'] ?? [];
    return data.map((json) => ChargingLocation.fromJson(json)).toList();
  }

  Future<ChargingTariff?> getChargingTariffs(String locationId) async {
    final response = await _dio.get('/api/1/charging/locations/$locationId/tariffs');
    final data = response.data['response'];
    if (data == null) return null;
    return ChargingTariff.fromJson(data);
  }

  // --- Alerts ---

  Future<Response> flashLights(String vehicleId) async {
    await _ensureOnline(vehicleId);
    return await _dio.post('/api/1/vehicles/$vehicleId/command/flash_lights');
  }

  Future<Response> honkHorn(String vehicleId) async {
    await _ensureOnline(vehicleId);
    return await _dio.post('/api/1/vehicles/$vehicleId/command/honk_horn');
  }

  // --- User & Account ---

  Future<UserRegion> getUserRegion() async {
    final response = await _dio.get('/api/1/users/region');
    return UserRegion.fromJson(response.data['response']);
  }

  Future<UserProfile> getUserProfile() async {
    final response = await _dio.get('/api/1/users/me');
    return UserProfile.fromJson(response.data['response']);
  }

  // --- Charging History ---

  Future<ChargingHistoryResponse> getChargingHistory() async {
    final response = await _dio.get('/api/1/dx/charging/history');
    return ChargingHistoryResponse.fromJson(response.data);
  }

  // --- Products (Vehicles & Energy) ---

  Future<List<TeslaProduct>> getProducts() async {
    final response = await _dio.get('/api/1/products');
    final List<dynamic> data = response.data['response'] ?? [];
    return data.map((json) => TeslaProduct.fromJson(json)).toList();
  }

  // --- Fleet Telemetry ---

  Future<Response> configureFleetTelemetry(String vehicleId, Map<String, dynamic> config) async {
    await _ensureOnline(vehicleId);
    return await _dio.post(
      '/api/1/vehicles/$vehicleId/fleet_telemetry_config',
      data: config,
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../features/dashboard/data/models/tesla_models.dart';
import '../../features/auth/domain/security_repository.dart';
import 'tesla_config.dart';
import 'tvcp/tvcp_signer.dart';

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
    int attempts = 0;
    while (attempts < 6) {
      final response = await getVehicles();
      final vehicle = response.response.firstWhere((v) => v.id == vehicleId);
      if (vehicle.state == 'online') {
        if (attempts > 0) debugPrint('TeslaApiClient: Vehicle is now online.');
        return;
      }
      
      debugPrint('TeslaApiClient: Vehicle is ${vehicle.state}, waking up (attempt ${attempts + 1})...');
      if (attempts == 0) {
        await wakeUp(vehicleId); // Only send the wake up command once
      }
      await Future.delayed(const Duration(seconds: 5));
      attempts++;
    }
    debugPrint('TeslaApiClient: Vehicle failed to wake up after $attempts attempts.');
  }

  // --- Vehicle Metadata ---

  Future<TeslaVehicleResponse> getVehicles() async {
    final response = await _dio.get('/api/1/vehicles');
    if (response.data == null) {
      throw Exception('TeslaApiClient: getVehicles returned null data');
    }
    return TeslaVehicleResponse.fromJson(response.data as Map<String, dynamic>);
  }

  Future<TeslaVehicleDataResponse> getVehicleData(String vehicleId) async {
    const endpoints = 'charge_state;climate_state;drive_state;gui_settings;vehicle_config;vehicle_state;location_data';
    final response = await _dio.get(
      '/api/1/vehicles/$vehicleId/vehicle_data',
      queryParameters: {'endpoints': endpoints},
    );
    
    if (response.data == null || response.data['response'] == null) {
      throw Exception('TeslaApiClient: getVehicleData returned null or empty response');
    }
    return TeslaVehicleDataResponse.fromJson(response.data as Map<String, dynamic>);
  }

  Future<Response> wakeUp(String vehicleId) async {
    return await _dio.post('/api/1/vehicles/$vehicleId/wake_up');
  }

  // --- Vehicle Command Protocol Support ---

  /// Commands that currently fail or are unimplemented in the TVCP proxy
  /// and should always use the direct Fleet API path.
  static const Set<String> _directOnlyCommands = {};

  /// Checks if a vehicle requires the new Tesla Vehicle Command Protocol (signed commands)
  Future<bool> requiresTVCP(String vin) async {
    try {
      final response = await _dio.post(
        '/api/1/vehicles/fleet_status',
        data: {'vins': [vin]},
      );
      final Map<String, dynamic> status = response.data['response'] ?? {};
      final bool required = status['vehicle_command_protocol_required']?[vin] ?? false;
      return required;
    } catch (e) {
      debugPrint('TeslaApiClient: Error checking fleet_status for $vin: $e');
      return true; // Default to true if check fails to be safe
    }
  }

  // --- Signed Commands (Security & Access) ---

  final Map<String, TVCPSigner> _tvcpSigners = {};

  TVCPSigner _getSignerForVehicle(String vin) {
    if (!_tvcpSigners.containsKey(vin)) {
      _tvcpSigners[vin] = TVCPSigner(_securityRepository, vin);
    }
    return _tvcpSigners[vin]!;
  }

  Future<Response> _postSignedCommand(String vehicleId, String command, Map<String, dynamic> data) async {
    // 1. Fetch Vehicle to get VIN (required for signed_command endpoints)
    final vehiclesDoc = await getVehicles();
    final vehicle = vehiclesDoc.response.firstWhere((v) => v.id.toString() == vehicleId);
    final vin = vehicle.vin;

    // Most write commands for third-party apps now require TVCP signing via proxy.
    // However, some commands are not yet fully implemented in the protocol/proxy
    // and should bypass to direct API if specified. 
    // We also check requiresTVCP logic to optimize.
    bool tryProxy = !_directOnlyCommands.contains(command);
    
    // Quick optimization: some models/years don't need TVCP at all.
    // Uncomment when Fleet API usage is confirmed:
    // tryProxy = tryProxy && await requiresTVCP(vin);

    if (tryProxy) {
      int proxyAttempts = 0;
      while (proxyAttempts < 5) {
        try {
          debugPrint('TeslaApiClient: Proxying TVCP command $command on VIN $vin (attempt ${proxyAttempts + 1})');
          
          final token = await _storage.read(key: 'access_token');
          final proxyUrl = TeslaConfig.proxyUrl;

          // POST to our backend proxy for TVCP signing and delivery
          final response = await _dio.post(
            '$proxyUrl/api/command/$vin/$command',
            data: data,
            options: Options(
              headers: {
                'Authorization': 'Bearer $token',
              },
            ),
          );
          
          debugPrint('TeslaApiClient: Proxy Command $command response: ${response.statusCode} - ${response.data}');
          return response;
        } catch (e) {
          if (e is DioException) {
            final statusCode = e.response?.statusCode;
            final errorBody = e.response?.data;
            debugPrint('TeslaApiClient: Proxy signing/sending failed: $statusCode - $errorBody');
            
            // 403 "vehicle is offline" is commonly returned when the car is sleeping
            if (statusCode == 403 && errorBody is Map && 
                (errorBody['error'] == 'vehicle is offline' || errorBody['error']?.toString().contains('offline') == true)) {
              proxyAttempts++;
              if (proxyAttempts >= 5) rethrow; 
              
              debugPrint('TeslaApiClient: Vehicle reported offline by proxy. Sending explicit wakeUp and retrying...');
              try {
                await wakeUp(vehicleId);
              } catch (_) {} 
              await Future.delayed(const Duration(seconds: 4));
              continue;
            }
            
            // Detect "Not Implemented" or 500 status from proxy and fall back to direct
            if (statusCode == 501 || statusCode == 500 || 
                (errorBody is Map && errorBody['type'] == 'UnimplementedError')) {
              debugPrint('TeslaApiClient: Proxy doesn\'t support $command. Falling back to direct Fleet API...');
              tryProxy = false;
              break;
            }

            // For other proxy responses, rethrow to avoid hiding real errors
            if (e.response != null) {
              rethrow;
            }
          } else {
            debugPrint('TeslaApiClient: Proxy signing/sending unexpected error: $e');
            tryProxy = false;
            break;
          }
        }
      }
    }

    try {
      debugPrint('TeslaApiClient: Sending standard command $command to $vehicleId with data: $data');
      final response = await _dio.post('/api/1/vehicles/$vehicleId/command/$command', data: data);
      debugPrint('TeslaApiClient: Command $command response: ${response.statusCode} - ${response.data}');
      return response;
    } catch (e) {
      if (e is DioException) {
        debugPrint('TeslaApiClient: Command $command failed: ${e.response?.statusCode} - ${e.response?.data}');
      } else {
        debugPrint('TeslaApiClient: Command $command failed: $e');
      }
      rethrow;
    }
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

  Future<Response> setSentryMode(String vehicleId, bool on) async {
    await _ensureOnline(vehicleId);
    return await _postSignedCommand(vehicleId, 'set_sentry_mode', {'on': on});
  }

  Future<Response> setValetMode(String vehicleId, bool on, {String? password}) async {
    await _ensureOnline(vehicleId);
    final data = <String, dynamic>{'on': on};
    if (password != null && password.isNotEmpty) {
      data['password'] = password;
    }
    return await _postSignedCommand(vehicleId, 'set_valet_mode', data);
  }

  // --- Climate Commands ---

  Future<Response> setTemperature(String vehicleId, double driverTemp, double passengerTemp) async {
    await _ensureOnline(vehicleId);
    return await _postSignedCommand(
      vehicleId, 
      'set_temps', 
      {
        'driver_temp': driverTemp,
        'passenger_temp': passengerTemp,
      },
    );
  }

  Future<Response> autoConditioningStart(String vehicleId) async {
    await _ensureOnline(vehicleId);
    return await _postSignedCommand(vehicleId, 'auto_conditioning_start', {});
  }

  Future<Response> autoConditioningStop(String vehicleId) async {
    await _ensureOnline(vehicleId);
    return await _postSignedCommand(vehicleId, 'auto_conditioning_stop', {});
  }

  Future<Response> remoteSeatHeaterRequest(String vehicleId, int heater, int level) async {
    await _ensureOnline(vehicleId);
    return await _postSignedCommand(
      vehicleId, 
      'remote_seat_heater_request', 
      {
        'heater': heater,
        'level': level,
      },
    );
  }

  // --- Charging Commands ---

  Future<Response> setChargeLimit(String vehicleId, int limit) async {
    await _ensureOnline(vehicleId);
    return await _postSignedCommand(
      vehicleId, 
      'set_charge_limit', 
      {'percent': limit},
    );
  }

  Future<Response> chargeStart(String vehicleId) async {
    await _ensureOnline(vehicleId);
    return await _postSignedCommand(vehicleId, 'charge_start', {});
  }

  Future<Response> chargeStop(String vehicleId) async {
    await _ensureOnline(vehicleId);
    return await _postSignedCommand(vehicleId, 'charge_stop', {});
  }

  Future<Response> setChargingAmps(String vehicleId, int amps) async {
    await _ensureOnline(vehicleId);
    return await _postSignedCommand(
      vehicleId, 
      'set_charging_amps', 
      {'charging_amps': amps},
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
    return await _postSignedCommand(vehicleId, 'flash_lights', {});
  }

  Future<Response> honkHorn(String vehicleId) async {
    await _ensureOnline(vehicleId);
    return await _postSignedCommand(vehicleId, 'honk_horn', {});
  }

  // --- User & Account ---

  Future<UserRegion> getUserRegion() async {
    final response = await _dio.get('/api/1/users/region');
    if (response.data == null || response.data['response'] == null) {
      throw Exception('TeslaApiClient: getUserRegion returned null response');
    }
    return UserRegion.fromJson(response.data['response'] as Map<String, dynamic>);
  }

  Future<UserProfile> getUserProfile() async {
    final response = await _dio.get('/api/1/users/me');
    if (response.data == null || response.data['response'] == null) {
       throw Exception('TeslaApiClient: getUserProfile returned null response');
    }
    return UserProfile.fromJson(response.data['response'] as Map<String, dynamic>);
  }

  // --- Metadata & Specifics ---

  Future<Response> getVehicleOptions(String vin) async {
    return await _dio.get('/api/1/dx/vehicles/options', queryParameters: {'vin': vin});
  }

  Future<Response> getWarrantyDetails(String vin) async {
    return await _dio.get('/api/1/dx/warranty/details', queryParameters: {'vin': vin});
  }

  /// WARNING: This call costs $0.10 per request. Use sparingly and cache results!
  Future<Response> getVehicleSpecs(String vin) async {
    return await _dio.get('/api/1/vehicles/$vin/specs');
  }

  Future<Response> getNearbyChargingSites(String vehicleId) async {
    return await _dio.get('/api/1/vehicles/$vehicleId/nearby_charging_sites');
  }

  Future<Response> getReleaseNotes(String vehicleId) async {
    return await _dio.get('/api/1/vehicles/$vehicleId/release_notes');
  }

  // --- Charging History ---

  Future<ChargingHistoryResponse> getChargingHistory() async {
    final response = await _dio.get('/api/1/dx/charging/history');
    if (response.data == null) {
      throw Exception('TeslaApiClient: getChargingHistory returned null data');
    }
    return ChargingHistoryResponse.fromJson(response.data as Map<String, dynamic>);
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
    // Even telemetry config sometimes requires partner-level signing or proxying 
    // to bypass 403 issues on standard account tokens
    return await _postSignedCommand(
      vehicleId, 
      'fleet_telemetry_config', 
      config,
    );
  }

  Future<void> updateRegion() async {
    try {
      // Always call the default global endpoint for region discovery
      final response = await Dio().get(
        'https://fleet-api.prd.na.vn.cloud.tesla.com/api/1/users/region',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${await _storage.read(key: 'access_token')}',
          },
        ),
      );

      if (response.statusCode == 200) {
        final regionUrl = response.data['region_url'] as String;
        await _storage.write(key: 'tesla_region', value: regionUrl);
        _dio.options.baseUrl = regionUrl;
        debugPrint('TeslaApiClient: Region updated to: $regionUrl');
      }
    } catch (e) {
      debugPrint('TeslaApiClient: Failed to update region: $e');
    }
  }
}

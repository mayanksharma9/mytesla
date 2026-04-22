import 'dart:async';
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

  // Singleton future to synchronize concurrent token refreshes
  Future<bool>? _refreshFuture;

  /// Fires when Tesla returns `login_required` during a token refresh.
  /// AuthBloc listens to this and dispatches LogoutRequested.
  static final _sessionExpiredController = StreamController<void>.broadcast();
  static Stream<void> get sessionExpired => _sessionExpiredController.stream;

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
            final isFirstFail = _refreshFuture == null;
            if (isFirstFail) {
              debugPrint('TeslaApiClient: 401 Unauthorized detected. Starting synchronized token refresh...');
              _refreshFuture = _triggerInternalRefresh();
            }
            
            try {
              final success = await _refreshFuture;
              if (success != null && success) {
                // Retry the request
                final token = await _storage.read(key: 'access_token');
                e.requestOptions.headers['Authorization'] = 'Bearer $token';
                final retryResponse = await _dio.fetch(e.requestOptions);
                return handler.resolve(retryResponse);
              }
            } finally {
              // Only the first failing request (which started the future) clears it
              if (isFirstFail) {
                _refreshFuture = null;
              }
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
      if (e is DioException) {
        debugPrint('TeslaApiClient: Refresh failed status: ${e.response?.statusCode}');
        debugPrint('TeslaApiClient: Refresh failed body: ${e.response?.data}');

        // login_required means the refresh token has been revoked or expired.
        // Clear stored credentials immediately so further calls don't loop,
        // then signal AuthBloc to navigate the user back to the login screen.
        final body = e.response?.data;
        final errorCode = body is Map ? body['error'] as String? : null;
        if (errorCode == 'login_required' || e.response?.statusCode == 401) {
          debugPrint('TeslaApiClient: Session permanently invalidated — clearing tokens.');
          await _storage.delete(key: 'access_token');
          await _storage.delete(key: 'refresh_token');
          await _storage.delete(key: 'tesla_expires_at');
          _sessionExpiredController.add(null);
        }
      } else {
        debugPrint('TeslaApiClient: Unexpected refresh error: $e');
      }
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
          // Forward the regional fleet API base URL so the proxy hits the
          // correct Tesla endpoint (EU/NA/APAC) rather than the hardcoded NA URL.
          final fleetBaseUrl = _dio.options.baseUrl;

          // POST to our backend proxy for TVCP signing and delivery
          final response = await _dio.post(
            '$proxyUrl/api/command/$vin/$command',
            data: data,
            options: Options(
              headers: {
                'Authorization': 'Bearer $token',
                if (fleetBaseUrl.isNotEmpty) 'X-Fleet-Api-Base-Url': fleetBaseUrl,
              },
            ),
          );
          
          debugPrint('TeslaApiClient: Proxy Command $command response: ${response.statusCode} - ${response.data}');

          // Tesla returns HTTP 200 with {response: null, error: "Unauthorized"}
          // when the virtual key for this app is not on the vehicle's whitelist.
          // Treat this as a real error so the UI surfaces it instead of silently
          // appearing to succeed.
          final body = response.data;
          if (body is Map) {
            final teslaError = body['error'] as String?;
            if (teslaError != null && teslaError.isNotEmpty && body['response'] == null) {
              if (teslaError.toLowerCase().contains('key not on whitelist')) {
                throw Exception(
                  'Virtual key not on vehicle whitelist. Open https://tesla.com/_ak/thedevelopersharma.com '
                  'in the Tesla app and tap your car to register the key.',
                );
              }
              if (teslaError.toLowerCase().contains('unauthorized')) {
                // Transient HMAC rejection — proxy will reset and re-handshake automatically.
                throw Exception('Command rejected by vehicle (Unauthorized). Please try again.');
              }
              throw Exception('Tesla command error: $teslaError');
            }
          }
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
            
            // Virtual key whitelist rejection — permanent error, surface immediately.
            // Proxy returns 403 for this; legacy proxy may return 500 with the
            // message in the body. Either way do NOT fall back to direct API.
            final proxyErrMsg = (errorBody is Map ? errorBody['error'] as String? : null) ?? '';
            if (proxyErrMsg.toLowerCase().contains('whitelist') ||
                proxyErrMsg.toLowerCase().contains('key not on')) {
              throw Exception(
                'Virtual key not on vehicle whitelist. Open https://tesla.com/_ak/thedevelopersharma.com '
                'in the Tesla app and tap your car to register the key.',
              );
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
        final body = e.response?.data;
        debugPrint('TeslaApiClient: Command $command failed: ${e.response?.statusCode} - $body');

        // 403 "Tesla Vehicle Command Protocol required" means the vehicle needs
        // a registered virtual key for this app. Surface a clear action step.
        if (e.response?.statusCode == 403 && body is Map) {
          final msg = (body['error'] as String? ?? '').toLowerCase();
          if (msg.contains('vehicle command protocol') || msg.contains('tvcp')) {
            throw Exception(
              'Virtual key required. Open the Tesla app on your phone, go to '
              'Security → Third-Party App Keys, then tap your car to add the key.',
            );
          }
        }
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

  /// Set climate keeper mode: "dog", "camp", "on", "off"
  Future<Response> setClimateKeeperMode(String vehicleId, String mode) async {
    await _ensureOnline(vehicleId);
    return await _postSignedCommand(vehicleId, 'set_climate_keeper_mode', {'climate_keeper_mode': mode});
  }

  /// Control windows: "vent" or "close"; optional lat/lon for "close"
  Future<Response> windowControl(String vehicleId, String command) async {
    await _ensureOnline(vehicleId);
    return await _postSignedCommand(vehicleId, 'window_control', {'command': command, 'lat': 0, 'lon': 0});
  }

  /// Set scheduled charging
  Future<Response> setScheduledCharging(String vehicleId, bool enable, {int? startTime}) async {
    await _ensureOnline(vehicleId);
    final data = <String, dynamic>{'enable': enable};
    if (startTime != null) data['time'] = startTime;
    return await _postSignedCommand(vehicleId, 'set_scheduled_charging', data);
  }

  /// Set speed limit (mph)
  Future<Response> speedLimitSetLimit(String vehicleId, int limitMph) async {
    await _ensureOnline(vehicleId);
    return await _postSignedCommand(vehicleId, 'speed_limit_set_limit', {'limit_mph': limitMph});
  }

  /// Activate speed limit mode (requires PIN)
  Future<Response> speedLimitActivate(String vehicleId, String pin) async {
    await _ensureOnline(vehicleId);
    return await _postSignedCommand(vehicleId, 'speed_limit_activate', {'pin': pin});
  }

  /// Deactivate speed limit mode (requires PIN)
  Future<Response> speedLimitDeactivate(String vehicleId, String pin) async {
    await _ensureOnline(vehicleId);
    return await _postSignedCommand(vehicleId, 'speed_limit_deactivate', {'pin': pin});
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

  // --- Charging History & Invoices ---
  
  Future<ChargingHistoryResponse> getChargingHistory({int? page, int? perPage}) async {
    final queryParams = <String, dynamic>{};
    if (page != null) queryParams['page'] = page;
    if (perPage != null) queryParams['per_page'] = perPage;
    
    final response = await _dio.get('/api/1/dx/charging/history', queryParameters: queryParams);
    if (response.data == null) {
      throw Exception('TeslaApiClient: getChargingHistory returned null data');
    }
    return ChargingHistoryResponse.fromJson(response.data as Map<String, dynamic>);
  }

  Future<List<int>> getChargingInvoice(String sessionIdentifier) async {
    final response = await _dio.get(
      '/api/1/dx/charging/invoice/$sessionIdentifier',
      options: Options(responseType: ResponseType.bytes),
    );
    if (response.data == null) {
      throw Exception('TeslaApiClient: getChargingInvoice returned null data');
    }
    return response.data as List<int>;
  }

  Future<ChargingSessionsResponse> getChargingSessions() async {
    final response = await _dio.get('/api/1/dx/charging/sessions');
    if (response.data == null) {
      throw Exception('TeslaApiClient: getChargingSessions returned null data');
    }
    return ChargingSessionsResponse.fromJson(response.data as Map<String, dynamic>);
  }

  // --- Products (Vehicles & Energy) ---

  Future<List<TeslaProduct>> getProducts() async {
    final response = await _dio.get('/api/1/products');
    final List<dynamic> data = response.data['response'] ?? [];
    return data.map((json) => TeslaProduct.fromJson(json)).toList();
  }

  // --- Fleet Telemetry ---

  Future<Response> configureFleetTelemetry(String vehicleId, Map<String, dynamic> config) async {
    // fleet_telemetry_config is a direct Fleet API call, NOT a signed vehicle command.
    // It must NOT go through _postSignedCommand / TVCP proxy.
    return await _dio.post(
      '/api/1/vehicles/$vehicleId/fleet_telemetry_config',
      data: {'config': config},
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
        final regionData = response.data['response'];
        final regionUrl = regionData?['fleet_api_base_url'] as String?;
        if (regionUrl != null && regionUrl.isNotEmpty) {
          await _storage.write(key: 'tesla_region', value: regionUrl);
          _dio.options.baseUrl = regionUrl;
          debugPrint('TeslaApiClient: Region updated to: $regionUrl');
        }
      }
    } catch (e) {
      debugPrint('TeslaApiClient: Failed to update region: $e');
    }
  }

  // --- Media Commands ---

  Future<Response> mediaCommand(String vehicleId, String command) async {
    await _ensureOnline(vehicleId);
    return await _postSignedCommand(vehicleId, command, {});
  }

  // --- Boombox ---

  Future<Response> remoteBoombox(String vehicleId, int soundId) async {
    await _ensureOnline(vehicleId);
    return await _postSignedCommand(vehicleId, 'remote_boombox', {'sound': soundId});
  }

  // --- Extra Climate ---

  Future<Response> setBioweaponMode(String vehicleId, bool on) async {
    await _ensureOnline(vehicleId);
    return await _postSignedCommand(vehicleId, 'set_bioweapon_mode', {'on': on, 'manual_override': true});
  }

  Future<Response> setCabinOverheatProtection(String vehicleId, {required bool on, bool fanOnly = false}) async {
    await _ensureOnline(vehicleId);
    return await _postSignedCommand(vehicleId, 'set_cabin_overheat_protection', {'on': on, 'fan_only': fanOnly});
  }

  Future<Response> setPreconditioningMax(String vehicleId, bool on) async {
    await _ensureOnline(vehicleId);
    return await _postSignedCommand(vehicleId, 'set_preconditioning_max', {'on': on, 'manual_override': false});
  }

  // --- Remote Start ---

  Future<Response> remoteStartDrive(String vehicleId) async {
    await _ensureOnline(vehicleId);
    return await _postSignedCommand(vehicleId, 'remote_start_drive', {});
  }
}

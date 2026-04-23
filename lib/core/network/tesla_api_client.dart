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
            debugPrint('TeslaApiClient: 408 Vehicle Unavailable (asleep or poor connectivity)');
          }
          if (e.response?.statusCode == 429) {
            // Respect Retry-After / RateLimit-Reset headers per Tesla docs.
            final headers = e.response?.headers;
            final retryAfter = headers?.value('retry-after') ??
                headers?.value('ratelimit-reset');
            if (retryAfter != null) {
              debugPrint('TeslaApiClient: 429 Rate Limited — retry after $retryAfter');
            } else {
              debugPrint('TeslaApiClient: 429 Rate Limited');
            }
          }
          if (e.response?.statusCode == 421) {
            // 421 = Incorrect Region — update region and retry the request once.
            debugPrint('TeslaApiClient: 421 Incorrect Region — updating region and retrying...');
            await updateRegion();
            try {
              final retryResponse = await _dio.fetch(e.requestOptions);
              return handler.resolve(retryResponse);
            } catch (_) {
              // If retry also fails, fall through and propagate the original error.
            }
          }
          if (e.response?.statusCode == 540) {
            debugPrint('TeslaApiClient: 540 Device Unexpected Error — vehicle may need reboot, OTA, or service');
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

      // Use a local clean Dio to avoid interceptor recursion.
      // Must POST to fleet-auth domain per Tesla docs.
      final tokenDio = Dio();
      final response = await tokenDio.post(
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
        final expiresAt = DateTime.now().add(Duration(seconds: expiresIn)).millisecondsSinceEpoch;

        await _storage.write(key: 'access_token', value: response.data['access_token']);
        // Refresh tokens are single-use — always save the new one.
        if (response.data['refresh_token'] != null) {
          await _storage.write(key: 'refresh_token', value: response.data['refresh_token']);
        }
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

  // --- Vehicle Metadata ---

  Future<TeslaVehicleResponse> getVehicles() async {
    final response = await _dio.get('/api/1/vehicles');
    if (response.data == null) {
      throw Exception('TeslaApiClient: getVehicles returned null data');
    }
    return TeslaVehicleResponse.fromJson(response.data as Map<String, dynamic>);
  }

  Future<TeslaVehicleDataResponse> getVehicleData(String vehicleId) async {
    // location_data requires vehicle_location scope — omit it from the default
    // poll so existing tokens (without that scope) don't receive 403.
    // Location is covered by Fleet Telemetry (Location field) once configured.
    // charge_schedule_data and preconditioning_schedule_data are free endpoints
    // that return schedule data — required for schedule management features.
    const endpoints = 'charge_state;climate_state;drive_state;gui_settings;vehicle_config;vehicle_state;charge_schedule_data;preconditioning_schedule_data';
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
                // "Unauthorized" from Tesla means the vehicle rejected the signed command.
                // If the virtual key IS already added, this means the proxy's private key
                // doesn't match the public key registered with Tesla — a proxy configuration
                // issue. Retrying won't help; surface a clear diagnostic immediately.
                debugPrint('TeslaApiClient: Proxy Unauthorized for $command — proxy signing key mismatch or session expired.');
                throw Exception('PROXY_AUTH_FAILED');
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
            final proxyErrMsg = (errorBody is Map ? errorBody['error'] as String? : null) ?? '';
            if (proxyErrMsg.toLowerCase().contains('whitelist') ||
                proxyErrMsg.toLowerCase().contains('key not on')) {
              throw Exception(
                'Virtual key not on vehicle whitelist. Open https://tesla.com/_ak/thedevelopersharma.com '
                'in the Tesla app and tap your car to register the key.',
              );
            }

            // 500 "RoutableMessage does not contain session info" — the proxy hasn't
            // completed a TVCP session handshake with this vehicle yet. This is a
            // transient state: retry with a delay so the proxy can establish the session.
            // Do NOT fall back to direct API — that always returns 403 for TVCP vehicles.
            if (statusCode == 500) {
              final errMsg = (errorBody is Map ? errorBody['error'] as String? : null) ?? '';
              if (errMsg.contains('session info') || errMsg.contains('RoutableMessage')) {
                proxyAttempts++;
                debugPrint('TeslaApiClient: Proxy session not established for $command (attempt $proxyAttempts). Retrying after delay...');
                if (proxyAttempts >= 5) {
                  throw Exception('Vehicle session could not be established. Ensure the virtual key is added and try again.');
                }
                await Future.delayed(const Duration(seconds: 5));
                continue;
              }
              // Other 500 errors (e.g. UnimplementedError) — fall back to direct
              if (errorBody is Map && errorBody['type'] == 'UnimplementedError') {
                debugPrint('TeslaApiClient: Proxy does not implement $command. Falling back to direct Fleet API...');
                tryProxy = false;
                break;
              }
              // Unknown 500 — surface it rather than silently falling back
              rethrow;
            }

            // 501 Not Implemented — fall back to direct API
            if (statusCode == 501) {
              debugPrint('TeslaApiClient: Proxy 501 for $command. Falling back to direct Fleet API...');
              tryProxy = false;
              break;
            }

            // For other proxy responses, rethrow to avoid hiding real errors
            if (e.response != null) {
              rethrow;
            }
          } else {
            // Non-Dio exceptions (e.g. our own thrown Exception from body checks above)
            // must be re-thrown — not silently swallowed into a direct-API fallback.
            debugPrint('TeslaApiClient: Proxy command $command exception: $e');
            rethrow;
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

  // Note: _ensureOnline() has been removed from all command methods.
  // The proxy's 403 "vehicle offline" handler and the repository's
  // _executeWithWakeUp() already handle wake-up reactively, which avoids
  // paying for an extra getVehicles() call before every command.

  Future<Response> doorLock(String vehicleId) async {
    return await _postSignedCommand(vehicleId, 'door_lock', {});
  }

  Future<Response> doorUnlock(String vehicleId) async {
    return await _postSignedCommand(vehicleId, 'door_unlock', {});
  }

  Future<Response> actuateTrunk(String vehicleId, String whichTrunk) async {
    return await _postSignedCommand(vehicleId, 'actuate_trunk', {'which_trunk': whichTrunk});
  }

  Future<Response> chargePortDoorOpen(String vehicleId) async {
    return await _postSignedCommand(vehicleId, 'charge_port_door_open', {});
  }

  Future<Response> chargePortDoorClose(String vehicleId) async {
    return await _postSignedCommand(vehicleId, 'charge_port_door_close', {});
  }

  Future<Response> setSentryMode(String vehicleId, bool on) async {
    return await _postSignedCommand(vehicleId, 'set_sentry_mode', {'on': on});
  }

  Future<Response> setValetMode(String vehicleId, bool on, {String? password}) async {
    final data = <String, dynamic>{'on': on};
    if (password != null && password.isNotEmpty) {
      data['password'] = password;
    }
    return await _postSignedCommand(vehicleId, 'set_valet_mode', data);
  }

  // --- Climate Commands ---

  Future<Response> setTemperature(String vehicleId, double driverTemp, double passengerTemp) async {
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
    return await _postSignedCommand(vehicleId, 'auto_conditioning_start', {});
  }

  Future<Response> autoConditioningStop(String vehicleId) async {
    return await _postSignedCommand(vehicleId, 'auto_conditioning_stop', {});
  }

  Future<Response> remoteSeatHeaterRequest(String vehicleId, int seatPosition, int level) async {
    // Tesla API param is 'seat_position', not 'heater'.
    // 0=front left, 1=front right, 2=rear left, 3=rear left back,
    // 4=rear center, 5=rear right, 6=rear right back, 7=third row left, 8=third row right
    return await _postSignedCommand(
      vehicleId,
      'remote_seat_heater_request',
      {
        'seat_position': seatPosition,
        'level': level,
      },
    );
  }

  /// Set climate keeper mode.
  /// Tesla API requires integer: 0=Off, 1=Keep, 2=Dog, 3=Camp.
  /// [mode] is the domain string ("off", "on", "dog", "camp") — converted here.
  Future<Response> setClimateKeeperMode(String vehicleId, String mode) async {
    const modeMap = {'off': 0, 'on': 1, 'dog': 2, 'camp': 3};
    final modeInt = modeMap[mode.toLowerCase()] ?? 0;
    return await _postSignedCommand(vehicleId, 'set_climate_keeper_mode', {'climate_keeper_mode': modeInt});
  }

  /// Control windows: "vent" or "close".
  /// For close on non-M3 vehicles, lat/lon must be the user's location to
  /// confirm they are within range. Pass vehicle's last-known coordinates.
  Future<Response> windowControl(String vehicleId, String command, {double lat = 0, double lon = 0}) async {
    return await _postSignedCommand(vehicleId, 'window_control', {'command': command, 'lat': lat, 'lon': lon});
  }

  /// Set scheduled charging
  Future<Response> setScheduledCharging(String vehicleId, bool enable, {int? startTime}) async {
    final data = <String, dynamic>{'enable': enable};
    if (startTime != null) data['time'] = startTime;
    return await _postSignedCommand(vehicleId, 'set_scheduled_charging', data);
  }

  /// Set speed limit (mph)
  Future<Response> speedLimitSetLimit(String vehicleId, int limitMph) async {
    return await _postSignedCommand(vehicleId, 'speed_limit_set_limit', {'limit_mph': limitMph});
  }

  /// Activate speed limit mode (requires PIN)
  Future<Response> speedLimitActivate(String vehicleId, String pin) async {
    return await _postSignedCommand(vehicleId, 'speed_limit_activate', {'pin': pin});
  }

  /// Deactivate speed limit mode (requires PIN)
  Future<Response> speedLimitDeactivate(String vehicleId, String pin) async {
    return await _postSignedCommand(vehicleId, 'speed_limit_deactivate', {'pin': pin});
  }

  // --- Charging Commands ---

  Future<Response> setChargeLimit(String vehicleId, int limit) async {
    return await _postSignedCommand(
      vehicleId,
      'set_charge_limit',
      {'percent': limit},
    );
  }

  Future<Response> chargeStart(String vehicleId) async {
    return await _postSignedCommand(vehicleId, 'charge_start', {});
  }

  Future<Response> chargeStop(String vehicleId) async {
    return await _postSignedCommand(vehicleId, 'charge_stop', {});
  }

  Future<Response> setChargingAmps(String vehicleId, int amps) async {
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
    return await _postSignedCommand(vehicleId, 'flash_lights', {});
  }

  Future<Response> honkHorn(String vehicleId) async {
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
  
  Future<ChargingHistoryResponse> getChargingHistory({
    String? vin,
    int? pageNo,
    int? pageSize,
    String? startTime,
    String? endTime,
    String? sortBy,
    String? sortOrder,
  }) async {
    final queryParams = <String, dynamic>{};
    if (vin != null) queryParams['vin'] = vin;
    if (pageNo != null) queryParams['pageNo'] = pageNo;
    if (pageSize != null) queryParams['pageSize'] = pageSize;
    if (startTime != null) queryParams['startTime'] = startTime;
    if (endTime != null) queryParams['endTime'] = endTime;
    if (sortBy != null) queryParams['sortBy'] = sortBy;
    if (sortOrder != null) queryParams['sortOrder'] = sortOrder;

    final response = await _dio.get('/api/1/dx/charging/history', queryParameters: queryParams);
    if (response.data == null) {
      throw Exception('TeslaApiClient: getChargingHistory returned null data');
    }
    final raw = response.data as Map<String, dynamic>;
    return ChargingHistoryResponse.fromJson(raw);
  }

  /// Downloads the PDF invoice for a charging session.
  /// [contentId] comes from [ChargingHistoryEntry.invoices[*].contentId].
  Future<List<int>> getChargingInvoice(String contentId) async {
    final response = await _dio.get(
      '/api/1/dx/charging/invoice/$contentId',
      options: Options(responseType: ResponseType.bytes),
    );
    if (response.data == null) {
      throw Exception('TeslaApiClient: getChargingInvoice returned null data');
    }
    return response.data as List<int>;
  }

  /// Fetches business/fleet charging sessions (fleet accounts only).
  Future<ChargingSessionsResponse> getChargingSessions({
    String? vin,
    String? dateFrom,
    String? dateTo,
    int? limit,
    int? offset,
  }) async {
    final queryParams = <String, dynamic>{};
    if (vin != null) queryParams['vin'] = vin;
    if (dateFrom != null) queryParams['date_from'] = dateFrom;
    if (dateTo != null) queryParams['date_to'] = dateTo;
    if (limit != null) queryParams['limit'] = limit;
    if (offset != null) queryParams['offset'] = offset;

    final response = await _dio.get('/api/1/dx/charging/sessions', queryParameters: queryParams);
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

  /// Configures Fleet Telemetry by routing through the TVCP proxy, which signs
  /// the config as a JWS token and forwards to Tesla's fleet_telemetry_config_jws
  /// endpoint. Using [vin] (not vehicleId integer) as required by the API.
  Future<Response> configureFleetTelemetry(String vin, Map<String, dynamic> config) async {
    final token = await _storage.read(key: 'access_token');
    final fleetBaseUrl = _dio.options.baseUrl;
    final proxyUrl = TeslaConfig.proxyUrl;

    return await _dio.post(
      '$proxyUrl/api/fleet/telemetry_config',
      data: {'vin': vin, 'config': config},
      options: Options(headers: {
        'Authorization': 'Bearer $token',
        if (fleetBaseUrl.isNotEmpty) 'X-Fleet-Api-Base-Url': fleetBaseUrl,
      }),
    );
  }

  /// Returns the active Fleet Telemetry config for this vehicle.
  /// [synced] = true means the vehicle has adopted the config.
  Future<Map<String, dynamic>> getFleetTelemetryConfig(String vin) async {
    final token = await _storage.read(key: 'access_token');
    final fleetBaseUrl = _dio.options.baseUrl;
    final proxyUrl = TeslaConfig.proxyUrl;
    final response = await _dio.get(
      '$proxyUrl/api/fleet/telemetry_config/$vin',
      options: Options(headers: {
        'Authorization': 'Bearer $token',
        if (fleetBaseUrl.isNotEmpty) 'X-Fleet-Api-Base-Url': fleetBaseUrl,
      }),
    );
    return (response.data is Map<String, dynamic>)
        ? response.data as Map<String, dynamic>
        : {};
  }

  /// Removes the Fleet Telemetry config from the vehicle.
  Future<void> deleteFleetTelemetryConfig(String vin) async {
    final token = await _storage.read(key: 'access_token');
    final fleetBaseUrl = _dio.options.baseUrl;
    final proxyUrl = TeslaConfig.proxyUrl;
    await _dio.delete(
      '$proxyUrl/api/fleet/telemetry_config/$vin',
      options: Options(headers: {
        'Authorization': 'Bearer $token',
        if (fleetBaseUrl.isNotEmpty) 'X-Fleet-Api-Base-Url': fleetBaseUrl,
      }),
    );
  }

  /// Returns recent Fleet Telemetry errors for this vehicle.
  Future<Map<String, dynamic>> getFleetTelemetryErrors(String vin) async {
    final token = await _storage.read(key: 'access_token');
    final fleetBaseUrl = _dio.options.baseUrl;
    final proxyUrl = TeslaConfig.proxyUrl;
    final response = await _dio.get(
      '$proxyUrl/api/fleet/telemetry_errors/$vin',
      options: Options(headers: {
        'Authorization': 'Bearer $token',
        if (fleetBaseUrl.isNotEmpty) 'X-Fleet-Api-Base-Url': fleetBaseUrl,
      }),
    );
    return (response.data is Map<String, dynamic>)
        ? response.data as Map<String, dynamic>
        : {};
  }

  /// Returns fleet status for one or more VINs (TVCP required, firmware, etc.)
  Future<Map<String, dynamic>> getFleetStatus(List<String> vins) async {
    final token = await _storage.read(key: 'access_token');
    final fleetBaseUrl = _dio.options.baseUrl;
    final proxyUrl = TeslaConfig.proxyUrl;
    final response = await _dio.post(
      '$proxyUrl/api/fleet/status',
      data: {'vins': vins},
      options: Options(headers: {
        'Authorization': 'Bearer $token',
        if (fleetBaseUrl.isNotEmpty) 'X-Fleet-Api-Base-Url': fleetBaseUrl,
      }),
    );
    return (response.data is Map<String, dynamic>)
        ? response.data as Map<String, dynamic>
        : {};
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
    return await _postSignedCommand(vehicleId, command, {});
  }

  // --- Boombox ---

  Future<Response> remoteBoombox(String vehicleId, int soundId) async {
    return await _postSignedCommand(vehicleId, 'remote_boombox', {'sound': soundId});
  }

  // --- Extra Climate ---

  Future<Response> setBioweaponMode(String vehicleId, bool on) async {
    return await _postSignedCommand(vehicleId, 'set_bioweapon_mode', {'on': on, 'manual_override': true});
  }

  Future<Response> setCabinOverheatProtection(String vehicleId, {required bool on, bool fanOnly = false}) async {
    return await _postSignedCommand(vehicleId, 'set_cabin_overheat_protection', {'on': on, 'fan_only': fanOnly});
  }

  Future<Response> setPreconditioningMax(String vehicleId, bool on) async {
    return await _postSignedCommand(vehicleId, 'set_preconditioning_max', {'on': on, 'manual_override': false});
  }

  // --- Remote Start ---

  Future<Response> remoteStartDrive(String vehicleId) async {
    return await _postSignedCommand(vehicleId, 'remote_start_drive', {});
  }

  // --- Additional Charging Commands ---

  /// Charge to 100% (max range mode). Use sparingly — degrades battery.
  Future<Response> chargeMaxRange(String vehicleId) async {
    return await _postSignedCommand(vehicleId, 'charge_max_range', {});
  }

  /// Reset charge limit to standard (factory default %).
  Future<Response> chargeStandard(String vehicleId) async {
    return await _postSignedCommand(vehicleId, 'charge_standard', {});
  }

  /// Add a recurring or one-time charge schedule (preferred over set_scheduled_charging since fw 2024.26).
  /// [daysOfWeek] e.g. "All", "Weekdays", "Monday,Wednesday"
  /// [startTime] and [endTime] are minutes after midnight (e.g. 120 = 2:00 AM)
  Future<Response> addChargeSchedule(
    String vehicleId, {
    required String daysOfWeek,
    required bool enabled,
    required bool startEnabled,
    required bool endEnabled,
    required double lat,
    required double lon,
    int? startTime,
    int? endTime,
    int? id,
    bool oneTime = false,
  }) async {
    final data = <String, dynamic>{
      'days_of_week': daysOfWeek,
      'enabled': enabled,
      'start_enabled': startEnabled,
      'end_enabled': endEnabled,
      'lat': lat,
      'lon': lon,
      'one_time': oneTime,
    };
    if (startTime != null) data['start_time'] = startTime;
    if (endTime != null) data['end_time'] = endTime;
    if (id != null) data['id'] = id;
    return await _postSignedCommand(vehicleId, 'add_charge_schedule', data);
  }

  /// Remove a charge schedule by its ID.
  Future<Response> removeChargeSchedule(String vehicleId, int id) async {
    return await _postSignedCommand(vehicleId, 'remove_charge_schedule', {'id': id});
  }

  /// Add a preconditioning schedule (preferred over set_scheduled_departure since fw 2024.26).
  /// [preconditionTime] minutes after midnight when conditioning should be complete.
  Future<Response> addPreconditionSchedule(
    String vehicleId, {
    required String daysOfWeek,
    required bool enabled,
    required double lat,
    required double lon,
    required int preconditionTime,
    int? id,
    bool oneTime = false,
  }) async {
    final data = <String, dynamic>{
      'days_of_week': daysOfWeek,
      'enabled': enabled,
      'lat': lat,
      'lon': lon,
      'precondition_time': preconditionTime,
      'one_time': oneTime,
    };
    if (id != null) data['id'] = id;
    return await _postSignedCommand(vehicleId, 'add_precondition_schedule', data);
  }

  /// Remove a preconditioning schedule by its ID.
  Future<Response> removePreconditionSchedule(String vehicleId, int id) async {
    return await _postSignedCommand(vehicleId, 'remove_precondition_schedule', {'id': id});
  }

  // --- Additional Climate Commands ---

  /// Set seat cooling level. Requires climate keeper or preconditioning to be active.
  /// [seatPosition]: 1=front left, 2=front right
  /// [level]: 0=off, 1=low, 2=medium, 3=high
  Future<Response> remoteSeatCoolerRequest(String vehicleId, int seatPosition, int level) async {
    return await _postSignedCommand(vehicleId, 'remote_seat_cooler_request', {
      'seat_position': seatPosition,
      'seat_cooler_level': level,
    });
  }

  /// Set Cabin Overheat Protection target temperature.
  /// [copTemp]: 0=Low (90°F/30°C), 1=Medium (95°F/35°C), 2=High (100°F/40°C)
  Future<Response> setCopTemp(String vehicleId, int copTemp) async {
    return await _postSignedCommand(vehicleId, 'set_cop_temp', {'cop_temp': copTemp});
  }

  /// Set steering wheel heat level (for vehicles that support leveled heat).
  /// [level]: 0=off, 1=low, 3=high (note: no level 2)
  Future<Response> remoteSteeringWheelHeatLevelRequest(String vehicleId, int level) async {
    return await _postSignedCommand(vehicleId, 'remote_steering_wheel_heat_level_request', {'level': level});
  }

  /// Adjust media volume precisely. [volume] is 0.0 to 11.0.
  Future<Response> adjustVolume(String vehicleId, double volume) async {
    return await _postSignedCommand(vehicleId, 'adjust_volume', {'volume': volume.clamp(0.0, 11.0)});
  }

  // --- Sunroof & HomeLink ---

  /// Control sunroof on equipped vehicles. [state]: "stop", "close", "vent"
  Future<Response> sunRoofControl(String vehicleId, String state) async {
    return await _postSignedCommand(vehicleId, 'sun_roof_control', {'state': state});
  }

  /// Trigger HomeLink (garage door). Requires lat/lon of user and a HomeLink token.
  Future<Response> triggerHomelink(String vehicleId, double lat, double lon, String token) async {
    return await _postSignedCommand(vehicleId, 'trigger_homelink', {'lat': lat, 'lon': lon, 'token': token});
  }

  // --- Navigation ---

  /// Send GPS coordinates to vehicle navigation.
  Future<Response> navigationGpsRequest(String vehicleId, double lat, double lon, {int order = 0}) async {
    return await _postSignedCommand(vehicleId, 'navigation_gps_request', {'lat': lat, 'lon': lon, 'order': order});
  }

  /// Navigate to a Supercharger by its site ID.
  Future<Response> navigationScRequest(String vehicleId, String id, {int order = 0}) async {
    return await _postSignedCommand(vehicleId, 'navigation_sc_request', {'id': id, 'order': order});
  }

  // --- Software Updates ---

  /// Schedule a software update to install [offsetSec] seconds from now.
  Future<Response> scheduleSoftwareUpdate(String vehicleId, int offsetSec) async {
    return await _postSignedCommand(vehicleId, 'schedule_software_update', {'offset_sec': offsetSec});
  }

  /// Cancel a pending software update installation countdown.
  Future<Response> cancelSoftwareUpdate(String vehicleId) async {
    return await _postSignedCommand(vehicleId, 'cancel_software_update', {});
  }

  // --- Vehicle Info Endpoints (free, not billed) ---

  /// Recent vehicle alerts (low fluid, errors, etc).
  Future<List<Map<String, dynamic>>> getRecentAlerts(String vin) async {
    final response = await _dio.get('/api/1/vehicles/$vin/recent_alerts');
    final data = response.data?['response'];
    if (data == null) return [];
    if (data is List) return data.cast<Map<String, dynamic>>();
    return [];
  }

  /// Firmware release notes. Set [staged] to true for upcoming update notes.
  Future<Map<String, dynamic>?> getReleaseNotesData(String vin, {bool staged = false}) async {
    final response = await _dio.get(
      '/api/1/vehicles/$vin/release_notes',
      queryParameters: {'staged': staged},
    );
    return response.data?['response'] as Map<String, dynamic>?;
  }

  /// Service status and appointment data for the vehicle.
  Future<Map<String, dynamic>?> getServiceData(String vin) async {
    final response = await _dio.get('/api/1/vehicles/$vin/service_data');
    return response.data?['response'] as Map<String, dynamic>?;
  }

  /// Check whether mobile access is enabled on the vehicle.
  Future<bool> getMobileEnabled(String vin) async {
    final response = await _dio.get('/api/1/vehicles/$vin/mobile_enabled');
    return response.data?['response'] as bool? ?? false;
  }

  /// List all drivers who have access to this vehicle (owner only).
  Future<List<Map<String, dynamic>>> getDrivers(String vin) async {
    final response = await _dio.get('/api/1/vehicles/$vin/drivers');
    final data = response.data?['response'];
    if (data == null) return [];
    if (data is List) return data.cast<Map<String, dynamic>>();
    return [];
  }

  /// Returns the user's active orders (pending deliveries).
  Future<List<Map<String, dynamic>>> getUserOrders() async {
    final response = await _dio.get('/api/1/users/orders');
    final data = response.data?['response'];
    if (data == null) return [];
    if (data is List) return data.cast<Map<String, dynamic>>();
    return [];
  }

  /// Returns eligible vehicle upgrades (FSD, acceleration boost, etc).
  Future<List<Map<String, dynamic>>> getEligibleUpgrades(String vin) async {
    final response = await _dio.get('/api/1/dx/vehicles/upgrades/eligibility', queryParameters: {'vin': vin});
    final data = response.data?['response'];
    if (data == null) return [];
    if (data is List) return data.cast<Map<String, dynamic>>();
    return [];
  }

  /// Get share invites for a vehicle.
  Future<List<Map<String, dynamic>>> getShareInvites(String vin) async {
    final response = await _dio.get('/api/1/vehicles/$vin/invitations');
    final data = response.data?['response'];
    if (data == null) return [];
    if (data is List) return data.cast<Map<String, dynamic>>();
    return [];
  }

  /// Create a 24-hour single-use share invite link.
  Future<Map<String, dynamic>> createShareInvite(String vin) async {
    final response = await _dio.post('/api/1/vehicles/$vin/invitations');
    return response.data?['response'] as Map<String, dynamic>? ?? {};
  }

  /// Revoke a share invite by its ID.
  Future<void> revokeShareInvite(String vin, String inviteId) async {
    await _dio.post('/api/1/vehicles/$vin/invitations/$inviteId/revoke');
  }
}

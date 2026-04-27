import 'dart:convert';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';
import '../../domain/vehicle.dart';
import '../../domain/vehicle_repository.dart';
import 'package:voltride/features/dashboard/domain/tesla_product.dart' as domain;
import '../models/tesla_models.dart';
import 'package:hive/hive.dart';
import 'package:voltride/features/telemetry/data/services/trip_detection_service.dart';

class VehicleRepositoryImpl implements VehicleRepository {
  final FirebaseFunctions _functions;

  // Hive Boxes
  final Box<BatterySnapshot> _batteryBox;
  final Box<DriveSession> _tripBox;
  final Box<ChargeSession> _chargeBox;
  final Box<VehicleCache> _vehicleCacheBox;
  final TripDetectionService _tripDetectionService;

  /// In-memory cache of vehicle metadata (id → TeslaVehicle) populated by
  /// getVehicles(). Allows getVehicleData() to avoid a second API call.
  final Map<String, TeslaVehicle> _vehicleMetaCache = {};

  VehicleRepositoryImpl(
    this._functions,
    this._batteryBox,
    this._tripBox,
    this._chargeBox,
    this._vehicleCacheBox,
    this._tripDetectionService,
  );

  /// Returns the Hive box used for caching complete vehicle data JSON.
  Box get _vehicleDataCacheBox => Hive.box('vehicle_data_cache');

  @override
  Future<List<Vehicle>> getVehicles() async {
    try {
      final result = await _functions.httpsCallable('getTeslaData').call({'path': '/api/1/products'});
      final data = result.data as Map;
      final response = data['response'] as List<dynamic>;
      final products = response.map((e) => TeslaVehicle.fromJson(Map<String, dynamic>.from(e as Map))).toList();
      
      final List<Vehicle> vehicles = [];
      for (final tesla in products) {
        _vehicleMetaCache[tesla.id] = tesla;
        vehicles.add(_mapBasicTeslaVehicleToDomain(tesla));
      }
      return vehicles;
    } catch (e) {
      debugPrint('VehicleRepository: getVehicles failed: $e');
      rethrow;
    }
  }

  @override
  Future<Vehicle> getVehicleData(String vehicleId) async {
    try {
      final result = await _functions.httpsCallable('getVehicleData').call({'vehicle_id': vehicleId});
      final dataMap = Map<String, dynamic>.from(result.data as Map);
      final teslaData = TeslaVehicleData.fromJson(dataMap);
      
      final tesla = _vehicleMetaCache[vehicleId] ?? 
          _vehicleMetaCache.values.firstWhere((v) => v.id == vehicleId, 
          orElse: () => throw Exception('Vehicle not found in cache'));

      final vehicle = _mapTeslaVehicleDataToDomain(tesla, teslaData);

      // Trigger Trip Detection processing
      await _tripDetectionService.processSnapshot(vehicle.vin, teslaData);

      // Save BatterySnapshot locally for history/analytics
      _saveBatterySnapshot(vehicle);

      // Cache full vehicle state for cold-start
      _cacheVehicleData(vehicle);

      return vehicle;
    } catch (e) {
      debugPrint('VehicleRepository: getVehicleData failed: $e');
      rethrow;
    }
  }

  @override
  Future<void> wakeUp(String vehicleId) async {
    await _functions.httpsCallable('wakeVehicle').call({'vehicle_id': vehicleId});
  }

  /// Save a battery snapshot to Hive for local analytics.
  void _saveBatterySnapshot(Vehicle vehicle) {
    try {
      final snapshot = BatterySnapshot(
        timestamp: DateTime.now(),
        batteryLevel: vehicle.batteryLevel,
        batteryRange: vehicle.batteryRange,
        idealBatteryRange: vehicle.idealBatteryRange,
        outsideTemp: vehicle.outsideTemp,
        batteryHeaterOn: vehicle.batteryHeaterOn,
        chargeLimitSoc: vehicle.chargeLimitSoc,
        shiftState: vehicle.shiftState ?? 'P',
        odometer: vehicle.odometer,
        vin: vehicle.vin,
      );
      _batteryBox.add(snapshot);

      // Keep only the last 200 snapshots to avoid unbounded growth
      if (_batteryBox.length > 200) {
        final keysToDelete = _batteryBox.keys.take(_batteryBox.length - 200).toList();
        _batteryBox.deleteAll(keysToDelete);
      }
    } catch (e) {
      debugPrint('VehicleRepository: Failed to save battery snapshot: $e');
    }
  }

  /// Cache the full vehicle state as JSON in Hive for instant cold-start.
  void _cacheVehicleData(Vehicle vehicle) {
    try {
      _vehicleDataCacheBox.put('last_vehicle_${vehicle.vin}', jsonEncode(vehicle.toJson()));
      _vehicleDataCacheBox.put('last_sync_time', DateTime.now().toIso8601String());
    } catch (e) {
      debugPrint('VehicleRepository: Failed to cache vehicle data: $e');
    }
  }

  /// Load cached vehicle data from Hive for cold-start display.
  Vehicle? loadCachedVehicleData(String vin) {
    try {
      final cached = _vehicleDataCacheBox.get('last_vehicle_$vin');
      if (cached != null && cached is String) {
        final json = jsonDecode(cached) as Map<String, dynamic>;
        return Vehicle(
          id: json['id'] ?? '',
          vehicleId: json['vehicle_id'] ?? '',
          vin: json['vin'] ?? vin,
          displayName: json['display_name'],
          optionCodes: json['option_codes'],
          color: json['color'],
          state: json['state'] ?? 'offline',
          batteryLevel: (json['battery_level'] as num?)?.toInt() ?? 0,
          batteryRange: (json['battery_range'] as num?)?.toDouble() ?? 0.0,
          idealBatteryRange: (json['ideal_battery_range'] as num?)?.toDouble() ?? 0.0,
          estBatteryRange: (json['est_battery_range'] as num?)?.toDouble() ?? 0.0,
          outsideTemp: (json['outside_temp'] as num?)?.toDouble() ?? 0.0,
          insideTemp: (json['inside_temp'] as num?)?.toDouble() ?? 0.0,
          odometer: (json['odometer'] as num?)?.toDouble() ?? 0.0,
          isLocked: json['is_locked'] ?? true,
          isClimateOn: json['is_climate_on'] ?? false,
          isSentryModeOn: json['is_sentry_mode_on'] ?? false,
          isValetModeOn: json['is_valet_mode_on'] ?? false,
          batteryHeaterOn: json['battery_heater_on'] ?? false,
          chargeLimitSoc: (json['charge_limit_soc'] as num?)?.toInt() ?? 80,
          shiftState: json['shift_state'],
          frontTrunkState: (json['front_trunk_state'] as num?)?.toInt() ?? 0,
          rearTrunkState: (json['rear_trunk_state'] as num?)?.toInt() ?? 0,
          chargingState: json['charging_state'] ?? 'Disconnected',
          chargeRate: (json['charge_rate'] as num?)?.toDouble() ?? 0.0,
          chargeEnergyAdded: (json['charge_energy_added'] as num?)?.toDouble() ?? 0.0,
          timeToFullCharge: (json['time_to_full_charge'] as num?)?.toDouble() ?? 0.0,
          chargerPower: (json['charger_power'] as num?)?.toDouble() ?? 0.0,
          chargerVoltage: (json['charger_voltage'] as num?)?.toDouble() ?? 0.0,
          chargerPhases: (json['charger_phases'] as num?)?.toInt() ?? 0,
          fastChargerType: json['fast_charger_type'],
          connChargeCable: json['conn_charge_cable'],
          speed: (json['speed'] as num?)?.toDouble() ?? 0.0,
          power: (json['power'] as num?)?.toDouble() ?? 0.0,
          latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
          longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
          heading: (json['heading'] as num?)?.toInt() ?? 0,
          driverTemp: (json['driver_temp'] as num?)?.toDouble(),
          passengerTemp: (json['passenger_temp'] as num?)?.toDouble(),
          fanStatus: (json['fan_status'] as num?)?.toInt() ?? 0,
          seatHeaterLeft: (json['seat_heater_left'] as num?)?.toInt() ?? 0,
          seatHeaterRight: (json['seat_heater_right'] as num?)?.toInt() ?? 0,
          steeringWheelHeater: json['steering_wheel_heater'] as bool? ?? false,
          frontDefrosterOn: json['front_defroster_on'] as bool? ?? false,
          tpmsPressureFl: (json['tpms_pressure_fl'] as num?)?.toDouble(),
          tpmsPressureFr: (json['tpms_pressure_fr'] as num?)?.toDouble(),
          tpmsPressureRl: (json['tpms_pressure_rl'] as num?)?.toDouble(),
          tpmsPressureRr: (json['tpms_pressure_rr'] as num?)?.toDouble(),
          softwareVersion: json['software_version'] ?? '',
          softwareUpdateStatus: json['software_update_status'],
          softwareUpdateVersion: json['software_update_version'],
          softwareUpdateProgress: (json['software_update_progress'] as num?)?.toInt() ?? 0,
          climateKeeperMode: json['climate_keeper_mode'] ?? 'off',
          scheduledChargingMode: json['scheduled_charging_mode'],
          scheduledChargingStartTime: (json['scheduled_charging_start_time'] as num?)?.toInt(),
          chargePortOpen: json['charge_port_open'] ?? false,
          chargeCurrentRequest: (json['charge_current_request'] as num?)?.toInt() ?? 0,
          useFahrenheit: json['use_fahrenheit'] ?? false,
          useMiles: json['use_miles'] ?? false,
          pressureUnit: json['pressure_unit'],
          // Extended charging
          usableBatteryLevel: (json['usable_battery_level'] as num?)?.toInt() ?? 0,
          chargeCurrentRequestMax: (json['charge_current_request_max'] as num?)?.toInt() ?? 48,
          scheduledChargingPending: json['scheduled_charging_pending'] ?? false,
          fastChargerPresent: json['fast_charger_present'] ?? false,
          // Extended climate
          seatHeaterRearLeft: (json['seat_heater_rear_left'] as num?)?.toInt() ?? 0,
          seatHeaterRearRight: (json['seat_heater_rear_right'] as num?)?.toInt() ?? 0,
          seatHeaterRearCenter: (json['seat_heater_rear_center'] as num?)?.toInt() ?? 0,
          steeringWheelHeatLevel: (json['steering_wheel_heat_level'] as num?)?.toInt() ?? 0,
          copTemp: (json['cop_temp'] as num?)?.toInt() ?? 0,
          // Software
          softwareUpdateScheduled: json['software_update_scheduled'] ?? false,
        );
      }
    } catch (e) {
      debugPrint('VehicleRepository: Failed to load cached vehicle data: $e');
    }
    return null;
  }

  /// Get the last sync time from the cache.
  DateTime? getLastSyncTime() {
    try {
      final timeStr = _vehicleDataCacheBox.get('last_sync_time');
      if (timeStr != null && timeStr is String) {
        return DateTime.parse(timeStr);
      }
    } catch (_) {}
    return null;
  }

  @override
  Future<void> lock(String vehicleId) async => 
      _callCommand(vehicleId, 'door_lock', {});

  @override
  Future<void> unlock(String vehicleId) async => 
      _callCommand(vehicleId, 'door_unlock', {});

  @override
  Future<void> actuateTrunk(String vehicleId, String whichTrunk) async => 
      _callCommand(vehicleId, 'actuate_trunk', {'which_trunk': whichTrunk});

  @override
  Future<void> setTemperature(String vehicleId, double temp) async => 
      _callCommand(vehicleId, 'set_temps', {'driver_temp': temp, 'passenger_temp': temp});

  @override
  Future<void> setClimateOn(String vehicleId, bool on) async => 
      _callCommand(vehicleId, on ? 'auto_conditioning_start' : 'auto_conditioning_stop', {});

  @override
  Future<void> setSeatHeater(String vehicleId, int heater, int level) async =>
      _callCommand(vehicleId, 'remote_seat_heater_request', {'seat_position': heater, 'level': level});

  @override
  Future<void> setClimateKeeperMode(String vehicleId, String mode) async {
    const modeMap = {'off': 0, 'on': 1, 'dog': 2, 'camp': 3};
    final modeInt = modeMap[mode.toLowerCase()] ?? 0;
    return _callCommand(vehicleId, 'set_climate_keeper_mode', {'climate_keeper_mode': modeInt});
  }

  @override
  Future<void> setChargeLimit(String vehicleId, int limit) async => 
      _callCommand(vehicleId, 'set_charge_limit', {'percent': limit});

  @override
  Future<void> startCharging(String vehicleId) async => 
      _callCommand(vehicleId, 'charge_start', {});

  @override
  Future<void> stopCharging(String vehicleId) async => 
      _callCommand(vehicleId, 'charge_stop', {});

  @override
  Future<void> setChargingAmps(String vehicleId, int amps) async =>
      _callCommand(vehicleId, 'set_charging_amps', {'charging_amps': amps});

  @override
  Future<void> openChargePort(String vehicleId) async =>
      _callCommand(vehicleId, 'charge_port_door_open', {});

  @override
  Future<void> closeChargePort(String vehicleId) async =>
      _callCommand(vehicleId, 'charge_port_door_close', {});

  @override
  Future<void> setScheduledCharging(String vehicleId, bool enable, {int? startTime}) async =>
      _callCommand(vehicleId, 'set_scheduled_charging', {'enable': enable, 'time':? startTime});

  @override
  Future<void> flashLights(String vehicleId) async => 
      _callCommand(vehicleId, 'flash_lights', {});

  @override
  Future<void> honkHorn(String vehicleId) async => 
      _callCommand(vehicleId, 'honk_horn', {});

  @override
  Future<void> setSentryMode(String vehicleId, bool on) async => 
      _callCommand(vehicleId, 'set_sentry_mode', {'on': on});

  @override
  Future<void> setValetMode(String vehicleId, bool on, {String? password}) async => 
      _callCommand(vehicleId, 'set_valet_mode', {'on': on, 'password':? password});

  @override
  Future<List<domain.TeslaProduct>> getProducts() async {
    final response = await _getGenericData('/api/1/products');
    return response.map((p) {
      domain.ProductType type = domain.ProductType.unknown;
      if (p['resource_type'] == 'battery') type = domain.ProductType.powerwall;
      if (p['resource_type'] == 'solar') type = domain.ProductType.solar;
      if (p['vin'] != null) type = domain.ProductType.vehicle;

      return domain.TeslaProduct(
        id: (p['id'] ?? p['energy_site_id'] ?? '').toString(),
        energySiteId: p['energy_site_id'],
        siteName: p['site_name'],
        type: type,
        vin: p['vin'],
      );
    }).toList();
  }

  @override
  Future<VehicleCache> getVehicleSpecs(String vin) async {
    if (_vehicleCacheBox.containsKey(vin)) return _vehicleCacheBox.get(vin)!;
    final response = await _getGenericData('/api/1/vehicles/$vin/specs');
    final data = response.first;
    final specs = VehicleCache(
      vin: vin,
      batteryCapacityKwh: _dynamicToDouble(data['battery_capacity_kwh']),
      originalRangeRating: _dynamicToDouble(data['original_range_rating']),
      batteryType: data['battery_type'],
      motorCount: _dynamicToInt(data['motor_count']),
    );
    await _vehicleCacheBox.put(vin, specs);
    return specs;
  }

  @override
  Future<void> syncWarranty(String vin) async {
    final response = await _getGenericData('/api/1/dx/warranty/details', params: {'vin': vin});
    final data = response.first;
    final oldCache = _vehicleCacheBox.get(vin);
    final newCache = VehicleCache(
      vin: vin,
      batteryCapacityKwh: oldCache?.batteryCapacityKwh,
      originalRangeRating: oldCache?.originalRangeRating,
      warrantyExpiryDate: data['warranty_expiry_date'] != null ? DateTime.parse(data['warranty_expiry_date']) : null,
      warrantyMilesRemaining: _dynamicToDouble(data['miles_remaining']),
      batteryType: oldCache?.batteryType,
      motorCount: oldCache?.motorCount,
    );
    await _vehicleCacheBox.put(vin, newCache);
  }

  @override
  Future<List<ChargingLocation>> getNearbyChargingSites(String vehicleId) async {
    final response = await _getGenericData('/api/1/vehicles/$vehicleId/nearby_charging_sites');
    final data = response.first;
    final List<dynamic> superchargers = data['superchargers'] ?? [];
    return superchargers.asMap().entries.map((entry) {
      final sc = entry.value as Map<String, dynamic>;
      final loc = sc['location'] as Map<String, dynamic>?;
      return ChargingLocation(
        id: 'nearby_${entry.key}',
        name: sc['name'],
        evseCount: sc['total_stalls'],
        coordinates: loc != null ? ChargingCoordinates(latitude: (loc['lat'] as num).toDouble(), longitude: (loc['long'] as num).toDouble()) : null,
      );
    }).toList();
  }

  @override
  Future<String?> getReleaseNotes(String vehicleId) async {
    final response = await _getGenericData('/api/1/vehicles/$vehicleId/release_notes');
    return response.first['notes'];
  }

  @override
  Future<List<BatterySnapshot>> getBatteryHistory(String vin) async {
    final all = _batteryBox.values.toList();
    final filtered = all.where((s) => s.vin == null || s.vin == vin).toList();
    filtered.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    return filtered;
  }

  @override
  Future<List<DriveSession>> getTripHistory(String vin) async {
    final all = _tripBox.values.toList();
    final filtered = all.where((s) => s.vin == null || s.vin == vin).toList();
    filtered.sort((a, b) => b.startTime.compareTo(a.startTime));
    return filtered;
  }

  @override
  Future<List<ChargeSession>> getChargeHistoryLocal(String vin) async => _chargeBox.values.toList();

  @override
  Future<void> configureFleetTelemetry(String vin, String hostname) async {
    final config = {
      'hostname': hostname,
      'port': 443,
      'fields': {
        'Soc': {'interval_seconds': 10},
        'Location': {'interval_seconds': 10},
        'Gear': {'interval_seconds': 5},
        'Locked': {'interval_seconds': 1},
      },
      'delivery_policy': 'latest',
    };
    await _callCommand(vin, 'fleet/telemetry_config', {'vin': vin, 'config': config});
  }

  @override
  Future<Map<String, dynamic>> getFleetTelemetryConfig(String vin) async {
    final res = await _getGenericData('/api/fleet/telemetry_config/$vin');
    return res.first;
  }

  @override
  Future<void> deleteFleetTelemetryConfig(String vin) async {
    // Note: This requires a DELETE call which getTeslaData might not support yet,
    // but we can update the Cloud Function if needed.
    await _functions.httpsCallable('getTeslaData').call({'path': '/api/fleet/telemetry_config/$vin', 'method': 'DELETE'});
  }

  @override
  Future<Map<String, dynamic>> getFleetTelemetryErrors(String vin) async {
    final res = await _getGenericData('/api/fleet/telemetry_errors/$vin');
    return res.first;
  }

  @override
  Future<Map<String, dynamic>> getFleetStatus(List<String> vins) async {
    final res = await _getGenericData('/api/fleet/status', params: {'vins': vins});
    return res.first;
  }

  @override
  Future<void> windowControl(String vehicleId, String command) async =>
      _callCommand(vehicleId, 'window_control', {'command': command});

  @override
  Future<void> mediaCommand(String vehicleId, String command) async =>
      _callCommand(vehicleId, 'media_command', {'command': command});

  @override
  Future<void> remoteBoombox(String vehicleId, int soundId) async =>
      _callCommand(vehicleId, 'remote_boombox', {'sound_id': soundId});

  @override
  Future<void> setBioweaponMode(String vehicleId, bool on) async =>
      _callCommand(vehicleId, 'set_bioweapon_mode', {'on': on});

  @override
  Future<void> setCabinOverheatProtection(String vehicleId, {required bool on, bool fanOnly = false}) async =>
      _callCommand(vehicleId, 'set_cabin_overheat_protection', {'on': on, 'fan_only': fanOnly});

  @override
  Future<void> setPreconditioningMax(String vehicleId, bool on) async =>
      _callCommand(vehicleId, 'set_preconditioning_max', {'on': on});

  @override
  Future<void> remoteStartDrive(String vehicleId) async =>
      _callCommand(vehicleId, 'remote_start_drive', {});

  @override
  Future<void> chargeMaxRange(String vehicleId) async =>
      _callCommand(vehicleId, 'charge_max_range', {});

  @override
  Future<void> chargeStandard(String vehicleId) async =>
      _callCommand(vehicleId, 'charge_standard', {});

  @override
  Future<void> addChargeSchedule(String vehicleId, {required String daysOfWeek, required bool enabled, required bool startEnabled, required bool endEnabled, required double lat, required double lon, int? startTime, int? endTime, int? id, bool oneTime = false}) async =>
      _callCommand(vehicleId, 'add_charge_schedule', {
        'days_of_week': daysOfWeek, 'enabled': enabled, 'start_enabled': startEnabled, 'end_enabled': endEnabled,
        'lat': lat, 'lon': lon, 'start_time':? startTime, 'end_time':? endTime,
        'id':? id, 'one_time': oneTime
      });

  @override
  Future<void> removeChargeSchedule(String vehicleId, int id) async =>
      _callCommand(vehicleId, 'remove_charge_schedule', {'id': id});

  @override
  Future<void> addPreconditionSchedule(String vehicleId, {required String daysOfWeek, required bool enabled, required double lat, required double lon, required int preconditionTime, int? id, bool oneTime = false}) async =>
      _callCommand(vehicleId, 'add_precondition_schedule', {
        'days_of_week': daysOfWeek, 'enabled': enabled, 'lat': lat, 'lon': lon,
        'precondition_time': preconditionTime, 'id':? id, 'one_time': oneTime
      });

  @override
  Future<void> removePreconditionSchedule(String vehicleId, int id) async =>
      _callCommand(vehicleId, 'remove_precondition_schedule', {'id': id});

  @override
  Future<void> setSeatCooler(String vehicleId, int seatPosition, int level) async =>
      _callCommand(vehicleId, 'remote_seat_cooler_request', {'seat_position': seatPosition, 'level': level});

  @override
  Future<void> setCopTemp(String vehicleId, int copTemp) async =>
      _callCommand(vehicleId, 'set_cop_temp', {'cop_temp': copTemp});

  @override
  Future<void> setSteeringWheelHeatLevel(String vehicleId, int level) async =>
      _callCommand(vehicleId, 'remote_steering_wheel_heat_level_request', {'level': level});

  @override
  Future<void> adjustVolume(String vehicleId, double volume) async =>
      _callCommand(vehicleId, 'adjust_volume', {'volume': volume});

  @override
  Future<void> sunRoofControl(String vehicleId, String state) async =>
      _callCommand(vehicleId, 'sun_roof_control', {'state': state});

  @override
  Future<void> scheduleSoftwareUpdate(String vehicleId, int offsetSec) async =>
      _callCommand(vehicleId, 'schedule_software_update', {'offset_sec': offsetSec});

  @override
  Future<void> cancelSoftwareUpdate(String vehicleId) async =>
      _callCommand(vehicleId, 'cancel_software_update', {});

  @override
  Future<void> navigationGpsRequest(String vehicleId, double lat, double lon) async =>
      _callCommand(vehicleId, 'navigation_gps_request', {'lat': lat, 'lon': lon});

  @override
  Future<void> navigationScRequest(String vehicleId, String superchargerId) async =>
      _callCommand(vehicleId, 'navigation_sc_request', {'id': superchargerId});

  // --- Vehicle Info (free endpoints) ---

  @override
  Future<List<Map<String, dynamic>>> getRecentAlerts(String vin) async =>
      _getGenericData('/api/1/vehicles/$vin/recent_alerts');

  @override
  Future<Map<String, dynamic>?> getReleaseNotesData(String vin, {bool staged = false}) async {
    final res = await _getGenericData('/api/1/vehicles/$vin/release_notes', params: {'staged': staged});
    return res.isNotEmpty ? res.first : null;
  }

  @override
  Future<Map<String, dynamic>?> getServiceData(String vin) async {
    final res = await _getGenericData('/api/1/vehicles/$vin/service_data');
    return res.isNotEmpty ? res.first : null;
  }

  @override
  Future<bool> getMobileEnabled(String vin) async {
    final res = await _getGenericData('/api/1/vehicles/$vin/mobile_enabled');
    return res.first['response'] ?? false;
  }

  @override
  Future<List<Map<String, dynamic>>> getDrivers(String vin) async =>
      _getGenericData('/api/1/vehicles/$vin/drivers');

  @override
  Future<List<Map<String, dynamic>>> getUserOrders() async =>
      _getGenericData('/api/1/users/orders');

  @override
  Future<List<Map<String, dynamic>>> getEligibleUpgrades(String vin) async =>
      _getGenericData('/api/1/vehicles/$vin/eligible_upgrades');

  @override
  Future<List<Map<String, dynamic>>> getShareInvites(String vin) async =>
      _getGenericData('/api/1/vehicles/$vin/invites');

  @override
  Future<Map<String, dynamic>> createShareInvite(String vin) async {
    final res = await _getGenericData('/api/1/vehicles/$vin/invites', params: {'method': 'POST'});
    return res.first;
  }

  @override
  Future<void> revokeShareInvite(String vin, String inviteId) async {
    await _functions.httpsCallable('getTeslaData').call({
      'path': '/api/1/vehicles/$vin/invites/$inviteId',
      'method': 'DELETE',
    });
  }

  // --- Helpers ---

  Future<void> _callCommand(String vehicleId, String command, Map<String, dynamic> data) async {
    try {
      await _functions.httpsCallable('sendTeslaCommand').call({
        'vehicle_id': vehicleId,
        'command': command,
        'data': data,
      });
    } catch (e) {
      debugPrint('VehicleRepository: Command $command failed: $e');
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> _getGenericData(String path, {Map<String, dynamic>? params}) async {
    try {
      final result = await _functions.httpsCallable('getTeslaData').call({
        'path': path,
        'params':? params,
      });
      final data = result.data as Map;
      final response = data['response'];
      if (response is List) return response.map((e) => Map<String, dynamic>.from(e as Map)).toList();
      if (response is Map) return [Map<String, dynamic>.from(response)];
      return [];
    } catch (e) {
      debugPrint('VehicleRepository: _getGenericData failed ($path): $e');
      rethrow;
    }
  }

  double _dynamicToDouble(dynamic val) => (val as num?)?.toDouble() ?? 0.0;
  int _dynamicToInt(dynamic val) => (val as num?)?.toInt() ?? 0;

  Vehicle _mapBasicTeslaVehicleToDomain(TeslaVehicle tesla) {
    return Vehicle(
      id: tesla.id,
      vehicleId: tesla.vehicleId.toString(),
      vin: tesla.vin,
      displayName: tesla.displayName,
      optionCodes: tesla.optionCodes,
      color: tesla.color,
      state: tesla.state,
      batteryLevel: 0,
      batteryRange: 0,
      idealBatteryRange: 0,
      outsideTemp: 0,
      insideTemp: 0.0,
      odometer: 0,
      isLocked: true, 
      isClimateOn: false,
      isSentryModeOn: false,
      isValetModeOn: false,
      batteryHeaterOn: false,
      chargeLimitSoc: 80,
      shiftState: 'P',
      frontTrunkState: 0,
      rearTrunkState: 0,
    );
  }

  Vehicle _mapTeslaVehicleDataToDomain(TeslaVehicle tesla, TeslaVehicleData data) {
    return Vehicle(
      id: tesla.id,
      vehicleId: tesla.vehicleId.toString(),
      vin: tesla.vin,
      displayName: tesla.displayName,
      optionCodes: tesla.optionCodes,
      color: tesla.color,
      state: tesla.state,
      batteryLevel: data.chargeState?.batteryLevel ?? 0,
      batteryRange: data.chargeState?.batteryRange ?? 0.0,
      idealBatteryRange: data.chargeState?.idealBatteryRange ?? 0.0,
      estBatteryRange: data.chargeState?.estBatteryRange ?? 0.0,
      chargeLimitSoc: data.chargeState?.chargeLimitSoc ?? 80,
      chargingState: data.chargeState?.chargingState ?? 'Disconnected',
      chargeRate: data.chargeState?.chargeRate ?? 0.0,
      chargeEnergyAdded: data.chargeState?.chargeEnergyAdded ?? 0.0,
      timeToFullCharge: data.chargeState?.timeToFullCharge ?? 0.0,
      chargerPower: data.chargeState?.chargerPower?.toDouble() ?? 0.0,
      chargerVoltage: data.chargeState?.chargerVoltage?.toDouble() ?? 0.0,
      chargerPhases: data.chargeState?.chargerPhases ?? 0,
      fastChargerType: data.chargeState?.fastChargerType,
      connChargeCable: data.chargeState?.connChargeType,
      batteryHeaterOn: data.chargeState?.batteryHeaterOn ?? false,
      outsideTemp: data.climateState?.outsideTemp ?? 0.0,
      insideTemp: data.climateState?.insideTemp ?? 0.0,
      isClimateOn: data.climateState?.isClimateOn ?? false,
      driverTemp: data.climateState?.driverTempSetting,
      passengerTemp: data.climateState?.passengerTempSetting,
      fanStatus: data.climateState?.fanStatus ?? 0,
      seatHeaterLeft: data.climateState?.seatHeaterLeft ?? 0,
      seatHeaterRight: data.climateState?.seatHeaterRight ?? 0,
      steeringWheelHeater: data.climateState?.steeringWheelHeater ?? false,
      frontDefrosterOn: data.climateState?.frontDefrosterOn ?? false,
      seatHeaterRearLeft: data.climateState?.seatHeaterRearLeft ?? 0,
      seatHeaterRearRight: data.climateState?.seatHeaterRearRight ?? 0,
      seatHeaterRearCenter: data.climateState?.seatHeaterRearCenter ?? 0,
      steeringWheelHeatLevel: data.climateState?.steeringWheelHeatLevel ?? 0,
      climateKeeperMode: data.climateState?.climateKeeperMode ?? 'off',
      odometer: data.vehicleState?.odometer ?? 0.0,
      isLocked: data.vehicleState?.locked ?? true,
      isSentryModeOn: data.vehicleState?.sentryMode ?? false,
      isValetModeOn: data.vehicleState?.valetMode ?? false,
      frontTrunkState: data.vehicleState?.ft ?? 0,
      rearTrunkState: data.vehicleState?.rt ?? 0,
      softwareVersion: data.vehicleState?.carVersion ?? '',
      softwareUpdateStatus: data.vehicleState?.softwareUpdate?.status,
      softwareUpdateVersion: data.vehicleState?.softwareUpdate?.version,
      softwareUpdateProgress: data.vehicleState?.softwareUpdate?.installPerc ?? 0,
      tpmsPressureFl: data.vehicleState?.tpmsPressureFl,
      tpmsPressureFr: data.vehicleState?.tpmsPressureFr,
      tpmsPressureRl: data.vehicleState?.tpmsPressureRl,
      tpmsPressureRr: data.vehicleState?.tpmsPressureRr,
      chargePortOpen: data.chargeState?.chargePortDoorOpen ?? false,
      chargeCurrentRequest: data.chargeState?.chargeCurrentRequest ?? 0,
      usableBatteryLevel: data.chargeState?.usableBatteryLevel ?? (data.chargeState?.batteryLevel ?? 0),
      chargeCurrentRequestMax: data.chargeState?.chargeCurrentRequestMax ?? 48,
      scheduledChargingPending: data.chargeState?.scheduledChargingPending ?? false,
      fastChargerPresent: data.chargeState?.fastChargerPresent ?? false,
      scheduledChargingMode: data.chargeState?.scheduledChargingMode,
      scheduledChargingStartTime: data.chargeState?.scheduledChargingStartTime,
      shiftState: data.driveState?.shiftState ?? 'P',
      speed: data.driveState?.speed ?? 0.0,
      power: data.driveState?.power.toDouble() ?? 0.0,
      latitude: data.driveState?.latitude ?? 0.0,
      longitude: data.driveState?.longitude ?? 0.0,
      heading: data.driveState?.heading ?? 0,
      useFahrenheit: data.guiSettings?.temperatureUnits == 'F',
      useMiles: data.guiSettings?.distanceUnits != 'km/hr',
      pressureUnit: data.guiSettings?.pressureUnits ?? 'Psi',
    );
  }
}

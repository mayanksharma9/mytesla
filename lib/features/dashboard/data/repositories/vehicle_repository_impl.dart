import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../domain/vehicle.dart';
import '../../domain/vehicle_repository.dart';
import 'package:voltride/features/dashboard/domain/tesla_product.dart' as domain;
import 'package:voltride/core/network/tesla_api_client.dart';
import '../models/tesla_models.dart';
import 'package:hive/hive.dart';
import 'package:voltride/features/telemetry/data/services/trip_detection_service.dart';

class VehicleRepositoryImpl implements VehicleRepository {
  final TeslaApiClient _apiClient;
  
  // Hive Boxes
  final Box<BatterySnapshot> _batteryBox;
  final Box<DriveSession> _tripBox;
  final Box<ChargeSession> _chargeBox;
  final Box<VehicleCache> _vehicleCacheBox;
  final TripDetectionService _tripDetectionService;

  VehicleRepositoryImpl(
    this._apiClient, 
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
      final response = await _apiClient.getVehicles();
      return response.response.map(_mapBasicTeslaVehicleToDomain).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Vehicle> getVehicleData(String vehicleId, [int retryCount = 0]) async {
    try {
      final dataResponse = await _apiClient.getVehicleData(vehicleId);
      final vehiclesResponse = await _apiClient.getVehicles();

      final teslaVehicle = vehiclesResponse.response.firstWhere((v) => v.id == vehicleId);
      final vehicle = _mapTeslaVehicleDataToDomain(teslaVehicle, dataResponse.response);

      // Use VIN from data response if available, otherwise from vehicles list
      final vin = dataResponse.response.vin ?? teslaVehicle.vin;

      // Trigger Trip Detection processing
      await _tripDetectionService.processSnapshot(vin, dataResponse.response);

      // Save BatterySnapshot locally for history/analytics
      _saveBatterySnapshot(vehicle);

      // Cache full vehicle state for cold-start
      _cacheVehicleData(vehicle);

      return vehicle;
    } on DioException catch (e) {
      // 408 = vehicle is asleep; send wake and retry (max 3 attempts × 10s = ~30s)
      if (e.response?.statusCode == 408 && retryCount < 3) {
        debugPrint('VehicleRepository: Vehicle $vehicleId asleep (attempt ${retryCount + 1}/3). Waking...');
        await _apiClient.wakeUp(vehicleId);
        await Future.delayed(const Duration(seconds: 10));
        return getVehicleData(vehicleId, retryCount + 1);
      }
      rethrow;
    }
  }

  @override
  Future<void> wakeUp(String vehicleId) async {
    await _apiClient.wakeUp(vehicleId);
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
      _executeWithWakeUp(vehicleId, () => _apiClient.doorLock(vehicleId));

  @override
  Future<void> unlock(String vehicleId) async => 
      _executeWithWakeUp(vehicleId, () => _apiClient.doorUnlock(vehicleId));

  @override
  Future<void> actuateTrunk(String vehicleId, String whichTrunk) async => 
      _executeWithWakeUp(vehicleId, () => _apiClient.actuateTrunk(vehicleId, whichTrunk));

  @override
  Future<void> setTemperature(String vehicleId, double temp) async => 
      _executeWithWakeUp(vehicleId, () => _apiClient.setTemperature(vehicleId, temp, temp));

  @override
  Future<void> setClimateOn(String vehicleId, bool on) async => 
      _executeWithWakeUp(vehicleId, on 
          ? () => _apiClient.autoConditioningStart(vehicleId) 
          : () => _apiClient.autoConditioningStop(vehicleId));

  @override
  Future<void> setSeatHeater(String vehicleId, int heater, int level) async =>
      _executeWithWakeUp(vehicleId, () => _apiClient.remoteSeatHeaterRequest(vehicleId, heater, level));

  @override
  Future<void> setClimateKeeperMode(String vehicleId, String mode) async =>
      _executeWithWakeUp(vehicleId, () => _apiClient.setClimateKeeperMode(vehicleId, mode));

  @override
  Future<void> setChargeLimit(String vehicleId, int limit) async => 
      _executeWithWakeUp(vehicleId, () => _apiClient.setChargeLimit(vehicleId, limit));

  @override
  Future<void> startCharging(String vehicleId) async => 
      _executeWithWakeUp(vehicleId, () => _apiClient.chargeStart(vehicleId));

  @override
  Future<void> stopCharging(String vehicleId) async => 
      _executeWithWakeUp(vehicleId, () => _apiClient.chargeStop(vehicleId));

  @override
  Future<void> setChargingAmps(String vehicleId, int amps) async =>
      _executeWithWakeUp(vehicleId, () => _apiClient.setChargingAmps(vehicleId, amps));

  @override
  Future<void> openChargePort(String vehicleId) async =>
      _executeWithWakeUp(vehicleId, () => _apiClient.chargePortDoorOpen(vehicleId));

  @override
  Future<void> closeChargePort(String vehicleId) async =>
      _executeWithWakeUp(vehicleId, () => _apiClient.chargePortDoorClose(vehicleId));

  @override
  Future<void> setScheduledCharging(String vehicleId, bool enable, {int? startTime}) async =>
      _executeWithWakeUp(vehicleId, () => _apiClient.setScheduledCharging(vehicleId, enable, startTime: startTime));

  @override
  Future<void> flashLights(String vehicleId) async => 
      _executeWithWakeUp(vehicleId, () => _apiClient.flashLights(vehicleId));

  @override
  Future<void> honkHorn(String vehicleId) async => 
      _executeWithWakeUp(vehicleId, () => _apiClient.honkHorn(vehicleId));

  @override
  Future<void> setSentryMode(String vehicleId, bool on) async => 
      _executeWithWakeUp(vehicleId, () => _apiClient.setSentryMode(vehicleId, on));

  @override
  Future<void> setValetMode(String vehicleId, bool on, {String? password}) async => 
      _executeWithWakeUp(vehicleId, () => _apiClient.setValetMode(vehicleId, on, password: password));

  @override
  Future<List<domain.TeslaProduct>> getProducts() async {
    try {
      final products = await _apiClient.getProducts();
      return products.map((p) {
        domain.ProductType type = domain.ProductType.unknown;
        if (p.resourceType == 'battery') type = domain.ProductType.powerwall;
        if (p.resourceType == 'solar') type = domain.ProductType.solar;
        if (p.vin != null) type = domain.ProductType.vehicle;

        return domain.TeslaProduct(
          id: p.id ?? p.energySiteId ?? '',
          energySiteId: p.energySiteId,
          siteName: p.siteName,
          type: type,
          vin: p.vin,
        );
      }).toList();
    } catch (e) {
      rethrow;
    }
  }

  // --- Features 1-11 Data Implementation ---

  @override
  Future<VehicleCache> getVehicleSpecs(String vin) async {
    // 1. Check Cache
    if (_vehicleCacheBox.containsKey(vin)) {
      return _vehicleCacheBox.get(vin)!;
    }

    try {
      // 2. Fetch from Fleet API
      final response = await _apiClient.getVehicleSpecs(vin);
      final data = response.data['response'];
      
      final specs = VehicleCache(
        vin: vin,
        batteryCapacityKwh: _dynamicToDouble(data['battery_capacity_kwh']),
        originalRangeRating: _dynamicToDouble(data['original_range_rating']),
        batteryType: data['battery_type'],
        motorCount: _dynamicToInt(data['motor_count']),
      );

      // 3. Persist Forever (It's a $0.10 call!)
      await _vehicleCacheBox.put(vin, specs);
      return specs;
    } catch (e) {
      debugPrint('VehicleRepository: Failed to fetch specs: $e');
      rethrow;
    }
  }

  @override
  Future<void> syncWarranty(String vin) async {
    try {
      final response = await _apiClient.getWarrantyDetails(vin);
      final data = response.data['response'];
      
      final oldCache = _vehicleCacheBox.get(vin);
      final newCache = VehicleCache(
        vin: vin,
        batteryCapacityKwh: oldCache?.batteryCapacityKwh,
        originalRangeRating: oldCache?.originalRangeRating,
        warrantyExpiryDate: data['warranty_expiry_date'] != null ? DateTime.parse(data['warranty_expiry_date']) : null,
        warrantyMilesRemaining: _dynamicToDouble(data['miles_remaining']),
        batteryType: oldCache?.batteryType,
        motorCount: oldCache?.motorCount,
        options: oldCache?.options,
      );
      
      await _vehicleCacheBox.put(vin, newCache);
    } catch (e) {
      debugPrint('VehicleRepository: Failed to sync warranty: $e');
    }
  }

  @override
  Future<List<ChargingLocation>> getNearbyChargingSites(String vehicleId) async {
    try {
      final response = await _apiClient.getNearbyChargingSites(vehicleId);
      final List<dynamic> data = response.data['response']['superchargers'] ?? [];
      return data.map((json) => ChargingLocation.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String?> getReleaseNotes(String vehicleId) async {
    try {
      final response = await _apiClient.getReleaseNotes(vehicleId);
      return response.data['response']?['notes'];
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<BatterySnapshot>> getBatteryHistory(String vin) async {
    final all = _batteryBox.values.toList();
    // Filter by VIN for newer snapshots; fall back to all for legacy entries (null vin).
    final filtered = all.where((s) => s.vin == null || s.vin == vin).toList();
    filtered.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    return filtered;
  }

  @override
  Future<List<DriveSession>> getTripHistory(String vin) async {
    // Filter by VIN when present; fall back to all sessions for legacy entries.
    final all = _tripBox.values.toList();
    final filtered = all.where((s) => s.vin == null || s.vin == vin).toList();
    filtered.sort((a, b) => b.startTime.compareTo(a.startTime));
    return filtered;
  }

  @override
  Future<List<ChargeSession>> getChargeHistoryLocal(String vin) async {
    return _chargeBox.values.toList();
  }

  @override
  Future<void> configureFleetTelemetry(String vin, String hostname) async {
    // Field names must match Tesla's vehicle_data.proto exactly.
    // "Location" streams lat/lng together. "DetailedChargeState" replaces
    // the legacy "ChargingState" string. "Gear" is "Gear", not "ShiftState".
    // Intervals follow the Tesla pricing example for common fields.
    final config = {
      'hostname': hostname,
      'port': 443,
      'fields': {
        // Battery & charging
        'Soc': {'interval_seconds': 10},                    // state of charge (%)
        'EstBatteryRange': {'interval_seconds': 60},
        'DetailedChargeState': {'interval_seconds': 5},     // replaces legacy ChargingState
        'ChargeAmps': {'interval_seconds': 5},
        'ChargerVoltage': {'interval_seconds': 5},
        'TimeToFullCharge': {'interval_seconds': 30},
        'ACChargingEnergyIn': {'interval_seconds': 30},
        'DCChargingEnergyIn': {'interval_seconds': 30},
        // Drive & location
        'VehicleSpeed': {'interval_seconds': 5},
        'Location': {'interval_seconds': 10},               // lat/lng combined field
        'Gear': {'interval_seconds': 5},
        'Odometer': {'interval_seconds': 60},
        // Status
        'Locked': {'interval_seconds': 1},
        'DoorState': {'interval_seconds': 1},
        'VehicleName': {'interval_seconds': 60},
        // Climate
        'InsideTemp': {'interval_seconds': 30},
        'OutsideTemp': {'interval_seconds': 60},
        // TPMS
        'TpmsPressureFl': {'interval_seconds': 120},
        'TpmsPressureFr': {'interval_seconds': 120},
        'TpmsPressureRl': {'interval_seconds': 120},
        'TpmsPressureRr': {'interval_seconds': 120},
      },
      'delivery_policy': 'latest',
    };
    try {
      // configureFleetTelemetry now routes through the TVCP proxy for JWS signing.
      // It uses VIN (not vehicleId integer) as required by the API.
      await _apiClient.configureFleetTelemetry(vin, config);
      debugPrint('VehicleRepository: Fleet Telemetry configured → $hostname');
    } catch (e) {
      debugPrint('VehicleRepository: configureFleetTelemetry failed: $e');
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getFleetTelemetryConfig(String vin) async {
    try {
      return await _apiClient.getFleetTelemetryConfig(vin);
    } catch (e) {
      debugPrint('VehicleRepository: getFleetTelemetryConfig failed: $e');
      rethrow;
    }
  }

  @override
  Future<void> deleteFleetTelemetryConfig(String vin) async {
    try {
      await _apiClient.deleteFleetTelemetryConfig(vin);
      debugPrint('VehicleRepository: Fleet Telemetry config deleted for VIN $vin');
    } catch (e) {
      debugPrint('VehicleRepository: deleteFleetTelemetryConfig failed: $e');
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getFleetTelemetryErrors(String vin) async {
    try {
      return await _apiClient.getFleetTelemetryErrors(vin);
    } catch (e) {
      debugPrint('VehicleRepository: getFleetTelemetryErrors failed: $e');
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getFleetStatus(List<String> vins) async {
    try {
      return await _apiClient.getFleetStatus(vins);
    } catch (e) {
      debugPrint('VehicleRepository: getFleetStatus failed: $e');
      rethrow;
    }
  }

  /// Helper to ensure vehicle is awake before sending a command.
  Future<T> _executeWithWakeUp<T>(String vehicleId, Future<T> Function() action) async {
    try {
      return await action();
    } on DioException catch (e) {
      // 408 means vehicle is asleep or command timed out
      if (e.response?.statusCode == 408 || e.response?.statusCode == 405) {
        debugPrint('VehicleRepository: Vehicle $vehicleId is asleep. Waking up...');
        await _apiClient.wakeUp(vehicleId);
        
        // Poll for 'online' status (max 60 seconds)
        for (int i = 0; i < 12; i++) {
          await Future.delayed(const Duration(seconds: 5));
          final vehicles = await _apiClient.getVehicles();
          final v = vehicles.response.firstWhere((v) => v.id == vehicleId);
          
          if (v.state == 'online') {
            debugPrint('VehicleRepository: Vehicle $vehicleId is now online. Retrying command...');
            return await action();
          }
          debugPrint('VehicleRepository: Still waiting for $vehicleId to wake up (attempt ${i + 1})...');
        }
        throw Exception('Vehicle failed to wake up in time.');
      }
      
      // 429 means Rate Limit - wait a bit and retry once
      if (e.response?.statusCode == 429) {
        debugPrint('VehicleRepository: Rate limited (429). Retrying in 2 seconds...');
        await Future.delayed(const Duration(seconds: 2));
        return await action();
      }
      
      rethrow;
    }
  }

  Vehicle _mapBasicTeslaVehicleToDomain(TeslaVehicle tesla) {
    try {
      debugPrint('Mapping basic vehicle: ${tesla.id}');
      
      // Try to load cached vehicle data first for better cold-start experience
      final cached = loadCachedVehicleData(tesla.vin);
      if (cached != null) {
        // Return cached data with updated state from the vehicle list
        return cached.copyWith(
          id: tesla.id,
          vehicleId: tesla.vehicleId.toString(),
          state: tesla.state,
          displayName: tesla.displayName,
        );
      }

      // Fallback to last battery snapshot
      final lastSnapshot = _batteryBox.values.lastWhere(
        (s) => true,
        orElse: () => BatterySnapshot(
          timestamp: DateTime.now(),
          batteryLevel: 0,
          batteryRange: 0,
          idealBatteryRange: 0,
          outsideTemp: 0,
          batteryHeaterOn: false,
          chargeLimitSoc: 80,
          shiftState: 'P',
          odometer: 0,
        ),
      );

      return Vehicle(
        id: tesla.id,
        vehicleId: tesla.vehicleId.toString(),
        vin: tesla.vin,
        displayName: tesla.displayName,
        optionCodes: tesla.optionCodes,
        color: tesla.color,
        state: tesla.state,
        batteryLevel: lastSnapshot.batteryLevel,
        batteryRange: lastSnapshot.batteryRange,
        idealBatteryRange: lastSnapshot.idealBatteryRange,
        outsideTemp: lastSnapshot.outsideTemp,
        insideTemp: 0.0,
        odometer: lastSnapshot.odometer,
        isLocked: true, 
        isClimateOn: false,
        isSentryModeOn: false,
        isValetModeOn: false,
        batteryHeaterOn: lastSnapshot.batteryHeaterOn,
        chargeLimitSoc: lastSnapshot.chargeLimitSoc,
        shiftState: lastSnapshot.shiftState,
        frontTrunkState: 0,
        rearTrunkState: 0,
      );
    } catch (e) {
      debugPrint('Error mapping basic vehicle: $e');
      rethrow;
    }
  }

  Vehicle _mapTeslaVehicleDataToDomain(TeslaVehicle tesla, TeslaVehicleData data) {
    try {
      debugPrint('Mapping detailed vehicle: ${tesla.id}');
      return Vehicle(
        id: tesla.id,
        vehicleId: tesla.vehicleId.toString(),
        vin: tesla.vin,
        displayName: tesla.displayName,
        optionCodes: tesla.optionCodes,
        color: tesla.color,
        state: tesla.state,
        // Charge State
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
        // Climate State
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
        climateKeeperMode: data.climateState?.climateKeeperMode ?? 'off',
        // Vehicle State
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
        // Charging Extended
        chargePortOpen: data.chargeState?.chargePortDoorOpen ?? false,
        chargeCurrentRequest: data.chargeState?.chargeCurrentRequest ?? 0,
        scheduledChargingMode: data.chargeState?.scheduledChargingMode,
        scheduledChargingStartTime: data.chargeState?.scheduledChargingStartTime,
        // Drive State
        shiftState: data.driveState?.shiftState ?? 'P',
        speed: data.driveState?.speed ?? 0.0,
        power: data.driveState?.power.toDouble() ?? 0.0,
        latitude: data.driveState?.latitude ?? 0.0,
        longitude: data.driveState?.longitude ?? 0.0,
        heading: data.driveState?.heading ?? 0,
        // GUI Settings / Units
        useFahrenheit: data.guiSettings?.temperatureUnits == 'F',
        useMiles: data.guiSettings?.distanceUnits != 'km/hr',
        pressureUnit: data.guiSettings?.pressureUnits ?? 'Psi',
      );
    } catch (e) {
      debugPrint('Error mapping detailed vehicle: $e');
      rethrow;
    }
  }

  @override
  Future<void> windowControl(String vehicleId, String command) async =>
      _executeWithWakeUp(vehicleId, () => _apiClient.windowControl(vehicleId, command));

  @override
  Future<void> mediaCommand(String vehicleId, String command) async =>
      _executeWithWakeUp(vehicleId, () => _apiClient.mediaCommand(vehicleId, command));

  @override
  Future<void> remoteBoombox(String vehicleId, int soundId) async =>
      _executeWithWakeUp(vehicleId, () => _apiClient.remoteBoombox(vehicleId, soundId));

  @override
  Future<void> setBioweaponMode(String vehicleId, bool on) async =>
      _executeWithWakeUp(vehicleId, () => _apiClient.setBioweaponMode(vehicleId, on));

  @override
  Future<void> setCabinOverheatProtection(String vehicleId, {required bool on, bool fanOnly = false}) async =>
      _executeWithWakeUp(vehicleId, () => _apiClient.setCabinOverheatProtection(vehicleId, on: on, fanOnly: fanOnly));

  @override
  Future<void> setPreconditioningMax(String vehicleId, bool on) async =>
      _executeWithWakeUp(vehicleId, () => _apiClient.setPreconditioningMax(vehicleId, on));

  @override
  Future<void> remoteStartDrive(String vehicleId) async =>
      _executeWithWakeUp(vehicleId, () => _apiClient.remoteStartDrive(vehicleId));

  double _dynamicToDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }

  int _dynamicToInt(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) return int.tryParse(value) ?? 0;
    return 0;
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import '../../domain/vehicle.dart';
import '../../domain/vehicle_repository.dart';
import 'package:voltride/features/dashboard/domain/tesla_product.dart' as domain;
import 'package:voltride/core/network/tesla_api_client.dart';
import '../models/tesla_models.dart';
import 'package:hive/hive.dart';
import 'package:voltride/features/telemetry/data/services/trip_detection_service.dart';

class VehicleRepositoryImpl implements VehicleRepository {
  final TeslaApiClient _apiClient;
  final FirebaseFirestore _firestore;
  
  // Hive Boxes
  final Box<BatterySnapshot> _batteryBox;
  final Box<DriveSession> _tripBox;
  final Box<ChargeSession> _chargeBox;
  final Box<VehicleCache> _vehicleCacheBox;
  final TripDetectionService _tripDetectionService;

  VehicleRepositoryImpl(
    this._apiClient, 
    this._firestore,
    this._batteryBox,
    this._tripBox,
    this._chargeBox,
    this._vehicleCacheBox,
    this._tripDetectionService,
  );

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
  Future<Vehicle> getVehicleData(String vehicleId) async {
    try {
      final dataResponse = await _apiClient.getVehicleData(vehicleId);
      final vehiclesResponse = await _apiClient.getVehicles();
      
      final teslaVehicle = vehiclesResponse.response.firstWhere((v) => v.id == vehicleId);
      final vehicle = _mapTeslaVehicleDataToDomain(teslaVehicle, dataResponse.response);

      // Trigger Trip Detection processing
      await _tripDetectionService.processSnapshot(teslaVehicle.vin, dataResponse.response);

      // Sync to Firestore for persistence and analytics
      _syncToFirestore(vehicle);

      return vehicle;
    } on DioException catch (e) {
      if (e.response?.statusCode == 408) {
        await _apiClient.wakeUp(vehicleId);
        await Future.delayed(const Duration(seconds: 5));
        return getVehicleData(vehicleId);
      }
      rethrow;
    }
  }

  @override
  Future<void> wakeUp(String vehicleId) async {
    await _apiClient.wakeUp(vehicleId);
  }

  Future<void> _syncToFirestore(Vehicle vehicle) async {
    try {
      final vin = vehicle.vin;
      // 1. Update Latest State
      await _firestore.collection('vehicles').doc(vin).set({
        ...vehicle.toJson(),
        'last_sync': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

      // 2. Save local BatterySnapshot for local-first analytics
      final snapshot = BatterySnapshot(
        timestamp: DateTime.now(),
        batteryLevel: vehicle.batteryLevel,
        batteryRange: vehicle.batteryRange,
        idealBatteryRange: vehicle.idealBatteryRange ?? 0.0,
        outsideTemp: vehicle.outsideTemp,
        batteryHeaterOn: vehicle.batteryHeaterOn,
        chargeLimitSoc: vehicle.chargeLimitSoc,
        shiftState: vehicle.shiftState ?? 'P',
        odometer: vehicle.odometer,
      );
      await _batteryBox.add(snapshot);

      // 3. Add Telemetry Snapshot to Firestore for cloud sync
      await _firestore.collection('vehicles').doc(vin).collection('telemetry_history').add({
        'timestamp': FieldValue.serverTimestamp(),
        'battery_level': vehicle.batteryLevel,
        'battery_range': vehicle.batteryRange,
        'odometer': vehicle.odometer,
        'outside_temp': vehicle.outsideTemp,
        'inside_temp': vehicle.insideTemp,
        'shift_state': vehicle.shiftState,
        'is_locked': vehicle.isLocked,
        'is_climate_on': vehicle.isClimateOn,
      });

      print('VehicleRepository: Synced $vin to Firestore');
    } catch (e) {
      print('VehicleRepository: Firestore sync failed: $e');
    }
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
      print('VehicleRepository: Failed to fetch specs: $e');
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
      print('VehicleRepository: Failed to sync warranty: $e');
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
    return _batteryBox.values.where((s) => true).toList(); // Filtering by VIN logic here if multi-vehicle
  }

  @override
  Future<List<DriveSession>> getTripHistory(String vin) async {
    return _tripBox.values.toList();
  }

  @override
  Future<List<ChargeSession>> getChargeHistoryLocal(String vin) async {
    return _chargeBox.values.toList();
  }

  /// Helper to ensure vehicle is awake before sending a command.
  Future<T> _executeWithWakeUp<T>(String vehicleId, Future<T> Function() action) async {
    try {
      return await action();
    } on DioException catch (e) {
      // 408 means vehicle is asleep or command timed out
      if (e.response?.statusCode == 408 || e.response?.statusCode == 405) {
        print('VehicleRepository: Vehicle $vehicleId is asleep. Waking up...');
        await _apiClient.wakeUp(vehicleId);
        
        // Poll for 'online' status (max 60 seconds)
        for (int i = 0; i < 12; i++) {
          await Future.delayed(const Duration(seconds: 5));
          final vehicles = await _apiClient.getVehicles();
          final v = vehicles.response.firstWhere((v) => v.id == vehicleId);
          
          if (v.state == 'online') {
            print('VehicleRepository: Vehicle $vehicleId is now online. Retrying command...');
            return await action();
          }
          print('VehicleRepository: Still waiting for $vehicleId to wake up (attempt ${i + 1})...');
        }
        throw Exception('Vehicle failed to wake up in time.');
      }
      
      // 429 means Rate Limit - wait a bit and retry once
      if (e.response?.statusCode == 429) {
        print('VehicleRepository: Rate limited (429). Retrying in 2 seconds...');
        await Future.delayed(const Duration(seconds: 2));
        return await action();
      }
      
      rethrow;
    }
  }

  Vehicle _mapBasicTeslaVehicleToDomain(TeslaVehicle tesla) {
    try {
      print('Mapping basic vehicle: ${tesla.id}');
      
      // Try to find last known snapshot for this VIN to avoid showing 0s
      final lastSnapshot = _batteryBox.values.lastWhere(
        (s) => true, // In a multi-VIN world, we'd filter by VIN
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

      final cache = _vehicleCacheBox.get(tesla.vin);

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
        insideTemp: lastSnapshot.outsideTemp, // fallback
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
      print('Error mapping basic vehicle: $e');
      rethrow;
    }
  }

  Vehicle _mapTeslaVehicleDataToDomain(TeslaVehicle tesla, TeslaVehicleData data) {
    try {
      print('Mapping detailed vehicle: ${tesla.id}');
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
        outsideTemp: data.climateState?.outsideTemp ?? 0.0,
        insideTemp: data.climateState?.insideTemp ?? 0.0,
        odometer: data.vehicleState?.odometer ?? 0.0,
        isLocked: data.vehicleState?.locked ?? true,
        isClimateOn: data.climateState?.isClimateOn ?? false,
        isSentryModeOn: data.vehicleState?.sentryMode ?? false,
        isValetModeOn: data.vehicleState?.valetMode ?? false,
        batteryHeaterOn: data.climateState?.batteryHeaterOn ?? false,
        chargeLimitSoc: data.chargeState?.chargeLimitSoc ?? 80,
        shiftState: data.driveState?.shiftState ?? 'P',
        frontTrunkState: data.vehicleState?.ft ?? 0,
        rearTrunkState: data.vehicleState?.rt ?? 0,
        tpmsPressureFl: data.vehicleState?.tpmsPressureFl,
        tpmsPressureFr: data.vehicleState?.tpmsPressureFr,
        tpmsPressureRl: data.vehicleState?.tpmsPressureRl,
        tpmsPressureRr: data.vehicleState?.tpmsPressureRr,
        driverTemp: data.climateState?.driverTempSetting,
        passengerTemp: data.climateState?.passengerTempSetting,
        useFahrenheit: data.guiSettings?.temperatureUnits == 'F',
        useMiles: data.guiSettings?.distanceUnits != 'km/hr',
        pressureUnit: data.guiSettings?.pressureUnits ?? 'Psi',
      );
    } catch (e) {
      print('Error mapping detailed vehicle: $e');
      rethrow;
    }
  }

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

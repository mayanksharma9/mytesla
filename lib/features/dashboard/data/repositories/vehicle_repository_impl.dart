import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import '../../domain/vehicle.dart';
import '../../domain/vehicle_repository.dart';
import 'package:voltride/features/dashboard/domain/tesla_product.dart' as domain;
import 'package:voltride/core/network/tesla_api_client.dart';
import '../models/tesla_models.dart';

class VehicleRepositoryImpl implements VehicleRepository {
  final TeslaApiClient _apiClient;

  VehicleRepositoryImpl(this._apiClient);

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
      return _mapTeslaVehicleDataToDomain(teslaVehicle, dataResponse.response);
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
        outsideTemp: 0,
        insideTemp: 0,
        odometer: 0,
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
        batteryLevel: data.chargeState.batteryLevel,
        batteryRange: data.chargeState.batteryRange,
        outsideTemp: data.climateState.outsideTemp,
        insideTemp: data.climateState.insideTemp,
        odometer: data.vehicleState.odometer,
        isLocked: data.vehicleState.locked,
        isClimateOn: data.climateState.isClimateOn,
        isSentryModeOn: data.vehicleState.sentryMode ?? false,
        isValetModeOn: data.vehicleState.valetMode,
        frontTrunkState: data.vehicleState.ft ?? 0,
        rearTrunkState: data.vehicleState.rt ?? 0,
      );
    } catch (e) {
      print('Error mapping detailed vehicle: $e');
      rethrow;
    }
  }
}

class MockVehicleRepository implements VehicleRepository {
  @override
  Future<List<Vehicle>> getVehicles() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      const Vehicle(
        id: '1',
        vehicleId: '123456',
        vin: '5YJ3E1EA0LF000000',
        displayName: 'Neo',
        optionCodes: 'MS03',
        color: 'Midnight Silver',
        state: 'online',
        batteryLevel: 84,
        batteryRange: 268.5,
        outsideTemp: 42.0,
        insideTemp: 68.0,
        odometer: 12450.0,
        isLocked: true,
        isSentryModeOn: true,
      ),
    ];
  }

  @override
  Future<Vehicle> getVehicleData(String vehicleId) async {
    final vehicles = await getVehicles();
    return vehicles.firstWhere((v) => v.id == vehicleId);
  }

  @override
  Future<void> lock(String vehicleId) async {}
  @override
  Future<void> unlock(String vehicleId) async {}
  @override
  Future<void> actuateTrunk(String vehicleId, String whichTrunk) async {}
  @override
  Future<void> setTemperature(String vehicleId, double temp) async {}
  @override
  Future<void> setClimateOn(String vehicleId, bool on) async {}
  @override
  Future<void> setSeatHeater(String vehicleId, int heater, int level) async {}
  @override
  Future<void> setChargeLimit(String vehicleId, int limit) async {}
  @override
  Future<void> startCharging(String vehicleId) async {}
  @override
  Future<void> stopCharging(String vehicleId) async {}

  @override
  Future<void> setChargingAmps(String vehicleId, int amps) async {}

  @override
  Future<void> flashLights(String vehicleId) async {}

  @override
  Future<void> honkHorn(String vehicleId) async {}

  @override
  Future<List<domain.TeslaProduct>> getProducts() async {
    return [
      const domain.TeslaProduct(
        id: '1',
        siteName: 'Main Residence',
        type: domain.ProductType.powerwall,
        energySiteId: '789',
      ),
    ];
  }
}

import 'vehicle.dart';
import 'tesla_product.dart';

abstract class VehicleRepository {
  Future<List<Vehicle>> getVehicles();
  Future<Vehicle> getVehicleData(String vehicleId);
  
  // Controls
  Future<void> lock(String vehicleId);
  Future<void> unlock(String vehicleId);
  Future<void> actuateTrunk(String vehicleId, String whichTrunk);
  
  // Climate
  Future<void> setTemperature(String vehicleId, double temp);
  Future<void> setClimateOn(String vehicleId, bool on);
  Future<void> setSeatHeater(String vehicleId, int heater, int level);
  
  // Charging
  Future<void> setChargeLimit(String vehicleId, int limit);
  Future<void> startCharging(String vehicleId);
  Future<void> stopCharging(String vehicleId);
  Future<void> setChargingAmps(String vehicleId, int amps);

  // Alerts
  Future<void> flashLights(String vehicleId);
  Future<void> honkHorn(String vehicleId);
  
  // Security
  Future<void> setSentryMode(String vehicleId, bool on);
  Future<void> setValetMode(String vehicleId, bool on, {String? password});
  
  // Power & Energy
  Future<List<TeslaProduct>> getProducts();
}

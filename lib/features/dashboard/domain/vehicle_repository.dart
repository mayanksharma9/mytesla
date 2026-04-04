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
  // Metadata & Specifics
  Future<VehicleCache> getVehicleSpecs(String vin);
  Future<void> syncWarranty(String vin);
  Future<List<ChargingLocation>> getNearbyChargingSites(String vehicleId);
  Future<String?> getReleaseNotes(String vehicleId);

  // Power & Energy
  Future<List<domain.TeslaProduct>> getProducts();
  
  // History & Analytics (Local)
  Future<List<BatterySnapshot>> getBatteryHistory(String vin);
  Future<List<DriveSession>> getTripHistory(String vin);
  Future<List<ChargeSession>> getChargeHistoryLocal(String vin);
}

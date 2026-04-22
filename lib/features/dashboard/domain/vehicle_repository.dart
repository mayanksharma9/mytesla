import 'vehicle.dart';
import 'tesla_product.dart' as domain;
import '../data/models/tesla_models.dart';

abstract class VehicleRepository {
  Future<List<Vehicle>> getVehicles();
  Future<Vehicle> getVehicleData(String vehicleId);
  Future<void> wakeUp(String vehicleId);
  
  // Controls
  Future<void> lock(String vehicleId);
  Future<void> unlock(String vehicleId);
  Future<void> actuateTrunk(String vehicleId, String whichTrunk);
  
  // Climate
  Future<void> setTemperature(String vehicleId, double temp);
  Future<void> setClimateOn(String vehicleId, bool on);
  Future<void> setSeatHeater(String vehicleId, int heater, int level);
  Future<void> setClimateKeeperMode(String vehicleId, String mode); // "dog", "camp", "on", "off"
  
  // Charging
  Future<void> setChargeLimit(String vehicleId, int limit);
  Future<void> startCharging(String vehicleId);
  Future<void> stopCharging(String vehicleId);
  Future<void> setChargingAmps(String vehicleId, int amps);
  Future<void> openChargePort(String vehicleId);
  Future<void> closeChargePort(String vehicleId);
  Future<void> setScheduledCharging(String vehicleId, bool enable, {int? startTime});

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

  // Fleet Telemetry
  Future<void> configureFleetTelemetry(String vin, String hostname);
  Future<Map<String, dynamic>> getFleetTelemetryConfig(String vin);
  Future<void> deleteFleetTelemetryConfig(String vin);
  Future<Map<String, dynamic>> getFleetTelemetryErrors(String vin);
  Future<Map<String, dynamic>> getFleetStatus(List<String> vins);

  // Windows & Media
  Future<void> windowControl(String vehicleId, String command);
  Future<void> mediaCommand(String vehicleId, String command);
  Future<void> remoteBoombox(String vehicleId, int soundId);

  // Extra Climate
  Future<void> setBioweaponMode(String vehicleId, bool on);
  Future<void> setCabinOverheatProtection(String vehicleId, {required bool on, bool fanOnly = false});
  Future<void> setPreconditioningMax(String vehicleId, bool on);

  // Remote Start
  Future<void> remoteStartDrive(String vehicleId);
  
  // History & Analytics (Local)
  Future<List<BatterySnapshot>> getBatteryHistory(String vin);
  Future<List<DriveSession>> getTripHistory(String vin);
  Future<List<ChargeSession>> getChargeHistoryLocal(String vin);
}

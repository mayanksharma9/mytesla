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

  // Charging - Max Range / Standard
  Future<void> chargeMaxRange(String vehicleId);
  Future<void> chargeStandard(String vehicleId);
  Future<void> addChargeSchedule(String vehicleId, {required String daysOfWeek, required bool enabled, required bool startEnabled, required bool endEnabled, required double lat, required double lon, int? startTime, int? endTime, int? id, bool oneTime = false});
  Future<void> removeChargeSchedule(String vehicleId, int id);
  Future<void> addPreconditionSchedule(String vehicleId, {required String daysOfWeek, required bool enabled, required double lat, required double lon, required int preconditionTime, int? id, bool oneTime = false});
  Future<void> removePreconditionSchedule(String vehicleId, int id);

  // Climate - Extended
  Future<void> setSeatCooler(String vehicleId, int seatPosition, int level);
  Future<void> setCopTemp(String vehicleId, int copTemp);
  Future<void> setSteeringWheelHeatLevel(String vehicleId, int level);
  Future<void> adjustVolume(String vehicleId, double volume);

  // Vehicle Controls
  Future<void> sunRoofControl(String vehicleId, String state);
  Future<void> scheduleSoftwareUpdate(String vehicleId, int offsetSec);
  Future<void> cancelSoftwareUpdate(String vehicleId);
  Future<void> navigationGpsRequest(String vehicleId, double lat, double lon);
  Future<void> navigationScRequest(String vehicleId, String superchargerId);

  // Vehicle Info (free endpoints)
  Future<List<Map<String, dynamic>>> getRecentAlerts(String vin);
  Future<Map<String, dynamic>?> getReleaseNotesData(String vin, {bool staged = false});
  Future<Map<String, dynamic>?> getServiceData(String vin);
  Future<bool> getMobileEnabled(String vin);
  Future<List<Map<String, dynamic>>> getDrivers(String vin);
  Future<List<Map<String, dynamic>>> getUserOrders();
  Future<List<Map<String, dynamic>>> getEligibleUpgrades(String vin);
  Future<List<Map<String, dynamic>>> getShareInvites(String vin);
  Future<Map<String, dynamic>> createShareInvite(String vin);
  Future<void> revokeShareInvite(String vin, String inviteId);

  // History & Analytics (Local)
  Future<List<BatterySnapshot>> getBatteryHistory(String vin);
  Future<List<DriveSession>> getTripHistory(String vin);
  Future<List<ChargeSession>> getChargeHistoryLocal(String vin);
}

import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

part 'tesla_models.g.dart';

@JsonSerializable()
class TeslaVehicleResponse {
  final List<TeslaVehicle> response;
  final int count;

  TeslaVehicleResponse({required this.response, required this.count});

  factory TeslaVehicleResponse.fromJson(Map<String, dynamic> json) {
    if (json['response'] == null) json['response'] = [];
    if (json['count'] == null) json['count'] = 0;
    return _$TeslaVehicleResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TeslaVehicleResponseToJson(this);
}

@JsonSerializable()
class TeslaVehicle {
  @JsonKey(fromJson: _dynamicToString)
  final String id;
  @JsonKey(name: 'vehicle_id', fromJson: _dynamicToInt)
  final int vehicleId;
  @JsonKey(fromJson: _dynamicToString)
  final String vin;
  @JsonKey(name: 'display_name', fromJson: _dynamicToNullableString)
  final String? displayName;
  @JsonKey(name: 'option_codes', fromJson: _dynamicToNullableString)
  final String? optionCodes;
  @JsonKey(fromJson: _dynamicToNullableString)
  final String? color;
  @JsonKey(fromJson: _dynamicToString)
  final String state;
  @JsonKey(name: 'in_service')
  final bool? inService;

  TeslaVehicle({
    required this.id,
    required this.vehicleId,
    required this.vin,
    this.displayName,
    this.optionCodes,
    this.color,
    required this.state,
    this.inService,
  });

  factory TeslaVehicle.fromJson(Map<String, dynamic> json) => _$TeslaVehicleFromJson(json);
  Map<String, dynamic> toJson() => _$TeslaVehicleToJson(this);
}

String _dynamicToString(dynamic value) => value?.toString() ?? '';
String? _dynamicToNullableString(dynamic value) => value?.toString();
int _dynamicToInt(dynamic value) {
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value) ?? 0;
  return 0;
}

double _dynamicToDouble(dynamic value) {
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value) ?? 0.0;
  return 0.0;
}

List<T> _dynamicToList<T>(dynamic value) {
  if (value is List) return value.cast<T>();
  return <T>[];
}

@JsonSerializable()
class TeslaVehicleDataResponse {
  final TeslaVehicleData response;

  TeslaVehicleDataResponse({required this.response});

  factory TeslaVehicleDataResponse.fromJson(Map<String, dynamic> json) {
    if (json['response'] == null) {
      throw Exception('TeslaVehicleDataResponse: "response" key is null');
    }
    return _$TeslaVehicleDataResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TeslaVehicleDataResponseToJson(this);
}

@JsonSerializable()
class TeslaVehicleData {
  @JsonKey(name: 'charge_state')
  final ChargeState? chargeState;
  @JsonKey(name: 'climate_state')
  final ClimateState? climateState;
  @JsonKey(name: 'vehicle_state')
  final VehicleState? vehicleState;
  @JsonKey(name: 'drive_state')
  final DriveState? driveState;
  @JsonKey(name: 'gui_settings')
  final GuiSettings? guiSettings;

  TeslaVehicleData({
    this.chargeState,
    this.climateState,
    this.vehicleState,
    this.driveState,
    this.guiSettings,
  });

  factory TeslaVehicleData.fromJson(Map<String, dynamic> json) => _$TeslaVehicleDataFromJson(json);
  Map<String, dynamic> toJson() => _$TeslaVehicleDataToJson(this);
}

@JsonSerializable()
class GuiSettings {
  @JsonKey(name: 'gui_distance_units')
  final String? distanceUnits; // "km/hr" or "mph"
  @JsonKey(name: 'gui_temperature_units')
  final String? temperatureUnits; // "C" or "F"
  @JsonKey(name: 'gui_tire_pressure_units')
  final String? pressureUnits; // "Psi", "Bar", "kPa"
  @JsonKey(name: 'gui_charge_rate_units')
  final String? chargeRateUnits;
  @JsonKey(name: 'gui_24_hour_time')
  final bool? is24HourTime;
  @JsonKey(name: 'show_range_units')
  final bool? showRangeUnits;

  GuiSettings({
    this.distanceUnits,
    this.temperatureUnits,
    this.pressureUnits,
    this.chargeRateUnits,
    this.is24HourTime,
    this.showRangeUnits,
  });

  factory GuiSettings.fromJson(Map<String, dynamic> json) => _$GuiSettingsFromJson(json);
  Map<String, dynamic> toJson() => _$GuiSettingsToJson(this);
}

@JsonSerializable()
class ChargeState {
  @JsonKey(name: 'battery_level', fromJson: _dynamicToInt)
  final int batteryLevel;
  @JsonKey(name: 'battery_range', fromJson: _dynamicToDouble)
  final double batteryRange;
  @JsonKey(name: 'ideal_battery_range', fromJson: _dynamicToDouble)
  final double idealBatteryRange;
  @JsonKey(name: 'charge_limit_soc', fromJson: _dynamicToInt)
  final int chargeLimitSoc;
  @JsonKey(name: 'charge_current_request', fromJson: _dynamicToInt)
  final int chargeCurrentRequest;
  @JsonKey(name: 'charging_state', fromJson: _dynamicToString)
  final String chargingState;

  ChargeState({
    required this.batteryLevel,
    required this.batteryRange,
    this.idealBatteryRange = 0.0,
    required this.chargeLimitSoc,
    required this.chargeCurrentRequest,
    required this.chargingState,
  });

  factory ChargeState.fromJson(Map<String, dynamic> json) => _$ChargeStateFromJson(json);
  Map<String, dynamic> toJson() => _$ChargeStateToJson(this);
}

@JsonSerializable()
class ClimateState {
  @JsonKey(name: 'inside_temp', fromJson: _dynamicToDouble)
  final double insideTemp;
  @JsonKey(name: 'outside_temp', fromJson: _dynamicToDouble)
  final double outsideTemp;
  @JsonKey(name: 'driver_temp_setting', fromJson: _dynamicToDouble)
  final double driverTempSetting;
  @JsonKey(name: 'passenger_temp_setting', fromJson: _dynamicToDouble)
  final double passengerTempSetting;
  @JsonKey(name: 'is_climate_on')
  final bool isClimateOn;
  @JsonKey(name: 'battery_heater_on')
  final bool batteryHeaterOn;

  ClimateState({
    required this.insideTemp,
    required this.outsideTemp,
    required this.driverTempSetting,
    required this.passengerTempSetting,
    required this.isClimateOn,
    this.batteryHeaterOn = false,
  });

  factory ClimateState.fromJson(Map<String, dynamic> json) => _$ClimateStateFromJson(json);
  Map<String, dynamic> toJson() => _$ClimateStateToJson(this);
}

@HiveType(typeId: 2)
@JsonSerializable()
class VehicleState {
  @HiveField(0)
  @JsonKey(fromJson: _dynamicToDouble)
  final double odometer;
  @HiveField(1)
  @JsonKey(name: 'car_version', fromJson: _dynamicToString)
  final String carVersion;
  @HiveField(2)
  final bool locked;
  @HiveField(3)
  @JsonKey(name: 'sentry_mode')
  final bool? sentryMode;
  @HiveField(4)
  @JsonKey(name: 'valet_mode')
  final bool valetMode;
  @HiveField(5)
  final int? ft;
  @HiveField(6)
  final int? rt;
  @HiveField(7)
  @JsonKey(name: 'tpms_pressure_fl', fromJson: _dynamicToDouble)
  final double? tpmsPressureFl;
  @HiveField(8)
  @JsonKey(name: 'tpms_pressure_fr', fromJson: _dynamicToDouble)
  final double? tpmsPressureFr;
  @HiveField(9)
  @JsonKey(name: 'tpms_pressure_rl', fromJson: _dynamicToDouble)
  final double? tpmsPressureRl;
  @HiveField(10)
  @JsonKey(name: 'tpms_pressure_rr', fromJson: _dynamicToDouble)
  final double? tpmsPressureRr;

  VehicleState({
    required this.odometer,
    required this.carVersion,
    required this.locked,
    this.sentryMode,
    required this.valetMode,
    this.ft,
    this.rt,
    this.tpmsPressureFl,
    this.tpmsPressureFr,
    this.tpmsPressureRl,
    this.tpmsPressureRr,
  });

  factory VehicleState.fromJson(Map<String, dynamic> json) => _$VehicleStateFromJson(json);
  Map<String, dynamic> toJson() => _$VehicleStateToJson(this);
}

@JsonSerializable()
class DriveState {
  @JsonKey(fromJson: _dynamicToDouble)
  final double latitude;
  @JsonKey(fromJson: _dynamicToDouble)
  final double longitude;
  @JsonKey(fromJson: _dynamicToDouble)
  final double speed;
  @JsonKey(name: 'shift_state', fromJson: _dynamicToNullableString)
  final String? shiftState;

  DriveState({
    required this.latitude,
    required this.longitude,
    required this.speed,
    this.shiftState,
  });

  factory DriveState.fromJson(Map<String, dynamic> json) => _$DriveStateFromJson(json);
  Map<String, dynamic> toJson() => _$DriveStateToJson(this);
}

@JsonSerializable()
class ChargingLocation {
  final String id;
  final String? name;
  final String? address;
  final String? city;
  final String? state;
  @JsonKey(name: 'postal_code')
  final String? postalCode;
  final ChargingCoordinates? coordinates;
  final List<EVSE>? evses;
  @JsonKey(name: 'evse_count')
  final int? evseCount;
  @JsonKey(name: 'country_code')
  final String? countryCode;

  ChargingLocation({
    required this.id,
    this.name,
    this.address,
    this.city,
    this.state,
    this.postalCode,
    this.coordinates,
    this.evses,
    this.evseCount,
    this.countryCode,
  });

  factory ChargingLocation.fromJson(Map<String, dynamic> json) => _$ChargingLocationFromJson(json);
  Map<String, dynamic> toJson() => _$ChargingLocationToJson(this);
}

@JsonSerializable()
class ChargingCoordinates {
  @JsonKey(fromJson: _dynamicToDouble)
  final double latitude;
  @JsonKey(fromJson: _dynamicToDouble)
  final double longitude;

  ChargingCoordinates({required this.latitude, required this.longitude});

  factory ChargingCoordinates.fromJson(Map<String, dynamic> json) => _$ChargingCoordinatesFromJson(json);
  Map<String, dynamic> toJson() => _$ChargingCoordinatesToJson(this);
}

@JsonSerializable()
class EVSE {
  final String uid;
  @JsonKey(name: 'evse_id')
  final String? evseId;
  final String status;
  final List<Connector>? connectors;

  EVSE({
    required this.uid,
    this.evseId,
    required this.status,
    this.connectors,
  });

  factory EVSE.fromJson(Map<String, dynamic> json) => _$EVSEFromJson(json);
  Map<String, dynamic> toJson() => _$EVSEToJson(this);
}

@JsonSerializable()
class Connector {
  final String id;
  final String standard;
  @JsonKey(name: 'power_type')
  final String powerType;
  @JsonKey(name: 'max_electric_power')
  final int maxElectricPower;
  @JsonKey(name: 'tariff_ids')
  final List<String>? tariffIds;

  Connector({
    required this.id,
    required this.standard,
    required this.powerType,
    required this.maxElectricPower,
    this.tariffIds,
  });

  factory Connector.fromJson(Map<String, dynamic> json) => _$ConnectorFromJson(json);
  Map<String, dynamic> toJson() => _$ConnectorToJson(this);
}

@JsonSerializable()
class ChargingTariff {
  final String id;
  final String currency;
  final List<TariffElement> elements;

  ChargingTariff({
    required this.id,
    required this.currency,
    required this.elements,
  });

  factory ChargingTariff.fromJson(Map<String, dynamic> json) => _$ChargingTariffFromJson(json);
  Map<String, dynamic> toJson() => _$ChargingTariffToJson(this);
}

@JsonSerializable()
class TariffElement {
  @JsonKey(name: 'price_components')
  final List<PriceComponent> priceComponents;

  TariffElement({required this.priceComponents});

  factory TariffElement.fromJson(Map<String, dynamic> json) => _$TariffElementFromJson(json);
  Map<String, dynamic> toJson() => _$TariffElementToJson(this);
}

@JsonSerializable()
class PriceComponent {
  final String type;
  @JsonKey(fromJson: _dynamicToDouble)
  final double price;
  @JsonKey(fromJson: _dynamicToInt)
  final int stepSize;

  PriceComponent({
    required this.type,
    required this.price,
    required this.stepSize,
  });

  factory PriceComponent.fromJson(Map<String, dynamic> json) => _$PriceComponentFromJson(json);
  Map<String, dynamic> toJson() => _$PriceComponentToJson(this);
}

@JsonSerializable()
class UserRegionResponse {
  final UserRegion response;

  UserRegionResponse({required this.response});

  factory UserRegionResponse.fromJson(Map<String, dynamic> json) {
    if (json['response'] == null) {
      throw Exception('UserRegionResponse: "response" key is null');
    }
    return _$UserRegionResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserRegionResponseToJson(this);
}

@JsonSerializable()
class UserRegion {
  final String region;
  @JsonKey(name: 'fleet_api_base_url')
  final String fleetApiBaseUrl;

  UserRegion({required this.region, required this.fleetApiBaseUrl});

  factory UserRegion.fromJson(Map<String, dynamic> json) => _$UserRegionFromJson(json);
  Map<String, dynamic> toJson() => _$UserRegionToJson(this);
}

@JsonSerializable()
class UserProfileResponse {
  final UserProfile response;

  UserProfileResponse({required this.response});

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) {
    if (json['response'] == null) {
      throw Exception('UserProfileResponse: "response" key is null');
    }
    return _$UserProfileResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserProfileResponseToJson(this);
}

@JsonSerializable()
class UserProfile {
  @JsonKey(name: 'full_name')
  final String fullName;
  final String email;
  @JsonKey(name: 'profile_image_url')
  final String? profileImageUrl;

  UserProfile({required this.fullName, required this.email, this.profileImageUrl});

  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);
  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
}

@JsonSerializable()
class ChargingHistoryResponse {
  @JsonKey(defaultValue: [])
  final List<ChargingHistoryEntry> response;
  @JsonKey(defaultValue: 0)
  final int count;

  ChargingHistoryResponse({required this.response, required this.count});

  factory ChargingHistoryResponse.fromJson(Map<String, dynamic> json) {
    if (json['response'] == null) json['response'] = [];
    if (json['count'] == null) json['count'] = 0;
    return _$ChargingHistoryResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ChargingHistoryResponseToJson(this);
}

@HiveType(typeId: 7)
@JsonSerializable()
class ChargingHistoryEntry {
  @HiveField(0)
  @JsonKey(name: 'charge_start_date_time')
  final String? chargeStartDateTime;
  
  @HiveField(1)
  @JsonKey(name: 'charge_stop_date_time')
  final String? chargeStopDateTime;
  
  @HiveField(2)
  @JsonKey(name: 'energy_kwh', fromJson: _dynamicToDouble)
  final double energyKwh;
  
  @HiveField(3)
  @JsonKey(name: 'total_cost', fromJson: _dynamicToDouble)
  final double totalCost;
  
  @HiveField(4)
  final String? vin;
  
  @HiveField(5)
  @JsonKey(name: 'location_id')
  final String? locationId;

  ChargingHistoryEntry({
    this.chargeStartDateTime,
    this.chargeStopDateTime,
    required this.energyKwh,
    required this.totalCost,
    this.vin,
    this.locationId,
  });

  // Compatibility getters for existing UI
  String get date => chargeStartDateTime ?? '';
  double get energyDelivered => energyKwh;
  String get locationName => locationId ?? 'Tesla Station';

  factory ChargingHistoryEntry.fromJson(Map<String, dynamic> json) => _$ChargingHistoryEntryFromJson(json);
  Map<String, dynamic> toJson() => _$ChargingHistoryEntryToJson(this);
}

@JsonSerializable()
class TeslaProductResponse {
  final List<TeslaProduct> response;

  TeslaProductResponse({required this.response});

  factory TeslaProductResponse.fromJson(Map<String, dynamic> json) {
    if (json['response'] == null) json['response'] = <dynamic>[];
    return _$TeslaProductResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TeslaProductResponseToJson(this);
}

@JsonSerializable()
class TeslaProduct {
  @JsonKey(name: 'energy_site_id', fromJson: _dynamicToNullableString)
  final String? energySiteId;
  @JsonKey(name: 'resource_type')
  final String? resourceType;
  @JsonKey(name: 'site_name')
  final String? siteName;
  @JsonKey(fromJson: _dynamicToNullableString)
  final String? id;
  @JsonKey(name: 'vehicle_id', fromJson: _dynamicToInt)
  final int? vehicleId;
  final String? vin;

  TeslaProduct({
    this.energySiteId,
    this.resourceType,
    this.siteName,
    this.id,
    this.vehicleId,
    this.vin,
  });

  factory TeslaProduct.fromJson(Map<String, dynamic> json) => _$TeslaProductFromJson(json);
  Map<String, dynamic> toJson() => _$TeslaProductToJson(this);
}

@HiveType(typeId: 3)
@JsonSerializable()
class BatterySnapshot {
  @HiveField(0)
  final DateTime timestamp;
  
  @HiveField(1)
  final int batteryLevel;
  
  @HiveField(2)
  final double batteryRange;
  
  @HiveField(3)
  final double idealBatteryRange;
  
  @HiveField(4)
  final double outsideTemp;
  
  @HiveField(5)
  final bool batteryHeaterOn;
  
  @HiveField(6)
  final int chargeLimitSoc;
  
  @HiveField(7)
  final String shiftState; // P, D, R, N
  
  @HiveField(8)
  final double odometer;

  BatterySnapshot({
    required this.timestamp,
    required this.batteryLevel,
    required this.batteryRange,
    required this.idealBatteryRange,
    required this.outsideTemp,
    required this.batteryHeaterOn,
    required this.chargeLimitSoc,
    required this.shiftState,
    required this.odometer,
  });

  factory BatterySnapshot.fromJson(Map<String, dynamic> json) => _$BatterySnapshotFromJson(json);
  Map<String, dynamic> toJson() => _$BatterySnapshotToJson(this);
}

@HiveType(typeId: 4)
@JsonSerializable()
class ChargeSession {
  @HiveField(0)
  final DateTime timestamp;
  
  @HiveField(1)
  final double energyAddedKwh;
  
  @HiveField(2)
  final double cost;
  
  @HiveField(3)
  @JsonKey(toJson: _durationToJson, fromJson: _durationFromJson)
  final Duration duration;
  
  @HiveField(4)
  final int startBattery;
  
  @HiveField(5)
  final int endBattery;
  
  @HiveField(6)
  final String? location;

  ChargeSession({
    required this.timestamp,
    required this.energyAddedKwh,
    required this.cost,
    required this.duration,
    required this.startBattery,
    required this.endBattery,
    this.location,
  });

  factory ChargeSession.fromJson(Map<String, dynamic> json) => _$ChargeSessionFromJson(json);
  Map<String, dynamic> toJson() => _$ChargeSessionToJson(this);
}

@HiveType(typeId: 5)
@JsonSerializable()
class DriveSession {
  @HiveField(0)
  final DateTime startTime;
  
  @HiveField(1)
  final DateTime endTime;
  
  @HiveField(2)
  final int startBattery;
  
  @HiveField(3)
  final int endBattery;
  
  @HiveField(4)
  final double startRange;
  
  @HiveField(5)
  final double endRange;
  
  @HiveField(6)
  final double odometerStart;
  
  @HiveField(7)
  final double odometerEnd;
  
  @HiveField(8)
  final double efficiencyScore;
  
  @HiveField(9)
  final double avgOutsideTemp;

  DriveSession({
    required this.startTime,
    required this.endTime,
    required this.startBattery,
    required this.endBattery,
    required this.startRange,
    required this.endRange,
    required this.odometerStart,
    required this.odometerEnd,
    required this.efficiencyScore,
    required this.avgOutsideTemp,
  });

  factory DriveSession.fromJson(Map<String, dynamic> json) => _$DriveSessionFromJson(json);
  Map<String, dynamic> toJson() => _$DriveSessionToJson(this);
}

@HiveType(typeId: 6)
@JsonSerializable()
class LocalVehicleInfo {
  @HiveField(0)
  final String firmwareVersion;
  
  @HiveField(1)
  final double odometer;
  
  @HiveField(2)
  final double tireFL;
  
  @HiveField(3)
  final double tireFR;
  
  @HiveField(4)
  final double tireRL;
  
  @HiveField(5)
  final double tireRR;
  
  @HiveField(6)
  final DateTime lastUpdated;

  LocalVehicleInfo({
    required this.firmwareVersion,
    required this.odometer,
    required this.tireFL,
    required this.tireFR,
    required this.tireRL,
    required this.tireRR,
    required this.lastUpdated,
  });

  factory LocalVehicleInfo.fromJson(Map<String, dynamic> json) => _$LocalVehicleInfoFromJson(json);
  Map<String, dynamic> toJson() => _$LocalVehicleInfoToJson(this);
}

@HiveType(typeId: 8)
@JsonSerializable()
class VehicleCache {
  @HiveField(0)
  final String vin;
  
  @HiveField(1)
  final double? batteryCapacityKwh;
  
  @HiveField(2)
  final double? originalRangeRating;
  
  @HiveField(3)
  final DateTime? warrantyExpiryDate;
  
  @HiveField(4)
  final double? warrantyMilesRemaining;
  
  @HiveField(5)
  final String? batteryType; // LFP, NCA, NCM
  
  @HiveField(6)
  final int? motorCount;
  
  @HiveField(7)
  final List<String>? options;

  VehicleCache({
    required this.vin,
    this.batteryCapacityKwh,
    this.originalRangeRating,
    this.warrantyExpiryDate,
    this.warrantyMilesRemaining,
    this.batteryType,
    this.motorCount,
    this.options,
  });

  factory VehicleCache.fromJson(Map<String, dynamic> json) => _$VehicleCacheFromJson(json);
  Map<String, dynamic> toJson() => _$VehicleCacheToJson(this);
}

@HiveType(typeId: 9)
class UserPrefs {
  @HiveField(0)
  final double? electricityRatePerKwh; // For home charging cost calc
  
  @HiveField(1)
  final bool? notificationsEnabled;
  
  @HiveField(2)
  final String? preferredTheme;

  UserPrefs({
    this.electricityRatePerKwh,
    this.notificationsEnabled,
    this.preferredTheme,
  });
}

// Helpers for JSON
int _durationToJson(Duration duration) => duration.inSeconds;
Duration _durationFromJson(int seconds) => Duration(seconds: seconds);


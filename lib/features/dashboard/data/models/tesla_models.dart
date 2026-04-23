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

int? _dynamicToNullableInt(dynamic value) {
  if (value == null) return null;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value);
  return null;
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
  final String? vin;
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
  @JsonKey(name: 'vehicle_config')
  final VehicleConfig? vehicleConfig;

  TeslaVehicleData({
    this.vin,
    this.chargeState,
    this.climateState,
    this.vehicleState,
    this.driveState,
    this.guiSettings,
    this.vehicleConfig,
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
  @JsonKey(name: 'est_battery_range', fromJson: _dynamicToDouble)
  final double estBatteryRange;
  @JsonKey(name: 'energy_left', fromJson: _dynamicToDouble)
  final double? energyLeft;
  @JsonKey(name: 'charge_limit_soc', fromJson: _dynamicToInt)
  final int chargeLimitSoc;
  @JsonKey(name: 'charge_current_request', fromJson: _dynamicToInt)
  final int chargeCurrentRequest;
  @JsonKey(name: 'charging_state', fromJson: _dynamicToString)
  final String chargingState;
  @JsonKey(name: 'charge_rate', fromJson: _dynamicToDouble)
  final double chargeRate;
  @JsonKey(name: 'charger_power', fromJson: _dynamicToNullableInt)
  final int? chargerPower;
  @JsonKey(name: 'charger_voltage', fromJson: _dynamicToNullableInt)
  final int? chargerVoltage;
  @JsonKey(name: 'charger_phases', fromJson: _dynamicToNullableInt)
  final int? chargerPhases;
  @JsonKey(name: 'charge_energy_added', fromJson: _dynamicToDouble)
  final double chargeEnergyAdded;
  @JsonKey(name: 'time_to_full_charge', fromJson: _dynamicToDouble)
  final double timeToFullCharge;
  @JsonKey(name: 'battery_heater_on')
  final bool batteryHeaterOn;
  @JsonKey(name: 'fast_charger_type', fromJson: _dynamicToString)
  final String? fastChargerType;
  @JsonKey(name: 'conn_charge_cable', fromJson: _dynamicToString)
  final String? connChargeType;

  /// "Off", "StartAt", "DepartBy" — scheduled charging mode
  @JsonKey(name: 'scheduled_charging_mode', fromJson: _dynamicToNullableString)
  final String? scheduledChargingMode;

  /// Unix timestamp for scheduled charge start time
  @JsonKey(name: 'scheduled_charging_start_time', fromJson: _dynamicToNullableInt)
  final int? scheduledChargingStartTime;

  /// Unix timestamp for scheduled departure
  @JsonKey(name: 'scheduled_departure_time', fromJson: _dynamicToNullableInt)
  final int? scheduledDepartureTime;

  /// Whether the charge port door is currently open
  @JsonKey(name: 'charge_port_door_open')
  final bool? chargePortDoorOpen;

  /// Whether fast charger is present
  @JsonKey(name: 'fast_charger_present')
  final bool? fastChargerPresent;

  @JsonKey(name: 'usable_battery_level', fromJson: _dynamicToInt)
  final int usableBatteryLevel;

  @JsonKey(name: 'charge_current_request_max', fromJson: _dynamicToInt)
  final int chargeCurrentRequestMax;

  @JsonKey(name: 'scheduled_charging_pending')
  final bool? scheduledChargingPending;

  ChargeState({
    required this.batteryLevel,
    required this.batteryRange,
    this.idealBatteryRange = 0.0,
    this.estBatteryRange = 0.0,
    this.energyLeft,
    required this.chargeLimitSoc,
    required this.chargeCurrentRequest,
    required this.chargingState,
    this.chargeRate = 0.0,
    this.chargerPower,
    this.chargerVoltage,
    this.chargerPhases,
    this.chargeEnergyAdded = 0.0,
    this.timeToFullCharge = 0.0,
    this.batteryHeaterOn = false,
    this.fastChargerType,
    this.connChargeType,
    this.scheduledChargingMode,
    this.scheduledChargingStartTime,
    this.scheduledDepartureTime,
    this.chargePortDoorOpen,
    this.fastChargerPresent,
    this.usableBatteryLevel = 0,
    this.chargeCurrentRequestMax = 48,
    this.scheduledChargingPending,
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
  @JsonKey(name: 'battery_heater')
  final bool batteryHeaterOn;
  @JsonKey(name: 'fan_status', fromJson: _dynamicToInt)
  final int fanStatus;

  @JsonKey(name: 'seat_heater_left', fromJson: _dynamicToInt)
  final int seatHeaterLeft;   // 0=off, 1=low, 2=med, 3=high

  @JsonKey(name: 'seat_heater_right', fromJson: _dynamicToInt)
  final int seatHeaterRight;

  @JsonKey(name: 'steering_wheel_heater')
  final bool steeringWheelHeater;

  @JsonKey(name: 'front_defroster_on')
  final bool frontDefrosterOn;

  /// "dog", "camp", "on", "off" — mirrors Tesla's climate_keeper_mode API field
  @JsonKey(name: 'climate_keeper_mode', fromJson: _dynamicToNullableString)
  final String? climateKeeperMode;

  @JsonKey(name: 'seat_heater_rear_left', fromJson: _dynamicToInt)
  final int seatHeaterRearLeft;

  @JsonKey(name: 'seat_heater_rear_right', fromJson: _dynamicToInt)
  final int seatHeaterRearRight;

  @JsonKey(name: 'seat_heater_rear_center', fromJson: _dynamicToInt)
  final int seatHeaterRearCenter;

  /// Leveled steering wheel heat: 0=off, 1=low, 3=high (no level 2)
  @JsonKey(name: 'steering_wheel_heat_level', fromJson: _dynamicToInt)
  final int steeringWheelHeatLevel;

  ClimateState({
    required this.insideTemp,
    required this.outsideTemp,
    required this.driverTempSetting,
    required this.passengerTempSetting,
    required this.isClimateOn,
    this.batteryHeaterOn = false,
    this.fanStatus = 0,
    this.seatHeaterLeft = 0,
    this.seatHeaterRight = 0,
    this.steeringWheelHeater = false,
    this.frontDefrosterOn = false,
    this.climateKeeperMode,
    this.seatHeaterRearLeft = 0,
    this.seatHeaterRearRight = 0,
    this.seatHeaterRearCenter = 0,
    this.steeringWheelHeatLevel = 0,
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
  @HiveField(11)
  @JsonKey(name: 'tpms_soft_warning_fl')
  final bool? tpmsSoftWarningFl;
  @HiveField(12)
  @JsonKey(name: 'tpms_soft_warning_fr')
  final bool? tpmsSoftWarningFr;
  @HiveField(13)
  @JsonKey(name: 'tpms_soft_warning_rl')
  final bool? tpmsSoftWarningRl;
  @HiveField(14)
  @JsonKey(name: 'tpms_soft_warning_rr')
  final bool? tpmsSoftWarningRr;
  @HiveField(15)
  @JsonKey(name: 'software_update')
  final SoftwareUpdate? softwareUpdate;

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
    this.tpmsSoftWarningFl,
    this.tpmsSoftWarningFr,
    this.tpmsSoftWarningRl,
    this.tpmsSoftWarningRr,
    this.softwareUpdate,
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
  @JsonKey(fromJson: _dynamicToInt)
  final int heading;
  @JsonKey(name: 'gps_as_of', fromJson: _dynamicToInt)
  final int gpsAsOf;
  @JsonKey(fromJson: _dynamicToInt)
  final int power;

  DriveState({
    required this.latitude,
    required this.longitude,
    required this.speed,
    this.shiftState,
    this.heading = 0,
    this.gpsAsOf = 0,
    this.power = 0,
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
    // Tesla /dx/charging/history: {data: [...], total_results: N}
    // Standard Tesla endpoints: {response: [...], count: N}
    // Handle both formats
    List<dynamic>? items;
    if (json['data'] is List) {
      items = json['data'] as List<dynamic>;
    } else if (json['response'] is List) {
      items = json['response'] as List<dynamic>;
    } else if (json['results'] is List) {
      items = json['results'] as List<dynamic>;
    }
    final total = (json['total_results'] as num?)?.toInt() ??
        (json['count'] as num?)?.toInt() ??
        items?.length ??
        0;
    final parsed = (items ?? [])
        .whereType<Map<String, dynamic>>()
        .map(ChargingHistoryEntry.fromJson)
        .toList();
    return ChargingHistoryResponse(response: parsed, count: total);
  }

  Map<String, dynamic> toJson() => _$ChargingHistoryResponseToJson(this);
}

@HiveType(typeId: 7)
@JsonSerializable()
class ChargingHistoryEntry {
  /// ISO-8601 start timestamp (stored in Hive for offline history).
  @HiveField(0)
  @JsonKey(name: 'charge_start_date_time')
  final String? chargeStartDateTime;

  /// ISO-8601 stop timestamp.
  @HiveField(1)
  @JsonKey(name: 'charge_stop_date_time')
  final String? chargeStopDateTime;

  /// Energy delivered in kWh.
  @HiveField(2)
  @JsonKey(name: 'energy_kwh', fromJson: _dynamicToDouble)
  final double energyKwh;

  /// Total cost in local currency (derived from fees[] if no direct field).
  @HiveField(3)
  @JsonKey(name: 'total_cost', fromJson: _dynamicToDouble)
  final double totalCost;

  @HiveField(4)
  final String? vin;

  /// Human-readable site name (e.g. "Tesla Supercharger - Main St").
  @HiveField(5)
  @JsonKey(name: 'location_id')
  final String? locationId;

  @HiveField(6)
  @JsonKey(name: 'session_id', fromJson: _dynamicToNullableString)
  final String? sessionId;

  /// Currency code from fees (e.g. "USD").
  @HiveField(7)
  @JsonKey(name: 'currency_code')
  final String? currencyCode;

  /// Invoices attached to this session — not persisted in Hive (fetched fresh).
  /// Use [ChargingInvoice.contentId] with getChargingInvoice().
  @JsonKey(includeFromJson: false, includeToJson: false)
  final List<ChargingInvoice> invoices;

  /// Individual fee line-items — not persisted in Hive.
  @JsonKey(includeFromJson: false, includeToJson: false)
  final List<ChargingFee> fees;

  ChargingHistoryEntry({
    this.chargeStartDateTime,
    this.chargeStopDateTime,
    required this.energyKwh,
    required this.totalCost,
    this.vin,
    this.locationId,
    this.sessionId,
    this.currencyCode,
    this.invoices = const [],
    this.fees = const [],
  });

  String get date => chargeStartDateTime ?? '';
  double get energyDelivered => energyKwh;
  String get locationName => locationId ?? 'Tesla Supercharger';

  factory ChargingHistoryEntry.fromJson(Map<String, dynamic> json) {
    // Tesla Fleet API /dx/charging/history exact field names (confirmed from live response):
    //   sessionId, vin, siteLocationName, chargeStartDateTime, chargeStopDateTime,
    //   countryCode, fees[]{sessionFeeId, feeType, currencyCode, usageBase, totalDue,
    //                        netDue, uom, isPaid, status, rateBase, pricingType}

    // --- Timestamps (Tesla sends camelCase) ---
    final startRaw = json['chargeStartDateTime'] ??
        json['date_started'] ??
        json['charge_start_date_time'];
    final stopRaw = json['chargeStopDateTime'] ??
        json['date_stopped'] ??
        json['charge_stop_date_time'];

    // --- Parse fees first — energy & cost both come from the fees array ---
    final rawFees = json['fees'] as List<dynamic>? ?? [];
    final feeList = rawFees
        .map((e) => ChargingFee.fromJson(e as Map<String, dynamic>))
        .toList();

    // Energy kWh: usageBase on the CHARGING fee (uom: "kwh")
    double energyKwh = _dynamicToDouble(
      json['total_energy_kWh'] ?? json['energyKwh'] ?? json['energy_kwh'] ?? 0,
    );
    if (energyKwh == 0) {
      for (final fee in feeList) {
        if (fee.feeType.toUpperCase() == 'CHARGING' && fee.usageBase > 0) {
          energyKwh = fee.usageBase;
          break;
        }
      }
    }

    // Total cost: sum of totalDue across all PAYMENT-type fees
    double totalCost = _dynamicToDouble(
      json['total_cost'] ?? json['totalCost'] ?? 0,
    );
    if (totalCost == 0) {
      totalCost = feeList.fold(0.0, (sum, f) => sum + f.totalDue);
    }

    // Currency: from first fee that has it
    final currencyCode = (json['currency_code'] ??
        json['currencyCode'] ??
        (feeList.isNotEmpty ? feeList.first.currencyCode : null))
        ?.toString();

    // --- Location (Tesla sends siteLocationName) ---
    final locationId = (json['siteLocationName'] ??
        json['charging_site_name'] ??
        json['chargingSiteName'] ??
        json['site_name'] ??
        json['location_id'])
        ?.toString();

    // --- Invoices ---
    final rawInvoices = json['invoices'] as List<dynamic>? ?? [];
    final invoices = rawInvoices
        .map((e) => ChargingInvoice.fromJson(e as Map<String, dynamic>))
        .toList();

    // --- Other fields ---
    final vin = json['vin']?.toString();
    final sessionId = json['sessionId']?.toString() ??
        json['din']?.toString() ??
        json['session_id']?.toString();

    return ChargingHistoryEntry(
      chargeStartDateTime: startRaw?.toString(),
      chargeStopDateTime: stopRaw?.toString(),
      energyKwh: energyKwh,
      totalCost: totalCost,
      vin: vin,
      locationId: locationId,
      sessionId: sessionId,
      currencyCode: currencyCode,
      invoices: invoices,
      fees: feeList,
    );
  }

  Map<String, dynamic> toJson() => _$ChargingHistoryEntryToJson(this);
}

class ChargingFee {
  /// e.g. "CHARGING", "CONGESTION", "TAX"
  final String feeType;
  /// e.g. "PAYMENT", "NO_CHARGE"
  final String pricingType;
  /// kWh used (for CHARGING fee)
  final double usageBase;
  /// Rate per unit ($/kWh)
  final double rateBase;
  /// Total amount due for this fee line
  final double totalDue;
  /// Net amount due after credits
  final double netDue;
  final String? currencyCode;
  final bool isPaid;
  /// e.g. "PAID", "PENDING"
  final String? status;

  const ChargingFee({
    required this.feeType,
    required this.pricingType,
    required this.usageBase,
    required this.rateBase,
    required this.totalDue,
    required this.netDue,
    this.currencyCode,
    required this.isPaid,
    this.status,
  });

  /// Convenience: the charged amount the user actually pays
  double get amount => totalDue;

  factory ChargingFee.fromJson(Map<String, dynamic> json) => ChargingFee(
        feeType: (json['feeType'] ?? json['fee_type'] ?? 'CHARGING').toString(),
        pricingType: (json['pricingType'] ?? json['pricing_type'] ?? '').toString(),
        usageBase: _dynamicToDouble(json['usageBase'] ?? json['usage_base'] ?? 0),
        rateBase: _dynamicToDouble(json['rateBase'] ?? json['rate_base'] ?? 0),
        totalDue: _dynamicToDouble(json['totalDue'] ?? json['total_due'] ?? json['amount'] ?? 0),
        netDue: _dynamicToDouble(json['netDue'] ?? json['net_due'] ?? json['totalDue'] ?? 0),
        currencyCode: (json['currencyCode'] ?? json['currency_code'])?.toString(),
        isPaid: (json['isPaid'] ?? json['is_paid']) as bool? ?? false,
        status: (json['status'])?.toString(),
      );
}

class ChargingInvoice {
  final String contentId;
  final String? billingType;

  const ChargingInvoice({required this.contentId, this.billingType});

  factory ChargingInvoice.fromJson(Map<String, dynamic> json) => ChargingInvoice(
        contentId: (json['content_id'] ?? json['contentId'] ?? '').toString(),
        billingType: json['billing_type']?.toString(),
      );
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

  @HiveField(9)
  final String? vin;

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
    this.vin,
  });

  factory BatterySnapshot.fromJson(Map<String, dynamic> json) => _$BatterySnapshotFromJson(json);
  Map<String, dynamic> toJson() => _$BatterySnapshotToJson(this);
}
@HiveType(typeId: 4)
@JsonSerializable()
class ChargeSession {
  @HiveField(0)
  final DateTime startTime;
  
  @HiveField(1)
  final DateTime endTime;
  
  @HiveField(2)
  final double startSoc;
  
  @HiveField(3)
  final double endSoc;
  
  @HiveField(4)
  final double startRange;
  
  @HiveField(5)
  final double endRange;
  
  @HiveField(6)
  final double kwhAdded;
  
  @HiveField(7)
  final double chargerVoltage;
  
  @HiveField(8)
  final int chargerPhases;
  
  @HiveField(9)
  final double chargerPower;
  
  @HiveField(10)
  final String? fastChargerType;
  
  @HiveField(11)
  final String? connChargeType;

  @HiveField(12)
  final String? vin;

  /// kW readings sampled during the session (one per poll cycle, ~5 min apart)
  @HiveField(13)
  final List<double> powerCurve;

  /// Battery % at each power reading (same length as powerCurve)
  @HiveField(14)
  final List<double> socCurve;

  ChargeSession({
    required this.startTime,
    required this.endTime,
    required this.startSoc,
    required this.endSoc,
    required this.startRange,
    required this.endRange,
    required this.kwhAdded,
    required this.chargerVoltage,
    required this.chargerPhases,
    required this.chargerPower,
    this.fastChargerType,
    this.connChargeType,
    this.vin,
    this.powerCurve = const [],
    this.socCurve = const [],
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
  final double startOdometer;
  
  @HiveField(3)
  final double endOdometer;
  
  @HiveField(4)
  final double startSoc;
  
  @HiveField(5)
  final double endSoc;
  
  @HiveField(6)
  final double distance;
  
  @HiveField(7)
  final double energyUsedKwh;
  
  @HiveField(8)
  final double efficiencyScore;
  
  @HiveField(9)
  final double avgOutsideTemp;

  @HiveField(10)
  final String? vin;

  DriveSession({
    required this.startTime,
    required this.endTime,
    required this.startOdometer,
    required this.endOdometer,
    required this.startSoc,
    required this.endSoc,
    required this.distance,
    required this.energyUsedKwh,
    required this.efficiencyScore,
    required this.avgOutsideTemp,
    this.vin,
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

@JsonSerializable()
class SoftwareUpdate {
  @JsonKey(name: 'expected_duration_sec', fromJson: _dynamicToInt)
  final int expectedDurationSec;
  @JsonKey(fromJson: _dynamicToString)
  final String status;
  @JsonKey(fromJson: _dynamicToString)
  final String version;
  @JsonKey(name: 'install_perc', fromJson: _dynamicToInt)
  final int installPerc;

  SoftwareUpdate({
    required this.expectedDurationSec,
    required this.status,
    required this.version,
    this.installPerc = 0,
  });

  factory SoftwareUpdate.fromJson(Map<String, dynamic> json) => _$SoftwareUpdateFromJson(json);
  Map<String, dynamic> toJson() => _$SoftwareUpdateToJson(this);
}

@JsonSerializable()
class VehicleConfig {
  @JsonKey(name: 'car_type', fromJson: _dynamicToString)
  final String? carType;
  @JsonKey(name: 'charge_port_type', fromJson: _dynamicToString)
  final String? chargePortType;
  @JsonKey(name: 'exterior_color', fromJson: _dynamicToString)
  final String? exteriorColor;
  @JsonKey(name: 'roof_color', fromJson: _dynamicToString)
  final String? roofColor;
  @JsonKey(name: 'wheel_type', fromJson: _dynamicToString)
  final String? wheelType;

  VehicleConfig({
    this.carType,
    this.chargePortType,
    this.exteriorColor,
    this.roofColor,
    this.wheelType,
  });

  factory VehicleConfig.fromJson(Map<String, dynamic> json) => _$VehicleConfigFromJson(json);
  Map<String, dynamic> toJson() => _$VehicleConfigToJson(this);
}

@JsonSerializable()
class ChargingSessionsResponse {
  @JsonKey(defaultValue: [])
  final List<ChargingSessionInfo> response;
  @JsonKey(defaultValue: 0)
  final int count;

  ChargingSessionsResponse({required this.response, required this.count});

  factory ChargingSessionsResponse.fromJson(Map<String, dynamic> json) {
    List<dynamic>? items;
    if (json['data'] is List) {
      items = json['data'] as List<dynamic>;
    } else if (json['response'] is List) {
      items = json['response'] as List<dynamic>;
    } else if (json['results'] is List) {
      items = json['results'] as List<dynamic>;
    }
    final total = (json['total_results'] as num?)?.toInt() ??
        (json['count'] as num?)?.toInt() ??
        items?.length ??
        0;
    final parsed = (items ?? [])
        .whereType<Map<String, dynamic>>()
        .map(ChargingSessionInfo.fromJson)
        .toList();
    return ChargingSessionsResponse(response: parsed, count: total);
  }

  Map<String, dynamic> toJson() => _$ChargingSessionsResponseToJson(this);
}

@JsonSerializable()
class ChargingSessionInfo {
  @JsonKey(name: 'session_id', fromJson: _dynamicToString)
  final String sessionId;
  @JsonKey(name: 'vin')
  final String? vin;
  @JsonKey(name: 'start_date_time')
  final String? startDateTime;
  @JsonKey(name: 'end_date_time')
  final String? endDateTime;
  @JsonKey(name: 'energy_kwh', fromJson: _dynamicToDouble)
  final double energyKwh;
  @JsonKey(name: 'total_cost', fromJson: _dynamicToDouble)
  final double totalCost;
  @JsonKey(name: 'currency_code')
  final String? currencyCode;

  ChargingSessionInfo({
    required this.sessionId,
    this.vin,
    this.startDateTime,
    this.endDateTime,
    required this.energyKwh,
    required this.totalCost,
    this.currencyCode,
  });

  factory ChargingSessionInfo.fromJson(Map<String, dynamic> json) => _$ChargingSessionInfoFromJson(json);
  Map<String, dynamic> toJson() => _$ChargingSessionInfoToJson(this);
}


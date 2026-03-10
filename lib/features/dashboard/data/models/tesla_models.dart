import 'package:json_annotation/json_annotation.dart';

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

  factory TeslaVehicleDataResponse.fromJson(Map<String, dynamic> json) => _$TeslaVehicleDataResponseFromJson(json);
}

@JsonSerializable()
class TeslaVehicleData {
  @JsonKey(name: 'charge_state')
  final ChargeState chargeState;
  @JsonKey(name: 'climate_state')
  final ClimateState climateState;
  @JsonKey(name: 'vehicle_state')
  final VehicleState vehicleState;
  @JsonKey(name: 'drive_state')
  final DriveState driveState;

  TeslaVehicleData({
    required this.chargeState,
    required this.climateState,
    required this.vehicleState,
    required this.driveState,
  });

  factory TeslaVehicleData.fromJson(Map<String, dynamic> json) => _$TeslaVehicleDataFromJson(json);
}

@JsonSerializable()
class ChargeState {
  @JsonKey(name: 'battery_level', fromJson: _dynamicToInt)
  final int batteryLevel;
  @JsonKey(name: 'battery_range', fromJson: _dynamicToDouble)
  final double batteryRange;
  @JsonKey(name: 'charge_limit_soc', fromJson: _dynamicToInt)
  final int chargeLimitSoc;
  @JsonKey(name: 'charge_current_request', fromJson: _dynamicToInt)
  final int chargeCurrentRequest;
  @JsonKey(name: 'charging_state', fromJson: _dynamicToString)
  final String chargingState;

  ChargeState({
    required this.batteryLevel,
    required this.batteryRange,
    required this.chargeLimitSoc,
    required this.chargeCurrentRequest,
    required this.chargingState,
  });

  factory ChargeState.fromJson(Map<String, dynamic> json) => _$ChargeStateFromJson(json);
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

  ClimateState({
    required this.insideTemp,
    required this.outsideTemp,
    required this.driverTempSetting,
    required this.passengerTempSetting,
    required this.isClimateOn,
  });

  factory ClimateState.fromJson(Map<String, dynamic> json) => _$ClimateStateFromJson(json);
}

@JsonSerializable()
class VehicleState {
  @JsonKey(fromJson: _dynamicToDouble)
  final double odometer;
  @JsonKey(name: 'car_version', fromJson: _dynamicToString)
  final String carVersion;
  final bool locked;
  @JsonKey(name: 'sentry_mode')
  final bool? sentryMode;
  @JsonKey(name: 'valet_mode')
  final bool valetMode;
  final int? ft;
  final int? rt;

  VehicleState({
    required this.odometer,
    required this.carVersion,
    required this.locked,
    this.sentryMode,
    required this.valetMode,
    this.ft,
    this.rt,
  });

  factory VehicleState.fromJson(Map<String, dynamic> json) => _$VehicleStateFromJson(json);
}

@JsonSerializable()
class DriveState {
  @JsonKey(fromJson: _dynamicToDouble)
  final double latitude;
  @JsonKey(fromJson: _dynamicToDouble)
  final double longitude;
  @JsonKey(fromJson: _dynamicToDouble)
  final double speed;

  DriveState({
    required this.latitude,
    required this.longitude,
    required this.speed,
  });

  factory DriveState.fromJson(Map<String, dynamic> json) => _$DriveStateFromJson(json);
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
}

@JsonSerializable()
class ChargingCoordinates {
  @JsonKey(fromJson: _dynamicToDouble)
  final double latitude;
  @JsonKey(fromJson: _dynamicToDouble)
  final double longitude;

  ChargingCoordinates({required this.latitude, required this.longitude});

  factory ChargingCoordinates.fromJson(Map<String, dynamic> json) => _$ChargingCoordinatesFromJson(json);
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
}

@JsonSerializable()
class TariffElement {
  @JsonKey(name: 'price_components')
  final List<PriceComponent> priceComponents;

  TariffElement({required this.priceComponents});

  factory TariffElement.fromJson(Map<String, dynamic> json) => _$TariffElementFromJson(json);
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
}

@JsonSerializable()
class UserRegionResponse {
  final UserRegion response;

  UserRegionResponse({required this.response});

  factory UserRegionResponse.fromJson(Map<String, dynamic> json) => _$UserRegionResponseFromJson(json);
}

@JsonSerializable()
class UserRegion {
  final String region;
  @JsonKey(name: 'fleet_api_base_url')
  final String fleetApiBaseUrl;

  UserRegion({required this.region, required this.fleetApiBaseUrl});

  factory UserRegion.fromJson(Map<String, dynamic> json) => _$UserRegionFromJson(json);
}

@JsonSerializable()
class UserProfileResponse {
  final UserProfile response;

  UserProfileResponse({required this.response});

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) => _$UserProfileResponseFromJson(json);
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
}

@JsonSerializable()
class ChargingHistoryResponse {
  @JsonKey(defaultValue: [])
  final List<ChargingHistoryEntry> response;
  @JsonKey(defaultValue: 0)
  final int count;

  ChargingHistoryResponse({required this.response, required this.count});

  factory ChargingHistoryResponse.fromJson(Map<String, dynamic> json) {
    // Handle cases where response might be null but key exists
    if (json['response'] == null) {
      json['response'] = [];
    }
    if (json['count'] == null) {
      json['count'] = 0;
    }
    return _$ChargingHistoryResponseFromJson(json);
  }
}

@JsonSerializable()
class ChargingHistoryEntry {
  @JsonKey(name: 'charge_start_date_time')
  final String? chargeStartDateTime;
  @JsonKey(name: 'charge_stop_date_time')
  final String? chargeStopDateTime;
  @JsonKey(name: 'energy_kwh', fromJson: _dynamicToDouble)
  final double energyKwh;
  @JsonKey(name: 'total_cost', fromJson: _dynamicToDouble)
  final double totalCost;
  final String? vin;
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

  factory ChargingHistoryEntry.fromJson(Map<String, dynamic> json) => _$ChargingHistoryEntryFromJson(json);
}

@JsonSerializable()
class TeslaProductResponse {
  final List<TeslaProduct> response;

  TeslaProductResponse({required this.response});

  factory TeslaProductResponse.fromJson(Map<String, dynamic> json) {
    if (json['response'] == null) json['response'] = [];
    return _$TeslaProductResponseFromJson(json);
  }
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
}

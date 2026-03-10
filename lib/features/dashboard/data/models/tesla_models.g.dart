// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tesla_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeslaVehicleResponse _$TeslaVehicleResponseFromJson(
  Map<String, dynamic> json,
) => TeslaVehicleResponse(
  response: (json['response'] as List<dynamic>)
      .map((e) => TeslaVehicle.fromJson(e as Map<String, dynamic>))
      .toList(),
  count: (json['count'] as num).toInt(),
);

Map<String, dynamic> _$TeslaVehicleResponseToJson(
  TeslaVehicleResponse instance,
) => <String, dynamic>{'response': instance.response, 'count': instance.count};

TeslaVehicle _$TeslaVehicleFromJson(Map<String, dynamic> json) => TeslaVehicle(
  id: _dynamicToString(json['id']),
  vehicleId: _dynamicToInt(json['vehicle_id']),
  vin: _dynamicToString(json['vin']),
  displayName: _dynamicToNullableString(json['display_name']),
  optionCodes: _dynamicToNullableString(json['option_codes']),
  color: _dynamicToNullableString(json['color']),
  state: _dynamicToString(json['state']),
  inService: json['in_service'] as bool?,
);

Map<String, dynamic> _$TeslaVehicleToJson(TeslaVehicle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vehicle_id': instance.vehicleId,
      'vin': instance.vin,
      'display_name': instance.displayName,
      'option_codes': instance.optionCodes,
      'color': instance.color,
      'state': instance.state,
      'in_service': instance.inService,
    };

TeslaVehicleDataResponse _$TeslaVehicleDataResponseFromJson(
  Map<String, dynamic> json,
) => TeslaVehicleDataResponse(
  response: TeslaVehicleData.fromJson(json['response'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TeslaVehicleDataResponseToJson(
  TeslaVehicleDataResponse instance,
) => <String, dynamic>{'response': instance.response};

TeslaVehicleData _$TeslaVehicleDataFromJson(Map<String, dynamic> json) =>
    TeslaVehicleData(
      chargeState: ChargeState.fromJson(
        json['charge_state'] as Map<String, dynamic>,
      ),
      climateState: ClimateState.fromJson(
        json['climate_state'] as Map<String, dynamic>,
      ),
      vehicleState: VehicleState.fromJson(
        json['vehicle_state'] as Map<String, dynamic>,
      ),
      driveState: DriveState.fromJson(
        json['drive_state'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$TeslaVehicleDataToJson(TeslaVehicleData instance) =>
    <String, dynamic>{
      'charge_state': instance.chargeState,
      'climate_state': instance.climateState,
      'vehicle_state': instance.vehicleState,
      'drive_state': instance.driveState,
    };

ChargeState _$ChargeStateFromJson(Map<String, dynamic> json) => ChargeState(
  batteryLevel: _dynamicToInt(json['battery_level']),
  batteryRange: _dynamicToDouble(json['battery_range']),
  chargeLimitSoc: _dynamicToInt(json['charge_limit_soc']),
  chargeCurrentRequest: _dynamicToInt(json['charge_current_request']),
  chargingState: _dynamicToString(json['charging_state']),
);

Map<String, dynamic> _$ChargeStateToJson(ChargeState instance) =>
    <String, dynamic>{
      'battery_level': instance.batteryLevel,
      'battery_range': instance.batteryRange,
      'charge_limit_soc': instance.chargeLimitSoc,
      'charge_current_request': instance.chargeCurrentRequest,
      'charging_state': instance.chargingState,
    };

ClimateState _$ClimateStateFromJson(Map<String, dynamic> json) => ClimateState(
  insideTemp: _dynamicToDouble(json['inside_temp']),
  outsideTemp: _dynamicToDouble(json['outside_temp']),
  driverTempSetting: _dynamicToDouble(json['driver_temp_setting']),
  passengerTempSetting: _dynamicToDouble(json['passenger_temp_setting']),
  isClimateOn: json['is_climate_on'] as bool,
);

Map<String, dynamic> _$ClimateStateToJson(ClimateState instance) =>
    <String, dynamic>{
      'inside_temp': instance.insideTemp,
      'outside_temp': instance.outsideTemp,
      'driver_temp_setting': instance.driverTempSetting,
      'passenger_temp_setting': instance.passengerTempSetting,
      'is_climate_on': instance.isClimateOn,
    };

VehicleState _$VehicleStateFromJson(Map<String, dynamic> json) => VehicleState(
  odometer: _dynamicToDouble(json['odometer']),
  carVersion: _dynamicToString(json['car_version']),
  locked: json['locked'] as bool,
  sentryMode: json['sentry_mode'] as bool?,
  valetMode: json['valet_mode'] as bool,
  ft: (json['ft'] as num?)?.toInt(),
  rt: (json['rt'] as num?)?.toInt(),
);

Map<String, dynamic> _$VehicleStateToJson(VehicleState instance) =>
    <String, dynamic>{
      'odometer': instance.odometer,
      'car_version': instance.carVersion,
      'locked': instance.locked,
      'sentry_mode': instance.sentryMode,
      'valet_mode': instance.valetMode,
      'ft': instance.ft,
      'rt': instance.rt,
    };

DriveState _$DriveStateFromJson(Map<String, dynamic> json) => DriveState(
  latitude: _dynamicToDouble(json['latitude']),
  longitude: _dynamicToDouble(json['longitude']),
  speed: _dynamicToDouble(json['speed']),
);

Map<String, dynamic> _$DriveStateToJson(DriveState instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'speed': instance.speed,
    };

ChargingLocation _$ChargingLocationFromJson(Map<String, dynamic> json) =>
    ChargingLocation(
      id: json['id'] as String,
      name: json['name'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      postalCode: json['postal_code'] as String?,
      coordinates: json['coordinates'] == null
          ? null
          : ChargingCoordinates.fromJson(
              json['coordinates'] as Map<String, dynamic>,
            ),
      evses: (json['evses'] as List<dynamic>?)
          ?.map((e) => EVSE.fromJson(e as Map<String, dynamic>))
          .toList(),
      evseCount: (json['evse_count'] as num?)?.toInt(),
      countryCode: json['country_code'] as String?,
    );

Map<String, dynamic> _$ChargingLocationToJson(ChargingLocation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'postal_code': instance.postalCode,
      'coordinates': instance.coordinates,
      'evses': instance.evses,
      'evse_count': instance.evseCount,
      'country_code': instance.countryCode,
    };

ChargingCoordinates _$ChargingCoordinatesFromJson(Map<String, dynamic> json) =>
    ChargingCoordinates(
      latitude: _dynamicToDouble(json['latitude']),
      longitude: _dynamicToDouble(json['longitude']),
    );

Map<String, dynamic> _$ChargingCoordinatesToJson(
  ChargingCoordinates instance,
) => <String, dynamic>{
  'latitude': instance.latitude,
  'longitude': instance.longitude,
};

EVSE _$EVSEFromJson(Map<String, dynamic> json) => EVSE(
  uid: json['uid'] as String,
  evseId: json['evse_id'] as String?,
  status: json['status'] as String,
  connectors: (json['connectors'] as List<dynamic>?)
      ?.map((e) => Connector.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$EVSEToJson(EVSE instance) => <String, dynamic>{
  'uid': instance.uid,
  'evse_id': instance.evseId,
  'status': instance.status,
  'connectors': instance.connectors,
};

Connector _$ConnectorFromJson(Map<String, dynamic> json) => Connector(
  id: json['id'] as String,
  standard: json['standard'] as String,
  powerType: json['power_type'] as String,
  maxElectricPower: (json['max_electric_power'] as num).toInt(),
  tariffIds: (json['tariff_ids'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$ConnectorToJson(Connector instance) => <String, dynamic>{
  'id': instance.id,
  'standard': instance.standard,
  'power_type': instance.powerType,
  'max_electric_power': instance.maxElectricPower,
  'tariff_ids': instance.tariffIds,
};

ChargingTariff _$ChargingTariffFromJson(Map<String, dynamic> json) =>
    ChargingTariff(
      id: json['id'] as String,
      currency: json['currency'] as String,
      elements: (json['elements'] as List<dynamic>)
          .map((e) => TariffElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChargingTariffToJson(ChargingTariff instance) =>
    <String, dynamic>{
      'id': instance.id,
      'currency': instance.currency,
      'elements': instance.elements,
    };

TariffElement _$TariffElementFromJson(Map<String, dynamic> json) =>
    TariffElement(
      priceComponents: (json['price_components'] as List<dynamic>)
          .map((e) => PriceComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TariffElementToJson(TariffElement instance) =>
    <String, dynamic>{'price_components': instance.priceComponents};

PriceComponent _$PriceComponentFromJson(Map<String, dynamic> json) =>
    PriceComponent(
      type: json['type'] as String,
      price: _dynamicToDouble(json['price']),
      stepSize: _dynamicToInt(json['stepSize']),
    );

Map<String, dynamic> _$PriceComponentToJson(PriceComponent instance) =>
    <String, dynamic>{
      'type': instance.type,
      'price': instance.price,
      'stepSize': instance.stepSize,
    };

UserRegionResponse _$UserRegionResponseFromJson(Map<String, dynamic> json) =>
    UserRegionResponse(
      response: UserRegion.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserRegionResponseToJson(UserRegionResponse instance) =>
    <String, dynamic>{'response': instance.response};

UserRegion _$UserRegionFromJson(Map<String, dynamic> json) => UserRegion(
  region: json['region'] as String,
  fleetApiBaseUrl: json['fleet_api_base_url'] as String,
);

Map<String, dynamic> _$UserRegionToJson(UserRegion instance) =>
    <String, dynamic>{
      'region': instance.region,
      'fleet_api_base_url': instance.fleetApiBaseUrl,
    };

UserProfileResponse _$UserProfileResponseFromJson(Map<String, dynamic> json) =>
    UserProfileResponse(
      response: UserProfile.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserProfileResponseToJson(
  UserProfileResponse instance,
) => <String, dynamic>{'response': instance.response};

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => UserProfile(
  fullName: json['full_name'] as String,
  email: json['email'] as String,
  profileImageUrl: json['profile_image_url'] as String?,
);

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'email': instance.email,
      'profile_image_url': instance.profileImageUrl,
    };

ChargingHistoryResponse _$ChargingHistoryResponseFromJson(
  Map<String, dynamic> json,
) => ChargingHistoryResponse(
  response:
      (json['response'] as List<dynamic>?)
          ?.map((e) => ChargingHistoryEntry.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  count: (json['count'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ChargingHistoryResponseToJson(
  ChargingHistoryResponse instance,
) => <String, dynamic>{'response': instance.response, 'count': instance.count};

ChargingHistoryEntry _$ChargingHistoryEntryFromJson(
  Map<String, dynamic> json,
) => ChargingHistoryEntry(
  chargeStartDateTime: json['charge_start_date_time'] as String?,
  chargeStopDateTime: json['charge_stop_date_time'] as String?,
  energyKwh: _dynamicToDouble(json['energy_kwh']),
  totalCost: _dynamicToDouble(json['total_cost']),
  vin: json['vin'] as String?,
  locationId: json['location_id'] as String?,
);

Map<String, dynamic> _$ChargingHistoryEntryToJson(
  ChargingHistoryEntry instance,
) => <String, dynamic>{
  'charge_start_date_time': instance.chargeStartDateTime,
  'charge_stop_date_time': instance.chargeStopDateTime,
  'energy_kwh': instance.energyKwh,
  'total_cost': instance.totalCost,
  'vin': instance.vin,
  'location_id': instance.locationId,
};

TeslaProductResponse _$TeslaProductResponseFromJson(
  Map<String, dynamic> json,
) => TeslaProductResponse(
  response: (json['response'] as List<dynamic>)
      .map((e) => TeslaProduct.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TeslaProductResponseToJson(
  TeslaProductResponse instance,
) => <String, dynamic>{'response': instance.response};

TeslaProduct _$TeslaProductFromJson(Map<String, dynamic> json) => TeslaProduct(
  energySiteId: _dynamicToNullableString(json['energy_site_id']),
  resourceType: json['resource_type'] as String?,
  siteName: json['site_name'] as String?,
  id: _dynamicToNullableString(json['id']),
  vehicleId: _dynamicToInt(json['vehicle_id']),
  vin: json['vin'] as String?,
);

Map<String, dynamic> _$TeslaProductToJson(TeslaProduct instance) =>
    <String, dynamic>{
      'energy_site_id': instance.energySiteId,
      'resource_type': instance.resourceType,
      'site_name': instance.siteName,
      'id': instance.id,
      'vehicle_id': instance.vehicleId,
      'vin': instance.vin,
    };

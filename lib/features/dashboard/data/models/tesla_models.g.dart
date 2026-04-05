// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tesla_models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VehicleStateAdapter extends TypeAdapter<VehicleState> {
  @override
  final int typeId = 2;

  @override
  VehicleState read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VehicleState(
      odometer: fields[0] as double,
      carVersion: fields[1] as String,
      locked: fields[2] as bool,
      sentryMode: fields[3] as bool?,
      valetMode: fields[4] as bool,
      ft: fields[5] as int?,
      rt: fields[6] as int?,
      tpmsPressureFl: fields[7] as double?,
      tpmsPressureFr: fields[8] as double?,
      tpmsPressureRl: fields[9] as double?,
      tpmsPressureRr: fields[10] as double?,
      tpmsSoftWarningFl: fields[11] as bool?,
      tpmsSoftWarningFr: fields[12] as bool?,
      tpmsSoftWarningRl: fields[13] as bool?,
      tpmsSoftWarningRr: fields[14] as bool?,
      softwareUpdate: fields[15] as SoftwareUpdate?,
    );
  }

  @override
  void write(BinaryWriter writer, VehicleState obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.odometer)
      ..writeByte(1)
      ..write(obj.carVersion)
      ..writeByte(2)
      ..write(obj.locked)
      ..writeByte(3)
      ..write(obj.sentryMode)
      ..writeByte(4)
      ..write(obj.valetMode)
      ..writeByte(5)
      ..write(obj.ft)
      ..writeByte(6)
      ..write(obj.rt)
      ..writeByte(7)
      ..write(obj.tpmsPressureFl)
      ..writeByte(8)
      ..write(obj.tpmsPressureFr)
      ..writeByte(9)
      ..write(obj.tpmsPressureRl)
      ..writeByte(10)
      ..write(obj.tpmsPressureRr)
      ..writeByte(11)
      ..write(obj.tpmsSoftWarningFl)
      ..writeByte(12)
      ..write(obj.tpmsSoftWarningFr)
      ..writeByte(13)
      ..write(obj.tpmsSoftWarningRl)
      ..writeByte(14)
      ..write(obj.tpmsSoftWarningRr)
      ..writeByte(15)
      ..write(obj.softwareUpdate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VehicleStateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ChargingHistoryEntryAdapter extends TypeAdapter<ChargingHistoryEntry> {
  @override
  final int typeId = 7;

  @override
  ChargingHistoryEntry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChargingHistoryEntry(
      chargeStartDateTime: fields[0] as String?,
      chargeStopDateTime: fields[1] as String?,
      energyKwh: fields[2] as double,
      totalCost: fields[3] as double,
      vin: fields[4] as String?,
      locationId: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ChargingHistoryEntry obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.chargeStartDateTime)
      ..writeByte(1)
      ..write(obj.chargeStopDateTime)
      ..writeByte(2)
      ..write(obj.energyKwh)
      ..writeByte(3)
      ..write(obj.totalCost)
      ..writeByte(4)
      ..write(obj.vin)
      ..writeByte(5)
      ..write(obj.locationId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChargingHistoryEntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BatterySnapshotAdapter extends TypeAdapter<BatterySnapshot> {
  @override
  final int typeId = 3;

  @override
  BatterySnapshot read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BatterySnapshot(
      timestamp: fields[0] as DateTime,
      batteryLevel: fields[1] as int,
      batteryRange: fields[2] as double,
      idealBatteryRange: fields[3] as double,
      outsideTemp: fields[4] as double,
      batteryHeaterOn: fields[5] as bool,
      chargeLimitSoc: fields[6] as int,
      shiftState: fields[7] as String,
      odometer: fields[8] as double,
    );
  }

  @override
  void write(BinaryWriter writer, BatterySnapshot obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.timestamp)
      ..writeByte(1)
      ..write(obj.batteryLevel)
      ..writeByte(2)
      ..write(obj.batteryRange)
      ..writeByte(3)
      ..write(obj.idealBatteryRange)
      ..writeByte(4)
      ..write(obj.outsideTemp)
      ..writeByte(5)
      ..write(obj.batteryHeaterOn)
      ..writeByte(6)
      ..write(obj.chargeLimitSoc)
      ..writeByte(7)
      ..write(obj.shiftState)
      ..writeByte(8)
      ..write(obj.odometer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BatterySnapshotAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ChargeSessionAdapter extends TypeAdapter<ChargeSession> {
  @override
  final int typeId = 4;

  @override
  ChargeSession read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChargeSession(
      startTime: fields[0] as DateTime,
      endTime: fields[1] as DateTime,
      startSoc: fields[2] as double,
      endSoc: fields[3] as double,
      startRange: fields[4] as double,
      endRange: fields[5] as double,
      kwhAdded: fields[6] as double,
      chargerVoltage: fields[7] as double,
      chargerPhases: fields[8] as int,
      chargerPower: fields[9] as double,
      fastChargerType: fields[10] as String?,
      connChargeType: fields[11] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ChargeSession obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.startTime)
      ..writeByte(1)
      ..write(obj.endTime)
      ..writeByte(2)
      ..write(obj.startSoc)
      ..writeByte(3)
      ..write(obj.endSoc)
      ..writeByte(4)
      ..write(obj.startRange)
      ..writeByte(5)
      ..write(obj.endRange)
      ..writeByte(6)
      ..write(obj.kwhAdded)
      ..writeByte(7)
      ..write(obj.chargerVoltage)
      ..writeByte(8)
      ..write(obj.chargerPhases)
      ..writeByte(9)
      ..write(obj.chargerPower)
      ..writeByte(10)
      ..write(obj.fastChargerType)
      ..writeByte(11)
      ..write(obj.connChargeType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChargeSessionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DriveSessionAdapter extends TypeAdapter<DriveSession> {
  @override
  final int typeId = 5;

  @override
  DriveSession read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DriveSession(
      startTime: fields[0] as DateTime,
      endTime: fields[1] as DateTime,
      startOdometer: fields[2] as double,
      endOdometer: fields[3] as double,
      startSoc: fields[4] as double,
      endSoc: fields[5] as double,
      distance: fields[6] as double,
      energyUsedKwh: fields[7] as double,
      efficiencyScore: fields[8] as double,
      avgOutsideTemp: fields[9] as double,
    );
  }

  @override
  void write(BinaryWriter writer, DriveSession obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.startTime)
      ..writeByte(1)
      ..write(obj.endTime)
      ..writeByte(2)
      ..write(obj.startOdometer)
      ..writeByte(3)
      ..write(obj.endOdometer)
      ..writeByte(4)
      ..write(obj.startSoc)
      ..writeByte(5)
      ..write(obj.endSoc)
      ..writeByte(6)
      ..write(obj.distance)
      ..writeByte(7)
      ..write(obj.energyUsedKwh)
      ..writeByte(8)
      ..write(obj.efficiencyScore)
      ..writeByte(9)
      ..write(obj.avgOutsideTemp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DriveSessionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LocalVehicleInfoAdapter extends TypeAdapter<LocalVehicleInfo> {
  @override
  final int typeId = 6;

  @override
  LocalVehicleInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalVehicleInfo(
      firmwareVersion: fields[0] as String,
      odometer: fields[1] as double,
      tireFL: fields[2] as double,
      tireFR: fields[3] as double,
      tireRL: fields[4] as double,
      tireRR: fields[5] as double,
      lastUpdated: fields[6] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, LocalVehicleInfo obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.firmwareVersion)
      ..writeByte(1)
      ..write(obj.odometer)
      ..writeByte(2)
      ..write(obj.tireFL)
      ..writeByte(3)
      ..write(obj.tireFR)
      ..writeByte(4)
      ..write(obj.tireRL)
      ..writeByte(5)
      ..write(obj.tireRR)
      ..writeByte(6)
      ..write(obj.lastUpdated);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalVehicleInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VehicleCacheAdapter extends TypeAdapter<VehicleCache> {
  @override
  final int typeId = 8;

  @override
  VehicleCache read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VehicleCache(
      vin: fields[0] as String,
      batteryCapacityKwh: fields[1] as double?,
      originalRangeRating: fields[2] as double?,
      warrantyExpiryDate: fields[3] as DateTime?,
      warrantyMilesRemaining: fields[4] as double?,
      batteryType: fields[5] as String?,
      motorCount: fields[6] as int?,
      options: (fields[7] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, VehicleCache obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.vin)
      ..writeByte(1)
      ..write(obj.batteryCapacityKwh)
      ..writeByte(2)
      ..write(obj.originalRangeRating)
      ..writeByte(3)
      ..write(obj.warrantyExpiryDate)
      ..writeByte(4)
      ..write(obj.warrantyMilesRemaining)
      ..writeByte(5)
      ..write(obj.batteryType)
      ..writeByte(6)
      ..write(obj.motorCount)
      ..writeByte(7)
      ..write(obj.options);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VehicleCacheAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserPrefsAdapter extends TypeAdapter<UserPrefs> {
  @override
  final int typeId = 9;

  @override
  UserPrefs read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserPrefs(
      electricityRatePerKwh: fields[0] as double?,
      notificationsEnabled: fields[1] as bool?,
      preferredTheme: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserPrefs obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.electricityRatePerKwh)
      ..writeByte(1)
      ..write(obj.notificationsEnabled)
      ..writeByte(2)
      ..write(obj.preferredTheme);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserPrefsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeslaVehicleResponse _$TeslaVehicleResponseFromJson(
        Map<String, dynamic> json) =>
    TeslaVehicleResponse(
      response: (json['response'] as List<dynamic>)
          .map((e) => TeslaVehicle.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$TeslaVehicleResponseToJson(
        TeslaVehicleResponse instance) =>
    <String, dynamic>{
      'response': instance.response,
      'count': instance.count,
    };

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
        Map<String, dynamic> json) =>
    TeslaVehicleDataResponse(
      response:
          TeslaVehicleData.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TeslaVehicleDataResponseToJson(
        TeslaVehicleDataResponse instance) =>
    <String, dynamic>{
      'response': instance.response,
    };

TeslaVehicleData _$TeslaVehicleDataFromJson(Map<String, dynamic> json) =>
    TeslaVehicleData(
      chargeState: json['charge_state'] == null
          ? null
          : ChargeState.fromJson(json['charge_state'] as Map<String, dynamic>),
      climateState: json['climate_state'] == null
          ? null
          : ClimateState.fromJson(
              json['climate_state'] as Map<String, dynamic>),
      vehicleState: json['vehicle_state'] == null
          ? null
          : VehicleState.fromJson(
              json['vehicle_state'] as Map<String, dynamic>),
      driveState: json['drive_state'] == null
          ? null
          : DriveState.fromJson(json['drive_state'] as Map<String, dynamic>),
      guiSettings: json['gui_settings'] == null
          ? null
          : GuiSettings.fromJson(json['gui_settings'] as Map<String, dynamic>),
      vehicleConfig: json['vehicle_config'] == null
          ? null
          : VehicleConfig.fromJson(
              json['vehicle_config'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TeslaVehicleDataToJson(TeslaVehicleData instance) =>
    <String, dynamic>{
      'charge_state': instance.chargeState,
      'climate_state': instance.climateState,
      'vehicle_state': instance.vehicleState,
      'drive_state': instance.driveState,
      'gui_settings': instance.guiSettings,
      'vehicle_config': instance.vehicleConfig,
    };

GuiSettings _$GuiSettingsFromJson(Map<String, dynamic> json) => GuiSettings(
      distanceUnits: json['gui_distance_units'] as String?,
      temperatureUnits: json['gui_temperature_units'] as String?,
      pressureUnits: json['gui_tire_pressure_units'] as String?,
      chargeRateUnits: json['gui_charge_rate_units'] as String?,
      is24HourTime: json['gui_24_hour_time'] as bool?,
      showRangeUnits: json['show_range_units'] as bool?,
    );

Map<String, dynamic> _$GuiSettingsToJson(GuiSettings instance) =>
    <String, dynamic>{
      'gui_distance_units': instance.distanceUnits,
      'gui_temperature_units': instance.temperatureUnits,
      'gui_tire_pressure_units': instance.pressureUnits,
      'gui_charge_rate_units': instance.chargeRateUnits,
      'gui_24_hour_time': instance.is24HourTime,
      'show_range_units': instance.showRangeUnits,
    };

ChargeState _$ChargeStateFromJson(Map<String, dynamic> json) => ChargeState(
      batteryLevel: _dynamicToInt(json['battery_level']),
      batteryRange: _dynamicToDouble(json['battery_range']),
      idealBatteryRange: json['ideal_battery_range'] == null
          ? 0.0
          : _dynamicToDouble(json['ideal_battery_range']),
      estBatteryRange: json['est_battery_range'] == null
          ? 0.0
          : _dynamicToDouble(json['est_battery_range']),
      energyLeft: _dynamicToDouble(json['energy_left']),
      chargeLimitSoc: _dynamicToInt(json['charge_limit_soc']),
      chargeCurrentRequest: _dynamicToInt(json['charge_current_request']),
      chargingState: _dynamicToString(json['charging_state']),
      chargeRate: json['charge_rate'] == null
          ? 0.0
          : _dynamicToDouble(json['charge_rate']),
      chargerPower: _dynamicToNullableInt(json['charger_power']),
      chargerVoltage: _dynamicToNullableInt(json['charger_voltage']),
      chargerPhases: _dynamicToNullableInt(json['charger_phases']),
      chargeEnergyAdded: json['charge_energy_added'] == null
          ? 0.0
          : _dynamicToDouble(json['charge_energy_added']),
      timeToFullCharge: json['time_to_full_charge'] == null
          ? 0.0
          : _dynamicToDouble(json['time_to_full_charge']),
      batteryHeaterOn: json['battery_heater_on'] as bool? ?? false,
      fastChargerType: _dynamicToString(json['fast_charger_type']),
      connChargeType: _dynamicToString(json['conn_charge_cable']),
    );

Map<String, dynamic> _$ChargeStateToJson(ChargeState instance) =>
    <String, dynamic>{
      'battery_level': instance.batteryLevel,
      'battery_range': instance.batteryRange,
      'ideal_battery_range': instance.idealBatteryRange,
      'est_battery_range': instance.estBatteryRange,
      'energy_left': instance.energyLeft,
      'charge_limit_soc': instance.chargeLimitSoc,
      'charge_current_request': instance.chargeCurrentRequest,
      'charging_state': instance.chargingState,
      'charge_rate': instance.chargeRate,
      'charger_power': instance.chargerPower,
      'charger_voltage': instance.chargerVoltage,
      'charger_phases': instance.chargerPhases,
      'charge_energy_added': instance.chargeEnergyAdded,
      'time_to_full_charge': instance.timeToFullCharge,
      'battery_heater_on': instance.batteryHeaterOn,
      'fast_charger_type': instance.fastChargerType,
      'conn_charge_cable': instance.connChargeType,
    };

ClimateState _$ClimateStateFromJson(Map<String, dynamic> json) => ClimateState(
      insideTemp: _dynamicToDouble(json['inside_temp']),
      outsideTemp: _dynamicToDouble(json['outside_temp']),
      driverTempSetting: _dynamicToDouble(json['driver_temp_setting']),
      passengerTempSetting: _dynamicToDouble(json['passenger_temp_setting']),
      isClimateOn: json['is_climate_on'] as bool,
      batteryHeaterOn: json['battery_heater'] as bool? ?? false,
      fanStatus:
          json['fan_status'] == null ? 0 : _dynamicToInt(json['fan_status']),
    );

Map<String, dynamic> _$ClimateStateToJson(ClimateState instance) =>
    <String, dynamic>{
      'inside_temp': instance.insideTemp,
      'outside_temp': instance.outsideTemp,
      'driver_temp_setting': instance.driverTempSetting,
      'passenger_temp_setting': instance.passengerTempSetting,
      'is_climate_on': instance.isClimateOn,
      'battery_heater': instance.batteryHeaterOn,
      'fan_status': instance.fanStatus,
    };

VehicleState _$VehicleStateFromJson(Map<String, dynamic> json) => VehicleState(
      odometer: _dynamicToDouble(json['odometer']),
      carVersion: _dynamicToString(json['car_version']),
      locked: json['locked'] as bool,
      sentryMode: json['sentry_mode'] as bool?,
      valetMode: json['valet_mode'] as bool,
      ft: (json['ft'] as num?)?.toInt(),
      rt: (json['rt'] as num?)?.toInt(),
      tpmsPressureFl: _dynamicToDouble(json['tpms_pressure_fl']),
      tpmsPressureFr: _dynamicToDouble(json['tpms_pressure_fr']),
      tpmsPressureRl: _dynamicToDouble(json['tpms_pressure_rl']),
      tpmsPressureRr: _dynamicToDouble(json['tpms_pressure_rr']),
      tpmsSoftWarningFl: json['tpms_soft_warning_fl'] as bool?,
      tpmsSoftWarningFr: json['tpms_soft_warning_fr'] as bool?,
      tpmsSoftWarningRl: json['tpms_soft_warning_rl'] as bool?,
      tpmsSoftWarningRr: json['tpms_soft_warning_rr'] as bool?,
      softwareUpdate: json['software_update'] == null
          ? null
          : SoftwareUpdate.fromJson(
              json['software_update'] as Map<String, dynamic>),
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
      'tpms_pressure_fl': instance.tpmsPressureFl,
      'tpms_pressure_fr': instance.tpmsPressureFr,
      'tpms_pressure_rl': instance.tpmsPressureRl,
      'tpms_pressure_rr': instance.tpmsPressureRr,
      'tpms_soft_warning_fl': instance.tpmsSoftWarningFl,
      'tpms_soft_warning_fr': instance.tpmsSoftWarningFr,
      'tpms_soft_warning_rl': instance.tpmsSoftWarningRl,
      'tpms_soft_warning_rr': instance.tpmsSoftWarningRr,
      'software_update': instance.softwareUpdate,
    };

DriveState _$DriveStateFromJson(Map<String, dynamic> json) => DriveState(
      latitude: _dynamicToDouble(json['latitude']),
      longitude: _dynamicToDouble(json['longitude']),
      speed: _dynamicToDouble(json['speed']),
      shiftState: _dynamicToNullableString(json['shift_state']),
      heading: json['heading'] == null ? 0 : _dynamicToInt(json['heading']),
      gpsAsOf: json['gps_as_of'] == null ? 0 : _dynamicToInt(json['gps_as_of']),
      power: json['power'] == null ? 0 : _dynamicToInt(json['power']),
    );

Map<String, dynamic> _$DriveStateToJson(DriveState instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'speed': instance.speed,
      'shift_state': instance.shiftState,
      'heading': instance.heading,
      'gps_as_of': instance.gpsAsOf,
      'power': instance.power,
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
              json['coordinates'] as Map<String, dynamic>),
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
        ChargingCoordinates instance) =>
    <String, dynamic>{
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
    <String, dynamic>{
      'price_components': instance.priceComponents,
    };

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
    <String, dynamic>{
      'response': instance.response,
    };

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
        UserProfileResponse instance) =>
    <String, dynamic>{
      'response': instance.response,
    };

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
        Map<String, dynamic> json) =>
    ChargingHistoryResponse(
      response: (json['response'] as List<dynamic>?)
              ?.map((e) =>
                  ChargingHistoryEntry.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      count: (json['count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ChargingHistoryResponseToJson(
        ChargingHistoryResponse instance) =>
    <String, dynamic>{
      'response': instance.response,
      'count': instance.count,
    };

ChargingHistoryEntry _$ChargingHistoryEntryFromJson(
        Map<String, dynamic> json) =>
    ChargingHistoryEntry(
      chargeStartDateTime: json['charge_start_date_time'] as String?,
      chargeStopDateTime: json['charge_stop_date_time'] as String?,
      energyKwh: _dynamicToDouble(json['energy_kwh']),
      totalCost: _dynamicToDouble(json['total_cost']),
      vin: json['vin'] as String?,
      locationId: json['location_id'] as String?,
    );

Map<String, dynamic> _$ChargingHistoryEntryToJson(
        ChargingHistoryEntry instance) =>
    <String, dynamic>{
      'charge_start_date_time': instance.chargeStartDateTime,
      'charge_stop_date_time': instance.chargeStopDateTime,
      'energy_kwh': instance.energyKwh,
      'total_cost': instance.totalCost,
      'vin': instance.vin,
      'location_id': instance.locationId,
    };

TeslaProductResponse _$TeslaProductResponseFromJson(
        Map<String, dynamic> json) =>
    TeslaProductResponse(
      response: (json['response'] as List<dynamic>)
          .map((e) => TeslaProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TeslaProductResponseToJson(
        TeslaProductResponse instance) =>
    <String, dynamic>{
      'response': instance.response,
    };

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

BatterySnapshot _$BatterySnapshotFromJson(Map<String, dynamic> json) =>
    BatterySnapshot(
      timestamp: DateTime.parse(json['timestamp'] as String),
      batteryLevel: (json['batteryLevel'] as num).toInt(),
      batteryRange: (json['batteryRange'] as num).toDouble(),
      idealBatteryRange: (json['idealBatteryRange'] as num).toDouble(),
      outsideTemp: (json['outsideTemp'] as num).toDouble(),
      batteryHeaterOn: json['batteryHeaterOn'] as bool,
      chargeLimitSoc: (json['chargeLimitSoc'] as num).toInt(),
      shiftState: json['shiftState'] as String,
      odometer: (json['odometer'] as num).toDouble(),
    );

Map<String, dynamic> _$BatterySnapshotToJson(BatterySnapshot instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp.toIso8601String(),
      'batteryLevel': instance.batteryLevel,
      'batteryRange': instance.batteryRange,
      'idealBatteryRange': instance.idealBatteryRange,
      'outsideTemp': instance.outsideTemp,
      'batteryHeaterOn': instance.batteryHeaterOn,
      'chargeLimitSoc': instance.chargeLimitSoc,
      'shiftState': instance.shiftState,
      'odometer': instance.odometer,
    };

ChargeSession _$ChargeSessionFromJson(Map<String, dynamic> json) =>
    ChargeSession(
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      startSoc: (json['startSoc'] as num).toDouble(),
      endSoc: (json['endSoc'] as num).toDouble(),
      startRange: (json['startRange'] as num).toDouble(),
      endRange: (json['endRange'] as num).toDouble(),
      kwhAdded: (json['kwhAdded'] as num).toDouble(),
      chargerVoltage: (json['chargerVoltage'] as num).toDouble(),
      chargerPhases: (json['chargerPhases'] as num).toInt(),
      chargerPower: (json['chargerPower'] as num).toDouble(),
      fastChargerType: json['fastChargerType'] as String?,
      connChargeType: json['connChargeType'] as String?,
    );

Map<String, dynamic> _$ChargeSessionToJson(ChargeSession instance) =>
    <String, dynamic>{
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'startSoc': instance.startSoc,
      'endSoc': instance.endSoc,
      'startRange': instance.startRange,
      'endRange': instance.endRange,
      'kwhAdded': instance.kwhAdded,
      'chargerVoltage': instance.chargerVoltage,
      'chargerPhases': instance.chargerPhases,
      'chargerPower': instance.chargerPower,
      'fastChargerType': instance.fastChargerType,
      'connChargeType': instance.connChargeType,
    };

DriveSession _$DriveSessionFromJson(Map<String, dynamic> json) => DriveSession(
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      startOdometer: (json['startOdometer'] as num).toDouble(),
      endOdometer: (json['endOdometer'] as num).toDouble(),
      startSoc: (json['startSoc'] as num).toDouble(),
      endSoc: (json['endSoc'] as num).toDouble(),
      distance: (json['distance'] as num).toDouble(),
      energyUsedKwh: (json['energyUsedKwh'] as num).toDouble(),
      efficiencyScore: (json['efficiencyScore'] as num).toDouble(),
      avgOutsideTemp: (json['avgOutsideTemp'] as num).toDouble(),
    );

Map<String, dynamic> _$DriveSessionToJson(DriveSession instance) =>
    <String, dynamic>{
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'startOdometer': instance.startOdometer,
      'endOdometer': instance.endOdometer,
      'startSoc': instance.startSoc,
      'endSoc': instance.endSoc,
      'distance': instance.distance,
      'energyUsedKwh': instance.energyUsedKwh,
      'efficiencyScore': instance.efficiencyScore,
      'avgOutsideTemp': instance.avgOutsideTemp,
    };

LocalVehicleInfo _$LocalVehicleInfoFromJson(Map<String, dynamic> json) =>
    LocalVehicleInfo(
      firmwareVersion: json['firmwareVersion'] as String,
      odometer: (json['odometer'] as num).toDouble(),
      tireFL: (json['tireFL'] as num).toDouble(),
      tireFR: (json['tireFR'] as num).toDouble(),
      tireRL: (json['tireRL'] as num).toDouble(),
      tireRR: (json['tireRR'] as num).toDouble(),
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$LocalVehicleInfoToJson(LocalVehicleInfo instance) =>
    <String, dynamic>{
      'firmwareVersion': instance.firmwareVersion,
      'odometer': instance.odometer,
      'tireFL': instance.tireFL,
      'tireFR': instance.tireFR,
      'tireRL': instance.tireRL,
      'tireRR': instance.tireRR,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
    };

VehicleCache _$VehicleCacheFromJson(Map<String, dynamic> json) => VehicleCache(
      vin: json['vin'] as String,
      batteryCapacityKwh: (json['batteryCapacityKwh'] as num?)?.toDouble(),
      originalRangeRating: (json['originalRangeRating'] as num?)?.toDouble(),
      warrantyExpiryDate: json['warrantyExpiryDate'] == null
          ? null
          : DateTime.parse(json['warrantyExpiryDate'] as String),
      warrantyMilesRemaining:
          (json['warrantyMilesRemaining'] as num?)?.toDouble(),
      batteryType: json['batteryType'] as String?,
      motorCount: (json['motorCount'] as num?)?.toInt(),
      options:
          (json['options'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$VehicleCacheToJson(VehicleCache instance) =>
    <String, dynamic>{
      'vin': instance.vin,
      'batteryCapacityKwh': instance.batteryCapacityKwh,
      'originalRangeRating': instance.originalRangeRating,
      'warrantyExpiryDate': instance.warrantyExpiryDate?.toIso8601String(),
      'warrantyMilesRemaining': instance.warrantyMilesRemaining,
      'batteryType': instance.batteryType,
      'motorCount': instance.motorCount,
      'options': instance.options,
    };

SoftwareUpdate _$SoftwareUpdateFromJson(Map<String, dynamic> json) =>
    SoftwareUpdate(
      expectedDurationSec: _dynamicToInt(json['expected_duration_sec']),
      status: _dynamicToString(json['status']),
      version: _dynamicToString(json['version']),
      installPerc: json['install_perc'] == null
          ? 0
          : _dynamicToInt(json['install_perc']),
    );

Map<String, dynamic> _$SoftwareUpdateToJson(SoftwareUpdate instance) =>
    <String, dynamic>{
      'expected_duration_sec': instance.expectedDurationSec,
      'status': instance.status,
      'version': instance.version,
      'install_perc': instance.installPerc,
    };

VehicleConfig _$VehicleConfigFromJson(Map<String, dynamic> json) =>
    VehicleConfig(
      carType: _dynamicToString(json['car_type']),
      chargePortType: _dynamicToString(json['charge_port_type']),
      exteriorColor: _dynamicToString(json['exterior_color']),
      roofColor: _dynamicToString(json['roof_color']),
      wheelType: _dynamicToString(json['wheel_type']),
    );

Map<String, dynamic> _$VehicleConfigToJson(VehicleConfig instance) =>
    <String, dynamic>{
      'car_type': instance.carType,
      'charge_port_type': instance.chargePortType,
      'exterior_color': instance.exteriorColor,
      'roof_color': instance.roofColor,
      'wheel_type': instance.wheelType,
    };

import 'package:equatable/equatable.dart';

class Vehicle extends Equatable {
  final String id;
  final String vehicleId;
  final String vin;
  final String? displayName;
  final String? optionCodes;
  final String? color;
  final String state;
  final int batteryLevel;
  final double batteryRange;
  final double idealBatteryRange;
  final double estBatteryRange;
  final double outsideTemp;
  final double insideTemp;
  final double odometer;
  
  // Status Flags
  final bool isLocked;
  final bool isClimateOn;
  final bool isSentryModeOn;
  final bool isValetModeOn;
  final bool batteryHeaterOn;
  final int chargeLimitSoc;
  final String? shiftState;
  final int frontTrunkState; // 0: closed, 1: open
  final int rearTrunkState;  // 0: closed, 1: open or 2: partially open

  // Charging State (from charge_state)
  final String chargingState; // "Charging", "Complete", "Disconnected", "Stopped", "NoPower"
  final double chargeRate; // mi/hr or km/hr depending on gui_settings
  final double chargeEnergyAdded; // kWh added in current session
  final double timeToFullCharge; // hours remaining (double)
  final double chargerPower; // kW
  final double chargerVoltage; // V
  final int chargerPhases;
  final String? fastChargerType;
  final String? connChargeCable;

  // Drive State (from drive_state)
  final double speed;
  final double power; // kW at wheels
  final double latitude;
  final double longitude;
  final int heading;

  // Climate Control
  final double? driverTemp;
  final double? passengerTemp;
  final int fanStatus;
  final int seatHeaterLeft;   // 0=off, 1=low, 2=med, 3=high
  final int seatHeaterRight;
  final bool steeringWheelHeater;
  final bool frontDefrosterOn;

  // TPMS (Tire Pressure)
  final double? tpmsPressureFl;
  final double? tpmsPressureFr;
  final double? tpmsPressureRl;
  final double? tpmsPressureRr;

  // Vehicle Info
  final String softwareVersion;
  final String? softwareUpdateStatus;   // "available", "downloading", "installing", ""
  final String? softwareUpdateVersion;  // e.g. "2024.44.32"
  final int softwareUpdateProgress;     // 0-100 install percentage

  // Climate Keeper Mode: "dog", "camp", "on", "off"
  final String climateKeeperMode;

  // Charging Extended
  final String? scheduledChargingMode; // "Off", "StartAt", "DepartBy"
  final int? scheduledChargingStartTime; // Unix timestamp
  final bool chargePortOpen;
  final int chargeCurrentRequest; // Requested charge amps

  // Unit Preferences
  final bool useFahrenheit;
  final bool useMiles;
  final String? pressureUnit; // "Psi", "Bar", "kPa"

  const Vehicle({
    required this.id,
    required this.vehicleId,
    required this.vin,
    this.displayName,
    this.optionCodes,
    this.color,
    required this.state,
    required this.batteryLevel,
    required this.batteryRange,
    this.idealBatteryRange = 0.0,
    this.estBatteryRange = 0.0,
    required this.outsideTemp,
    required this.insideTemp,
    required this.odometer,
    this.isLocked = true,
    this.isClimateOn = false,
    this.isSentryModeOn = false,
    this.isValetModeOn = false,
    this.batteryHeaterOn = false,
    this.chargeLimitSoc = 80,
    this.shiftState = 'P',
    this.frontTrunkState = 0,
    this.rearTrunkState = 0,
    // Charging
    this.chargingState = 'Disconnected',
    this.chargeRate = 0.0,
    this.chargeEnergyAdded = 0.0,
    this.timeToFullCharge = 0.0,
    this.chargerPower = 0.0,
    this.chargerVoltage = 0.0,
    this.chargerPhases = 0,
    this.fastChargerType,
    this.connChargeCable,
    // Drive
    this.speed = 0.0,
    this.power = 0.0,
    this.latitude = 0.0,
    this.longitude = 0.0,
    this.heading = 0,
    // Climate
    this.driverTemp,
    this.passengerTemp,
    this.fanStatus = 0,
    this.seatHeaterLeft = 0,
    this.seatHeaterRight = 0,
    this.steeringWheelHeater = false,
    this.frontDefrosterOn = false,
    // TPMS
    this.tpmsPressureFl,
    this.tpmsPressureFr,
    this.tpmsPressureRl,
    this.tpmsPressureRr,
    // Vehicle Info
    this.softwareVersion = '',
    this.softwareUpdateStatus,
    this.softwareUpdateVersion,
    this.softwareUpdateProgress = 0,
    // Climate Keeper
    this.climateKeeperMode = 'off',
    // Charging Extended
    this.scheduledChargingMode,
    this.scheduledChargingStartTime,
    this.chargePortOpen = false,
    this.chargeCurrentRequest = 0,
    // Units
    this.useFahrenheit = false,
    this.useMiles = false,
    this.pressureUnit = 'Psi',
  });

  @override
  List<Object?> get props => [
        id,
        vehicleId,
        vin,
        displayName,
        optionCodes,
        color,
        state,
        batteryLevel,
        batteryRange,
        idealBatteryRange,
        estBatteryRange,
        outsideTemp,
        insideTemp,
        odometer,
        isLocked,
        isClimateOn,
        isSentryModeOn,
        isValetModeOn,
        batteryHeaterOn,
        chargeLimitSoc,
        shiftState,
        frontTrunkState,
        rearTrunkState,
        chargingState,
        chargeRate,
        chargeEnergyAdded,
        timeToFullCharge,
        chargerPower,
        chargerVoltage,
        chargerPhases,
        fastChargerType,
        connChargeCable,
        speed,
        power,
        latitude,
        longitude,
        heading,
        driverTemp,
        passengerTemp,
        fanStatus,
        seatHeaterLeft,
        seatHeaterRight,
        steeringWheelHeater,
        frontDefrosterOn,
        tpmsPressureFl,
        tpmsPressureFr,
        tpmsPressureRl,
        tpmsPressureRr,
        softwareVersion,
        softwareUpdateStatus,
        softwareUpdateVersion,
        softwareUpdateProgress,
        climateKeeperMode,
        scheduledChargingMode,
        scheduledChargingStartTime,
        chargePortOpen,
        chargeCurrentRequest,
        useFahrenheit,
        useMiles,
        pressureUnit,
      ];

  Vehicle copyWith({
    String? id,
    String? vehicleId,
    String? vin,
    String? displayName,
    String? optionCodes,
    String? color,
    String? state,
    int? batteryLevel,
    double? batteryRange,
    double? idealBatteryRange,
    double? estBatteryRange,
    double? outsideTemp,
    double? insideTemp,
    double? odometer,
    bool? isLocked,
    bool? isClimateOn,
    bool? isSentryModeOn,
    bool? isValetModeOn,
    bool? batteryHeaterOn,
    int? chargeLimitSoc,
    String? shiftState,
    int? frontTrunkState,
    int? rearTrunkState,
    String? chargingState,
    double? chargeRate,
    double? chargeEnergyAdded,
    double? timeToFullCharge,
    double? chargerPower,
    double? chargerVoltage,
    int? chargerPhases,
    String? fastChargerType,
    String? connChargeCable,
    double? speed,
    double? power,
    double? latitude,
    double? longitude,
    int? heading,
    double? driverTemp,
    double? passengerTemp,
    int? fanStatus,
    int? seatHeaterLeft,
    int? seatHeaterRight,
    bool? steeringWheelHeater,
    bool? frontDefrosterOn,
    double? tpmsPressureFl,
    double? tpmsPressureFr,
    double? tpmsPressureRl,
    double? tpmsPressureRr,
    String? softwareVersion,
    String? softwareUpdateStatus,
    String? softwareUpdateVersion,
    int? softwareUpdateProgress,
    String? climateKeeperMode,
    String? scheduledChargingMode,
    int? scheduledChargingStartTime,
    bool? chargePortOpen,
    int? chargeCurrentRequest,
    bool? useFahrenheit,
    bool? useMiles,
    String? pressureUnit,
  }) {
    return Vehicle(
      id: id ?? this.id,
      vehicleId: vehicleId ?? this.vehicleId,
      vin: vin ?? this.vin,
      displayName: displayName ?? this.displayName,
      optionCodes: optionCodes ?? this.optionCodes,
      color: color ?? this.color,
      state: state ?? this.state,
      batteryLevel: batteryLevel ?? this.batteryLevel,
      batteryRange: batteryRange ?? this.batteryRange,
      idealBatteryRange: idealBatteryRange ?? this.idealBatteryRange,
      estBatteryRange: estBatteryRange ?? this.estBatteryRange,
      outsideTemp: outsideTemp ?? this.outsideTemp,
      insideTemp: insideTemp ?? this.insideTemp,
      odometer: odometer ?? this.odometer,
      isLocked: isLocked ?? this.isLocked,
      isClimateOn: isClimateOn ?? this.isClimateOn,
      isSentryModeOn: isSentryModeOn ?? this.isSentryModeOn,
      isValetModeOn: isValetModeOn ?? this.isValetModeOn,
      batteryHeaterOn: batteryHeaterOn ?? this.batteryHeaterOn,
      chargeLimitSoc: chargeLimitSoc ?? this.chargeLimitSoc,
      shiftState: shiftState ?? this.shiftState,
      frontTrunkState: frontTrunkState ?? this.frontTrunkState,
      rearTrunkState: rearTrunkState ?? this.rearTrunkState,
      chargingState: chargingState ?? this.chargingState,
      chargeRate: chargeRate ?? this.chargeRate,
      chargeEnergyAdded: chargeEnergyAdded ?? this.chargeEnergyAdded,
      timeToFullCharge: timeToFullCharge ?? this.timeToFullCharge,
      chargerPower: chargerPower ?? this.chargerPower,
      chargerVoltage: chargerVoltage ?? this.chargerVoltage,
      chargerPhases: chargerPhases ?? this.chargerPhases,
      fastChargerType: fastChargerType ?? this.fastChargerType,
      connChargeCable: connChargeCable ?? this.connChargeCable,
      speed: speed ?? this.speed,
      power: power ?? this.power,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      heading: heading ?? this.heading,
      driverTemp: driverTemp ?? this.driverTemp,
      passengerTemp: passengerTemp ?? this.passengerTemp,
      fanStatus: fanStatus ?? this.fanStatus,
      seatHeaterLeft: seatHeaterLeft ?? this.seatHeaterLeft,
      seatHeaterRight: seatHeaterRight ?? this.seatHeaterRight,
      steeringWheelHeater: steeringWheelHeater ?? this.steeringWheelHeater,
      frontDefrosterOn: frontDefrosterOn ?? this.frontDefrosterOn,
      tpmsPressureFl: tpmsPressureFl ?? this.tpmsPressureFl,
      tpmsPressureFr: tpmsPressureFr ?? this.tpmsPressureFr,
      tpmsPressureRl: tpmsPressureRl ?? this.tpmsPressureRl,
      tpmsPressureRr: tpmsPressureRr ?? this.tpmsPressureRr,
      softwareVersion: softwareVersion ?? this.softwareVersion,
      softwareUpdateStatus: softwareUpdateStatus ?? this.softwareUpdateStatus,
      softwareUpdateVersion: softwareUpdateVersion ?? this.softwareUpdateVersion,
      softwareUpdateProgress: softwareUpdateProgress ?? this.softwareUpdateProgress,
      climateKeeperMode: climateKeeperMode ?? this.climateKeeperMode,
      scheduledChargingMode: scheduledChargingMode ?? this.scheduledChargingMode,
      scheduledChargingStartTime: scheduledChargingStartTime ?? this.scheduledChargingStartTime,
      chargePortOpen: chargePortOpen ?? this.chargePortOpen,
      chargeCurrentRequest: chargeCurrentRequest ?? this.chargeCurrentRequest,
      useFahrenheit: useFahrenheit ?? this.useFahrenheit,
      useMiles: useMiles ?? this.useMiles,
      pressureUnit: pressureUnit ?? this.pressureUnit,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'vehicle_id': vehicleId,
        'vin': vin,
        'display_name': displayName,
        'option_codes': optionCodes,
        'color': color,
        'state': state,
        'battery_level': batteryLevel,
        'battery_range': batteryRange,
        'ideal_battery_range': idealBatteryRange,
        'est_battery_range': estBatteryRange,
        'outside_temp': outsideTemp,
        'inside_temp': insideTemp,
        'odometer': odometer,
        'is_locked': isLocked,
        'is_climate_on': isClimateOn,
        'is_sentry_mode_on': isSentryModeOn,
        'is_valet_mode_on': isValetModeOn,
        'battery_heater_on': batteryHeaterOn,
        'charge_limit_soc': chargeLimitSoc,
        'shift_state': shiftState,
        'front_trunk_state': frontTrunkState,
        'rear_trunk_state': rearTrunkState,
        'charging_state': chargingState,
        'charge_rate': chargeRate,
        'charge_energy_added': chargeEnergyAdded,
        'time_to_full_charge': timeToFullCharge,
        'charger_power': chargerPower,
        'charger_voltage': chargerVoltage,
        'charger_phases': chargerPhases,
        'fast_charger_type': fastChargerType,
        'conn_charge_cable': connChargeCable,
        'speed': speed,
        'power': power,
        'latitude': latitude,
        'longitude': longitude,
        'heading': heading,
        'driver_temp': driverTemp,
        'passenger_temp': passengerTemp,
        'fan_status': fanStatus,
        'seat_heater_left': seatHeaterLeft,
        'seat_heater_right': seatHeaterRight,
        'steering_wheel_heater': steeringWheelHeater,
        'front_defroster_on': frontDefrosterOn,
        'tpms_pressure_fl': tpmsPressureFl,
        'tpms_pressure_fr': tpmsPressureFr,
        'tpms_pressure_rl': tpmsPressureRl,
        'tpms_pressure_rr': tpmsPressureRr,
        'software_version': softwareVersion,
        'software_update_status': softwareUpdateStatus,
        'software_update_version': softwareUpdateVersion,
        'software_update_progress': softwareUpdateProgress,
        'climate_keeper_mode': climateKeeperMode,
        'scheduled_charging_mode': scheduledChargingMode,
        'scheduled_charging_start_time': scheduledChargingStartTime,
        'charge_port_open': chargePortOpen,
        'charge_current_request': chargeCurrentRequest,
        'use_fahrenheit': useFahrenheit,
        'use_miles': useMiles,
        'pressure_unit': pressureUnit,
      };
}

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

  // Climate Control
  final double? driverTemp;
  final double? passengerTemp;

  // TPMS (Tire Pressure)
  final double? tpmsPressureFl;
  final double? tpmsPressureFr;
  final double? tpmsPressureRl;
  final double? tpmsPressureRr;

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
    this.tpmsPressureFl,
    this.tpmsPressureFr,
    this.tpmsPressureRl,
    this.tpmsPressureRr,
    this.driverTemp,
    this.passengerTemp,
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
        tpmsPressureFl,
        tpmsPressureFr,
        tpmsPressureRl,
        tpmsPressureRr,
        driverTemp,
        passengerTemp,
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
    double? tpmsPressureFl,
    double? tpmsPressureFr,
    double? tpmsPressureRl,
    double? tpmsPressureRr,
    double? driverTemp,
    double? passengerTemp,
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
      tpmsPressureFl: tpmsPressureFl ?? this.tpmsPressureFl,
      tpmsPressureFr: tpmsPressureFr ?? this.tpmsPressureFr,
      tpmsPressureRl: tpmsPressureRl ?? this.tpmsPressureRl,
      tpmsPressureRr: tpmsPressureRr ?? this.tpmsPressureRr,
      driverTemp: driverTemp ?? this.driverTemp,
      passengerTemp: passengerTemp ?? this.passengerTemp,
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
        'tpms_pressure_fl': tpmsPressureFl,
        'tpms_pressure_fr': tpmsPressureFr,
        'tpms_pressure_rl': tpmsPressureRl,
        'tpms_pressure_rr': tpmsPressureRr,
        'driver_temp': driverTemp,
        'passenger_temp': passengerTemp,
        'use_fahrenheit': useFahrenheit,
        'use_miles': useMiles,
        'pressure_unit': pressureUnit,
      };
}

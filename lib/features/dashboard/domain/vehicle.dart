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
  final double outsideTemp;
  final double insideTemp;
  final double odometer;
  
  // Status Flags
  final bool isLocked;
  final bool isClimateOn;
  final bool isSentryModeOn;
  final bool isValetModeOn;
  final int frontTrunkState; // 0: closed, 1: open
  final int rearTrunkState;  // 0: closed, 1: open or 2: partially open

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
    required this.outsideTemp,
    required this.insideTemp,
    required this.odometer,
    this.isLocked = true,
    this.isClimateOn = false,
    this.isSentryModeOn = false,
    this.isValetModeOn = false,
    this.frontTrunkState = 0,
    this.rearTrunkState = 0,
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
        outsideTemp,
        insideTemp,
        odometer,
        isLocked,
        isClimateOn,
        isSentryModeOn,
        isValetModeOn,
        frontTrunkState,
        rearTrunkState,
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
    double? outsideTemp,
    double? insideTemp,
    double? odometer,
    bool? isLocked,
    bool? isClimateOn,
    bool? isSentryModeOn,
    bool? isValetModeOn,
    int? frontTrunkState,
    int? rearTrunkState,
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
      outsideTemp: outsideTemp ?? this.outsideTemp,
      insideTemp: insideTemp ?? this.insideTemp,
      odometer: odometer ?? this.odometer,
      isLocked: isLocked ?? this.isLocked,
      isClimateOn: isClimateOn ?? this.isClimateOn,
      isSentryModeOn: isSentryModeOn ?? this.isSentryModeOn,
      isValetModeOn: isValetModeOn ?? this.isValetModeOn,
      frontTrunkState: frontTrunkState ?? this.frontTrunkState,
      rearTrunkState: rearTrunkState ?? this.rearTrunkState,
    );
  }
}

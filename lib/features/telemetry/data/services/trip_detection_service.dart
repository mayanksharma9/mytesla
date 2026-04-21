import 'dart:async';
import 'package:flutter/foundation.dart';
import '../../../dashboard/data/models/tesla_models.dart';
import '../../domain/repositories/telemetry_repository.dart';

class TripDetectionService {
  final TelemetryRepository _telemetryRepository;
  
  // Trip state
  String? _lastShiftState;
  double? _startOdometer;
  double? _startSoc;
  DateTime? _startTime;
  double _totalEnergyUsed = 0.0;
  List<double> _outsideTemps = [];

  // Charging state
  String? _lastChargingState;
  DateTime? _chargeStartTime;
  double? _chargeStartSoc;
  double? _chargeStartRange;
  final List<double> _chargePowerReadings = [];
  final List<double> _chargeSocReadings = [];

  TripDetectionService(this._telemetryRepository);

  /// Process a new vehicle snapshot to detect activity boundaries (Trips/Charging)
  Future<void> processSnapshot(String vin, TeslaVehicleData data) async {
    final driveState = data.driveState;
    final chargeState = data.chargeState;
    final vehicleState = data.vehicleState;
    
    if (driveState == null || vehicleState == null || chargeState == null) return;

    final currentShiftState = driveState.shiftState ?? 'P';
    final currentOdometer = vehicleState.odometer;
    final currentSoc = chargeState.batteryLevel.toDouble();
    final currentChargingState = chargeState.chargingState;

    // --- 1. Trip Detection ---
    if (_lastShiftState == 'P' && (currentShiftState == 'D' || currentShiftState == 'R')) {
      _startTrip(currentOdometer, currentSoc);
    }
    if ((_lastShiftState == 'D' || _lastShiftState == 'R') && currentShiftState == 'P') {
      await _endTrip(vin, currentOdometer, currentSoc);
    }
    if (currentShiftState == 'D' || currentShiftState == 'R') {
      _updateTripStats(data);
    }
    _lastShiftState = currentShiftState;

    // --- 2. Charging Detection ---
    if (_lastChargingState != 'Charging' && currentChargingState == 'Charging') {
      _startCharging(currentSoc, chargeState.batteryRange);
    }
    if (_lastChargingState == 'Charging' && currentChargingState != 'Charging') {
      await _endCharging(vin, data);
    }
    // Sample power curve while charging is active
    if (currentChargingState == 'Charging' && chargeState.chargerPower != null) {
      final kw = chargeState.chargerPower!.toDouble();
      if (kw > 0) {
        _chargePowerReadings.add(kw);
        _chargeSocReadings.add(currentSoc);
      }
    }
    _lastChargingState = currentChargingState;
  }

  // --- Trip Helpers ---
  void _startTrip(double odometer, double soc) {
    _startOdometer = odometer;
    _startSoc = soc;
    _startTime = DateTime.now();
    _totalEnergyUsed = 0.0;
    _outsideTemps = [];
  }

  Future<void> _endTrip(String vin, double odometer, double soc) async {
    if (_startOdometer == null || _startTime == null) return;
    final distance = odometer - _startOdometer!;
    final endTime = DateTime.now();
    if (distance < 0.1) { _resetTrip(); return; }
    final avgTemp = _outsideTemps.isEmpty ? 0.0 : _outsideTemps.reduce((a, b) => a + b) / _outsideTemps.length;
    final session = DriveSession(
      vin: vin,
      startTime: _startTime!,
      endTime: endTime,
      startOdometer: _startOdometer!,
      endOdometer: odometer,
      startSoc: _startSoc!,
      endSoc: soc,
      distance: distance,
      energyUsedKwh: _totalEnergyUsed,
      efficiencyScore: distance > 0 ? (_totalEnergyUsed / distance) : 0.0,
      avgOutsideTemp: avgTemp,
    );
    await _telemetryRepository.saveDriveSession(session);
    _resetTrip();
  }

  void _updateTripStats(TeslaVehicleData data) {
    if (data.climateState?.outsideTemp != null) { _outsideTemps.add(data.climateState!.outsideTemp); }
  }

  void _resetTrip() {
    _startOdometer = null; _startSoc = null; _startTime = null; _totalEnergyUsed = 0.0; _outsideTemps = [];
  }

  // --- Charging Helpers ---
  void _startCharging(double soc, double range) {
    debugPrint('TripDetectionService: Charging session started at $soc% SOC');
    _chargeStartTime = DateTime.now();
    _chargeStartSoc = soc;
    _chargeStartRange = range;
    _chargePowerReadings.clear();
    _chargeSocReadings.clear();
  }

  Future<void> _endCharging(String vin, TeslaVehicleData data) async {
    final chargeState = data.chargeState;
    if (_chargeStartTime == null || chargeState == null) return;

    final endTime = DateTime.now();
    final endSoc = chargeState.batteryLevel.toDouble();
    final endRange = chargeState.batteryRange;
    
    // Ignore extremely short ripples (< 1% gained)
    if (endSoc - _chargeStartSoc! < 1.0) {
      _resetCharging();
      return;
    }

    final session = ChargeSession(
      vin: vin,
      startTime: _chargeStartTime!,
      endTime: endTime,
      startSoc: _chargeStartSoc!,
      endSoc: endSoc,
      startRange: _chargeStartRange!,
      endRange: endRange,
      kwhAdded: chargeState.chargeEnergyAdded,
      chargerVoltage: chargeState.chargerVoltage?.toDouble() ?? 0.0,
      chargerPhases: chargeState.chargerPhases ?? 1,
      chargerPower: chargeState.chargerPower?.toDouble() ?? 0.0,
      fastChargerType: chargeState.fastChargerType,
      connChargeType: chargeState.connChargeType,
      powerCurve: List<double>.from(_chargePowerReadings),
      socCurve: List<double>.from(_chargeSocReadings),
    );

    debugPrint('TripDetectionService: Charging session completed! Added: ${chargeState.chargeEnergyAdded} kWh');
    await _telemetryRepository.saveChargeSession(session);
    _resetCharging();
  }

  void _resetCharging() {
    _chargeStartTime = null;
    _chargeStartSoc = null;
    _chargeStartRange = null;
    _chargePowerReadings.clear();
    _chargeSocReadings.clear();
  }
}

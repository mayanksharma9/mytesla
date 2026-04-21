import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:voltride/features/dashboard/domain/vehicle.dart';

/// Bridges vehicle telemetry state with Firestore.
///
/// Write path:  REST poll result → [writeVehicleState] → Firestore `telemetry/{vin}`
/// Read path:   Firestore `telemetry/{vin}` stream → VehicleBloc → UI
///
/// When the proxy backend receives Fleet Telemetry from Tesla it writes to the
/// same `telemetry/{vin}` document. Flutter receives the update through the
/// same stream regardless of which writer triggered it, giving true real-time
/// updates without polling once Fleet Telemetry is active.
class FirestoreTelemetryService {
  final FirebaseFirestore _firestore;

  static const String _collection = 'telemetry';

  FirestoreTelemetryService(this._firestore);

  /// Writes a complete vehicle state snapshot to Firestore.
  /// Called after every REST poll so the document stays up-to-date.
  Future<void> writeVehicleState(Vehicle vehicle) async {
    try {
      final doc = _firestore.collection(_collection).doc(vehicle.vin);
      await doc.set({
        // Identity
        'vehicleId': vehicle.id,
        'vin': vehicle.vin,
        'displayName': vehicle.displayName,
        'state': vehicle.state,
        // Battery
        'batteryLevel': vehicle.batteryLevel,
        'batteryRange': vehicle.batteryRange,
        'idealBatteryRange': vehicle.idealBatteryRange,
        'estBatteryRange': vehicle.estBatteryRange,
        // Charging
        'chargingState': vehicle.chargingState,
        'chargerPower': vehicle.chargerPower,
        'chargeEnergyAdded': vehicle.chargeEnergyAdded,
        'timeToFullCharge': vehicle.timeToFullCharge,
        'chargeRate': vehicle.chargeRate,
        'chargeLimitSoc': vehicle.chargeLimitSoc,
        'chargeCurrentRequest': vehicle.chargeCurrentRequest,
        'chargerVoltage': vehicle.chargerVoltage,
        'chargerPhases': vehicle.chargerPhases,
        'fastChargerType': vehicle.fastChargerType,
        'connChargeCable': vehicle.connChargeCable,
        'chargePortOpen': vehicle.chargePortOpen,
        'scheduledChargingMode': vehicle.scheduledChargingMode,
        'scheduledChargingStartTime': vehicle.scheduledChargingStartTime,
        'climateKeeperMode': vehicle.climateKeeperMode,
        // Drive
        'speed': vehicle.speed,
        'power': vehicle.power,
        'latitude': vehicle.latitude,
        'longitude': vehicle.longitude,
        'heading': vehicle.heading,
        'shiftState': vehicle.shiftState,
        'odometer': vehicle.odometer,
        // Status
        'isLocked': vehicle.isLocked,
        'isSentryModeOn': vehicle.isSentryModeOn,
        'isValetModeOn': vehicle.isValetModeOn,
        'frontTrunkState': vehicle.frontTrunkState,
        'rearTrunkState': vehicle.rearTrunkState,
        // Climate
        'isClimateOn': vehicle.isClimateOn,
        'insideTemp': vehicle.insideTemp,
        'outsideTemp': vehicle.outsideTemp,
        'driverTemp': vehicle.driverTemp,
        'passengerTemp': vehicle.passengerTemp,
        'fanStatus': vehicle.fanStatus,
        'seatHeaterLeft': vehicle.seatHeaterLeft,
        'seatHeaterRight': vehicle.seatHeaterRight,
        'steeringWheelHeater': vehicle.steeringWheelHeater,
        'frontDefrosterOn': vehicle.frontDefrosterOn,
        'batteryHeaterOn': vehicle.batteryHeaterOn,
        // TPMS
        'tpmsPressureFl': vehicle.tpmsPressureFl,
        'tpmsPressureFr': vehicle.tpmsPressureFr,
        'tpmsPressureRl': vehicle.tpmsPressureRl,
        'tpmsPressureRr': vehicle.tpmsPressureRr,
        // Meta
        'softwareVersion': vehicle.softwareVersion,
        'useFahrenheit': vehicle.useFahrenheit,
        'useMiles': vehicle.useMiles,
        'pressureUnit': vehicle.pressureUnit,
        'updatedAt': FieldValue.serverTimestamp(),
        'source': 'rest_poll',
      }, SetOptions(merge: true));
    } catch (e) {
      debugPrint('FirestoreTelemetryService: write error: $e');
    }
  }

  /// Returns a live stream of the telemetry document for [vin].
  /// Emits immediately with cached data, then on every server-side update.
  Stream<Map<String, dynamic>> streamVehicleState(String vin) {
    return _firestore
        .collection(_collection)
        .doc(vin)
        .snapshots()
        .where((snap) => snap.exists && snap.data() != null)
        .map((snap) => snap.data()!);
  }

  /// Applies a Firestore telemetry map onto an existing [Vehicle] via copyWith,
  /// preserving identity fields that Firestore doesn't own.
  Vehicle applyTelemetryUpdate(Vehicle base, Map<String, dynamic> data) {
    double d(String key, double fallback) {
      final v = data[key];
      if (v == null) return fallback;
      if (v is num) return v.toDouble();
      return fallback;
    }

    int i(String key, int fallback) {
      final v = data[key];
      if (v == null) return fallback;
      if (v is num) return v.toInt();
      return fallback;
    }

    bool b(String key, bool fallback) {
      final v = data[key];
      if (v == null) return fallback;
      if (v is bool) return v;
      return fallback;
    }

    String? s(String key) {
      final v = data[key];
      return v is String ? v : null;
    }

    return base.copyWith(
      state: s('state') ?? base.state,
      batteryLevel: i('batteryLevel', base.batteryLevel),
      batteryRange: d('batteryRange', base.batteryRange),
      idealBatteryRange: d('idealBatteryRange', base.idealBatteryRange),
      estBatteryRange: d('estBatteryRange', base.estBatteryRange),
      chargingState: s('chargingState') ?? base.chargingState,
      chargerPower: d('chargerPower', base.chargerPower),
      chargeEnergyAdded: d('chargeEnergyAdded', base.chargeEnergyAdded),
      timeToFullCharge: d('timeToFullCharge', base.timeToFullCharge),
      chargeRate: d('chargeRate', base.chargeRate),
      chargeLimitSoc: i('chargeLimitSoc', base.chargeLimitSoc),
      chargerVoltage: d('chargerVoltage', base.chargerVoltage),
      chargerPhases: i('chargerPhases', base.chargerPhases),
      fastChargerType: s('fastChargerType') ?? base.fastChargerType,
      speed: d('speed', base.speed),
      power: d('power', base.power),
      latitude: d('latitude', base.latitude),
      longitude: d('longitude', base.longitude),
      heading: i('heading', base.heading),
      shiftState: data.containsKey('shiftState') ? s('shiftState') : base.shiftState,
      odometer: d('odometer', base.odometer),
      isLocked: b('isLocked', base.isLocked),
      isSentryModeOn: b('isSentryModeOn', base.isSentryModeOn),
      frontTrunkState: i('frontTrunkState', base.frontTrunkState),
      rearTrunkState: i('rearTrunkState', base.rearTrunkState),
      isClimateOn: b('isClimateOn', base.isClimateOn),
      insideTemp: d('insideTemp', base.insideTemp),
      outsideTemp: d('outsideTemp', base.outsideTemp),
      seatHeaterLeft: i('seatHeaterLeft', base.seatHeaterLeft),
      seatHeaterRight: i('seatHeaterRight', base.seatHeaterRight),
      steeringWheelHeater: b('steeringWheelHeater', base.steeringWheelHeater),
      frontDefrosterOn: b('frontDefrosterOn', base.frontDefrosterOn),
      batteryHeaterOn: b('batteryHeaterOn', base.batteryHeaterOn),
      tpmsPressureFl: data.containsKey('tpmsPressureFl') ? d('tpmsPressureFl', 0.0) : base.tpmsPressureFl,
      tpmsPressureFr: data.containsKey('tpmsPressureFr') ? d('tpmsPressureFr', 0.0) : base.tpmsPressureFr,
      tpmsPressureRl: data.containsKey('tpmsPressureRl') ? d('tpmsPressureRl', 0.0) : base.tpmsPressureRl,
      tpmsPressureRr: data.containsKey('tpmsPressureRr') ? d('tpmsPressureRr', 0.0) : base.tpmsPressureRr,
      chargeCurrentRequest: i('chargeCurrentRequest', base.chargeCurrentRequest),
      chargePortOpen: data.containsKey('chargePortOpen') ? b('chargePortOpen', base.chargePortOpen) : base.chargePortOpen,
      scheduledChargingMode: data.containsKey('scheduledChargingMode') ? s('scheduledChargingMode') ?? base.scheduledChargingMode : base.scheduledChargingMode,
      climateKeeperMode: s('climateKeeperMode') ?? base.climateKeeperMode,
      softwareVersion: s('softwareVersion') ?? base.softwareVersion,
    );
  }
}

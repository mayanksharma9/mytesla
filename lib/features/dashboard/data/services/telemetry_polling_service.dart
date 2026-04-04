import 'dart:async';
import 'package:flutter/foundation.dart';
import '../../domain/vehicle.dart';
import '../../domain/vehicle_repository.dart';
import '../models/tesla_models.dart';

class TelemetryPollingService {
  final VehicleRepository _repository;
  Timer? _pollingTimer;
  String? _currentVehicleId;
  
  // Track states for session discovery
  String? _lastShiftState;
  bool? _lastIsCharging;
  double? _lastOdometer;
  DateTime? _sessionStartTime;
  double? _sessionStartOdometer;
  double? _sessionStartSoc;

  TelemetryPollingService(this._repository);

  void startPolling(String vehicleId) {
    if (_currentVehicleId == vehicleId && _pollingTimer != null) return;
    
    stopPolling();
    _currentVehicleId = vehicleId;
    debugPrint('TelemetryPollingService: Starting 5-minute snapshots for $vehicleId');
    
    // Initial fetch
    _poll();
    
    // Schedule every 5 minutes (300 seconds)
    _pollingTimer = Timer.periodic(const Duration(minutes: 5), (_) => _poll());
  }

  void stopPolling() {
    _pollingTimer?.cancel();
    _pollingTimer = null;
    _currentVehicleId = null;
  }

  Future<void> _poll() async {
    if (_currentVehicleId == null) return;

    try {
      final vehicle = await _repository.getVehicleData(_currentVehicleId!);
      
      // 1. Detect Sessions (Drive/Charge)
      _detectSessions(vehicle);

    } catch (e) {
      debugPrint('TelemetryPollingService: Poll failed: $e');
    }
  }

  void _detectSessions(Vehicle vehicle) async {
    final shiftState = vehicle.shiftState ?? 'P';
    final isCharging = vehicle.batteryLevel < 100 && vehicle.batteryHeaterOn; // Simplified, ideally we use a real is_charging flag
    // Wait, the Vehicle model doesn't have a clear "isCharging" boolean, but it has shiftState.
    
    // DRIVE SESSION DETECTION
    if (shiftState != 'P' && (_lastShiftState == 'P' || _lastShiftState == null)) {
      // START TRIP
      _sessionStartTime = DateTime.now();
      _sessionStartOdometer = vehicle.odometer;
      _sessionStartSoc = vehicle.batteryLevel.toDouble();
      debugPrint('TelemetryPollingService: TRIP STARTED at ${vehicle.odometer}');
    } else if (shiftState == 'P' && (_lastShiftState != 'P' && _lastShiftState != null)) {
      // END TRIP
      if (_sessionStartTime != null) {
        final endTime = DateTime.now();
        final distance = vehicle.odometer - (_sessionStartOdometer ?? vehicle.odometer);
        final socUsed = (_sessionStartSoc ?? vehicle.batteryLevel.toDouble()) - vehicle.batteryLevel;
        
        if (distance > 0.1) {
             final trip = DriveSession(
              startTime: _sessionStartTime!,
              endTime: endTime,
              startOdometer: _sessionStartOdometer ?? vehicle.odometer,
              endOdometer: vehicle.odometer,
              startSoc: _sessionStartSoc ?? vehicle.batteryLevel.toDouble(),
              endSoc: vehicle.batteryLevel.toDouble(),
              distance: distance,
              energyUsedKwh: socUsed * 0.75, // Estimated
            );
            // Save to repository (Trip history)
            // _repository.saveTrip(trip); // TODO: Add this method
            debugPrint('TelemetryPollingService: TRIP ENDED. Distance: $distance mi');
        }
      }
      _sessionStartTime = null;
    }

    _lastShiftState = shiftState;
    _lastOdometer = vehicle.odometer;
  }
}

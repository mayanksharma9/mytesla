import 'dart:async';
import 'package:flutter/material.dart';
import '../network/tesla_api_client.dart';
import '../../features/dashboard/data/models/tesla_models.dart';

class VehicleDataService extends ChangeNotifier with WidgetsBindingObserver {
  final TeslaApiClient _apiClient;

  Timer? _pollingTimer;
  bool _isPolling = false;
  DateTime? _lastSyncTime;
  String? _currentVehicleId;
  TeslaVehicleData? _latestData;

  VehicleDataService(this._apiClient) {
    WidgetsBinding.instance.addObserver(this);
  }

  TeslaVehicleData? get latestData => _latestData;
  DateTime? get lastSyncTime => _lastSyncTime;
  bool get isPolling => _isPolling;

  void startPolling(String vehicleId) {
    _currentVehicleId = vehicleId;
    _isPolling = true;
    _scheduleNextPoll(immediate: true);
    notifyListeners();
  }

  void stopPolling() {
    _isPolling = false;
    _pollingTimer?.cancel();
    _pollingTimer = null;
    notifyListeners();
  }

  void _scheduleNextPoll({bool immediate = false}) {
    _pollingTimer?.cancel();
    if (!_isPolling) return;

    if (immediate) {
      _fetchData();
    }
    
    // Poll every 5 minutes (300 seconds)
    _pollingTimer = Timer.periodic(const Duration(minutes: 5), (timer) {
      _fetchData();
    });
  }

  Future<void> _fetchData() async {
    if (_currentVehicleId == null || !_isPolling) return;

    try {
      debugPrint('VehicleDataService: Checking vehicle state for $_currentVehicleId...');

      // Lightweight check — only used so the service can track online state.
      // The VehicleBloc owns the authoritative periodic refresh via its own timer.
      final vehicles = await _apiClient.getVehicles();
      final vehicle = vehicles.response.firstWhere(
        (v) => v.id == _currentVehicleId,
        orElse: () => vehicles.response.first,
      );

      if (vehicle.state != 'online' && vehicle.state != 'charging') {
        debugPrint('VehicleDataService: Vehicle is ${vehicle.state}, skipping heavyweight fetch.');
        return;
      }

      // Keep a lightweight snapshot for callers that read latestData directly.
      final dataResponse = await _apiClient.getVehicleData(_currentVehicleId!);
      _latestData = dataResponse.response;
      _lastSyncTime = DateTime.now();

      debugPrint('VehicleDataService: Lightweight snapshot updated at $_lastSyncTime');
      notifyListeners();
    } catch (e) {
      debugPrint('VehicleDataService: Error during poll: $e');
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      debugPrint('VehicleDataService: App resumed, triggering immediate refresh.');
      _fetchData();
    } else if (state == AppLifecycleState.paused) {
      debugPrint('VehicleDataService: App paused, polling continues in background (handled by OS timer).');
      // We could slow down timer here if needed:
      // _pollingTimer?.cancel();
      // _pollingTimer = Timer.periodic(const Duration(minutes: 15), ...);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _pollingTimer?.cancel();
    super.dispose();
  }
}

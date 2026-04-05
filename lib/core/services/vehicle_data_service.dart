import 'dart:async';
import 'package:flutter/material.dart';
import '../network/tesla_api_client.dart';
import '../../features/dashboard/domain/vehicle_repository.dart';
import '../../features/dashboard/data/models/tesla_models.dart';

class VehicleDataService extends ChangeNotifier with WidgetsBindingObserver {
  final TeslaApiClient _apiClient;
  final VehicleRepository _repository;
  
  Timer? _pollingTimer;
  bool _isPolling = false;
  DateTime? _lastSyncTime;
  String? _currentVehicleId;
  TeslaVehicleData? _latestData;

  VehicleDataService(this._apiClient, this._repository) {
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
      debugPrint('VehicleDataService: Polling vehicle $_currentVehicleId...');
      
      // 1. Check if vehicle is online before heavy data fetch
      // This is a lightweight call
      final vehicles = await _apiClient.getVehicles();
      final vehicle = vehicles.response.firstWhere((v) => v.id == _currentVehicleId);
      
      if (vehicle.state != 'online') {
        debugPrint('VehicleDataService: Vehicle is ${vehicle.state}, skipping data fetch.');
        return;
      }

      // 2. Fetch comprehensive data
      final dataResponse = await _apiClient.getVehicleData(_currentVehicleId!);
      _latestData = dataResponse.response;
      _lastSyncTime = DateTime.now();

      // 3. Update repository (this triggers Hive/Firestore sync)
      await _repository.getVehicleData(_currentVehicleId!); 
      
      debugPrint('VehicleDataService: Sync complete at $_lastSyncTime');
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

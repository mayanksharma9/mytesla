import 'dart:async';
import 'package:flutter/material.dart';
import '../../features/dashboard/domain/vehicle_repository.dart';
import '../../features/dashboard/data/models/tesla_models.dart';

class VehicleDataService extends ChangeNotifier with WidgetsBindingObserver {
  final VehicleRepository _repository;

  Timer? _pollingTimer;
  bool _isPolling = false;
  DateTime? _lastSyncTime;
  String? _currentVehicleId;
  TeslaVehicleData? _latestData;

  VehicleDataService(this._repository) {
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

      // Use the repository which routes through Cloud Functions
      final vehicle = await _repository.getVehicleData(_currentVehicleId!);
      
      _lastSyncTime = DateTime.now();
      debugPrint('VehicleDataService: Data refreshed at $_lastSyncTime');
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
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _pollingTimer?.cancel();
    super.dispose();
  }
}

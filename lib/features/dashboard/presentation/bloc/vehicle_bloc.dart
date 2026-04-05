import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:voltride/features/charging/domain/charging_repository.dart';
import '../../domain/vehicle.dart';
import '../../domain/vehicle_repository.dart';
import '../../data/models/tesla_models.dart' as models hide TeslaProduct;
import '../../domain/tesla_product.dart';
import 'package:flutter/foundation.dart';
import 'package:voltride/core/services/vehicle_data_service.dart';
import '../../data/services/intelligence_engine.dart';

// Events
// ... (previous events here)

// Events
abstract class VehicleEvent extends Equatable {
  const VehicleEvent();
  @override
  List<Object?> get props => [];
}

class FetchVehicles extends VehicleEvent {}

class FetchProducts extends VehicleEvent {}

class StartPolling extends VehicleEvent {}

class StopPolling extends VehicleEvent {}

class SelectVehicle extends VehicleEvent {
  final String vin;
  const SelectVehicle(this.vin);
  @override
  List<Object?> get props => [vin];
}

class ToggleLock extends VehicleEvent {
  final String vehicleId;
  final bool lock;
  const ToggleLock(this.vehicleId, this.lock);
  @override
  List<Object?> get props => [vehicleId, lock];
}

class ActuateTrunk extends VehicleEvent {
  final String vehicleId;
  final String whichTrunk;
  const ActuateTrunk(this.vehicleId, this.whichTrunk);
  @override
  List<Object?> get props => [vehicleId, whichTrunk];
}

class ToggleClimate extends VehicleEvent {
  final String vehicleId;
  final bool on;
  const ToggleClimate(this.vehicleId, this.on);
  @override
  List<Object?> get props => [vehicleId, on];
}

class SetTemperature extends VehicleEvent {
  final String vehicleId;
  final double temp;
  const SetTemperature(this.vehicleId, this.temp);
  @override
  List<Object?> get props => [vehicleId, temp];
}

class SetSeatHeater extends VehicleEvent {
  final String vehicleId;
  final int heater;
  final int level;
  const SetSeatHeater(this.vehicleId, this.heater, this.level);
  @override
  List<Object?> get props => [vehicleId, heater, level];
}

class SetChargeLimit extends VehicleEvent {
  final String vehicleId;
  final int limit;
  const SetChargeLimit(this.vehicleId, this.limit);
  @override
  List<Object?> get props => [vehicleId, limit];
}

class ToggleCharging extends VehicleEvent {
  final String vehicleId;
  final bool start;
  const ToggleCharging(this.vehicleId, this.start);
  @override
  List<Object?> get props => [vehicleId, start];
}

class SetChargingAmps extends VehicleEvent {
  final String vehicleId;
  final int amps;
  const SetChargingAmps(this.vehicleId, this.amps);
  @override
  List<Object?> get props => [vehicleId, amps];
}

class HonkHorn extends VehicleEvent {
  final String vehicleId;
  const HonkHorn(this.vehicleId);
  @override
  List<Object?> get props => [vehicleId];
}

class FlashLights extends VehicleEvent {
  final String vehicleId;
  const FlashLights(this.vehicleId);
  @override
  List<Object?> get props => [vehicleId];
}

class ToggleSentryMode extends VehicleEvent {
  final String vehicleId;
  final bool on;
  const ToggleSentryMode(this.vehicleId, this.on);
  @override
  List<Object?> get props => [vehicleId, on];
}

class ToggleValetMode extends VehicleEvent {
  final String vehicleId;
  final bool on;
  final String? password;
  const ToggleValetMode(this.vehicleId, this.on, {this.password});
  @override
  List<Object?> get props => [vehicleId, on, password];
}

class FetchHistory extends VehicleEvent {
  final String vin;
  const FetchHistory(this.vin);
  @override
  List<Object?> get props => [vin];
}

class FetchSpecs extends VehicleEvent {
  final String vin;
  const FetchSpecs(this.vin);
  @override
  List<Object?> get props => [vin];
}

// States
enum VehicleStatus { initial, loading, success, error, commandInProgress }

class VehicleBlocState extends Equatable {
  final VehicleStatus status;
  final List<Vehicle> vehicles;
  final List<TeslaProduct> products;
  final Vehicle? selectedVehicle;
  final List<models.BatterySnapshot> batteryHistory;
  final List<models.ChargingHistoryEntry> chargingHistory;
  final List<models.DriveSession> tripHistory;
  final String? error;
  final Set<String> loadingCommands; // Set of vehicleId_commandType strings
  final models.VehicleCache? vehicleCache;
  final List<SmartSuggestion> suggestions;

  const VehicleBlocState({
    this.status = VehicleStatus.initial,
    this.vehicles = const [],
    this.products = const [],
    this.selectedVehicle,
    this.batteryHistory = const [],
    this.chargingHistory = const [],
    this.tripHistory = const [],
    this.error,
    this.loadingCommands = const {},
    this.vehicleCache,
    this.suggestions = const [],
  });

  @override
  List<Object?> get props => [
    status, 
    vehicles, 
    products, 
    selectedVehicle, 
    batteryHistory, 
    chargingHistory, 
    tripHistory,
    error,
    vehicleCache,
    suggestions,
  ];

  VehicleBlocState copyWith({
    VehicleStatus? status,
    List<Vehicle>? vehicles,
    List<TeslaProduct>? products,
    Vehicle? selectedVehicle,
    List<models.BatterySnapshot>? batteryHistory,
    List<models.ChargingHistoryEntry>? chargingHistory,
    List<models.DriveSession>? tripHistory,
    String? error,
    Set<String>? loadingCommands,
    models.VehicleCache? vehicleCache,
    List<SmartSuggestion>? suggestions,
  }) {
    return VehicleBlocState(
      status: status ?? this.status,
      vehicles: vehicles ?? this.vehicles,
      products: products ?? this.products,
      selectedVehicle: selectedVehicle ?? this.selectedVehicle,
      batteryHistory: batteryHistory ?? this.batteryHistory,
      chargingHistory: chargingHistory ?? this.chargingHistory,
      tripHistory: tripHistory ?? this.tripHistory,
      error: error ?? this.error,
      loadingCommands: loadingCommands ?? this.loadingCommands,
      vehicleCache: vehicleCache ?? this.vehicleCache,
      suggestions: suggestions ?? this.suggestions,
    );
  }
  
}

// Bloc
class VehicleBloc extends Bloc<VehicleEvent, VehicleBlocState> {
  final VehicleRepository _repository;
  final ChargingRepository _chargingRepository;
  final FirebaseFirestore _firestore;
  final VehicleDataService _pollingService;
  final IntelligenceEngine _intelligenceEngine;
  Timer? _pollingTimer;

  VehicleBloc(
    this._repository, 
    this._chargingRepository, 
    this._firestore,
    this._pollingService,
    this._intelligenceEngine,
  ) : super(const VehicleBlocState()) {
    on<FetchVehicles>(_onFetchVehicles);
    on<StartPolling>(_onStartPolling);
    on<StopPolling>(_onStopPolling);
    on<SelectVehicle>(_onSelectVehicle);
    on<FetchHistory>(_onFetchHistory);
    on<FetchSpecs>(_onFetchSpecs); // New event
    // ... existing handlers ...
    on<ToggleLock>(_onToggleLock);
    on<ActuateTrunk>(_onActuateTrunk);
    on<ToggleClimate>(_onToggleClimate);
    on<SetTemperature>(_onSetTemperature);
    on<SetSeatHeater>(_onSetSeatHeater);
    on<SetChargeLimit>(_onSetChargeLimit);
    on<ToggleCharging>(_onToggleCharging);
    on<SetChargingAmps>(_onSetChargingAmps);
    on<HonkHorn>(_onHonkHorn);
    on<FlashLights>(_onFlashLights);
    on<ToggleSentryMode>(_onToggleSentryMode);
    on<ToggleValetMode>(_onToggleValetMode);
    on<FetchProducts>(_onFetchProducts);
  }

  void _onStartPolling(StartPolling event, Emitter<VehicleBlocState> emit) {
    if (state.selectedVehicle != null) {
      _pollingService.startPolling(state.selectedVehicle!.id);
    }
  }

  void _onStopPolling(StopPolling event, Emitter<VehicleBlocState> emit) {
    _pollingService.stopPolling();
  }

  @override
  Future<void> close() {
    _pollingTimer?.cancel();
    return super.close();
  }

  Future<void> _onFetchVehicles(FetchVehicles event, Emitter<VehicleBlocState> emit) async {
    // Only show full loading if we don't have vehicles yet
    if (state.vehicles.isEmpty) {
      emit(state.copyWith(status: VehicleStatus.loading));
    }
    
    try {
      final vehicles = await _repository.getVehicles();
      
      Vehicle? currentSelection = state.selectedVehicle;
      if (currentSelection == null && vehicles.isNotEmpty) {
        currentSelection = vehicles.first;
      } else if (currentSelection != null) {
        currentSelection = vehicles.firstWhere((v) => v.id == currentSelection!.id, orElse: () => currentSelection!);
      }

      // If we have a selected vehicle, fetch its detailed data
      if (currentSelection != null) {
        // Trigger history fetch in background
        add(FetchHistory(currentSelection.vin));

        // Only fetch detailed data if vehicle is online or we need an update
        if (currentSelection.state == 'online' || currentSelection.state == 'charging') {
          final detailedVehicle = await _repository.getVehicleData(currentSelection.id);
          currentSelection = detailedVehicle;
        }
      }

      emit(state.copyWith(
        status: VehicleStatus.success,
        vehicles: vehicles,
        selectedVehicle: currentSelection,
      ));

      // Also fetch products
      add(FetchProducts());
    } catch (e) {
      emit(state.copyWith(status: VehicleStatus.error, error: e.toString()));
    }
  }

  Future<void> _onFetchHistory(FetchHistory event, Emitter<VehicleBlocState> emit) async {
    try {
      // 1. Fetch Battery Telemetry (Last 50 points)
      final batterySnapshots = await _firestore
          .collection('vehicles')
          .doc(event.vin)
          .collection('telemetry_history')
          .orderBy('timestamp', descending: true)
          .limit(50)
          .get();

      final batteryHistory = batterySnapshots.docs.map((doc) {
        final data = doc.data();
        return models.BatterySnapshot(
          timestamp: (data['timestamp'] as Timestamp? ?? Timestamp.now()).toDate(),
          batteryLevel: (data['battery_level'] as num? ?? 0).toInt(),
          batteryRange: (data['battery_range'] as num? ?? 0).toDouble(),
          idealBatteryRange: (data['battery_range'] as num? ?? 0).toDouble(),
          outsideTemp: (data['outside_temp'] as num? ?? 0).toDouble(),
          batteryHeaterOn: false,
          chargeLimitSoc: 80,
          shiftState: data['shift_state'] as String? ?? 'P',
          odometer: (data['odometer'] as num? ?? 0).toDouble(),
        );
      }).toList();

      print('VehicleBloc: Fetching history for VIN: ${event.vin}');
      
      // 2. Fetch Charging History (Last 50)
      final chargingSnapshots = await _firestore
          .collection('charging_history')
          .where('vin', isEqualTo: event.vin)
          .orderBy('charge_start_date_time', descending: true)
          .limit(50)
          .get();

      final chargingHistory = chargingSnapshots.docs.map((doc) {
        return models.ChargingHistoryEntry.fromJson(doc.data());
      }).toList();

      // 3. Fetch Trip History (Last 50)
      final tripSnapshots = await _firestore
          .collection('trip_history')
          .where('vin', isEqualTo: event.vin)
          .orderBy('startTime', descending: true)
          .limit(50)
          .get();

      final tripHistory = tripSnapshots.docs.map((doc) {
        return models.DriveSession.fromJson(doc.data());
      }).toList();

      emit(state.copyWith(
        batteryHistory: batteryHistory,
        chargingHistory: chargingHistory,
        tripHistory: tripHistory,
      ));

      // NEW: Generate suggestions based on updated history
      if (state.selectedVehicle != null) {
        final suggestions = _intelligenceEngine.generateSuggestions(
          vehicle: state.selectedVehicle!,
          history: batteryHistory,
          cache: state.vehicleCache,
        );
        emit(state.copyWith(suggestions: suggestions));
      }
      
      print('VehicleBloc: Fetched history for ${event.vin} (${batteryHistory.length} battery, ${chargingHistory.length} charging, ${tripHistory.length} trips)');
    } catch (e) {
      print('VehicleBloc: Failed to fetch history for ${event.vin}: $e');
    }
  }

  Future<void> _onSelectVehicle(SelectVehicle event, Emitter<VehicleBlocState> emit) async {
    final vehicle = state.vehicles.firstWhere(
      (v) => v.vin == event.vin, 
      orElse: () => state.vehicles.isNotEmpty ? state.vehicles.first : state.selectedVehicle!,
    );
    
    emit(state.copyWith(status: VehicleStatus.loading, selectedVehicle: vehicle));
    try {
      final detailedVehicle = await _repository.getVehicleData(vehicle.id);
      emit(state.copyWith(status: VehicleStatus.success, selectedVehicle: detailedVehicle));
    } catch (e) {
      // Fallback to basic info if detailed fetch fails
      emit(state.copyWith(status: VehicleStatus.success, selectedVehicle: vehicle));
    }
  }

  Future<void> _onToggleLock(ToggleLock event, Emitter<VehicleBlocState> emit) async {
    final cmdId = '${event.vehicleId}_lock';
    final currentSelected = state.selectedVehicle;
    
    // --- Optimistic Update ---
    if (currentSelected != null && currentSelected.id == event.vehicleId) {
      emit(state.copyWith(
        selectedVehicle: currentSelected.copyWith(isLocked: event.lock),
        loadingCommands: {...state.loadingCommands, cmdId},
      ));
    }

    try {
      if (event.lock) {
        await _repository.lock(event.vehicleId);
      } else {
        await _repository.unlock(event.vehicleId);
      }
      // Trigger a detailed refresh
      add(FetchVehicles());
    } catch (e) {
      emit(state.copyWith(
        status: VehicleStatus.error, 
        error: e.toString(),
        // Rollback optimistic update
        selectedVehicle: currentSelected,
      ));
    } finally {
      emit(state.copyWith(
        loadingCommands: Set.from(state.loadingCommands)..remove(cmdId),
      ));
    }
  }

  Future<void> _onActuateTrunk(ActuateTrunk event, Emitter<VehicleBlocState> emit) async {
    try {
      await _repository.actuateTrunk(event.vehicleId, event.whichTrunk);
      add(FetchVehicles());
    } catch (e) {
      emit(state.copyWith(status: VehicleStatus.error, error: e.toString()));
    }
  }

  Future<void> _onToggleClimate(ToggleClimate event, Emitter<VehicleBlocState> emit) async {
    final cmdId = '${event.vehicleId}_climate';
    final currentSelected = state.selectedVehicle;

    // --- Optimistic Update ---
    if (currentSelected != null && currentSelected.id == event.vehicleId) {
      emit(state.copyWith(
        selectedVehicle: currentSelected.copyWith(isClimateOn: event.on),
        loadingCommands: {...state.loadingCommands, cmdId},
      ));
    }

    try {
      await _repository.setClimateOn(event.vehicleId, event.on);
      add(FetchVehicles());
    } catch (e) {
      emit(state.copyWith(
        status: VehicleStatus.error, 
        error: e.toString(),
        selectedVehicle: currentSelected,
      ));
    } finally {
      emit(state.copyWith(
        loadingCommands: Set.from(state.loadingCommands)..remove(cmdId),
      ));
    }
  }

  Future<void> _onSetTemperature(SetTemperature event, Emitter<VehicleBlocState> emit) async {
    try {
      await _repository.setTemperature(event.vehicleId, event.temp);
      add(FetchVehicles());
    } catch (e) {
      emit(state.copyWith(status: VehicleStatus.error, error: e.toString()));
    }
  }

  Future<void> _onSetSeatHeater(SetSeatHeater event, Emitter<VehicleBlocState> emit) async {
    try {
      await _repository.setSeatHeater(event.vehicleId, event.heater, event.level);
      add(FetchVehicles());
    } catch (e) {
      emit(state.copyWith(status: VehicleStatus.error, error: e.toString()));
    }
  }

  Future<void> _onSetChargeLimit(SetChargeLimit event, Emitter<VehicleBlocState> emit) async {
    try {
      await _repository.setChargeLimit(event.vehicleId, event.limit);
      add(FetchVehicles());
    } catch (e) {
      emit(state.copyWith(status: VehicleStatus.error, error: e.toString()));
    }
  }

  Future<void> _onToggleCharging(ToggleCharging event, Emitter<VehicleBlocState> emit) async {
    final cmdId = '${event.vehicleId}_charging';
    final currentSelected = state.selectedVehicle;

    // --- Optimistic Update ---
    if (currentSelected != null && currentSelected.id == event.vehicleId) {
      emit(state.copyWith(
        selectedVehicle: currentSelected.copyWith(
          state: event.start ? 'charging' : 'online',
        ),
        loadingCommands: {...state.loadingCommands, cmdId},
      ));
    }

    try {
      if (event.start) {
        await _repository.startCharging(event.vehicleId);
      } else {
        await _repository.stopCharging(event.vehicleId);
      }
      add(FetchVehicles());
    } catch (e) {
      emit(state.copyWith(
        status: VehicleStatus.error, 
        error: e.toString(),
        selectedVehicle: currentSelected,
      ));
    } finally {
      emit(state.copyWith(
        loadingCommands: Set.from(state.loadingCommands)..remove(cmdId),
      ));
    }
  }

  Future<void> _onSetChargingAmps(SetChargingAmps event, Emitter<VehicleBlocState> emit) async {
    try {
      await _repository.setChargingAmps(event.vehicleId, event.amps);
      add(FetchVehicles());
    } catch (e) {
      emit(state.copyWith(status: VehicleStatus.error, error: e.toString()));
    }
  }

  Future<void> _onHonkHorn(HonkHorn event, Emitter<VehicleBlocState> emit) async {
    try {
      await _repository.honkHorn(event.vehicleId);
    } catch (e) {
      emit(state.copyWith(status: VehicleStatus.error, error: e.toString()));
    }
  }

  Future<void> _onFlashLights(FlashLights event, Emitter<VehicleBlocState> emit) async {
    try {
      await _repository.flashLights(event.vehicleId);
    } catch (e) {
      emit(state.copyWith(status: VehicleStatus.error, error: e.toString()));
    }
  }

  Future<void> _onFetchProducts(FetchProducts event, Emitter<VehicleBlocState> emit) async {
    try {
      final products = await _repository.getProducts();
      emit(state.copyWith(products: products));
    } catch (e) {
      print('VehicleBloc: Failed to fetch products: $e');
    }
  }

  Future<void> _onToggleSentryMode(ToggleSentryMode event, Emitter<VehicleBlocState> emit) async {
    final cmdId = '${event.vehicleId}_sentry';
    final currentSelected = state.selectedVehicle;

    // --- Optimistic Update ---
    if (currentSelected != null && currentSelected.id == event.vehicleId) {
      emit(state.copyWith(
        selectedVehicle: currentSelected.copyWith(isSentryModeOn: event.on),
        loadingCommands: {...state.loadingCommands, cmdId},
      ));
    }

    try {
      await _repository.setSentryMode(event.vehicleId, event.on);
      add(FetchVehicles());
    } catch (e) {
      emit(state.copyWith(
        status: VehicleStatus.error, 
        error: e.toString(),
        selectedVehicle: currentSelected,
      ));
    } finally {
      emit(state.copyWith(
        loadingCommands: Set.from(state.loadingCommands)..remove(cmdId),
      ));
    }
  }

  Future<void> _onToggleValetMode(ToggleValetMode event, Emitter<VehicleBlocState> emit) async {
    final cmdId = '${event.vehicleId}_valet';
    final currentSelected = state.selectedVehicle;

    // --- Optimistic Update ---
    if (currentSelected != null && currentSelected.id == event.vehicleId) {
      emit(state.copyWith(
        selectedVehicle: currentSelected.copyWith(isValetModeOn: event.on),
        loadingCommands: {...state.loadingCommands, cmdId},
      ));
    }

    try {
      await _repository.setValetMode(event.vehicleId, event.on, password: event.password);
      add(FetchVehicles());
    } catch (e) {
      emit(state.copyWith(
        status: VehicleStatus.error, 
        error: e.toString(),
        selectedVehicle: currentSelected,
      ));
    } finally {
      emit(state.copyWith(
        loadingCommands: Set.from(state.loadingCommands)..remove(cmdId),
      ));
    }
  }

  Future<void> _onFetchSpecs(FetchSpecs event, Emitter<VehicleBlocState> emit) async {
    try {
      final specs = await _repository.getVehicleSpecs(event.vin);
      emit(state.copyWith(vehicleCache: specs));
      
      // Also sync warranty in background
      _repository.syncWarranty(event.vin);
    } catch (e) {
      print('VehicleBloc: Failed to fetch specs: $e');
    }
  }
}

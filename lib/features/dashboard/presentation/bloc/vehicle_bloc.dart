import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/vehicle.dart';
import '../../domain/tesla_product.dart';
import '../../domain/vehicle_repository.dart';

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
  final Vehicle vehicle;
  const SelectVehicle(this.vehicle);
  @override
  List<Object?> get props => [vehicle];
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

// States
enum VehicleStatus { initial, loading, success, error, commandInProgress }

class VehicleState extends Equatable {
  final VehicleStatus status;
  final List<Vehicle> vehicles;
  final List<TeslaProduct> products;
  final Vehicle? selectedVehicle;
  final String? error;
  final Set<String> loadingCommands; // Set of vehicleId_commandType strings

  const VehicleState({
    this.status = VehicleStatus.initial,
    this.vehicles = const [],
    this.products = const [],
    this.selectedVehicle,
    this.error,
    this.loadingCommands = const {},
  });

  @override
  List<Object?> get props => [status, vehicles, products, selectedVehicle, error];

  VehicleState copyWith({
    VehicleStatus? status,
    List<Vehicle>? vehicles,
    List<TeslaProduct>? products,
    Vehicle? selectedVehicle,
    String? error,
    Set<String>? loadingCommands,
  }) {
    return VehicleState(
      status: status ?? this.status,
      vehicles: vehicles ?? this.vehicles,
      products: products ?? this.products,
      selectedVehicle: selectedVehicle ?? this.selectedVehicle,
      error: error ?? this.error,
      loadingCommands: loadingCommands ?? this.loadingCommands,
    );
  }
}

// Bloc
class VehicleBloc extends Bloc<VehicleEvent, VehicleState> {
  final VehicleRepository _repository;
  Timer? _pollingTimer;

  VehicleBloc(this._repository) : super(const VehicleState()) {
    on<FetchVehicles>(_onFetchVehicles);
    on<StartPolling>(_onStartPolling);
    on<StopPolling>(_onStopPolling);
    on<SelectVehicle>(_onSelectVehicle);
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
    on<FetchProducts>(_onFetchProducts);
  }

  void _onStartPolling(StartPolling event, Emitter<VehicleState> emit) {
    _pollingTimer?.cancel();
    _pollingTimer = Timer.periodic(const Duration(seconds: 30), (_) {
      add(FetchVehicles());
    });
  }

  void _onStopPolling(StopPolling event, Emitter<VehicleState> emit) {
    _pollingTimer?.cancel();
    _pollingTimer = null;
  }

  @override
  Future<void> close() {
    _pollingTimer?.cancel();
    return super.close();
  }

  Future<void> _onFetchVehicles(FetchVehicles event, Emitter<VehicleState> emit) async {
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

      emit(state.copyWith(
        status: VehicleStatus.success,
        vehicles: vehicles,
        selectedVehicle: currentSelection,
      ));

      // If we have a selected vehicle, fetch its detailed data as well
      if (currentSelection != null) {
        final detailedVehicle = await _repository.getVehicleData(currentSelection.id);
        emit(state.copyWith(selectedVehicle: detailedVehicle));
      }

      // Also fetch products
      add(FetchProducts());
    } catch (e) {
      emit(state.copyWith(status: VehicleStatus.error, error: e.toString()));
    }
  }

  Future<void> _onSelectVehicle(SelectVehicle event, Emitter<VehicleState> emit) async {
    emit(state.copyWith(status: VehicleStatus.loading, selectedVehicle: event.vehicle));
    try {
      final detailedVehicle = await _repository.getVehicleData(event.vehicle.id);
      emit(state.copyWith(status: VehicleStatus.success, selectedVehicle: detailedVehicle));
    } catch (e) {
      // Fallback to basic info if detailed fetch fails
      emit(state.copyWith(status: VehicleStatus.success, selectedVehicle: event.vehicle));
    }
  }

  Future<void> _onToggleLock(ToggleLock event, Emitter<VehicleState> emit) async {
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

  Future<void> _onActuateTrunk(ActuateTrunk event, Emitter<VehicleState> emit) async {
    try {
      await _repository.actuateTrunk(event.vehicleId, event.whichTrunk);
      add(FetchVehicles());
    } catch (e) {
      emit(state.copyWith(status: VehicleStatus.error, error: e.toString()));
    }
  }

  Future<void> _onToggleClimate(ToggleClimate event, Emitter<VehicleState> emit) async {
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

  Future<void> _onSetTemperature(SetTemperature event, Emitter<VehicleState> emit) async {
    try {
      await _repository.setTemperature(event.vehicleId, event.temp);
      add(FetchVehicles());
    } catch (e) {
      emit(state.copyWith(status: VehicleStatus.error, error: e.toString()));
    }
  }

  Future<void> _onSetSeatHeater(SetSeatHeater event, Emitter<VehicleState> emit) async {
    try {
      await _repository.setSeatHeater(event.vehicleId, event.heater, event.level);
      add(FetchVehicles());
    } catch (e) {
      emit(state.copyWith(status: VehicleStatus.error, error: e.toString()));
    }
  }

  Future<void> _onSetChargeLimit(SetChargeLimit event, Emitter<VehicleState> emit) async {
    try {
      await _repository.setChargeLimit(event.vehicleId, event.limit);
      add(FetchVehicles());
    } catch (e) {
      emit(state.copyWith(status: VehicleStatus.error, error: e.toString()));
    }
  }

  Future<void> _onToggleCharging(ToggleCharging event, Emitter<VehicleState> emit) async {
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

  Future<void> _onSetChargingAmps(SetChargingAmps event, Emitter<VehicleState> emit) async {
    try {
      await _repository.setChargingAmps(event.vehicleId, event.amps);
      add(FetchVehicles());
    } catch (e) {
      emit(state.copyWith(status: VehicleStatus.error, error: e.toString()));
    }
  }

  Future<void> _onHonkHorn(HonkHorn event, Emitter<VehicleState> emit) async {
    try {
      await _repository.honkHorn(event.vehicleId);
    } catch (e) {
      emit(state.copyWith(status: VehicleStatus.error, error: e.toString()));
    }
  }

  Future<void> _onFlashLights(FlashLights event, Emitter<VehicleState> emit) async {
    try {
      await _repository.flashLights(event.vehicleId);
    } catch (e) {
      emit(state.copyWith(status: VehicleStatus.error, error: e.toString()));
    }
  }

  Future<void> _onFetchProducts(FetchProducts event, Emitter<VehicleState> emit) async {
    try {
      final products = await _repository.getProducts();
      emit(state.copyWith(products: products));
    } catch (e) {
      print('VehicleBloc: Failed to fetch products: $e');
    }
  }
}

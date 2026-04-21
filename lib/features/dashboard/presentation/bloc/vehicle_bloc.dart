import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:voltride/features/charging/domain/charging_repository.dart';
import '../../domain/vehicle.dart';
import '../../domain/vehicle_repository.dart';
import '../../data/models/tesla_models.dart' as models hide TeslaProduct;
import '../../domain/tesla_product.dart';
import 'package:flutter/foundation.dart';
import 'package:voltride/core/services/vehicle_data_service.dart';
import 'package:voltride/core/services/firestore_telemetry_service.dart';
import 'package:voltride/core/services/notification_service.dart';
import 'package:voltride/core/services/phantom_drain_service.dart';
import 'package:voltride/core/network/tesla_config.dart';
import '../../data/services/intelligence_engine.dart';
import '../../data/repositories/vehicle_repository_impl.dart';


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

class LoadCachedData extends VehicleEvent {}

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

class SetClimateKeeperMode extends VehicleEvent {
  final String vehicleId;
  final String mode; // "dog", "camp", "on", "off"
  const SetClimateKeeperMode(this.vehicleId, this.mode);
  @override
  List<Object?> get props => [vehicleId, mode];
}

class OpenChargePort extends VehicleEvent {
  final String vehicleId;
  const OpenChargePort(this.vehicleId);
  @override
  List<Object?> get props => [vehicleId];
}

class CloseChargePort extends VehicleEvent {
  final String vehicleId;
  const CloseChargePort(this.vehicleId);
  @override
  List<Object?> get props => [vehicleId];
}

class SetScheduledCharging extends VehicleEvent {
  final String vehicleId;
  final bool enable;
  final int? startTime; // Unix timestamp in minutes-since-midnight format
  const SetScheduledCharging(this.vehicleId, this.enable, {this.startTime});
  @override
  List<Object?> get props => [vehicleId, enable, startTime];
}

class FetchNearbySuperchargers extends VehicleEvent {}

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

class WakeOnForeground extends VehicleEvent {}

/// Fired by the Firestore stream when a remote (or local) write updates
/// the telemetry document — triggers a live UI refresh without a REST call.
class TelemetryStreamUpdate extends VehicleEvent {
  final Map<String, dynamic> data;
  const TelemetryStreamUpdate(this.data);
  @override
  List<Object?> get props => [data];
}

/// Registers the Fleet Telemetry proxy endpoint with Tesla so the vehicle
/// pushes sub-second telemetry to the proxy → Firestore → app.
/// [proxyHostname] is the Cloud Run hostname (without https://).
class ConfigureFleetTelemetry extends VehicleEvent {
  final String proxyHostname;
  const ConfigureFleetTelemetry(this.proxyHostname);
  @override
  List<Object?> get props => [proxyHostname];
}

/// Refreshes only the currently selected vehicle's full data.
/// Faster than [FetchVehicles] post-command because it skips the vehicle list call.
class RefreshSelectedVehicle extends VehicleEvent {}

// States
enum VehicleStatus { initial, loading, success, error, commandInProgress, refreshing }

class VehicleBlocState extends Equatable {
  final VehicleStatus status;
  final List<Vehicle> vehicles;
  final List<TeslaProduct> products;
  final Vehicle? selectedVehicle;
  final List<models.BatterySnapshot> batteryHistory;
  final List<models.ChargingHistoryEntry> chargingHistory;
  final List<models.DriveSession> tripHistory;
  final String? error;
  /// Non-null when a vehicle command (climate, lock, etc.) fails.
  /// Does NOT change [status] — the page stays visible, a SnackBar is shown.
  final String? commandError;
  final Set<String> loadingCommands;
  final models.VehicleCache? vehicleCache;
  final List<SmartSuggestion> suggestions;
  final DateTime? lastSyncTime;
  final List<models.ChargingLocation>? nearbySuperchargers;
  final bool nearbyLoading;

  const VehicleBlocState({
    this.status = VehicleStatus.initial,
    this.vehicles = const [],
    this.products = const [],
    this.selectedVehicle,
    this.batteryHistory = const [],
    this.chargingHistory = const [],
    this.tripHistory = const [],
    this.error,
    this.commandError,
    this.loadingCommands = const {},
    this.vehicleCache,
    this.suggestions = const [],
    this.lastSyncTime,
    this.nearbySuperchargers,
    this.nearbyLoading = false,
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
    commandError,
    vehicleCache,
    suggestions,
    lastSyncTime,
    nearbySuperchargers,
    nearbyLoading,
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
    String? commandError,
    bool clearCommandError = false,
    Set<String>? loadingCommands,
    models.VehicleCache? vehicleCache,
    List<SmartSuggestion>? suggestions,
    DateTime? lastSyncTime,
    List<models.ChargingLocation>? nearbySuperchargers,
    bool? nearbyLoading,
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
      commandError: clearCommandError ? null : (commandError ?? this.commandError),
      loadingCommands: loadingCommands ?? this.loadingCommands,
      vehicleCache: vehicleCache ?? this.vehicleCache,
      suggestions: suggestions ?? this.suggestions,
      lastSyncTime: lastSyncTime ?? this.lastSyncTime,
      nearbySuperchargers: nearbySuperchargers ?? this.nearbySuperchargers,
      nearbyLoading: nearbyLoading ?? this.nearbyLoading,
    );
  }
  
}

// Bloc
class VehicleBloc extends Bloc<VehicleEvent, VehicleBlocState> {
  final VehicleRepository _repository;
  final ChargingRepository _chargingRepository;
  final VehicleDataService _pollingService;
  final IntelligenceEngine _intelligenceEngine;
  final FirestoreTelemetryService _firestoreService;
  Timer? _pollingTimer;
  StreamSubscription<Map<String, dynamic>>? _telemetryStreamSub;

  VehicleBloc(
    this._repository,
    this._chargingRepository,
    this._pollingService,
    this._intelligenceEngine,
    this._firestoreService,
  ) : super(const VehicleBlocState()) {
    on<FetchVehicles>(_onFetchVehicles);
    on<LoadCachedData>(_onLoadCachedData);
    on<StartPolling>(_onStartPolling);
    on<StopPolling>(_onStopPolling);
    on<SelectVehicle>(_onSelectVehicle);
    on<FetchHistory>(_onFetchHistory);
    on<FetchSpecs>(_onFetchSpecs);
    on<WakeOnForeground>(_onWakeOnForeground);
    on<TelemetryStreamUpdate>(_onTelemetryStreamUpdate);
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
    on<ConfigureFleetTelemetry>(_onConfigureFleetTelemetry);
    on<SetClimateKeeperMode>(_onSetClimateKeeperMode);
    on<OpenChargePort>(_onOpenChargePort);
    on<CloseChargePort>(_onCloseChargePort);
    on<SetScheduledCharging>(_onSetScheduledCharging);
    on<FetchNearbySuperchargers>(_onFetchNearbySuperchargers);
    on<RefreshSelectedVehicle>(_onRefreshSelectedVehicle);
  }

  /// Converts raw exception messages into user-friendly strings.
  /// Surfaces the virtual key setup instruction prominently.
  String _userFriendlyError(Object e) {
    final msg = e.toString();
    if (msg.contains('whitelist') || msg.contains('virtual key') || msg.contains('Virtual key')) {
      return 'VIRTUAL_KEY_NOT_ADDED';
    }
    if (msg.contains('Unauthorized')) {
      return 'Command rejected by vehicle. If this keeps happening, add the virtual key: open https://tesla.com/_ak/thedevelopersharma.com in the Tesla app and tap your car.';
    }
    if (msg.contains('Vehicle failed to wake') || msg.contains('asleep')) {
      return 'Vehicle is asleep. Try again in a moment.';
    }
    if (msg.contains('403') || msg.contains('Vehicle Command Protocol')) {
      return 'VIRTUAL_KEY_NOT_ADDED';
    }
    return msg.replaceAll('Exception: ', '');
  }

  /// Cast to concrete type for cache access
  VehicleRepositoryImpl? get _repoImpl => _repository is VehicleRepositoryImpl ? _repository as VehicleRepositoryImpl : null;

  void _onStartPolling(StartPolling event, Emitter<VehicleBlocState> emit) {
    if (state.selectedVehicle == null) return;
    _pollingService.startPolling(state.selectedVehicle!.id);

    // REST fallback: periodic BLoC-level refresh every 5 minutes.
    // Once Fleet Telemetry is active this becomes a safety net only.
    _pollingTimer?.cancel();
    _pollingTimer = Timer.periodic(const Duration(minutes: 5), (_) {
      add(FetchVehicles());
    });

    // Subscribe to Firestore real-time stream for this VIN.
    // Any write — from this device's REST poll or from the proxy backend's
    // Fleet Telemetry handler — immediately fires TelemetryStreamUpdate.
    _telemetryStreamSub?.cancel();
    _telemetryStreamSub = _firestoreService
        .streamVehicleState(state.selectedVehicle!.vin)
        .listen(
          (data) => add(TelemetryStreamUpdate(data)),
          onError: (e) => debugPrint('VehicleBloc: Firestore stream error: $e'),
        );
  }

  void _onStopPolling(StopPolling event, Emitter<VehicleBlocState> emit) {
    _pollingTimer?.cancel();
    _pollingTimer = null;
    _telemetryStreamSub?.cancel();
    _telemetryStreamSub = null;
    _pollingService.stopPolling();
  }

  @override
  Future<void> close() {
    _pollingTimer?.cancel();
    _telemetryStreamSub?.cancel();
    return super.close();
  }


  /// Load cached vehicle data from Hive for instant cold-start display.
  Future<void> _onLoadCachedData(LoadCachedData event, Emitter<VehicleBlocState> emit) async {
    final repoImpl = _repoImpl;
    if (repoImpl == null) return;

    // We don't have a VIN yet on first open, so we just check the last sync time
    final lastSync = repoImpl.getLastSyncTime();
    if (lastSync != null) {
      emit(state.copyWith(lastSyncTime: lastSync));
    }
  }

  /// Fast post-command refresh: only fetches the selected vehicle's detailed data.
  Future<void> _onRefreshSelectedVehicle(RefreshSelectedVehicle event, Emitter<VehicleBlocState> emit) async {
    final current = state.selectedVehicle;
    if (current == null) {
      add(FetchVehicles());
      return;
    }
    try {
      final updated = await _repository.getVehicleData(current.id);
      emit(state.copyWith(
        selectedVehicle: updated,
        status: VehicleStatus.success,
        lastSyncTime: DateTime.now(),
      ));
      _firestoreService.writeVehicleState(updated);
      add(FetchHistory(updated.vin));
    } catch (e) {
      debugPrint('VehicleBloc: RefreshSelectedVehicle failed: $e');
      // Fall back silently — optimistic update already applied
    }
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

      // If we have a selected vehicle, always attempt a detailed data fetch.
      // The repository handles 408 (asleep) by sending a wake command + retry,
      // so we never need to gate on vehicle.state here.
      if (currentSelection != null) {
        try {
          // getVehicleData calls TripDetectionService.processSnapshot internally,
          // which may save a new DriveSession. FetchHistory is queued AFTER so it
          // picks up any session that was just persisted.
          final detailedVehicle = await _repository.getVehicleData(currentSelection.id);
          currentSelection = detailedVehicle;
        } catch (e) {
          debugPrint('VehicleBloc: Failed to fetch detailed data, using cached: $e');
        }
        // Refresh Hive history (battery + trips) after processSnapshot has run
        add(FetchHistory(currentSelection!.vin));
      }

      emit(state.copyWith(
        status: VehicleStatus.success,
        vehicles: vehicles,
        selectedVehicle: currentSelection,
        lastSyncTime: DateTime.now(),
      ));

      // Write fresh state to Firestore so all listeners (other devices,
      // Fleet Telemetry subscription) have the latest data immediately.
      if (currentSelection != null) {
        _firestoreService.writeVehicleState(currentSelection);
      }

      // Auto-configure Fleet Telemetry if hostname is set in .env and this is
      // the first successful fetch (vehicles were empty before).
      final hostname = TeslaConfig.fleetTelemetryHostname;
      if (hostname != null && hostname.isNotEmpty && currentSelection != null && state.vehicles.isEmpty) {
        add(ConfigureFleetTelemetry(hostname));
      }

      // Also fetch products
      add(FetchProducts());
    } catch (e) {
      emit(state.copyWith(status: VehicleStatus.error, error: e.toString()));
    }
  }

  /// Fetch history data from local Hive storage (no Firestore).
  Future<void> _onFetchHistory(FetchHistory event, Emitter<VehicleBlocState> emit) async {
    try {
      debugPrint('VehicleBloc: Fetching local history for VIN: ${event.vin}');
      
      // 1. Fetch Battery Telemetry from local Hive
      final batteryHistory = await _repository.getBatteryHistory(event.vin);
      // Sort by timestamp descending, take last 50
      batteryHistory.sort((a, b) => b.timestamp.compareTo(a.timestamp));
      final recentBatteryHistory = batteryHistory.take(50).toList();

      // 2. Fetch Trip History from local Hive
      final tripHistory = await _repository.getTripHistory(event.vin);

      emit(state.copyWith(
        batteryHistory: recentBatteryHistory,
        tripHistory: tripHistory,
      ));

      // Generate suggestions based on updated local history
      if (state.selectedVehicle != null && recentBatteryHistory.isNotEmpty) {
        final suggestions = _intelligenceEngine.generateSuggestions(
          vehicle: state.selectedVehicle!,
          history: recentBatteryHistory,
          cache: state.vehicleCache,
        );
        emit(state.copyWith(suggestions: suggestions));
      }
      
      debugPrint('VehicleBloc: Local history loaded (${recentBatteryHistory.length} battery, ${tripHistory.length} trips)');
    } catch (e) {
      debugPrint('VehicleBloc: Failed to fetch local history for ${event.vin}: $e');
    }
  }

  /// Applies a Firestore telemetry update to the selected vehicle in-place.
  /// This fires whenever any writer (REST poll, Fleet Telemetry proxy) updates
  /// the Firestore document, giving sub-second UI refresh for live data.
  void _onTelemetryStreamUpdate(TelemetryStreamUpdate event, Emitter<VehicleBlocState> emit) {
    final current = state.selectedVehicle;
    if (current == null) return;

    // Only apply if the update is for the currently selected vehicle
    final dataVin = event.data['vin'] as String?;
    if (dataVin != null && dataVin != current.vin) return;

    final prev = current;
    final updated = _firestoreService.applyTelemetryUpdate(current, event.data);
    emit(state.copyWith(selectedVehicle: updated, lastSyncTime: DateTime.now()));

    // Phantom drain tracking on every state update
    PhantomDrainService().onVehicleUpdate(
      soc: updated.batteryLevel,
      shiftState: updated.shiftState,
      chargingState: updated.chargingState,
    );

    // Charging complete notification
    if (prev.chargingState == 'Charging' && updated.chargingState != 'Charging') {
      NotificationService().notifyChargingComplete(
          updated.batteryLevel, updated.chargeEnergyAdded);
    }

    // Low battery notification
    if (prev.batteryLevel > updated.batteryLevel && updated.chargingState != 'Charging') {
      NotificationService().notifyLowBattery(updated.batteryLevel);
    }

    // Sentry alert — detect sentry turning on unexpectedly (vehicle was stationary)
    if (!prev.isSentryModeOn && updated.isSentryModeOn) {
      NotificationService().notifySentryEvent();
    }

    // Software update notification
    if (prev.softwareVersion.isNotEmpty &&
        updated.softwareVersion.isNotEmpty &&
        prev.softwareVersion != updated.softwareVersion) {
      NotificationService()
          .notifySoftwareUpdate(updated.softwareVersion, prev.softwareVersion);
    }

    // Tire pressure alert — any TPMS reading below 2.5 bar (≈36 PSI)
    const lowTpmsThreshold = 2.5; // bar
    final fl = updated.tpmsPressureFl;
    final fr = updated.tpmsPressureFr;
    if (fl != null && fl > 0 && fl < lowTpmsThreshold) {
      NotificationService().notifyTirePressure('Front Left', fl * 14.5);
    }
    if (fr != null && fr > 0 && fr < lowTpmsThreshold) {
      NotificationService().notifyTirePressure('Front Right', fr * 14.5);
    }
  }

  Future<void> _onSelectVehicle(SelectVehicle event, Emitter<VehicleBlocState> emit) async {
    final vehicle = state.vehicles.firstWhere(
      (v) => v.vin == event.vin,
      orElse: () => state.vehicles.isNotEmpty ? state.vehicles.first : state.selectedVehicle!,
    );

    // Re-subscribe Firestore stream to new VIN
    _telemetryStreamSub?.cancel();
    _telemetryStreamSub = _firestoreService
        .streamVehicleState(vehicle.vin)
        .listen(
          (data) => add(TelemetryStreamUpdate(data)),
          onError: (e) => debugPrint('VehicleBloc: Firestore stream error: $e'),
        );

    emit(state.copyWith(status: VehicleStatus.loading, selectedVehicle: vehicle));
    try {
      final detailedVehicle = await _repository.getVehicleData(vehicle.id);
      _firestoreService.writeVehicleState(detailedVehicle);
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
      add(RefreshSelectedVehicle());
    } catch (e) {
      emit(state.copyWith(
        commandError: _userFriendlyError(e),
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
      add(RefreshSelectedVehicle());
    } catch (e) {
      emit(state.copyWith(commandError: _userFriendlyError(e)));
    }
  }

  Future<void> _onToggleClimate(ToggleClimate event, Emitter<VehicleBlocState> emit) async {
    final cmdId = '${event.vehicleId}_climate';
    final currentSelected = state.selectedVehicle;

    if (currentSelected != null && currentSelected.id == event.vehicleId) {
      emit(state.copyWith(
        selectedVehicle: currentSelected.copyWith(isClimateOn: event.on),
        loadingCommands: {...state.loadingCommands, cmdId},
      ));
    }

    try {
      await _repository.setClimateOn(event.vehicleId, event.on);
      add(RefreshSelectedVehicle());
    } catch (e) {
      emit(state.copyWith(
        commandError: _userFriendlyError(e),
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
      add(RefreshSelectedVehicle());
    } catch (e) {
      emit(state.copyWith(commandError: _userFriendlyError(e)));
    }
  }

  Future<void> _onSetSeatHeater(SetSeatHeater event, Emitter<VehicleBlocState> emit) async {
    try {
      await _repository.setSeatHeater(event.vehicleId, event.heater, event.level);
      add(RefreshSelectedVehicle());
    } catch (e) {
      emit(state.copyWith(commandError: _userFriendlyError(e)));
    }
  }

  Future<void> _onSetChargeLimit(SetChargeLimit event, Emitter<VehicleBlocState> emit) async {
    try {
      await _repository.setChargeLimit(event.vehicleId, event.limit);
      add(RefreshSelectedVehicle());
    } catch (e) {
      emit(state.copyWith(commandError: _userFriendlyError(e)));
    }
  }

  Future<void> _onToggleCharging(ToggleCharging event, Emitter<VehicleBlocState> emit) async {
    final cmdId = '${event.vehicleId}_charging';
    final currentSelected = state.selectedVehicle;

    if (currentSelected != null && currentSelected.id == event.vehicleId) {
      emit(state.copyWith(
        selectedVehicle: currentSelected.copyWith(
          chargingState: event.start ? 'Charging' : 'Stopped',
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
      add(RefreshSelectedVehicle());
    } catch (e) {
      emit(state.copyWith(
        commandError: _userFriendlyError(e),
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
      add(RefreshSelectedVehicle());
    } catch (e) {
      emit(state.copyWith(commandError: _userFriendlyError(e)));
    }
  }

  Future<void> _onHonkHorn(HonkHorn event, Emitter<VehicleBlocState> emit) async {
    try {
      await _repository.honkHorn(event.vehicleId);
    } catch (e) {
      emit(state.copyWith(commandError: 'Horn command failed: ${e.toString()}'));
    }
  }

  Future<void> _onFlashLights(FlashLights event, Emitter<VehicleBlocState> emit) async {
    try {
      await _repository.flashLights(event.vehicleId);
    } catch (e) {
      emit(state.copyWith(commandError: 'Flash lights command failed: ${e.toString()}'));
    }
  }

  Future<void> _onFetchProducts(FetchProducts event, Emitter<VehicleBlocState> emit) async {
    try {
      final products = await _repository.getProducts();
      emit(state.copyWith(products: products));
    } catch (e) {
      debugPrint('VehicleBloc: Failed to fetch products: $e');
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
        commandError: 'Sentry mode command failed: ${e.toString()}',
        selectedVehicle: currentSelected, // rollback optimistic update
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
        commandError: 'Valet mode command failed: ${e.toString()}',
        selectedVehicle: currentSelected, // rollback optimistic update
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
      debugPrint('VehicleBloc: Failed to fetch specs: $e');
    }
  }

  /// Wake the vehicle when app comes to foreground, then fetch fresh data.
  /// Sends the wake command immediately and dispatches FetchVehicles without
  /// blocking — the repository handles 408 (asleep) with its own retry logic.
  Future<void> _onWakeOnForeground(WakeOnForeground event, Emitter<VehicleBlocState> emit) async {
    final currentSelected = state.selectedVehicle;
    if (currentSelected == null) {
      // No vehicle cached yet — do a full fetch
      add(FetchVehicles());
      return;
    }

    debugPrint('VehicleBloc: App resumed — waking vehicle ${currentSelected.id}');
    emit(state.copyWith(status: VehicleStatus.refreshing));

    // 1. Fire wake command (non-blocking — vehicle may already be online)
    try {
      await _repository.wakeUp(currentSelected.id);
    } catch (e) {
      debugPrint('VehicleBloc: Wake command failed (vehicle may already be online): $e');
    }

    // 2. Kick off a fresh data fetch immediately.
    //    Repository handles 408 (vehicle asleep) internally via its own retry.
    add(FetchVehicles());
  }

  Future<void> _onSetClimateKeeperMode(SetClimateKeeperMode event, Emitter<VehicleBlocState> emit) async {
    final cmdId = '${event.vehicleId}_keeper';
    final currentSelected = state.selectedVehicle;

    if (currentSelected != null && currentSelected.id == event.vehicleId) {
      emit(state.copyWith(
        selectedVehicle: currentSelected.copyWith(climateKeeperMode: event.mode),
        loadingCommands: {...state.loadingCommands, cmdId},
      ));
    }

    try {
      await _repository.setClimateKeeperMode(event.vehicleId, event.mode);
      add(FetchVehicles());
    } catch (e) {
      emit(state.copyWith(
        commandError: 'Climate keeper mode failed: ${e.toString()}',
        selectedVehicle: currentSelected,
      ));
    } finally {
      emit(state.copyWith(loadingCommands: Set.from(state.loadingCommands)..remove(cmdId)));
    }
  }

  Future<void> _onOpenChargePort(OpenChargePort event, Emitter<VehicleBlocState> emit) async {
    final cmdId = '${event.vehicleId}_chargeport';
    final currentSelected = state.selectedVehicle;

    if (currentSelected != null && currentSelected.id == event.vehicleId) {
      emit(state.copyWith(
        selectedVehicle: currentSelected.copyWith(chargePortOpen: true),
        loadingCommands: {...state.loadingCommands, cmdId},
      ));
    }

    try {
      await _repository.openChargePort(event.vehicleId);
      add(FetchVehicles());
    } catch (e) {
      emit(state.copyWith(
        commandError: 'Charge port open failed: ${e.toString()}',
        selectedVehicle: currentSelected,
      ));
    } finally {
      emit(state.copyWith(loadingCommands: Set.from(state.loadingCommands)..remove(cmdId)));
    }
  }

  Future<void> _onCloseChargePort(CloseChargePort event, Emitter<VehicleBlocState> emit) async {
    final cmdId = '${event.vehicleId}_chargeport';
    final currentSelected = state.selectedVehicle;

    if (currentSelected != null && currentSelected.id == event.vehicleId) {
      emit(state.copyWith(
        selectedVehicle: currentSelected.copyWith(chargePortOpen: false),
        loadingCommands: {...state.loadingCommands, cmdId},
      ));
    }

    try {
      await _repository.closeChargePort(event.vehicleId);
      add(FetchVehicles());
    } catch (e) {
      emit(state.copyWith(
        commandError: 'Charge port close failed: ${e.toString()}',
        selectedVehicle: currentSelected,
      ));
    } finally {
      emit(state.copyWith(loadingCommands: Set.from(state.loadingCommands)..remove(cmdId)));
    }
  }

  Future<void> _onSetScheduledCharging(SetScheduledCharging event, Emitter<VehicleBlocState> emit) async {
    try {
      await _repository.setScheduledCharging(event.vehicleId, event.enable, startTime: event.startTime);
      add(FetchVehicles());
    } catch (e) {
      emit(state.copyWith(commandError: 'Scheduled charging failed: ${e.toString()}'));
    }
  }

  Future<void> _onFetchNearbySuperchargers(FetchNearbySuperchargers event, Emitter<VehicleBlocState> emit) async {
    final vehicle = state.selectedVehicle;
    if (vehicle == null) return;

    emit(state.copyWith(nearbyLoading: true));
    try {
      final locations = await _repository.getNearbyChargingSites(vehicle.id);
      emit(state.copyWith(nearbySuperchargers: locations, nearbyLoading: false));
    } catch (e) {
      debugPrint('VehicleBloc: Failed to fetch nearby superchargers: $e');
      emit(state.copyWith(nearbySuperchargers: const [], nearbyLoading: false));
    }
  }

  Future<void> _onConfigureFleetTelemetry(ConfigureFleetTelemetry event, Emitter<VehicleBlocState> emit) async {
    final vehicle = state.selectedVehicle;
    if (vehicle == null) {
      debugPrint('VehicleBloc: ConfigureFleetTelemetry — no selected vehicle');
      return;
    }
    try {
      await _repository.configureFleetTelemetry(vehicle.id, event.proxyHostname);
      debugPrint('VehicleBloc: Fleet Telemetry configured for VIN ${vehicle.vin} → ${event.proxyHostname}');
    } catch (e) {
      debugPrint('VehicleBloc: Fleet Telemetry configuration failed: $e');
      emit(state.copyWith(status: VehicleStatus.error, error: 'Fleet Telemetry setup failed: $e'));
    }
  }
}

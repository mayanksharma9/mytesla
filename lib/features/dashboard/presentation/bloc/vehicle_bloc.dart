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

class WindowControl extends VehicleEvent {
  final String vehicleId;
  final String command; // "vent" or "close"
  const WindowControl(this.vehicleId, this.command);
  @override
  List<Object?> get props => [vehicleId, command];
}

class MediaTogglePlayback extends VehicleEvent {
  final String vehicleId;
  const MediaTogglePlayback(this.vehicleId);
  @override
  List<Object?> get props => [vehicleId];
}

class MediaNextTrack extends VehicleEvent {
  final String vehicleId;
  const MediaNextTrack(this.vehicleId);
  @override
  List<Object?> get props => [vehicleId];
}

class MediaPrevTrack extends VehicleEvent {
  final String vehicleId;
  const MediaPrevTrack(this.vehicleId);
  @override
  List<Object?> get props => [vehicleId];
}

class MediaVolumeUp extends VehicleEvent {
  final String vehicleId;
  const MediaVolumeUp(this.vehicleId);
  @override
  List<Object?> get props => [vehicleId];
}

class MediaVolumeDown extends VehicleEvent {
  final String vehicleId;
  const MediaVolumeDown(this.vehicleId);
  @override
  List<Object?> get props => [vehicleId];
}

class RemoteBoombox extends VehicleEvent {
  final String vehicleId;
  final int soundId; // 0=random fart, 2000=locate ping
  const RemoteBoombox(this.vehicleId, this.soundId);
  @override
  List<Object?> get props => [vehicleId, soundId];
}

class SetBioweaponMode extends VehicleEvent {
  final String vehicleId;
  final bool on;
  const SetBioweaponMode(this.vehicleId, this.on);
  @override
  List<Object?> get props => [vehicleId, on];
}

class SetCabinOverheatProtection extends VehicleEvent {
  final String vehicleId;
  final bool on;
  final bool fanOnly;
  const SetCabinOverheatProtection(this.vehicleId, {required this.on, this.fanOnly = false});
  @override
  List<Object?> get props => [vehicleId, on, fanOnly];
}

class RemoteStartDrive extends VehicleEvent {
  final String vehicleId;
  const RemoteStartDrive(this.vehicleId);
  @override
  List<Object?> get props => [vehicleId];
}

class SetPreconditioningMax extends VehicleEvent {
  final String vehicleId;
  final bool on;
  const SetPreconditioningMax(this.vehicleId, this.on);
  @override
  List<Object?> get props => [vehicleId, on];
}

class ChargeMaxRange extends VehicleEvent {
  final String vehicleId;
  const ChargeMaxRange(this.vehicleId);
  @override List<Object?> get props => [vehicleId];
}

class ChargeStandard extends VehicleEvent {
  final String vehicleId;
  const ChargeStandard(this.vehicleId);
  @override List<Object?> get props => [vehicleId];
}

class SetSeatCooler extends VehicleEvent {
  final String vehicleId;
  final int seatPosition; // 1=front left, 2=front right
  final int level;        // 0=off, 1=low, 2=med, 3=high
  const SetSeatCooler(this.vehicleId, this.seatPosition, this.level);
  @override List<Object?> get props => [vehicleId, seatPosition, level];
}

class SetCopTemp extends VehicleEvent {
  final String vehicleId;
  final int copTemp; // 0=Low/90°F, 1=Med/95°F, 2=High/100°F
  const SetCopTemp(this.vehicleId, this.copTemp);
  @override List<Object?> get props => [vehicleId, copTemp];
}

class SetSteeringWheelHeatLevel extends VehicleEvent {
  final String vehicleId;
  final int level; // 0=off, 1=low, 3=high
  const SetSteeringWheelHeatLevel(this.vehicleId, this.level);
  @override List<Object?> get props => [vehicleId, level];
}

class AdjustVolume extends VehicleEvent {
  final String vehicleId;
  final double volume; // 0.0–11.0
  const AdjustVolume(this.vehicleId, this.volume);
  @override List<Object?> get props => [vehicleId, volume];
}

class SunRoofControl extends VehicleEvent {
  final String vehicleId;
  final String state; // "vent", "close", "stop"
  const SunRoofControl(this.vehicleId, this.state);
  @override List<Object?> get props => [vehicleId, state];
}

class ScheduleSoftwareUpdate extends VehicleEvent {
  final String vehicleId;
  final int offsetSec;
  const ScheduleSoftwareUpdate(this.vehicleId, this.offsetSec);
  @override List<Object?> get props => [vehicleId, offsetSec];
}

class CancelSoftwareUpdate extends VehicleEvent {
  final String vehicleId;
  const CancelSoftwareUpdate(this.vehicleId);
  @override List<Object?> get props => [vehicleId];
}

class NavigateToGps extends VehicleEvent {
  final String vehicleId;
  final double lat;
  final double lon;
  const NavigateToGps(this.vehicleId, this.lat, this.lon);
  @override List<Object?> get props => [vehicleId, lat, lon];
}

class NavigateToSupercharger extends VehicleEvent {
  final String vehicleId;
  final String superchargerId;
  const NavigateToSupercharger(this.vehicleId, this.superchargerId);
  @override List<Object?> get props => [vehicleId, superchargerId];
}

class FetchRecentAlerts extends VehicleEvent {
  final String vin;
  const FetchRecentAlerts(this.vin);
  @override List<Object?> get props => [vin];
}

class FetchServiceData extends VehicleEvent {
  final String vin;
  const FetchServiceData(this.vin);
  @override List<Object?> get props => [vin];
}

class FetchDrivers extends VehicleEvent {
  final String vin;
  const FetchDrivers(this.vin);
  @override List<Object?> get props => [vin];
}

class CreateShareInvite extends VehicleEvent {
  final String vin;
  const CreateShareInvite(this.vin);
  @override List<Object?> get props => [vin];
}

class RevokeShareInvite extends VehicleEvent {
  final String vin;
  final String inviteId;
  const RevokeShareInvite(this.vin, this.inviteId);
  @override List<Object?> get props => [vin, inviteId];
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

class FetchFleetTelemetryConfig extends VehicleEvent {
  const FetchFleetTelemetryConfig();
}

class DeleteFleetTelemetryConfig extends VehicleEvent {
  const DeleteFleetTelemetryConfig();
}

class FetchFleetTelemetryErrors extends VehicleEvent {
  const FetchFleetTelemetryErrors();
}

class FetchFleetStatus extends VehicleEvent {
  const FetchFleetStatus();
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
  final Map<String, dynamic>? fleetTelemetryConfig;
  final Map<String, dynamic>? fleetTelemetryErrors;
  final Map<String, dynamic>? fleetStatus;
  final List<Map<String, dynamic>> recentAlerts;
  final Map<String, dynamic>? serviceData;
  final List<Map<String, dynamic>> drivers;
  final List<Map<String, dynamic>> shareInvites;
  final String? createdShareInviteUrl;

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
    this.fleetTelemetryConfig,
    this.fleetTelemetryErrors,
    this.fleetStatus,
    this.recentAlerts = const [],
    this.serviceData,
    this.drivers = const [],
    this.shareInvites = const [],
    this.createdShareInviteUrl,
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
    fleetTelemetryConfig,
    fleetTelemetryErrors,
    fleetStatus,
    recentAlerts,
    serviceData,
    drivers,
    shareInvites,
    createdShareInviteUrl,
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
    Map<String, dynamic>? fleetTelemetryConfig,
    bool clearFleetTelemetryConfig = false,
    Map<String, dynamic>? fleetTelemetryErrors,
    Map<String, dynamic>? fleetStatus,
    List<Map<String, dynamic>>? recentAlerts,
    Map<String, dynamic>? serviceData,
    bool clearServiceData = false,
    List<Map<String, dynamic>>? drivers,
    List<Map<String, dynamic>>? shareInvites,
    String? createdShareInviteUrl,
    bool clearCreatedShareInviteUrl = false,
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
      fleetTelemetryConfig: clearFleetTelemetryConfig ? null : (fleetTelemetryConfig ?? this.fleetTelemetryConfig),
      fleetTelemetryErrors: fleetTelemetryErrors ?? this.fleetTelemetryErrors,
      fleetStatus: fleetStatus ?? this.fleetStatus,
      recentAlerts: recentAlerts ?? this.recentAlerts,
      serviceData: clearServiceData ? null : (serviceData ?? this.serviceData),
      drivers: drivers ?? this.drivers,
      shareInvites: shareInvites ?? this.shareInvites,
      createdShareInviteUrl: clearCreatedShareInviteUrl ? null : (createdShareInviteUrl ?? this.createdShareInviteUrl),
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
    on<WindowControl>(_onWindowControl);
    on<MediaTogglePlayback>(_onMediaTogglePlayback);
    on<MediaNextTrack>(_onMediaNextTrack);
    on<MediaPrevTrack>(_onMediaPrevTrack);
    on<MediaVolumeUp>(_onMediaVolumeUp);
    on<MediaVolumeDown>(_onMediaVolumeDown);
    on<RemoteBoombox>(_onRemoteBoombox);
    on<SetBioweaponMode>(_onSetBioweaponMode);
    on<SetCabinOverheatProtection>(_onSetCabinOverheatProtection);
    on<RemoteStartDrive>(_onRemoteStartDrive);
    on<SetPreconditioningMax>(_onSetPreconditioningMax);
    on<FetchFleetTelemetryConfig>(_onFetchFleetTelemetryConfig);
    on<DeleteFleetTelemetryConfig>(_onDeleteFleetTelemetryConfig);
    on<FetchFleetTelemetryErrors>(_onFetchFleetTelemetryErrors);
    on<FetchFleetStatus>(_onFetchFleetStatus);
    on<ChargeMaxRange>(_onChargeMaxRange);
    on<ChargeStandard>(_onChargeStandard);
    on<SetSeatCooler>(_onSetSeatCooler);
    on<SetCopTemp>(_onSetCopTemp);
    on<SetSteeringWheelHeatLevel>(_onSetSteeringWheelHeatLevel);
    on<AdjustVolume>(_onAdjustVolume);
    on<SunRoofControl>(_onSunRoofControl);
    on<ScheduleSoftwareUpdate>(_onScheduleSoftwareUpdate);
    on<CancelSoftwareUpdate>(_onCancelSoftwareUpdate);
    on<NavigateToGps>(_onNavigateToGps);
    on<NavigateToSupercharger>(_onNavigateToSupercharger);
    on<FetchRecentAlerts>(_onFetchRecentAlerts);
    on<FetchServiceData>(_onFetchServiceData);
    on<FetchDrivers>(_onFetchDrivers);
    on<CreateShareInvite>(_onCreateShareInvite);
    on<RevokeShareInvite>(_onRevokeShareInvite);
  }

  /// Converts raw exception messages into user-friendly strings.
  /// Surfaces the virtual key setup instruction prominently.
  String _userFriendlyError(Object e) {
    final msg = e.toString();
    // Explicit whitelist/key-missing errors → show setup sheet
    if (msg.contains('whitelist') || msg.contains('key not on') ||
        msg.contains('Virtual key required') || msg.contains('Third-Party App Keys') ||
        msg.contains('VirtualKeyNotRegistered') || msg.contains('rejected the command')) {
      return 'VIRTUAL_KEY_NOT_ADDED';
    }
    // Direct Fleet API 403 TVCP — key not added
    if (msg.contains('Vehicle Command Protocol') || msg.contains('tvcp')) {
      return 'VIRTUAL_KEY_NOT_ADDED';
    }
    if (msg.contains('Vehicle failed to wake') || msg.contains('asleep')) {
      return 'Vehicle is asleep. Try again in a moment.';
    }
    if (msg.contains('session could not be established')) {
      return 'Could not establish a secure session with the vehicle. Ensure the proxy is running and the vehicle is online, then try again.';
    }
    return msg.replaceAll('Exception: ', '');
  }

  /// Schedules a [RefreshSelectedVehicle] after [delay].
  ///
  /// Use this instead of immediate `add(RefreshSelectedVehicle())` after
  /// commands so Tesla's REST API has time to propagate the state change
  /// before we poll. Without this delay the optimistic UI update gets
  /// overwritten by the stale response (vehicle reports old state for ~5–15s
  /// after executing a command), making commands appear to have failed.
  void _scheduleRefresh({Duration delay = const Duration(seconds: 10)}) {
    Future.delayed(delay, () {
      if (!isClosed) add(RefreshSelectedVehicle());
    });
  }

  /// Cast to concrete type for cache access
  VehicleRepositoryImpl? get _repoImpl {
    final r = _repository;
    return r is VehicleRepositoryImpl ? r : null;
  }

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
      _scheduleRefresh();
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
    final cmdId = '${event.vehicleId}_trunk_${event.whichTrunk}';
    final currentSelected = state.selectedVehicle;

    // Optimistic: toggle trunk state (0=closed→1=open, anything else→0=closed)
    if (currentSelected != null && currentSelected.id == event.vehicleId) {
      final isFront = event.whichTrunk == 'front';
      final currentState = isFront ? currentSelected.frontTrunkState : currentSelected.rearTrunkState;
      final nextState = currentState == 0 ? 1 : 0;
      emit(state.copyWith(
        selectedVehicle: isFront
            ? currentSelected.copyWith(frontTrunkState: nextState)
            : currentSelected.copyWith(rearTrunkState: nextState),
        loadingCommands: {...state.loadingCommands, cmdId},
      ));
    }

    try {
      await _repository.actuateTrunk(event.vehicleId, event.whichTrunk);
      _scheduleRefresh();
    } catch (e) {
      emit(state.copyWith(
        commandError: _userFriendlyError(e),
        selectedVehicle: currentSelected,
      ));
    } finally {
      emit(state.copyWith(loadingCommands: Set.from(state.loadingCommands)..remove(cmdId)));
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
      _scheduleRefresh();
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
    final currentSelected = state.selectedVehicle;
    if (currentSelected != null && currentSelected.id == event.vehicleId) {
      emit(state.copyWith(
        selectedVehicle: currentSelected.copyWith(
          driverTemp: event.temp,
          passengerTemp: event.temp,
        ),
      ));
    }
    try {
      await _repository.setTemperature(event.vehicleId, event.temp);
      _scheduleRefresh();
    } catch (e) {
      emit(state.copyWith(
        commandError: _userFriendlyError(e),
        selectedVehicle: currentSelected,
      ));
    }
  }

  Future<void> _onSetSeatHeater(SetSeatHeater event, Emitter<VehicleBlocState> emit) async {
    final currentSelected = state.selectedVehicle;
    if (currentSelected != null && currentSelected.id == event.vehicleId) {
      Vehicle updated = currentSelected;
      switch (event.heater) {
        case 0: updated = currentSelected.copyWith(seatHeaterLeft: event.level); break;
        case 1: updated = currentSelected.copyWith(seatHeaterRight: event.level); break;
        case 2: updated = currentSelected.copyWith(seatHeaterRearLeft: event.level); break;
        case 3: updated = currentSelected.copyWith(seatHeaterRearRight: event.level); break;
        case 4: updated = currentSelected.copyWith(seatHeaterRearCenter: event.level); break;
      }
      emit(state.copyWith(selectedVehicle: updated));
    }
    try {
      await _repository.setSeatHeater(event.vehicleId, event.heater, event.level);
      _scheduleRefresh();
    } catch (e) {
      emit(state.copyWith(
        commandError: _userFriendlyError(e),
        selectedVehicle: currentSelected,
      ));
    }
  }

  Future<void> _onSetChargeLimit(SetChargeLimit event, Emitter<VehicleBlocState> emit) async {
    final currentSelected = state.selectedVehicle;
    if (currentSelected != null && currentSelected.id == event.vehicleId) {
      emit(state.copyWith(
        selectedVehicle: currentSelected.copyWith(chargeLimitSoc: event.limit),
      ));
    }
    try {
      await _repository.setChargeLimit(event.vehicleId, event.limit);
      _scheduleRefresh();
    } catch (e) {
      emit(state.copyWith(
        commandError: _userFriendlyError(e),
        selectedVehicle: currentSelected,
      ));
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
      _scheduleRefresh();
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
    final currentSelected = state.selectedVehicle;
    if (currentSelected != null && currentSelected.id == event.vehicleId) {
      emit(state.copyWith(
        selectedVehicle: currentSelected.copyWith(chargeCurrentRequest: event.amps),
      ));
    }
    try {
      await _repository.setChargingAmps(event.vehicleId, event.amps);
      _scheduleRefresh();
    } catch (e) {
      emit(state.copyWith(
        commandError: _userFriendlyError(e),
        selectedVehicle: currentSelected,
      ));
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
      _scheduleRefresh();
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
      _scheduleRefresh();
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
  /// Skips the wake command if the vehicle was synced within the last 5 minutes
  /// (it is almost certainly still online), saving an unnecessary wake API call.
  Future<void> _onWakeOnForeground(WakeOnForeground event, Emitter<VehicleBlocState> emit) async {
    final currentSelected = state.selectedVehicle;
    if (currentSelected == null) {
      // No vehicle cached yet — do a full fetch
      add(FetchVehicles());
      return;
    }

    emit(state.copyWith(status: VehicleStatus.refreshing));

    // Only send a wake command if we haven't heard from the vehicle recently.
    // If the last sync was within 5 minutes the vehicle is likely still online.
    final lastSync = state.lastSyncTime;
    final recentlyOnline = lastSync != null &&
        DateTime.now().difference(lastSync) < const Duration(minutes: 5);

    if (!recentlyOnline) {
      debugPrint('VehicleBloc: App resumed — waking vehicle ${currentSelected.id}');
      try {
        await _repository.wakeUp(currentSelected.id);
      } catch (e) {
        debugPrint('VehicleBloc: Wake command failed (vehicle may already be online): $e');
      }
    } else {
      debugPrint('VehicleBloc: App resumed — vehicle synced ${DateTime.now().difference(lastSync).inSeconds}s ago, skipping wake');
    }

    // Kick off a fresh data fetch.
    // Repository handles 408 (vehicle asleep) internally via its own retry.
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
      _scheduleRefresh();
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
      _scheduleRefresh();
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
      _scheduleRefresh();
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
      _scheduleRefresh();
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
      // Must pass VIN (not integer vehicleId) — the Fleet API uses VIN everywhere.
      await _repository.configureFleetTelemetry(vehicle.vin, event.proxyHostname);
      debugPrint('VehicleBloc: Fleet Telemetry configured for VIN ${vehicle.vin} → ${event.proxyHostname}');
    } catch (e) {
      debugPrint('VehicleBloc: Fleet Telemetry configuration failed: $e');
      // Non-fatal — REST polling still works, telemetry is a best-effort enhancement.
    }
  }

  Future<void> _onFetchFleetTelemetryConfig(FetchFleetTelemetryConfig event, Emitter<VehicleBlocState> emit) async {
    final vin = state.selectedVehicle?.vin;
    if (vin == null) return;
    try {
      final config = await _repository.getFleetTelemetryConfig(vin);
      debugPrint('VehicleBloc: Fleet Telemetry config for $vin: $config');
      emit(state.copyWith(fleetTelemetryConfig: config));
    } catch (e) {
      debugPrint('VehicleBloc: FetchFleetTelemetryConfig failed: $e');
    }
  }

  Future<void> _onDeleteFleetTelemetryConfig(DeleteFleetTelemetryConfig event, Emitter<VehicleBlocState> emit) async {
    final vin = state.selectedVehicle?.vin;
    if (vin == null) return;
    try {
      await _repository.deleteFleetTelemetryConfig(vin);
      debugPrint('VehicleBloc: Fleet Telemetry config deleted for VIN $vin');
      emit(state.copyWith(fleetTelemetryConfig: null));
    } catch (e) {
      debugPrint('VehicleBloc: DeleteFleetTelemetryConfig failed: $e');
      emit(state.copyWith(commandError: 'Failed to delete telemetry config: $e'));
    }
  }

  Future<void> _onFetchFleetTelemetryErrors(FetchFleetTelemetryErrors event, Emitter<VehicleBlocState> emit) async {
    final vin = state.selectedVehicle?.vin;
    if (vin == null) return;
    try {
      final errors = await _repository.getFleetTelemetryErrors(vin);
      debugPrint('VehicleBloc: Fleet Telemetry errors for $vin: $errors');
      emit(state.copyWith(fleetTelemetryErrors: errors));
    } catch (e) {
      debugPrint('VehicleBloc: FetchFleetTelemetryErrors failed: $e');
    }
  }

  Future<void> _onFetchFleetStatus(FetchFleetStatus event, Emitter<VehicleBlocState> emit) async {
    final vin = state.selectedVehicle?.vin;
    if (vin == null) return;
    try {
      final status = await _repository.getFleetStatus([vin]);
      debugPrint('VehicleBloc: Fleet status for $vin: $status');
      emit(state.copyWith(fleetStatus: status));
    } catch (e) {
      debugPrint('VehicleBloc: FetchFleetStatus failed: $e');
    }
  }

  Future<void> _onWindowControl(WindowControl event, Emitter<VehicleBlocState> emit) async {
    try {
      await _repository.windowControl(event.vehicleId, event.command);
    } catch (e) {
      emit(state.copyWith(commandError: _userFriendlyError(e)));
    }
  }

  Future<void> _onMediaTogglePlayback(MediaTogglePlayback event, Emitter<VehicleBlocState> emit) async {
    try {
      await _repository.mediaCommand(event.vehicleId, 'media_toggle_playback');
    } catch (e) {
      emit(state.copyWith(commandError: _userFriendlyError(e)));
    }
  }

  Future<void> _onMediaNextTrack(MediaNextTrack event, Emitter<VehicleBlocState> emit) async {
    try {
      await _repository.mediaCommand(event.vehicleId, 'media_next_track');
    } catch (e) {
      emit(state.copyWith(commandError: _userFriendlyError(e)));
    }
  }

  Future<void> _onMediaPrevTrack(MediaPrevTrack event, Emitter<VehicleBlocState> emit) async {
    try {
      await _repository.mediaCommand(event.vehicleId, 'media_prev_track');
    } catch (e) {
      emit(state.copyWith(commandError: _userFriendlyError(e)));
    }
  }

  Future<void> _onMediaVolumeUp(MediaVolumeUp event, Emitter<VehicleBlocState> emit) async {
    try {
      await _repository.mediaCommand(event.vehicleId, 'media_volume_up');
    } catch (e) {
      emit(state.copyWith(commandError: _userFriendlyError(e)));
    }
  }

  Future<void> _onMediaVolumeDown(MediaVolumeDown event, Emitter<VehicleBlocState> emit) async {
    try {
      await _repository.mediaCommand(event.vehicleId, 'media_volume_down');
    } catch (e) {
      emit(state.copyWith(commandError: _userFriendlyError(e)));
    }
  }

  Future<void> _onRemoteBoombox(RemoteBoombox event, Emitter<VehicleBlocState> emit) async {
    try {
      await _repository.remoteBoombox(event.vehicleId, event.soundId);
    } catch (e) {
      emit(state.copyWith(commandError: _userFriendlyError(e)));
    }
  }

  Future<void> _onSetBioweaponMode(SetBioweaponMode event, Emitter<VehicleBlocState> emit) async {
    final cmdId = '${event.vehicleId}_bioweapon';
    emit(state.copyWith(loadingCommands: {...state.loadingCommands, cmdId}));
    try {
      await _repository.setBioweaponMode(event.vehicleId, event.on);
      _scheduleRefresh();
    } catch (e) {
      emit(state.copyWith(commandError: _userFriendlyError(e)));
    } finally {
      emit(state.copyWith(loadingCommands: Set.from(state.loadingCommands)..remove(cmdId)));
    }
  }

  Future<void> _onSetCabinOverheatProtection(SetCabinOverheatProtection event, Emitter<VehicleBlocState> emit) async {
    try {
      await _repository.setCabinOverheatProtection(event.vehicleId, on: event.on, fanOnly: event.fanOnly);
      _scheduleRefresh();
    } catch (e) {
      emit(state.copyWith(commandError: _userFriendlyError(e)));
    }
  }

  Future<void> _onRemoteStartDrive(RemoteStartDrive event, Emitter<VehicleBlocState> emit) async {
    try {
      await _repository.remoteStartDrive(event.vehicleId);
    } catch (e) {
      emit(state.copyWith(commandError: _userFriendlyError(e)));
    }
  }

  Future<void> _onSetPreconditioningMax(SetPreconditioningMax event, Emitter<VehicleBlocState> emit) async {
    try {
      await _repository.setPreconditioningMax(event.vehicleId, event.on);
      _scheduleRefresh();
    } catch (e) {
      emit(state.copyWith(commandError: _userFriendlyError(e)));
    }
  }

  Future<void> _onChargeMaxRange(ChargeMaxRange event, Emitter<VehicleBlocState> emit) async {
    final cmdId = '${event.vehicleId}_charge_mode';
    emit(state.copyWith(loadingCommands: {...state.loadingCommands, cmdId}));
    try {
      await _repository.chargeMaxRange(event.vehicleId);
      _scheduleRefresh();
    } catch (e) {
      emit(state.copyWith(commandError: _userFriendlyError(e)));
    } finally {
      emit(state.copyWith(loadingCommands: Set.from(state.loadingCommands)..remove(cmdId)));
    }
  }

  Future<void> _onChargeStandard(ChargeStandard event, Emitter<VehicleBlocState> emit) async {
    final cmdId = '${event.vehicleId}_charge_mode';
    emit(state.copyWith(loadingCommands: {...state.loadingCommands, cmdId}));
    try {
      await _repository.chargeStandard(event.vehicleId);
      _scheduleRefresh();
    } catch (e) {
      emit(state.copyWith(commandError: _userFriendlyError(e)));
    } finally {
      emit(state.copyWith(loadingCommands: Set.from(state.loadingCommands)..remove(cmdId)));
    }
  }

  Future<void> _onSetSeatCooler(SetSeatCooler event, Emitter<VehicleBlocState> emit) async {
    try {
      await _repository.setSeatCooler(event.vehicleId, event.seatPosition, event.level);
      _scheduleRefresh();
    } catch (e) {
      emit(state.copyWith(commandError: _userFriendlyError(e)));
    }
  }

  Future<void> _onSetCopTemp(SetCopTemp event, Emitter<VehicleBlocState> emit) async {
    try {
      await _repository.setCopTemp(event.vehicleId, event.copTemp);
      _scheduleRefresh();
    } catch (e) {
      emit(state.copyWith(commandError: _userFriendlyError(e)));
    }
  }

  Future<void> _onSetSteeringWheelHeatLevel(SetSteeringWheelHeatLevel event, Emitter<VehicleBlocState> emit) async {
    try {
      await _repository.setSteeringWheelHeatLevel(event.vehicleId, event.level);
      _scheduleRefresh();
    } catch (e) {
      emit(state.copyWith(commandError: _userFriendlyError(e)));
    }
  }

  Future<void> _onAdjustVolume(AdjustVolume event, Emitter<VehicleBlocState> emit) async {
    try {
      await _repository.adjustVolume(event.vehicleId, event.volume);
    } catch (e) {
      emit(state.copyWith(commandError: _userFriendlyError(e)));
    }
  }

  Future<void> _onSunRoofControl(SunRoofControl event, Emitter<VehicleBlocState> emit) async {
    try {
      await _repository.sunRoofControl(event.vehicleId, event.state);
    } catch (e) {
      emit(state.copyWith(commandError: _userFriendlyError(e)));
    }
  }

  Future<void> _onScheduleSoftwareUpdate(ScheduleSoftwareUpdate event, Emitter<VehicleBlocState> emit) async {
    final cmdId = '${event.vehicleId}_sw_update';
    emit(state.copyWith(loadingCommands: {...state.loadingCommands, cmdId}));
    try {
      await _repository.scheduleSoftwareUpdate(event.vehicleId, event.offsetSec);
      _scheduleRefresh();
    } catch (e) {
      emit(state.copyWith(commandError: _userFriendlyError(e)));
    } finally {
      emit(state.copyWith(loadingCommands: Set.from(state.loadingCommands)..remove(cmdId)));
    }
  }

  Future<void> _onCancelSoftwareUpdate(CancelSoftwareUpdate event, Emitter<VehicleBlocState> emit) async {
    final cmdId = '${event.vehicleId}_sw_update';
    emit(state.copyWith(loadingCommands: {...state.loadingCommands, cmdId}));
    try {
      await _repository.cancelSoftwareUpdate(event.vehicleId);
      _scheduleRefresh();
    } catch (e) {
      emit(state.copyWith(commandError: _userFriendlyError(e)));
    } finally {
      emit(state.copyWith(loadingCommands: Set.from(state.loadingCommands)..remove(cmdId)));
    }
  }

  Future<void> _onNavigateToGps(NavigateToGps event, Emitter<VehicleBlocState> emit) async {
    try {
      await _repository.navigationGpsRequest(event.vehicleId, event.lat, event.lon);
    } catch (e) {
      emit(state.copyWith(commandError: _userFriendlyError(e)));
    }
  }

  Future<void> _onNavigateToSupercharger(NavigateToSupercharger event, Emitter<VehicleBlocState> emit) async {
    try {
      await _repository.navigationScRequest(event.vehicleId, event.superchargerId);
    } catch (e) {
      emit(state.copyWith(commandError: _userFriendlyError(e)));
    }
  }

  Future<void> _onFetchRecentAlerts(FetchRecentAlerts event, Emitter<VehicleBlocState> emit) async {
    try {
      final alerts = await _repository.getRecentAlerts(event.vin);
      emit(state.copyWith(recentAlerts: alerts));
    } catch (e) {
      debugPrint('VehicleBloc: FetchRecentAlerts failed: $e');
    }
  }

  Future<void> _onFetchServiceData(FetchServiceData event, Emitter<VehicleBlocState> emit) async {
    try {
      final data = await _repository.getServiceData(event.vin);
      emit(state.copyWith(serviceData: data));
    } catch (e) {
      debugPrint('VehicleBloc: FetchServiceData failed: $e');
    }
  }

  Future<void> _onFetchDrivers(FetchDrivers event, Emitter<VehicleBlocState> emit) async {
    try {
      final driverList = await _repository.getDrivers(event.vin);
      emit(state.copyWith(drivers: driverList));
    } catch (e) {
      debugPrint('VehicleBloc: FetchDrivers failed: $e');
    }
  }

  Future<void> _onCreateShareInvite(CreateShareInvite event, Emitter<VehicleBlocState> emit) async {
    final cmdId = '${event.vin}_share_invite';
    emit(state.copyWith(loadingCommands: {...state.loadingCommands, cmdId}, clearCreatedShareInviteUrl: true));
    try {
      final result = await _repository.createShareInvite(event.vin);
      final url = result['url'] as String?;
      emit(state.copyWith(createdShareInviteUrl: url));
      // Refresh the invite list
      add(FetchDrivers(event.vin));
    } catch (e) {
      emit(state.copyWith(commandError: _userFriendlyError(e)));
    } finally {
      emit(state.copyWith(loadingCommands: Set.from(state.loadingCommands)..remove(cmdId)));
    }
  }

  Future<void> _onRevokeShareInvite(RevokeShareInvite event, Emitter<VehicleBlocState> emit) async {
    try {
      await _repository.revokeShareInvite(event.vin, event.inviteId);
      // Optimistically remove from local list
      final updated = state.shareInvites.where((i) => i['id'] != event.inviteId).toList();
      emit(state.copyWith(shareInvites: updated));
    } catch (e) {
      emit(state.copyWith(commandError: _userFriendlyError(e)));
    }
  }
}

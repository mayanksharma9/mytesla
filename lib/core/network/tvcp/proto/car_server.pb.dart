// This is a generated file - do not edit.
//
// Generated from car_server.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/timestamp.pb.dart'
    as $3;

import 'car_server.pbenum.dart';
import 'common.pb.dart' as $1;
import 'signatures.pb.dart' as $2;
import 'vehicle.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'car_server.pbenum.dart';

enum Action_ActionMsg { vehicleAction, notSet }

class Action extends $pb.GeneratedMessage {
  factory Action({
    VehicleAction? vehicleAction,
  }) {
    final result = create();
    if (vehicleAction != null) result.vehicleAction = vehicleAction;
    return result;
  }

  Action._();

  factory Action.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Action.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, Action_ActionMsg> _Action_ActionMsgByTag = {
    2: Action_ActionMsg.vehicleAction,
    0: Action_ActionMsg.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Action',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..oo(0, [2])
    ..aOM<VehicleAction>(2, _omitFieldNames ? '' : 'vehicleAction',
        protoName: 'vehicleAction', subBuilder: VehicleAction.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Action clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Action copyWith(void Function(Action) updates) =>
      super.copyWith((message) => updates(message as Action)) as Action;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Action create() => Action._();
  @$core.override
  Action createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Action getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Action>(create);
  static Action? _defaultInstance;

  @$pb.TagNumber(2)
  Action_ActionMsg whichActionMsg() => _Action_ActionMsgByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(2)
  void clearActionMsg() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(2)
  VehicleAction get vehicleAction => $_getN(0);
  @$pb.TagNumber(2)
  set vehicleAction(VehicleAction value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasVehicleAction() => $_has(0);
  @$pb.TagNumber(2)
  void clearVehicleAction() => $_clearField(2);
  @$pb.TagNumber(2)
  VehicleAction ensureVehicleAction() => $_ensure(0);
}

enum VehicleAction_VehicleActionMsg {
  getVehicleData,
  remoteStartDrive,
  createStreamSession,
  streamMessage,
  chargingSetLimitAction,
  chargingStartStopAction,
  drivingClearSpeedLimitPinAction,
  drivingSetSpeedLimitAction,
  drivingSpeedLimitAction,
  hvacAutoAction,
  hvacSetPreconditioningMaxAction,
  hvacSteeringWheelHeaterAction,
  hvacTemperatureAdjustmentAction,
  mediaPlayAction,
  mediaUpdateVolume,
  mediaNextFavorite,
  mediaPreviousFavorite,
  mediaNextTrack,
  mediaPreviousTrack,
  navigationRequest,
  navigationSuperchargerRequest,
  getNearbyChargingSites,
  uiSetUpcomingCalendarEntries,
  vehicleControlCancelSoftwareUpdateAction,
  vehicleControlFlashLightsAction,
  vehicleControlHonkHornAction,
  vehicleControlResetValetPinAction,
  vehicleControlScheduleSoftwareUpdateAction,
  vehicleControlSetSentryModeAction,
  vehicleControlSetValetModeAction,
  vehicleControlSunroofOpenCloseAction,
  vehicleControlTriggerHomelinkAction,
  vehicleControlWindowAction,
  hvacBioweaponModeAction,
  hvacSeatHeaterActions,
  vehicleDataSubscription,
  vehicleDataAck,
  vitalsSubscription,
  vitalsAck,
  scheduledChargingAction,
  scheduledDepartureAction,
  setChargingAmpsAction,
  hvacClimateKeeperAction,
  hvacRecirculationAction,
  ping,
  dashcamSaveClipAction,
  autoSeatClimateAction,
  hvacSeatCoolerActions,
  setCabinOverheatProtectionAction,
  piiKeyRequest,
  pseudonymSyncRequest,
  navigationGpsRequest,
  setVehicleNameAction,
  setRateTariffRequest,
  getRateTariffRequest,
  videoRequestAction,
  takeDrivenoteAction,
  chargePortDoorClose,
  chargePortDoorOpen,
  bluetoothClassicPairingRequest,
  boomboxAction,
  guestModeAction,
  setCopTempAction,
  addManagedChargingSiteRequest,
  removeManagedChargingSiteRequest,
  navigationRouteAction,
  autoStwHeatAction,
  stwHeatLevelAction,
  eraseUserDataAction,
  getManagedChargingSitesRequest,
  updateChargeOnSolarFeatureRequest,
  getChargeOnSolarFeatureRequest,
  vehicleControlSetPinToDriveAction,
  vehicleControlResetPinToDriveAction,
  drivingClearSpeedLimitPinAdminAction,
  setOutletsOnOffAction,
  setOutletTimerAction,
  setOutletSocLimitAction,
  setPowerFeedOnOffAction,
  setPowerFeedTimerAction,
  setPowerFeedSocLimitAction,
  setTrailerLightTestStartStopAction,
  setTruckBedLightAutoStateAction,
  setTruckBedLightBrightnessAction,
  vehicleControlResetPinToDriveAdminAction,
  navigationWaypointsRequest,
  setPowershareFeatureAction,
  setPowershareDischargeLimitAction,
  setPowershareRequestAction,
  setTentModeRequestAction,
  setFrontZoneLightRequestAction,
  setRearZoneLightRequestAction,
  addChargeScheduleAction,
  removeChargeScheduleAction,
  addPreconditionScheduleAction,
  removePreconditionScheduleAction,
  setLightbarBrightnessAction,
  setLightbarMiddleAction,
  setLightbarDitchAction,
  getMessagesAction,
  teslaAuthResponseAction,
  navigationGpsDestinationRequest,
  batchRemovePreconditionSchedulesAction,
  batchRemoveChargeSchedulesAction,
  parentalControlsClearPinAction,
  parentalControlsClearPinAdminAction,
  parentalControlsAction,
  parentalControlsEnableSettingsAction,
  parentalControlsSetSpeedLimitAction,
  cancelSohTestAction,
  stopLightShowAction,
  startLightShowAction,
  setSuspensionLevelAction,
  notSet
}

class VehicleAction extends $pb.GeneratedMessage {
  factory VehicleAction({
    GetVehicleData? getVehicleData,
    RemoteStartDrive? remoteStartDrive,
    CreateStreamSession? createStreamSession,
    StreamMessage? streamMessage,
    ChargingSetLimitAction? chargingSetLimitAction,
    ChargingStartStopAction? chargingStartStopAction,
    DrivingClearSpeedLimitPinAction? drivingClearSpeedLimitPinAction,
    DrivingSetSpeedLimitAction? drivingSetSpeedLimitAction,
    DrivingSpeedLimitAction? drivingSpeedLimitAction,
    HvacAutoAction? hvacAutoAction,
    HvacSetPreconditioningMaxAction? hvacSetPreconditioningMaxAction,
    HvacSteeringWheelHeaterAction? hvacSteeringWheelHeaterAction,
    HvacTemperatureAdjustmentAction? hvacTemperatureAdjustmentAction,
    MediaPlayAction? mediaPlayAction,
    MediaUpdateVolume? mediaUpdateVolume,
    MediaNextFavorite? mediaNextFavorite,
    MediaPreviousFavorite? mediaPreviousFavorite,
    MediaNextTrack? mediaNextTrack,
    MediaPreviousTrack? mediaPreviousTrack,
    NavigationRequest? navigationRequest,
    NavigationSuperchargerRequest? navigationSuperchargerRequest,
    GetNearbyChargingSites? getNearbyChargingSites,
    UiSetUpcomingCalendarEntries? uiSetUpcomingCalendarEntries,
    VehicleControlCancelSoftwareUpdateAction?
        vehicleControlCancelSoftwareUpdateAction,
    VehicleControlFlashLightsAction? vehicleControlFlashLightsAction,
    VehicleControlHonkHornAction? vehicleControlHonkHornAction,
    VehicleControlResetValetPinAction? vehicleControlResetValetPinAction,
    VehicleControlScheduleSoftwareUpdateAction?
        vehicleControlScheduleSoftwareUpdateAction,
    VehicleControlSetSentryModeAction? vehicleControlSetSentryModeAction,
    VehicleControlSetValetModeAction? vehicleControlSetValetModeAction,
    VehicleControlSunroofOpenCloseAction? vehicleControlSunroofOpenCloseAction,
    VehicleControlTriggerHomelinkAction? vehicleControlTriggerHomelinkAction,
    VehicleControlWindowAction? vehicleControlWindowAction,
    HvacBioweaponModeAction? hvacBioweaponModeAction,
    HvacSeatHeaterActions? hvacSeatHeaterActions,
    VehicleDataSubscription? vehicleDataSubscription,
    VehicleDataAck? vehicleDataAck,
    VitalsSubscription? vitalsSubscription,
    VitalsAck? vitalsAck,
    ScheduledChargingAction? scheduledChargingAction,
    ScheduledDepartureAction? scheduledDepartureAction,
    SetChargingAmpsAction? setChargingAmpsAction,
    HvacClimateKeeperAction? hvacClimateKeeperAction,
    HvacRecirculationAction? hvacRecirculationAction,
    Ping? ping,
    DashcamSaveClipAction? dashcamSaveClipAction,
    AutoSeatClimateAction? autoSeatClimateAction,
    HvacSeatCoolerActions? hvacSeatCoolerActions,
    SetCabinOverheatProtectionAction? setCabinOverheatProtectionAction,
    PiiKeyRequest? piiKeyRequest,
    PseudonymSyncRequest? pseudonymSyncRequest,
    NavigationGpsRequest? navigationGpsRequest,
    SetVehicleNameAction? setVehicleNameAction,
    SetRateTariffRequest? setRateTariffRequest,
    GetRateTariffRequest? getRateTariffRequest,
    VideoRequestAction? videoRequestAction,
    TakeDrivenoteAction? takeDrivenoteAction,
    ChargePortDoorClose? chargePortDoorClose,
    ChargePortDoorOpen? chargePortDoorOpen,
    BluetoothClassicPairingRequest? bluetoothClassicPairingRequest,
    BoomboxAction? boomboxAction,
    $0.VehicleState_GuestMode? guestModeAction,
    SetCopTempAction? setCopTempAction,
    AddManagedChargingSiteRequest? addManagedChargingSiteRequest,
    RemoveManagedChargingSiteRequest? removeManagedChargingSiteRequest,
    NavigationRouteAction? navigationRouteAction,
    AutoStwHeatAction? autoStwHeatAction,
    StwHeatLevelAction? stwHeatLevelAction,
    EraseUserDataAction? eraseUserDataAction,
    GetManagedChargingSitesRequest? getManagedChargingSitesRequest,
    UpdateChargeOnSolarFeatureRequest? updateChargeOnSolarFeatureRequest,
    GetChargeOnSolarFeatureRequest? getChargeOnSolarFeatureRequest,
    VehicleControlSetPinToDriveAction? vehicleControlSetPinToDriveAction,
    VehicleControlResetPinToDriveAction? vehicleControlResetPinToDriveAction,
    DrivingClearSpeedLimitPinAdminAction? drivingClearSpeedLimitPinAdminAction,
    SetOutletsOnOffAction? setOutletsOnOffAction,
    SetOutletTimerAction? setOutletTimerAction,
    SetOutletSocLimitAction? setOutletSocLimitAction,
    SetPowerFeedOnOffAction? setPowerFeedOnOffAction,
    SetPowerFeedTimerAction? setPowerFeedTimerAction,
    SetPowerFeedSocLimitAction? setPowerFeedSocLimitAction,
    SetTrailerLightTestStartStopAction? setTrailerLightTestStartStopAction,
    SetTruckBedLightAutoStateAction? setTruckBedLightAutoStateAction,
    SetTruckBedLightBrightnessAction? setTruckBedLightBrightnessAction,
    VehicleControlResetPinToDriveAdminAction?
        vehicleControlResetPinToDriveAdminAction,
    NavigationWaypointsRequest? navigationWaypointsRequest,
    SetPowershareFeatureAction? setPowershareFeatureAction,
    SetPowershareDischargeLimitAction? setPowershareDischargeLimitAction,
    SetPowershareRequestAction? setPowershareRequestAction,
    SetTentModeRequestAction? setTentModeRequestAction,
    SetZoneLightRequestAction? setFrontZoneLightRequestAction,
    SetZoneLightRequestAction? setRearZoneLightRequestAction,
    $1.ChargeSchedule? addChargeScheduleAction,
    RemoveChargeScheduleAction? removeChargeScheduleAction,
    $1.PreconditionSchedule? addPreconditionScheduleAction,
    RemovePreconditionScheduleAction? removePreconditionScheduleAction,
    SetLightbarBrightnessAction? setLightbarBrightnessAction,
    SetLightbarMiddleAction? setLightbarMiddleAction,
    SetLightbarDitchAction? setLightbarDitchAction,
    GetMessagesAction? getMessagesAction,
    TeslaAuthResponseAction? teslaAuthResponseAction,
    NavigationGpsDestinationRequest? navigationGpsDestinationRequest,
    BatchRemovePreconditionSchedulesAction?
        batchRemovePreconditionSchedulesAction,
    BatchRemoveChargeSchedulesAction? batchRemoveChargeSchedulesAction,
    ParentalControlsClearPinAction? parentalControlsClearPinAction,
    ParentalControlsClearPinAdminAction? parentalControlsClearPinAdminAction,
    ParentalControlsAction? parentalControlsAction,
    ParentalControlsEnableSettingsAction? parentalControlsEnableSettingsAction,
    ParentalControlsSetSpeedLimitAction? parentalControlsSetSpeedLimitAction,
    CancelSohTestAction? cancelSohTestAction,
    StopLightShowAction? stopLightShowAction,
    StartLightShowAction? startLightShowAction,
    SetSuspensionLevelAction? setSuspensionLevelAction,
  }) {
    final result = create();
    if (getVehicleData != null) result.getVehicleData = getVehicleData;
    if (remoteStartDrive != null) result.remoteStartDrive = remoteStartDrive;
    if (createStreamSession != null)
      result.createStreamSession = createStreamSession;
    if (streamMessage != null) result.streamMessage = streamMessage;
    if (chargingSetLimitAction != null)
      result.chargingSetLimitAction = chargingSetLimitAction;
    if (chargingStartStopAction != null)
      result.chargingStartStopAction = chargingStartStopAction;
    if (drivingClearSpeedLimitPinAction != null)
      result.drivingClearSpeedLimitPinAction = drivingClearSpeedLimitPinAction;
    if (drivingSetSpeedLimitAction != null)
      result.drivingSetSpeedLimitAction = drivingSetSpeedLimitAction;
    if (drivingSpeedLimitAction != null)
      result.drivingSpeedLimitAction = drivingSpeedLimitAction;
    if (hvacAutoAction != null) result.hvacAutoAction = hvacAutoAction;
    if (hvacSetPreconditioningMaxAction != null)
      result.hvacSetPreconditioningMaxAction = hvacSetPreconditioningMaxAction;
    if (hvacSteeringWheelHeaterAction != null)
      result.hvacSteeringWheelHeaterAction = hvacSteeringWheelHeaterAction;
    if (hvacTemperatureAdjustmentAction != null)
      result.hvacTemperatureAdjustmentAction = hvacTemperatureAdjustmentAction;
    if (mediaPlayAction != null) result.mediaPlayAction = mediaPlayAction;
    if (mediaUpdateVolume != null) result.mediaUpdateVolume = mediaUpdateVolume;
    if (mediaNextFavorite != null) result.mediaNextFavorite = mediaNextFavorite;
    if (mediaPreviousFavorite != null)
      result.mediaPreviousFavorite = mediaPreviousFavorite;
    if (mediaNextTrack != null) result.mediaNextTrack = mediaNextTrack;
    if (mediaPreviousTrack != null)
      result.mediaPreviousTrack = mediaPreviousTrack;
    if (navigationRequest != null) result.navigationRequest = navigationRequest;
    if (navigationSuperchargerRequest != null)
      result.navigationSuperchargerRequest = navigationSuperchargerRequest;
    if (getNearbyChargingSites != null)
      result.getNearbyChargingSites = getNearbyChargingSites;
    if (uiSetUpcomingCalendarEntries != null)
      result.uiSetUpcomingCalendarEntries = uiSetUpcomingCalendarEntries;
    if (vehicleControlCancelSoftwareUpdateAction != null)
      result.vehicleControlCancelSoftwareUpdateAction =
          vehicleControlCancelSoftwareUpdateAction;
    if (vehicleControlFlashLightsAction != null)
      result.vehicleControlFlashLightsAction = vehicleControlFlashLightsAction;
    if (vehicleControlHonkHornAction != null)
      result.vehicleControlHonkHornAction = vehicleControlHonkHornAction;
    if (vehicleControlResetValetPinAction != null)
      result.vehicleControlResetValetPinAction =
          vehicleControlResetValetPinAction;
    if (vehicleControlScheduleSoftwareUpdateAction != null)
      result.vehicleControlScheduleSoftwareUpdateAction =
          vehicleControlScheduleSoftwareUpdateAction;
    if (vehicleControlSetSentryModeAction != null)
      result.vehicleControlSetSentryModeAction =
          vehicleControlSetSentryModeAction;
    if (vehicleControlSetValetModeAction != null)
      result.vehicleControlSetValetModeAction =
          vehicleControlSetValetModeAction;
    if (vehicleControlSunroofOpenCloseAction != null)
      result.vehicleControlSunroofOpenCloseAction =
          vehicleControlSunroofOpenCloseAction;
    if (vehicleControlTriggerHomelinkAction != null)
      result.vehicleControlTriggerHomelinkAction =
          vehicleControlTriggerHomelinkAction;
    if (vehicleControlWindowAction != null)
      result.vehicleControlWindowAction = vehicleControlWindowAction;
    if (hvacBioweaponModeAction != null)
      result.hvacBioweaponModeAction = hvacBioweaponModeAction;
    if (hvacSeatHeaterActions != null)
      result.hvacSeatHeaterActions = hvacSeatHeaterActions;
    if (vehicleDataSubscription != null)
      result.vehicleDataSubscription = vehicleDataSubscription;
    if (vehicleDataAck != null) result.vehicleDataAck = vehicleDataAck;
    if (vitalsSubscription != null)
      result.vitalsSubscription = vitalsSubscription;
    if (vitalsAck != null) result.vitalsAck = vitalsAck;
    if (scheduledChargingAction != null)
      result.scheduledChargingAction = scheduledChargingAction;
    if (scheduledDepartureAction != null)
      result.scheduledDepartureAction = scheduledDepartureAction;
    if (setChargingAmpsAction != null)
      result.setChargingAmpsAction = setChargingAmpsAction;
    if (hvacClimateKeeperAction != null)
      result.hvacClimateKeeperAction = hvacClimateKeeperAction;
    if (hvacRecirculationAction != null)
      result.hvacRecirculationAction = hvacRecirculationAction;
    if (ping != null) result.ping = ping;
    if (dashcamSaveClipAction != null)
      result.dashcamSaveClipAction = dashcamSaveClipAction;
    if (autoSeatClimateAction != null)
      result.autoSeatClimateAction = autoSeatClimateAction;
    if (hvacSeatCoolerActions != null)
      result.hvacSeatCoolerActions = hvacSeatCoolerActions;
    if (setCabinOverheatProtectionAction != null)
      result.setCabinOverheatProtectionAction =
          setCabinOverheatProtectionAction;
    if (piiKeyRequest != null) result.piiKeyRequest = piiKeyRequest;
    if (pseudonymSyncRequest != null)
      result.pseudonymSyncRequest = pseudonymSyncRequest;
    if (navigationGpsRequest != null)
      result.navigationGpsRequest = navigationGpsRequest;
    if (setVehicleNameAction != null)
      result.setVehicleNameAction = setVehicleNameAction;
    if (setRateTariffRequest != null)
      result.setRateTariffRequest = setRateTariffRequest;
    if (getRateTariffRequest != null)
      result.getRateTariffRequest = getRateTariffRequest;
    if (videoRequestAction != null)
      result.videoRequestAction = videoRequestAction;
    if (takeDrivenoteAction != null)
      result.takeDrivenoteAction = takeDrivenoteAction;
    if (chargePortDoorClose != null)
      result.chargePortDoorClose = chargePortDoorClose;
    if (chargePortDoorOpen != null)
      result.chargePortDoorOpen = chargePortDoorOpen;
    if (bluetoothClassicPairingRequest != null)
      result.bluetoothClassicPairingRequest = bluetoothClassicPairingRequest;
    if (boomboxAction != null) result.boomboxAction = boomboxAction;
    if (guestModeAction != null) result.guestModeAction = guestModeAction;
    if (setCopTempAction != null) result.setCopTempAction = setCopTempAction;
    if (addManagedChargingSiteRequest != null)
      result.addManagedChargingSiteRequest = addManagedChargingSiteRequest;
    if (removeManagedChargingSiteRequest != null)
      result.removeManagedChargingSiteRequest =
          removeManagedChargingSiteRequest;
    if (navigationRouteAction != null)
      result.navigationRouteAction = navigationRouteAction;
    if (autoStwHeatAction != null) result.autoStwHeatAction = autoStwHeatAction;
    if (stwHeatLevelAction != null)
      result.stwHeatLevelAction = stwHeatLevelAction;
    if (eraseUserDataAction != null)
      result.eraseUserDataAction = eraseUserDataAction;
    if (getManagedChargingSitesRequest != null)
      result.getManagedChargingSitesRequest = getManagedChargingSitesRequest;
    if (updateChargeOnSolarFeatureRequest != null)
      result.updateChargeOnSolarFeatureRequest =
          updateChargeOnSolarFeatureRequest;
    if (getChargeOnSolarFeatureRequest != null)
      result.getChargeOnSolarFeatureRequest = getChargeOnSolarFeatureRequest;
    if (vehicleControlSetPinToDriveAction != null)
      result.vehicleControlSetPinToDriveAction =
          vehicleControlSetPinToDriveAction;
    if (vehicleControlResetPinToDriveAction != null)
      result.vehicleControlResetPinToDriveAction =
          vehicleControlResetPinToDriveAction;
    if (drivingClearSpeedLimitPinAdminAction != null)
      result.drivingClearSpeedLimitPinAdminAction =
          drivingClearSpeedLimitPinAdminAction;
    if (setOutletsOnOffAction != null)
      result.setOutletsOnOffAction = setOutletsOnOffAction;
    if (setOutletTimerAction != null)
      result.setOutletTimerAction = setOutletTimerAction;
    if (setOutletSocLimitAction != null)
      result.setOutletSocLimitAction = setOutletSocLimitAction;
    if (setPowerFeedOnOffAction != null)
      result.setPowerFeedOnOffAction = setPowerFeedOnOffAction;
    if (setPowerFeedTimerAction != null)
      result.setPowerFeedTimerAction = setPowerFeedTimerAction;
    if (setPowerFeedSocLimitAction != null)
      result.setPowerFeedSocLimitAction = setPowerFeedSocLimitAction;
    if (setTrailerLightTestStartStopAction != null)
      result.setTrailerLightTestStartStopAction =
          setTrailerLightTestStartStopAction;
    if (setTruckBedLightAutoStateAction != null)
      result.setTruckBedLightAutoStateAction = setTruckBedLightAutoStateAction;
    if (setTruckBedLightBrightnessAction != null)
      result.setTruckBedLightBrightnessAction =
          setTruckBedLightBrightnessAction;
    if (vehicleControlResetPinToDriveAdminAction != null)
      result.vehicleControlResetPinToDriveAdminAction =
          vehicleControlResetPinToDriveAdminAction;
    if (navigationWaypointsRequest != null)
      result.navigationWaypointsRequest = navigationWaypointsRequest;
    if (setPowershareFeatureAction != null)
      result.setPowershareFeatureAction = setPowershareFeatureAction;
    if (setPowershareDischargeLimitAction != null)
      result.setPowershareDischargeLimitAction =
          setPowershareDischargeLimitAction;
    if (setPowershareRequestAction != null)
      result.setPowershareRequestAction = setPowershareRequestAction;
    if (setTentModeRequestAction != null)
      result.setTentModeRequestAction = setTentModeRequestAction;
    if (setFrontZoneLightRequestAction != null)
      result.setFrontZoneLightRequestAction = setFrontZoneLightRequestAction;
    if (setRearZoneLightRequestAction != null)
      result.setRearZoneLightRequestAction = setRearZoneLightRequestAction;
    if (addChargeScheduleAction != null)
      result.addChargeScheduleAction = addChargeScheduleAction;
    if (removeChargeScheduleAction != null)
      result.removeChargeScheduleAction = removeChargeScheduleAction;
    if (addPreconditionScheduleAction != null)
      result.addPreconditionScheduleAction = addPreconditionScheduleAction;
    if (removePreconditionScheduleAction != null)
      result.removePreconditionScheduleAction =
          removePreconditionScheduleAction;
    if (setLightbarBrightnessAction != null)
      result.setLightbarBrightnessAction = setLightbarBrightnessAction;
    if (setLightbarMiddleAction != null)
      result.setLightbarMiddleAction = setLightbarMiddleAction;
    if (setLightbarDitchAction != null)
      result.setLightbarDitchAction = setLightbarDitchAction;
    if (getMessagesAction != null) result.getMessagesAction = getMessagesAction;
    if (teslaAuthResponseAction != null)
      result.teslaAuthResponseAction = teslaAuthResponseAction;
    if (navigationGpsDestinationRequest != null)
      result.navigationGpsDestinationRequest = navigationGpsDestinationRequest;
    if (batchRemovePreconditionSchedulesAction != null)
      result.batchRemovePreconditionSchedulesAction =
          batchRemovePreconditionSchedulesAction;
    if (batchRemoveChargeSchedulesAction != null)
      result.batchRemoveChargeSchedulesAction =
          batchRemoveChargeSchedulesAction;
    if (parentalControlsClearPinAction != null)
      result.parentalControlsClearPinAction = parentalControlsClearPinAction;
    if (parentalControlsClearPinAdminAction != null)
      result.parentalControlsClearPinAdminAction =
          parentalControlsClearPinAdminAction;
    if (parentalControlsAction != null)
      result.parentalControlsAction = parentalControlsAction;
    if (parentalControlsEnableSettingsAction != null)
      result.parentalControlsEnableSettingsAction =
          parentalControlsEnableSettingsAction;
    if (parentalControlsSetSpeedLimitAction != null)
      result.parentalControlsSetSpeedLimitAction =
          parentalControlsSetSpeedLimitAction;
    if (cancelSohTestAction != null)
      result.cancelSohTestAction = cancelSohTestAction;
    if (stopLightShowAction != null)
      result.stopLightShowAction = stopLightShowAction;
    if (startLightShowAction != null)
      result.startLightShowAction = startLightShowAction;
    if (setSuspensionLevelAction != null)
      result.setSuspensionLevelAction = setSuspensionLevelAction;
    return result;
  }

  VehicleAction._();

  factory VehicleAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VehicleAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, VehicleAction_VehicleActionMsg>
      _VehicleAction_VehicleActionMsgByTag = {
    1: VehicleAction_VehicleActionMsg.getVehicleData,
    2: VehicleAction_VehicleActionMsg.remoteStartDrive,
    3: VehicleAction_VehicleActionMsg.createStreamSession,
    4: VehicleAction_VehicleActionMsg.streamMessage,
    5: VehicleAction_VehicleActionMsg.chargingSetLimitAction,
    6: VehicleAction_VehicleActionMsg.chargingStartStopAction,
    7: VehicleAction_VehicleActionMsg.drivingClearSpeedLimitPinAction,
    8: VehicleAction_VehicleActionMsg.drivingSetSpeedLimitAction,
    9: VehicleAction_VehicleActionMsg.drivingSpeedLimitAction,
    10: VehicleAction_VehicleActionMsg.hvacAutoAction,
    12: VehicleAction_VehicleActionMsg.hvacSetPreconditioningMaxAction,
    13: VehicleAction_VehicleActionMsg.hvacSteeringWheelHeaterAction,
    14: VehicleAction_VehicleActionMsg.hvacTemperatureAdjustmentAction,
    15: VehicleAction_VehicleActionMsg.mediaPlayAction,
    16: VehicleAction_VehicleActionMsg.mediaUpdateVolume,
    17: VehicleAction_VehicleActionMsg.mediaNextFavorite,
    18: VehicleAction_VehicleActionMsg.mediaPreviousFavorite,
    19: VehicleAction_VehicleActionMsg.mediaNextTrack,
    20: VehicleAction_VehicleActionMsg.mediaPreviousTrack,
    21: VehicleAction_VehicleActionMsg.navigationRequest,
    22: VehicleAction_VehicleActionMsg.navigationSuperchargerRequest,
    23: VehicleAction_VehicleActionMsg.getNearbyChargingSites,
    24: VehicleAction_VehicleActionMsg.uiSetUpcomingCalendarEntries,
    25: VehicleAction_VehicleActionMsg.vehicleControlCancelSoftwareUpdateAction,
    26: VehicleAction_VehicleActionMsg.vehicleControlFlashLightsAction,
    27: VehicleAction_VehicleActionMsg.vehicleControlHonkHornAction,
    28: VehicleAction_VehicleActionMsg.vehicleControlResetValetPinAction,
    29: VehicleAction_VehicleActionMsg
        .vehicleControlScheduleSoftwareUpdateAction,
    30: VehicleAction_VehicleActionMsg.vehicleControlSetSentryModeAction,
    31: VehicleAction_VehicleActionMsg.vehicleControlSetValetModeAction,
    32: VehicleAction_VehicleActionMsg.vehicleControlSunroofOpenCloseAction,
    33: VehicleAction_VehicleActionMsg.vehicleControlTriggerHomelinkAction,
    34: VehicleAction_VehicleActionMsg.vehicleControlWindowAction,
    35: VehicleAction_VehicleActionMsg.hvacBioweaponModeAction,
    36: VehicleAction_VehicleActionMsg.hvacSeatHeaterActions,
    37: VehicleAction_VehicleActionMsg.vehicleDataSubscription,
    38: VehicleAction_VehicleActionMsg.vehicleDataAck,
    39: VehicleAction_VehicleActionMsg.vitalsSubscription,
    40: VehicleAction_VehicleActionMsg.vitalsAck,
    41: VehicleAction_VehicleActionMsg.scheduledChargingAction,
    42: VehicleAction_VehicleActionMsg.scheduledDepartureAction,
    43: VehicleAction_VehicleActionMsg.setChargingAmpsAction,
    44: VehicleAction_VehicleActionMsg.hvacClimateKeeperAction,
    45: VehicleAction_VehicleActionMsg.hvacRecirculationAction,
    46: VehicleAction_VehicleActionMsg.ping,
    47: VehicleAction_VehicleActionMsg.dashcamSaveClipAction,
    48: VehicleAction_VehicleActionMsg.autoSeatClimateAction,
    49: VehicleAction_VehicleActionMsg.hvacSeatCoolerActions,
    50: VehicleAction_VehicleActionMsg.setCabinOverheatProtectionAction,
    51: VehicleAction_VehicleActionMsg.piiKeyRequest,
    52: VehicleAction_VehicleActionMsg.pseudonymSyncRequest,
    53: VehicleAction_VehicleActionMsg.navigationGpsRequest,
    54: VehicleAction_VehicleActionMsg.setVehicleNameAction,
    55: VehicleAction_VehicleActionMsg.setRateTariffRequest,
    56: VehicleAction_VehicleActionMsg.getRateTariffRequest,
    57: VehicleAction_VehicleActionMsg.videoRequestAction,
    58: VehicleAction_VehicleActionMsg.takeDrivenoteAction,
    61: VehicleAction_VehicleActionMsg.chargePortDoorClose,
    62: VehicleAction_VehicleActionMsg.chargePortDoorOpen,
    63: VehicleAction_VehicleActionMsg.bluetoothClassicPairingRequest,
    64: VehicleAction_VehicleActionMsg.boomboxAction,
    65: VehicleAction_VehicleActionMsg.guestModeAction,
    66: VehicleAction_VehicleActionMsg.setCopTempAction,
    67: VehicleAction_VehicleActionMsg.addManagedChargingSiteRequest,
    68: VehicleAction_VehicleActionMsg.removeManagedChargingSiteRequest,
    69: VehicleAction_VehicleActionMsg.navigationRouteAction,
    70: VehicleAction_VehicleActionMsg.autoStwHeatAction,
    71: VehicleAction_VehicleActionMsg.stwHeatLevelAction,
    72: VehicleAction_VehicleActionMsg.eraseUserDataAction,
    73: VehicleAction_VehicleActionMsg.getManagedChargingSitesRequest,
    74: VehicleAction_VehicleActionMsg.updateChargeOnSolarFeatureRequest,
    75: VehicleAction_VehicleActionMsg.getChargeOnSolarFeatureRequest,
    77: VehicleAction_VehicleActionMsg.vehicleControlSetPinToDriveAction,
    78: VehicleAction_VehicleActionMsg.vehicleControlResetPinToDriveAction,
    79: VehicleAction_VehicleActionMsg.drivingClearSpeedLimitPinAdminAction,
    80: VehicleAction_VehicleActionMsg.setOutletsOnOffAction,
    81: VehicleAction_VehicleActionMsg.setOutletTimerAction,
    82: VehicleAction_VehicleActionMsg.setOutletSocLimitAction,
    83: VehicleAction_VehicleActionMsg.setPowerFeedOnOffAction,
    84: VehicleAction_VehicleActionMsg.setPowerFeedTimerAction,
    85: VehicleAction_VehicleActionMsg.setPowerFeedSocLimitAction,
    86: VehicleAction_VehicleActionMsg.setTrailerLightTestStartStopAction,
    87: VehicleAction_VehicleActionMsg.setTruckBedLightAutoStateAction,
    88: VehicleAction_VehicleActionMsg.setTruckBedLightBrightnessAction,
    89: VehicleAction_VehicleActionMsg.vehicleControlResetPinToDriveAdminAction,
    90: VehicleAction_VehicleActionMsg.navigationWaypointsRequest,
    91: VehicleAction_VehicleActionMsg.setPowershareFeatureAction,
    92: VehicleAction_VehicleActionMsg.setPowershareDischargeLimitAction,
    93: VehicleAction_VehicleActionMsg.setPowershareRequestAction,
    94: VehicleAction_VehicleActionMsg.setTentModeRequestAction,
    95: VehicleAction_VehicleActionMsg.setFrontZoneLightRequestAction,
    96: VehicleAction_VehicleActionMsg.setRearZoneLightRequestAction,
    97: VehicleAction_VehicleActionMsg.addChargeScheduleAction,
    98: VehicleAction_VehicleActionMsg.removeChargeScheduleAction,
    99: VehicleAction_VehicleActionMsg.addPreconditionScheduleAction,
    100: VehicleAction_VehicleActionMsg.removePreconditionScheduleAction,
    101: VehicleAction_VehicleActionMsg.setLightbarBrightnessAction,
    102: VehicleAction_VehicleActionMsg.setLightbarMiddleAction,
    103: VehicleAction_VehicleActionMsg.setLightbarDitchAction,
    104: VehicleAction_VehicleActionMsg.getMessagesAction,
    105: VehicleAction_VehicleActionMsg.teslaAuthResponseAction,
    106: VehicleAction_VehicleActionMsg.navigationGpsDestinationRequest,
    107: VehicleAction_VehicleActionMsg.batchRemovePreconditionSchedulesAction,
    108: VehicleAction_VehicleActionMsg.batchRemoveChargeSchedulesAction,
    109: VehicleAction_VehicleActionMsg.parentalControlsClearPinAction,
    110: VehicleAction_VehicleActionMsg.parentalControlsClearPinAdminAction,
    111: VehicleAction_VehicleActionMsg.parentalControlsAction,
    112: VehicleAction_VehicleActionMsg.parentalControlsEnableSettingsAction,
    113: VehicleAction_VehicleActionMsg.parentalControlsSetSpeedLimitAction,
    114: VehicleAction_VehicleActionMsg.cancelSohTestAction,
    116: VehicleAction_VehicleActionMsg.stopLightShowAction,
    117: VehicleAction_VehicleActionMsg.startLightShowAction,
    118: VehicleAction_VehicleActionMsg.setSuspensionLevelAction,
    0: VehicleAction_VehicleActionMsg.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VehicleAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..oo(0, [
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      12,
      13,
      14,
      15,
      16,
      17,
      18,
      19,
      20,
      21,
      22,
      23,
      24,
      25,
      26,
      27,
      28,
      29,
      30,
      31,
      32,
      33,
      34,
      35,
      36,
      37,
      38,
      39,
      40,
      41,
      42,
      43,
      44,
      45,
      46,
      47,
      48,
      49,
      50,
      51,
      52,
      53,
      54,
      55,
      56,
      57,
      58,
      61,
      62,
      63,
      64,
      65,
      66,
      67,
      68,
      69,
      70,
      71,
      72,
      73,
      74,
      75,
      77,
      78,
      79,
      80,
      81,
      82,
      83,
      84,
      85,
      86,
      87,
      88,
      89,
      90,
      91,
      92,
      93,
      94,
      95,
      96,
      97,
      98,
      99,
      100,
      101,
      102,
      103,
      104,
      105,
      106,
      107,
      108,
      109,
      110,
      111,
      112,
      113,
      114,
      116,
      117,
      118
    ])
    ..aOM<GetVehicleData>(1, _omitFieldNames ? '' : 'getVehicleData',
        protoName: 'getVehicleData', subBuilder: GetVehicleData.create)
    ..aOM<RemoteStartDrive>(2, _omitFieldNames ? '' : 'remoteStartDrive',
        protoName: 'remoteStartDrive', subBuilder: RemoteStartDrive.create)
    ..aOM<CreateStreamSession>(3, _omitFieldNames ? '' : 'createStreamSession',
        protoName: 'createStreamSession',
        subBuilder: CreateStreamSession.create)
    ..aOM<StreamMessage>(4, _omitFieldNames ? '' : 'streamMessage',
        protoName: 'streamMessage', subBuilder: StreamMessage.create)
    ..aOM<ChargingSetLimitAction>(
        5, _omitFieldNames ? '' : 'chargingSetLimitAction',
        protoName: 'chargingSetLimitAction',
        subBuilder: ChargingSetLimitAction.create)
    ..aOM<ChargingStartStopAction>(
        6, _omitFieldNames ? '' : 'chargingStartStopAction',
        protoName: 'chargingStartStopAction',
        subBuilder: ChargingStartStopAction.create)
    ..aOM<DrivingClearSpeedLimitPinAction>(
        7, _omitFieldNames ? '' : 'drivingClearSpeedLimitPinAction',
        protoName: 'drivingClearSpeedLimitPinAction',
        subBuilder: DrivingClearSpeedLimitPinAction.create)
    ..aOM<DrivingSetSpeedLimitAction>(
        8, _omitFieldNames ? '' : 'drivingSetSpeedLimitAction',
        protoName: 'drivingSetSpeedLimitAction',
        subBuilder: DrivingSetSpeedLimitAction.create)
    ..aOM<DrivingSpeedLimitAction>(
        9, _omitFieldNames ? '' : 'drivingSpeedLimitAction',
        protoName: 'drivingSpeedLimitAction',
        subBuilder: DrivingSpeedLimitAction.create)
    ..aOM<HvacAutoAction>(10, _omitFieldNames ? '' : 'hvacAutoAction',
        protoName: 'hvacAutoAction', subBuilder: HvacAutoAction.create)
    ..aOM<HvacSetPreconditioningMaxAction>(
        12, _omitFieldNames ? '' : 'hvacSetPreconditioningMaxAction',
        protoName: 'hvacSetPreconditioningMaxAction',
        subBuilder: HvacSetPreconditioningMaxAction.create)
    ..aOM<HvacSteeringWheelHeaterAction>(
        13, _omitFieldNames ? '' : 'hvacSteeringWheelHeaterAction',
        protoName: 'hvacSteeringWheelHeaterAction',
        subBuilder: HvacSteeringWheelHeaterAction.create)
    ..aOM<HvacTemperatureAdjustmentAction>(
        14, _omitFieldNames ? '' : 'hvacTemperatureAdjustmentAction',
        protoName: 'hvacTemperatureAdjustmentAction',
        subBuilder: HvacTemperatureAdjustmentAction.create)
    ..aOM<MediaPlayAction>(15, _omitFieldNames ? '' : 'mediaPlayAction',
        protoName: 'mediaPlayAction', subBuilder: MediaPlayAction.create)
    ..aOM<MediaUpdateVolume>(16, _omitFieldNames ? '' : 'mediaUpdateVolume',
        protoName: 'mediaUpdateVolume', subBuilder: MediaUpdateVolume.create)
    ..aOM<MediaNextFavorite>(17, _omitFieldNames ? '' : 'mediaNextFavorite',
        protoName: 'mediaNextFavorite', subBuilder: MediaNextFavorite.create)
    ..aOM<MediaPreviousFavorite>(
        18, _omitFieldNames ? '' : 'mediaPreviousFavorite',
        protoName: 'mediaPreviousFavorite',
        subBuilder: MediaPreviousFavorite.create)
    ..aOM<MediaNextTrack>(19, _omitFieldNames ? '' : 'mediaNextTrack',
        protoName: 'mediaNextTrack', subBuilder: MediaNextTrack.create)
    ..aOM<MediaPreviousTrack>(20, _omitFieldNames ? '' : 'mediaPreviousTrack',
        protoName: 'mediaPreviousTrack', subBuilder: MediaPreviousTrack.create)
    ..aOM<NavigationRequest>(21, _omitFieldNames ? '' : 'navigationRequest',
        protoName: 'navigationRequest', subBuilder: NavigationRequest.create)
    ..aOM<NavigationSuperchargerRequest>(
        22, _omitFieldNames ? '' : 'navigationSuperchargerRequest',
        protoName: 'navigationSuperchargerRequest',
        subBuilder: NavigationSuperchargerRequest.create)
    ..aOM<GetNearbyChargingSites>(
        23, _omitFieldNames ? '' : 'getNearbyChargingSites',
        protoName: 'getNearbyChargingSites',
        subBuilder: GetNearbyChargingSites.create)
    ..aOM<UiSetUpcomingCalendarEntries>(
        24, _omitFieldNames ? '' : 'uiSetUpcomingCalendarEntries',
        protoName: 'uiSetUpcomingCalendarEntries',
        subBuilder: UiSetUpcomingCalendarEntries.create)
    ..aOM<VehicleControlCancelSoftwareUpdateAction>(
        25, _omitFieldNames ? '' : 'vehicleControlCancelSoftwareUpdateAction',
        protoName: 'vehicleControlCancelSoftwareUpdateAction',
        subBuilder: VehicleControlCancelSoftwareUpdateAction.create)
    ..aOM<VehicleControlFlashLightsAction>(
        26, _omitFieldNames ? '' : 'vehicleControlFlashLightsAction',
        protoName: 'vehicleControlFlashLightsAction',
        subBuilder: VehicleControlFlashLightsAction.create)
    ..aOM<VehicleControlHonkHornAction>(
        27, _omitFieldNames ? '' : 'vehicleControlHonkHornAction',
        protoName: 'vehicleControlHonkHornAction',
        subBuilder: VehicleControlHonkHornAction.create)
    ..aOM<VehicleControlResetValetPinAction>(
        28, _omitFieldNames ? '' : 'vehicleControlResetValetPinAction',
        protoName: 'vehicleControlResetValetPinAction',
        subBuilder: VehicleControlResetValetPinAction.create)
    ..aOM<VehicleControlScheduleSoftwareUpdateAction>(
        29, _omitFieldNames ? '' : 'vehicleControlScheduleSoftwareUpdateAction',
        protoName: 'vehicleControlScheduleSoftwareUpdateAction',
        subBuilder: VehicleControlScheduleSoftwareUpdateAction.create)
    ..aOM<VehicleControlSetSentryModeAction>(
        30, _omitFieldNames ? '' : 'vehicleControlSetSentryModeAction',
        protoName: 'vehicleControlSetSentryModeAction',
        subBuilder: VehicleControlSetSentryModeAction.create)
    ..aOM<VehicleControlSetValetModeAction>(
        31, _omitFieldNames ? '' : 'vehicleControlSetValetModeAction',
        protoName: 'vehicleControlSetValetModeAction',
        subBuilder: VehicleControlSetValetModeAction.create)
    ..aOM<VehicleControlSunroofOpenCloseAction>(
        32, _omitFieldNames ? '' : 'vehicleControlSunroofOpenCloseAction',
        protoName: 'vehicleControlSunroofOpenCloseAction',
        subBuilder: VehicleControlSunroofOpenCloseAction.create)
    ..aOM<VehicleControlTriggerHomelinkAction>(
        33, _omitFieldNames ? '' : 'vehicleControlTriggerHomelinkAction',
        protoName: 'vehicleControlTriggerHomelinkAction',
        subBuilder: VehicleControlTriggerHomelinkAction.create)
    ..aOM<VehicleControlWindowAction>(
        34, _omitFieldNames ? '' : 'vehicleControlWindowAction',
        protoName: 'vehicleControlWindowAction',
        subBuilder: VehicleControlWindowAction.create)
    ..aOM<HvacBioweaponModeAction>(
        35, _omitFieldNames ? '' : 'hvacBioweaponModeAction',
        protoName: 'hvacBioweaponModeAction',
        subBuilder: HvacBioweaponModeAction.create)
    ..aOM<HvacSeatHeaterActions>(
        36, _omitFieldNames ? '' : 'hvacSeatHeaterActions',
        protoName: 'hvacSeatHeaterActions',
        subBuilder: HvacSeatHeaterActions.create)
    ..aOM<VehicleDataSubscription>(
        37, _omitFieldNames ? '' : 'vehicleDataSubscription',
        protoName: 'vehicleDataSubscription',
        subBuilder: VehicleDataSubscription.create)
    ..aOM<VehicleDataAck>(38, _omitFieldNames ? '' : 'vehicleDataAck',
        protoName: 'vehicleDataAck', subBuilder: VehicleDataAck.create)
    ..aOM<VitalsSubscription>(39, _omitFieldNames ? '' : 'vitalsSubscription',
        protoName: 'vitalsSubscription', subBuilder: VitalsSubscription.create)
    ..aOM<VitalsAck>(40, _omitFieldNames ? '' : 'vitalsAck',
        protoName: 'vitalsAck', subBuilder: VitalsAck.create)
    ..aOM<ScheduledChargingAction>(
        41, _omitFieldNames ? '' : 'scheduledChargingAction',
        protoName: 'scheduledChargingAction',
        subBuilder: ScheduledChargingAction.create)
    ..aOM<ScheduledDepartureAction>(
        42, _omitFieldNames ? '' : 'scheduledDepartureAction',
        protoName: 'scheduledDepartureAction',
        subBuilder: ScheduledDepartureAction.create)
    ..aOM<SetChargingAmpsAction>(
        43, _omitFieldNames ? '' : 'setChargingAmpsAction',
        protoName: 'setChargingAmpsAction',
        subBuilder: SetChargingAmpsAction.create)
    ..aOM<HvacClimateKeeperAction>(
        44, _omitFieldNames ? '' : 'hvacClimateKeeperAction',
        protoName: 'hvacClimateKeeperAction',
        subBuilder: HvacClimateKeeperAction.create)
    ..aOM<HvacRecirculationAction>(
        45, _omitFieldNames ? '' : 'hvacRecirculationAction',
        protoName: 'hvacRecirculationAction',
        subBuilder: HvacRecirculationAction.create)
    ..aOM<Ping>(46, _omitFieldNames ? '' : 'ping', subBuilder: Ping.create)
    ..aOM<DashcamSaveClipAction>(
        47, _omitFieldNames ? '' : 'dashcamSaveClipAction',
        protoName: 'dashcamSaveClipAction',
        subBuilder: DashcamSaveClipAction.create)
    ..aOM<AutoSeatClimateAction>(
        48, _omitFieldNames ? '' : 'autoSeatClimateAction',
        protoName: 'autoSeatClimateAction',
        subBuilder: AutoSeatClimateAction.create)
    ..aOM<HvacSeatCoolerActions>(
        49, _omitFieldNames ? '' : 'hvacSeatCoolerActions',
        protoName: 'hvacSeatCoolerActions',
        subBuilder: HvacSeatCoolerActions.create)
    ..aOM<SetCabinOverheatProtectionAction>(
        50, _omitFieldNames ? '' : 'setCabinOverheatProtectionAction',
        protoName: 'setCabinOverheatProtectionAction',
        subBuilder: SetCabinOverheatProtectionAction.create)
    ..aOM<PiiKeyRequest>(51, _omitFieldNames ? '' : 'piiKeyRequest',
        protoName: 'piiKeyRequest', subBuilder: PiiKeyRequest.create)
    ..aOM<PseudonymSyncRequest>(
        52, _omitFieldNames ? '' : 'pseudonymSyncRequest',
        protoName: 'pseudonymSyncRequest',
        subBuilder: PseudonymSyncRequest.create)
    ..aOM<NavigationGpsRequest>(
        53, _omitFieldNames ? '' : 'navigationGpsRequest',
        protoName: 'navigationGpsRequest',
        subBuilder: NavigationGpsRequest.create)
    ..aOM<SetVehicleNameAction>(
        54, _omitFieldNames ? '' : 'setVehicleNameAction',
        protoName: 'setVehicleNameAction',
        subBuilder: SetVehicleNameAction.create)
    ..aOM<SetRateTariffRequest>(
        55, _omitFieldNames ? '' : 'setRateTariffRequest',
        protoName: 'setRateTariffRequest',
        subBuilder: SetRateTariffRequest.create)
    ..aOM<GetRateTariffRequest>(
        56, _omitFieldNames ? '' : 'getRateTariffRequest',
        protoName: 'getRateTariffRequest',
        subBuilder: GetRateTariffRequest.create)
    ..aOM<VideoRequestAction>(57, _omitFieldNames ? '' : 'videoRequestAction',
        protoName: 'videoRequestAction', subBuilder: VideoRequestAction.create)
    ..aOM<TakeDrivenoteAction>(58, _omitFieldNames ? '' : 'takeDrivenoteAction',
        protoName: 'takeDrivenoteAction',
        subBuilder: TakeDrivenoteAction.create)
    ..aOM<ChargePortDoorClose>(61, _omitFieldNames ? '' : 'chargePortDoorClose',
        protoName: 'chargePortDoorClose',
        subBuilder: ChargePortDoorClose.create)
    ..aOM<ChargePortDoorOpen>(62, _omitFieldNames ? '' : 'chargePortDoorOpen',
        protoName: 'chargePortDoorOpen', subBuilder: ChargePortDoorOpen.create)
    ..aOM<BluetoothClassicPairingRequest>(
        63, _omitFieldNames ? '' : 'bluetoothClassicPairingRequest',
        protoName: 'bluetoothClassicPairingRequest',
        subBuilder: BluetoothClassicPairingRequest.create)
    ..aOM<BoomboxAction>(64, _omitFieldNames ? '' : 'boomboxAction',
        protoName: 'boomboxAction', subBuilder: BoomboxAction.create)
    ..aOM<$0.VehicleState_GuestMode>(
        65, _omitFieldNames ? '' : 'guestModeAction',
        protoName: 'guestModeAction',
        subBuilder: $0.VehicleState_GuestMode.create)
    ..aOM<SetCopTempAction>(66, _omitFieldNames ? '' : 'setCopTempAction',
        protoName: 'setCopTempAction', subBuilder: SetCopTempAction.create)
    ..aOM<AddManagedChargingSiteRequest>(
        67, _omitFieldNames ? '' : 'addManagedChargingSiteRequest',
        protoName: 'addManagedChargingSiteRequest',
        subBuilder: AddManagedChargingSiteRequest.create)
    ..aOM<RemoveManagedChargingSiteRequest>(
        68, _omitFieldNames ? '' : 'removeManagedChargingSiteRequest',
        protoName: 'removeManagedChargingSiteRequest',
        subBuilder: RemoveManagedChargingSiteRequest.create)
    ..aOM<NavigationRouteAction>(
        69, _omitFieldNames ? '' : 'navigationRouteAction',
        protoName: 'navigationRouteAction',
        subBuilder: NavigationRouteAction.create)
    ..aOM<AutoStwHeatAction>(70, _omitFieldNames ? '' : 'autoStwHeatAction',
        protoName: 'autoStwHeatAction', subBuilder: AutoStwHeatAction.create)
    ..aOM<StwHeatLevelAction>(71, _omitFieldNames ? '' : 'stwHeatLevelAction',
        protoName: 'stwHeatLevelAction', subBuilder: StwHeatLevelAction.create)
    ..aOM<EraseUserDataAction>(72, _omitFieldNames ? '' : 'eraseUserDataAction',
        protoName: 'eraseUserDataAction',
        subBuilder: EraseUserDataAction.create)
    ..aOM<GetManagedChargingSitesRequest>(
        73, _omitFieldNames ? '' : 'getManagedChargingSitesRequest',
        protoName: 'getManagedChargingSitesRequest',
        subBuilder: GetManagedChargingSitesRequest.create)
    ..aOM<UpdateChargeOnSolarFeatureRequest>(
        74, _omitFieldNames ? '' : 'updateChargeOnSolarFeatureRequest',
        protoName: 'updateChargeOnSolarFeatureRequest',
        subBuilder: UpdateChargeOnSolarFeatureRequest.create)
    ..aOM<GetChargeOnSolarFeatureRequest>(
        75, _omitFieldNames ? '' : 'getChargeOnSolarFeatureRequest',
        protoName: 'getChargeOnSolarFeatureRequest',
        subBuilder: GetChargeOnSolarFeatureRequest.create)
    ..aOM<VehicleControlSetPinToDriveAction>(
        77, _omitFieldNames ? '' : 'vehicleControlSetPinToDriveAction',
        protoName: 'vehicleControlSetPinToDriveAction',
        subBuilder: VehicleControlSetPinToDriveAction.create)
    ..aOM<VehicleControlResetPinToDriveAction>(
        78, _omitFieldNames ? '' : 'vehicleControlResetPinToDriveAction',
        protoName: 'vehicleControlResetPinToDriveAction',
        subBuilder: VehicleControlResetPinToDriveAction.create)
    ..aOM<DrivingClearSpeedLimitPinAdminAction>(
        79, _omitFieldNames ? '' : 'drivingClearSpeedLimitPinAdminAction',
        protoName: 'drivingClearSpeedLimitPinAdminAction',
        subBuilder: DrivingClearSpeedLimitPinAdminAction.create)
    ..aOM<SetOutletsOnOffAction>(
        80, _omitFieldNames ? '' : 'setOutletsOnOffAction',
        protoName: 'setOutletsOnOffAction',
        subBuilder: SetOutletsOnOffAction.create)
    ..aOM<SetOutletTimerAction>(
        81, _omitFieldNames ? '' : 'setOutletTimerAction',
        protoName: 'setOutletTimerAction',
        subBuilder: SetOutletTimerAction.create)
    ..aOM<SetOutletSocLimitAction>(
        82, _omitFieldNames ? '' : 'setOutletSocLimitAction',
        protoName: 'setOutletSocLimitAction',
        subBuilder: SetOutletSocLimitAction.create)
    ..aOM<SetPowerFeedOnOffAction>(
        83, _omitFieldNames ? '' : 'setPowerFeedOnOffAction',
        protoName: 'setPowerFeedOnOffAction',
        subBuilder: SetPowerFeedOnOffAction.create)
    ..aOM<SetPowerFeedTimerAction>(
        84, _omitFieldNames ? '' : 'setPowerFeedTimerAction',
        protoName: 'setPowerFeedTimerAction',
        subBuilder: SetPowerFeedTimerAction.create)
    ..aOM<SetPowerFeedSocLimitAction>(
        85, _omitFieldNames ? '' : 'setPowerFeedSocLimitAction',
        protoName: 'setPowerFeedSocLimitAction',
        subBuilder: SetPowerFeedSocLimitAction.create)
    ..aOM<SetTrailerLightTestStartStopAction>(
        86, _omitFieldNames ? '' : 'setTrailerLightTestStartStopAction',
        protoName: 'setTrailerLightTestStartStopAction',
        subBuilder: SetTrailerLightTestStartStopAction.create)
    ..aOM<SetTruckBedLightAutoStateAction>(
        87, _omitFieldNames ? '' : 'setTruckBedLightAutoStateAction',
        protoName: 'setTruckBedLightAutoStateAction',
        subBuilder: SetTruckBedLightAutoStateAction.create)
    ..aOM<SetTruckBedLightBrightnessAction>(
        88, _omitFieldNames ? '' : 'setTruckBedLightBrightnessAction',
        protoName: 'setTruckBedLightBrightnessAction',
        subBuilder: SetTruckBedLightBrightnessAction.create)
    ..aOM<VehicleControlResetPinToDriveAdminAction>(
        89, _omitFieldNames ? '' : 'vehicleControlResetPinToDriveAdminAction',
        protoName: 'vehicleControlResetPinToDriveAdminAction',
        subBuilder: VehicleControlResetPinToDriveAdminAction.create)
    ..aOM<NavigationWaypointsRequest>(
        90, _omitFieldNames ? '' : 'navigationWaypointsRequest',
        protoName: 'navigationWaypointsRequest',
        subBuilder: NavigationWaypointsRequest.create)
    ..aOM<SetPowershareFeatureAction>(
        91, _omitFieldNames ? '' : 'setPowershareFeatureAction',
        protoName: 'setPowershareFeatureAction',
        subBuilder: SetPowershareFeatureAction.create)
    ..aOM<SetPowershareDischargeLimitAction>(
        92, _omitFieldNames ? '' : 'setPowershareDischargeLimitAction',
        protoName: 'setPowershareDischargeLimitAction',
        subBuilder: SetPowershareDischargeLimitAction.create)
    ..aOM<SetPowershareRequestAction>(
        93, _omitFieldNames ? '' : 'setPowershareRequestAction',
        protoName: 'setPowershareRequestAction',
        subBuilder: SetPowershareRequestAction.create)
    ..aOM<SetTentModeRequestAction>(
        94, _omitFieldNames ? '' : 'setTentModeRequestAction',
        protoName: 'setTentModeRequestAction',
        subBuilder: SetTentModeRequestAction.create)
    ..aOM<SetZoneLightRequestAction>(
        95, _omitFieldNames ? '' : 'setFrontZoneLightRequestAction',
        protoName: 'setFrontZoneLightRequestAction',
        subBuilder: SetZoneLightRequestAction.create)
    ..aOM<SetZoneLightRequestAction>(
        96, _omitFieldNames ? '' : 'setRearZoneLightRequestAction',
        protoName: 'setRearZoneLightRequestAction',
        subBuilder: SetZoneLightRequestAction.create)
    ..aOM<$1.ChargeSchedule>(
        97, _omitFieldNames ? '' : 'addChargeScheduleAction',
        protoName: 'addChargeScheduleAction',
        subBuilder: $1.ChargeSchedule.create)
    ..aOM<RemoveChargeScheduleAction>(
        98, _omitFieldNames ? '' : 'removeChargeScheduleAction',
        protoName: 'removeChargeScheduleAction',
        subBuilder: RemoveChargeScheduleAction.create)
    ..aOM<$1.PreconditionSchedule>(
        99, _omitFieldNames ? '' : 'addPreconditionScheduleAction',
        protoName: 'addPreconditionScheduleAction',
        subBuilder: $1.PreconditionSchedule.create)
    ..aOM<RemovePreconditionScheduleAction>(
        100, _omitFieldNames ? '' : 'removePreconditionScheduleAction',
        protoName: 'removePreconditionScheduleAction',
        subBuilder: RemovePreconditionScheduleAction.create)
    ..aOM<SetLightbarBrightnessAction>(
        101, _omitFieldNames ? '' : 'setLightbarBrightnessAction',
        protoName: 'setLightbarBrightnessAction',
        subBuilder: SetLightbarBrightnessAction.create)
    ..aOM<SetLightbarMiddleAction>(
        102, _omitFieldNames ? '' : 'setLightbarMiddleAction',
        protoName: 'setLightbarMiddleAction',
        subBuilder: SetLightbarMiddleAction.create)
    ..aOM<SetLightbarDitchAction>(
        103, _omitFieldNames ? '' : 'setLightbarDitchAction',
        protoName: 'setLightbarDitchAction',
        subBuilder: SetLightbarDitchAction.create)
    ..aOM<GetMessagesAction>(104, _omitFieldNames ? '' : 'getMessagesAction',
        protoName: 'getMessagesAction', subBuilder: GetMessagesAction.create)
    ..aOM<TeslaAuthResponseAction>(
        105, _omitFieldNames ? '' : 'teslaAuthResponseAction',
        protoName: 'teslaAuthResponseAction',
        subBuilder: TeslaAuthResponseAction.create)
    ..aOM<NavigationGpsDestinationRequest>(
        106, _omitFieldNames ? '' : 'navigationGpsDestinationRequest',
        protoName: 'navigationGpsDestinationRequest',
        subBuilder: NavigationGpsDestinationRequest.create)
    ..aOM<BatchRemovePreconditionSchedulesAction>(
        107, _omitFieldNames ? '' : 'batchRemovePreconditionSchedulesAction',
        protoName: 'batchRemovePreconditionSchedulesAction',
        subBuilder: BatchRemovePreconditionSchedulesAction.create)
    ..aOM<BatchRemoveChargeSchedulesAction>(
        108, _omitFieldNames ? '' : 'batchRemoveChargeSchedulesAction',
        protoName: 'batchRemoveChargeSchedulesAction',
        subBuilder: BatchRemoveChargeSchedulesAction.create)
    ..aOM<ParentalControlsClearPinAction>(
        109, _omitFieldNames ? '' : 'parentalControlsClearPinAction',
        protoName: 'parentalControlsClearPinAction',
        subBuilder: ParentalControlsClearPinAction.create)
    ..aOM<ParentalControlsClearPinAdminAction>(
        110, _omitFieldNames ? '' : 'parentalControlsClearPinAdminAction',
        protoName: 'parentalControlsClearPinAdminAction',
        subBuilder: ParentalControlsClearPinAdminAction.create)
    ..aOM<ParentalControlsAction>(
        111, _omitFieldNames ? '' : 'parentalControlsAction',
        protoName: 'parentalControlsAction',
        subBuilder: ParentalControlsAction.create)
    ..aOM<ParentalControlsEnableSettingsAction>(
        112, _omitFieldNames ? '' : 'parentalControlsEnableSettingsAction',
        protoName: 'parentalControlsEnableSettingsAction',
        subBuilder: ParentalControlsEnableSettingsAction.create)
    ..aOM<ParentalControlsSetSpeedLimitAction>(
        113, _omitFieldNames ? '' : 'parentalControlsSetSpeedLimitAction',
        protoName: 'parentalControlsSetSpeedLimitAction',
        subBuilder: ParentalControlsSetSpeedLimitAction.create)
    ..aOM<CancelSohTestAction>(
        114, _omitFieldNames ? '' : 'cancelSohTestAction',
        protoName: 'cancelSohTestAction',
        subBuilder: CancelSohTestAction.create)
    ..aOM<StopLightShowAction>(
        116, _omitFieldNames ? '' : 'stopLightShowAction',
        protoName: 'stopLightShowAction',
        subBuilder: StopLightShowAction.create)
    ..aOM<StartLightShowAction>(
        117, _omitFieldNames ? '' : 'startLightShowAction',
        protoName: 'startLightShowAction',
        subBuilder: StartLightShowAction.create)
    ..aOM<SetSuspensionLevelAction>(
        118, _omitFieldNames ? '' : 'setSuspensionLevelAction',
        protoName: 'setSuspensionLevelAction',
        subBuilder: SetSuspensionLevelAction.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VehicleAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VehicleAction copyWith(void Function(VehicleAction) updates) =>
      super.copyWith((message) => updates(message as VehicleAction))
          as VehicleAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VehicleAction create() => VehicleAction._();
  @$core.override
  VehicleAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VehicleAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VehicleAction>(create);
  static VehicleAction? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  @$pb.TagNumber(10)
  @$pb.TagNumber(12)
  @$pb.TagNumber(13)
  @$pb.TagNumber(14)
  @$pb.TagNumber(15)
  @$pb.TagNumber(16)
  @$pb.TagNumber(17)
  @$pb.TagNumber(18)
  @$pb.TagNumber(19)
  @$pb.TagNumber(20)
  @$pb.TagNumber(21)
  @$pb.TagNumber(22)
  @$pb.TagNumber(23)
  @$pb.TagNumber(24)
  @$pb.TagNumber(25)
  @$pb.TagNumber(26)
  @$pb.TagNumber(27)
  @$pb.TagNumber(28)
  @$pb.TagNumber(29)
  @$pb.TagNumber(30)
  @$pb.TagNumber(31)
  @$pb.TagNumber(32)
  @$pb.TagNumber(33)
  @$pb.TagNumber(34)
  @$pb.TagNumber(35)
  @$pb.TagNumber(36)
  @$pb.TagNumber(37)
  @$pb.TagNumber(38)
  @$pb.TagNumber(39)
  @$pb.TagNumber(40)
  @$pb.TagNumber(41)
  @$pb.TagNumber(42)
  @$pb.TagNumber(43)
  @$pb.TagNumber(44)
  @$pb.TagNumber(45)
  @$pb.TagNumber(46)
  @$pb.TagNumber(47)
  @$pb.TagNumber(48)
  @$pb.TagNumber(49)
  @$pb.TagNumber(50)
  @$pb.TagNumber(51)
  @$pb.TagNumber(52)
  @$pb.TagNumber(53)
  @$pb.TagNumber(54)
  @$pb.TagNumber(55)
  @$pb.TagNumber(56)
  @$pb.TagNumber(57)
  @$pb.TagNumber(58)
  @$pb.TagNumber(61)
  @$pb.TagNumber(62)
  @$pb.TagNumber(63)
  @$pb.TagNumber(64)
  @$pb.TagNumber(65)
  @$pb.TagNumber(66)
  @$pb.TagNumber(67)
  @$pb.TagNumber(68)
  @$pb.TagNumber(69)
  @$pb.TagNumber(70)
  @$pb.TagNumber(71)
  @$pb.TagNumber(72)
  @$pb.TagNumber(73)
  @$pb.TagNumber(74)
  @$pb.TagNumber(75)
  @$pb.TagNumber(77)
  @$pb.TagNumber(78)
  @$pb.TagNumber(79)
  @$pb.TagNumber(80)
  @$pb.TagNumber(81)
  @$pb.TagNumber(82)
  @$pb.TagNumber(83)
  @$pb.TagNumber(84)
  @$pb.TagNumber(85)
  @$pb.TagNumber(86)
  @$pb.TagNumber(87)
  @$pb.TagNumber(88)
  @$pb.TagNumber(89)
  @$pb.TagNumber(90)
  @$pb.TagNumber(91)
  @$pb.TagNumber(92)
  @$pb.TagNumber(93)
  @$pb.TagNumber(94)
  @$pb.TagNumber(95)
  @$pb.TagNumber(96)
  @$pb.TagNumber(97)
  @$pb.TagNumber(98)
  @$pb.TagNumber(99)
  @$pb.TagNumber(100)
  @$pb.TagNumber(101)
  @$pb.TagNumber(102)
  @$pb.TagNumber(103)
  @$pb.TagNumber(104)
  @$pb.TagNumber(105)
  @$pb.TagNumber(106)
  @$pb.TagNumber(107)
  @$pb.TagNumber(108)
  @$pb.TagNumber(109)
  @$pb.TagNumber(110)
  @$pb.TagNumber(111)
  @$pb.TagNumber(112)
  @$pb.TagNumber(113)
  @$pb.TagNumber(114)
  @$pb.TagNumber(116)
  @$pb.TagNumber(117)
  @$pb.TagNumber(118)
  VehicleAction_VehicleActionMsg whichVehicleActionMsg() =>
      _VehicleAction_VehicleActionMsgByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  @$pb.TagNumber(10)
  @$pb.TagNumber(12)
  @$pb.TagNumber(13)
  @$pb.TagNumber(14)
  @$pb.TagNumber(15)
  @$pb.TagNumber(16)
  @$pb.TagNumber(17)
  @$pb.TagNumber(18)
  @$pb.TagNumber(19)
  @$pb.TagNumber(20)
  @$pb.TagNumber(21)
  @$pb.TagNumber(22)
  @$pb.TagNumber(23)
  @$pb.TagNumber(24)
  @$pb.TagNumber(25)
  @$pb.TagNumber(26)
  @$pb.TagNumber(27)
  @$pb.TagNumber(28)
  @$pb.TagNumber(29)
  @$pb.TagNumber(30)
  @$pb.TagNumber(31)
  @$pb.TagNumber(32)
  @$pb.TagNumber(33)
  @$pb.TagNumber(34)
  @$pb.TagNumber(35)
  @$pb.TagNumber(36)
  @$pb.TagNumber(37)
  @$pb.TagNumber(38)
  @$pb.TagNumber(39)
  @$pb.TagNumber(40)
  @$pb.TagNumber(41)
  @$pb.TagNumber(42)
  @$pb.TagNumber(43)
  @$pb.TagNumber(44)
  @$pb.TagNumber(45)
  @$pb.TagNumber(46)
  @$pb.TagNumber(47)
  @$pb.TagNumber(48)
  @$pb.TagNumber(49)
  @$pb.TagNumber(50)
  @$pb.TagNumber(51)
  @$pb.TagNumber(52)
  @$pb.TagNumber(53)
  @$pb.TagNumber(54)
  @$pb.TagNumber(55)
  @$pb.TagNumber(56)
  @$pb.TagNumber(57)
  @$pb.TagNumber(58)
  @$pb.TagNumber(61)
  @$pb.TagNumber(62)
  @$pb.TagNumber(63)
  @$pb.TagNumber(64)
  @$pb.TagNumber(65)
  @$pb.TagNumber(66)
  @$pb.TagNumber(67)
  @$pb.TagNumber(68)
  @$pb.TagNumber(69)
  @$pb.TagNumber(70)
  @$pb.TagNumber(71)
  @$pb.TagNumber(72)
  @$pb.TagNumber(73)
  @$pb.TagNumber(74)
  @$pb.TagNumber(75)
  @$pb.TagNumber(77)
  @$pb.TagNumber(78)
  @$pb.TagNumber(79)
  @$pb.TagNumber(80)
  @$pb.TagNumber(81)
  @$pb.TagNumber(82)
  @$pb.TagNumber(83)
  @$pb.TagNumber(84)
  @$pb.TagNumber(85)
  @$pb.TagNumber(86)
  @$pb.TagNumber(87)
  @$pb.TagNumber(88)
  @$pb.TagNumber(89)
  @$pb.TagNumber(90)
  @$pb.TagNumber(91)
  @$pb.TagNumber(92)
  @$pb.TagNumber(93)
  @$pb.TagNumber(94)
  @$pb.TagNumber(95)
  @$pb.TagNumber(96)
  @$pb.TagNumber(97)
  @$pb.TagNumber(98)
  @$pb.TagNumber(99)
  @$pb.TagNumber(100)
  @$pb.TagNumber(101)
  @$pb.TagNumber(102)
  @$pb.TagNumber(103)
  @$pb.TagNumber(104)
  @$pb.TagNumber(105)
  @$pb.TagNumber(106)
  @$pb.TagNumber(107)
  @$pb.TagNumber(108)
  @$pb.TagNumber(109)
  @$pb.TagNumber(110)
  @$pb.TagNumber(111)
  @$pb.TagNumber(112)
  @$pb.TagNumber(113)
  @$pb.TagNumber(114)
  @$pb.TagNumber(116)
  @$pb.TagNumber(117)
  @$pb.TagNumber(118)
  void clearVehicleActionMsg() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  GetVehicleData get getVehicleData => $_getN(0);
  @$pb.TagNumber(1)
  set getVehicleData(GetVehicleData value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasGetVehicleData() => $_has(0);
  @$pb.TagNumber(1)
  void clearGetVehicleData() => $_clearField(1);
  @$pb.TagNumber(1)
  GetVehicleData ensureGetVehicleData() => $_ensure(0);

  @$pb.TagNumber(2)
  RemoteStartDrive get remoteStartDrive => $_getN(1);
  @$pb.TagNumber(2)
  set remoteStartDrive(RemoteStartDrive value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasRemoteStartDrive() => $_has(1);
  @$pb.TagNumber(2)
  void clearRemoteStartDrive() => $_clearField(2);
  @$pb.TagNumber(2)
  RemoteStartDrive ensureRemoteStartDrive() => $_ensure(1);

  @$pb.TagNumber(3)
  CreateStreamSession get createStreamSession => $_getN(2);
  @$pb.TagNumber(3)
  set createStreamSession(CreateStreamSession value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasCreateStreamSession() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreateStreamSession() => $_clearField(3);
  @$pb.TagNumber(3)
  CreateStreamSession ensureCreateStreamSession() => $_ensure(2);

  @$pb.TagNumber(4)
  StreamMessage get streamMessage => $_getN(3);
  @$pb.TagNumber(4)
  set streamMessage(StreamMessage value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasStreamMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearStreamMessage() => $_clearField(4);
  @$pb.TagNumber(4)
  StreamMessage ensureStreamMessage() => $_ensure(3);

  @$pb.TagNumber(5)
  ChargingSetLimitAction get chargingSetLimitAction => $_getN(4);
  @$pb.TagNumber(5)
  set chargingSetLimitAction(ChargingSetLimitAction value) =>
      $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasChargingSetLimitAction() => $_has(4);
  @$pb.TagNumber(5)
  void clearChargingSetLimitAction() => $_clearField(5);
  @$pb.TagNumber(5)
  ChargingSetLimitAction ensureChargingSetLimitAction() => $_ensure(4);

  @$pb.TagNumber(6)
  ChargingStartStopAction get chargingStartStopAction => $_getN(5);
  @$pb.TagNumber(6)
  set chargingStartStopAction(ChargingStartStopAction value) =>
      $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasChargingStartStopAction() => $_has(5);
  @$pb.TagNumber(6)
  void clearChargingStartStopAction() => $_clearField(6);
  @$pb.TagNumber(6)
  ChargingStartStopAction ensureChargingStartStopAction() => $_ensure(5);

  @$pb.TagNumber(7)
  DrivingClearSpeedLimitPinAction get drivingClearSpeedLimitPinAction =>
      $_getN(6);
  @$pb.TagNumber(7)
  set drivingClearSpeedLimitPinAction(DrivingClearSpeedLimitPinAction value) =>
      $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasDrivingClearSpeedLimitPinAction() => $_has(6);
  @$pb.TagNumber(7)
  void clearDrivingClearSpeedLimitPinAction() => $_clearField(7);
  @$pb.TagNumber(7)
  DrivingClearSpeedLimitPinAction ensureDrivingClearSpeedLimitPinAction() =>
      $_ensure(6);

  @$pb.TagNumber(8)
  DrivingSetSpeedLimitAction get drivingSetSpeedLimitAction => $_getN(7);
  @$pb.TagNumber(8)
  set drivingSetSpeedLimitAction(DrivingSetSpeedLimitAction value) =>
      $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasDrivingSetSpeedLimitAction() => $_has(7);
  @$pb.TagNumber(8)
  void clearDrivingSetSpeedLimitAction() => $_clearField(8);
  @$pb.TagNumber(8)
  DrivingSetSpeedLimitAction ensureDrivingSetSpeedLimitAction() => $_ensure(7);

  @$pb.TagNumber(9)
  DrivingSpeedLimitAction get drivingSpeedLimitAction => $_getN(8);
  @$pb.TagNumber(9)
  set drivingSpeedLimitAction(DrivingSpeedLimitAction value) =>
      $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasDrivingSpeedLimitAction() => $_has(8);
  @$pb.TagNumber(9)
  void clearDrivingSpeedLimitAction() => $_clearField(9);
  @$pb.TagNumber(9)
  DrivingSpeedLimitAction ensureDrivingSpeedLimitAction() => $_ensure(8);

  @$pb.TagNumber(10)
  HvacAutoAction get hvacAutoAction => $_getN(9);
  @$pb.TagNumber(10)
  set hvacAutoAction(HvacAutoAction value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasHvacAutoAction() => $_has(9);
  @$pb.TagNumber(10)
  void clearHvacAutoAction() => $_clearField(10);
  @$pb.TagNumber(10)
  HvacAutoAction ensureHvacAutoAction() => $_ensure(9);

  /// Missing = 11;
  @$pb.TagNumber(12)
  HvacSetPreconditioningMaxAction get hvacSetPreconditioningMaxAction =>
      $_getN(10);
  @$pb.TagNumber(12)
  set hvacSetPreconditioningMaxAction(HvacSetPreconditioningMaxAction value) =>
      $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasHvacSetPreconditioningMaxAction() => $_has(10);
  @$pb.TagNumber(12)
  void clearHvacSetPreconditioningMaxAction() => $_clearField(12);
  @$pb.TagNumber(12)
  HvacSetPreconditioningMaxAction ensureHvacSetPreconditioningMaxAction() =>
      $_ensure(10);

  @$pb.TagNumber(13)
  HvacSteeringWheelHeaterAction get hvacSteeringWheelHeaterAction => $_getN(11);
  @$pb.TagNumber(13)
  set hvacSteeringWheelHeaterAction(HvacSteeringWheelHeaterAction value) =>
      $_setField(13, value);
  @$pb.TagNumber(13)
  $core.bool hasHvacSteeringWheelHeaterAction() => $_has(11);
  @$pb.TagNumber(13)
  void clearHvacSteeringWheelHeaterAction() => $_clearField(13);
  @$pb.TagNumber(13)
  HvacSteeringWheelHeaterAction ensureHvacSteeringWheelHeaterAction() =>
      $_ensure(11);

  @$pb.TagNumber(14)
  HvacTemperatureAdjustmentAction get hvacTemperatureAdjustmentAction =>
      $_getN(12);
  @$pb.TagNumber(14)
  set hvacTemperatureAdjustmentAction(HvacTemperatureAdjustmentAction value) =>
      $_setField(14, value);
  @$pb.TagNumber(14)
  $core.bool hasHvacTemperatureAdjustmentAction() => $_has(12);
  @$pb.TagNumber(14)
  void clearHvacTemperatureAdjustmentAction() => $_clearField(14);
  @$pb.TagNumber(14)
  HvacTemperatureAdjustmentAction ensureHvacTemperatureAdjustmentAction() =>
      $_ensure(12);

  @$pb.TagNumber(15)
  MediaPlayAction get mediaPlayAction => $_getN(13);
  @$pb.TagNumber(15)
  set mediaPlayAction(MediaPlayAction value) => $_setField(15, value);
  @$pb.TagNumber(15)
  $core.bool hasMediaPlayAction() => $_has(13);
  @$pb.TagNumber(15)
  void clearMediaPlayAction() => $_clearField(15);
  @$pb.TagNumber(15)
  MediaPlayAction ensureMediaPlayAction() => $_ensure(13);

  @$pb.TagNumber(16)
  MediaUpdateVolume get mediaUpdateVolume => $_getN(14);
  @$pb.TagNumber(16)
  set mediaUpdateVolume(MediaUpdateVolume value) => $_setField(16, value);
  @$pb.TagNumber(16)
  $core.bool hasMediaUpdateVolume() => $_has(14);
  @$pb.TagNumber(16)
  void clearMediaUpdateVolume() => $_clearField(16);
  @$pb.TagNumber(16)
  MediaUpdateVolume ensureMediaUpdateVolume() => $_ensure(14);

  @$pb.TagNumber(17)
  MediaNextFavorite get mediaNextFavorite => $_getN(15);
  @$pb.TagNumber(17)
  set mediaNextFavorite(MediaNextFavorite value) => $_setField(17, value);
  @$pb.TagNumber(17)
  $core.bool hasMediaNextFavorite() => $_has(15);
  @$pb.TagNumber(17)
  void clearMediaNextFavorite() => $_clearField(17);
  @$pb.TagNumber(17)
  MediaNextFavorite ensureMediaNextFavorite() => $_ensure(15);

  @$pb.TagNumber(18)
  MediaPreviousFavorite get mediaPreviousFavorite => $_getN(16);
  @$pb.TagNumber(18)
  set mediaPreviousFavorite(MediaPreviousFavorite value) =>
      $_setField(18, value);
  @$pb.TagNumber(18)
  $core.bool hasMediaPreviousFavorite() => $_has(16);
  @$pb.TagNumber(18)
  void clearMediaPreviousFavorite() => $_clearField(18);
  @$pb.TagNumber(18)
  MediaPreviousFavorite ensureMediaPreviousFavorite() => $_ensure(16);

  @$pb.TagNumber(19)
  MediaNextTrack get mediaNextTrack => $_getN(17);
  @$pb.TagNumber(19)
  set mediaNextTrack(MediaNextTrack value) => $_setField(19, value);
  @$pb.TagNumber(19)
  $core.bool hasMediaNextTrack() => $_has(17);
  @$pb.TagNumber(19)
  void clearMediaNextTrack() => $_clearField(19);
  @$pb.TagNumber(19)
  MediaNextTrack ensureMediaNextTrack() => $_ensure(17);

  @$pb.TagNumber(20)
  MediaPreviousTrack get mediaPreviousTrack => $_getN(18);
  @$pb.TagNumber(20)
  set mediaPreviousTrack(MediaPreviousTrack value) => $_setField(20, value);
  @$pb.TagNumber(20)
  $core.bool hasMediaPreviousTrack() => $_has(18);
  @$pb.TagNumber(20)
  void clearMediaPreviousTrack() => $_clearField(20);
  @$pb.TagNumber(20)
  MediaPreviousTrack ensureMediaPreviousTrack() => $_ensure(18);

  @$pb.TagNumber(21)
  NavigationRequest get navigationRequest => $_getN(19);
  @$pb.TagNumber(21)
  set navigationRequest(NavigationRequest value) => $_setField(21, value);
  @$pb.TagNumber(21)
  $core.bool hasNavigationRequest() => $_has(19);
  @$pb.TagNumber(21)
  void clearNavigationRequest() => $_clearField(21);
  @$pb.TagNumber(21)
  NavigationRequest ensureNavigationRequest() => $_ensure(19);

  @$pb.TagNumber(22)
  NavigationSuperchargerRequest get navigationSuperchargerRequest => $_getN(20);
  @$pb.TagNumber(22)
  set navigationSuperchargerRequest(NavigationSuperchargerRequest value) =>
      $_setField(22, value);
  @$pb.TagNumber(22)
  $core.bool hasNavigationSuperchargerRequest() => $_has(20);
  @$pb.TagNumber(22)
  void clearNavigationSuperchargerRequest() => $_clearField(22);
  @$pb.TagNumber(22)
  NavigationSuperchargerRequest ensureNavigationSuperchargerRequest() =>
      $_ensure(20);

  @$pb.TagNumber(23)
  GetNearbyChargingSites get getNearbyChargingSites => $_getN(21);
  @$pb.TagNumber(23)
  set getNearbyChargingSites(GetNearbyChargingSites value) =>
      $_setField(23, value);
  @$pb.TagNumber(23)
  $core.bool hasGetNearbyChargingSites() => $_has(21);
  @$pb.TagNumber(23)
  void clearGetNearbyChargingSites() => $_clearField(23);
  @$pb.TagNumber(23)
  GetNearbyChargingSites ensureGetNearbyChargingSites() => $_ensure(21);

  @$pb.TagNumber(24)
  UiSetUpcomingCalendarEntries get uiSetUpcomingCalendarEntries => $_getN(22);
  @$pb.TagNumber(24)
  set uiSetUpcomingCalendarEntries(UiSetUpcomingCalendarEntries value) =>
      $_setField(24, value);
  @$pb.TagNumber(24)
  $core.bool hasUiSetUpcomingCalendarEntries() => $_has(22);
  @$pb.TagNumber(24)
  void clearUiSetUpcomingCalendarEntries() => $_clearField(24);
  @$pb.TagNumber(24)
  UiSetUpcomingCalendarEntries ensureUiSetUpcomingCalendarEntries() =>
      $_ensure(22);

  @$pb.TagNumber(25)
  VehicleControlCancelSoftwareUpdateAction
      get vehicleControlCancelSoftwareUpdateAction => $_getN(23);
  @$pb.TagNumber(25)
  set vehicleControlCancelSoftwareUpdateAction(
          VehicleControlCancelSoftwareUpdateAction value) =>
      $_setField(25, value);
  @$pb.TagNumber(25)
  $core.bool hasVehicleControlCancelSoftwareUpdateAction() => $_has(23);
  @$pb.TagNumber(25)
  void clearVehicleControlCancelSoftwareUpdateAction() => $_clearField(25);
  @$pb.TagNumber(25)
  VehicleControlCancelSoftwareUpdateAction
      ensureVehicleControlCancelSoftwareUpdateAction() => $_ensure(23);

  @$pb.TagNumber(26)
  VehicleControlFlashLightsAction get vehicleControlFlashLightsAction =>
      $_getN(24);
  @$pb.TagNumber(26)
  set vehicleControlFlashLightsAction(VehicleControlFlashLightsAction value) =>
      $_setField(26, value);
  @$pb.TagNumber(26)
  $core.bool hasVehicleControlFlashLightsAction() => $_has(24);
  @$pb.TagNumber(26)
  void clearVehicleControlFlashLightsAction() => $_clearField(26);
  @$pb.TagNumber(26)
  VehicleControlFlashLightsAction ensureVehicleControlFlashLightsAction() =>
      $_ensure(24);

  @$pb.TagNumber(27)
  VehicleControlHonkHornAction get vehicleControlHonkHornAction => $_getN(25);
  @$pb.TagNumber(27)
  set vehicleControlHonkHornAction(VehicleControlHonkHornAction value) =>
      $_setField(27, value);
  @$pb.TagNumber(27)
  $core.bool hasVehicleControlHonkHornAction() => $_has(25);
  @$pb.TagNumber(27)
  void clearVehicleControlHonkHornAction() => $_clearField(27);
  @$pb.TagNumber(27)
  VehicleControlHonkHornAction ensureVehicleControlHonkHornAction() =>
      $_ensure(25);

  @$pb.TagNumber(28)
  VehicleControlResetValetPinAction get vehicleControlResetValetPinAction =>
      $_getN(26);
  @$pb.TagNumber(28)
  set vehicleControlResetValetPinAction(
          VehicleControlResetValetPinAction value) =>
      $_setField(28, value);
  @$pb.TagNumber(28)
  $core.bool hasVehicleControlResetValetPinAction() => $_has(26);
  @$pb.TagNumber(28)
  void clearVehicleControlResetValetPinAction() => $_clearField(28);
  @$pb.TagNumber(28)
  VehicleControlResetValetPinAction ensureVehicleControlResetValetPinAction() =>
      $_ensure(26);

  @$pb.TagNumber(29)
  VehicleControlScheduleSoftwareUpdateAction
      get vehicleControlScheduleSoftwareUpdateAction => $_getN(27);
  @$pb.TagNumber(29)
  set vehicleControlScheduleSoftwareUpdateAction(
          VehicleControlScheduleSoftwareUpdateAction value) =>
      $_setField(29, value);
  @$pb.TagNumber(29)
  $core.bool hasVehicleControlScheduleSoftwareUpdateAction() => $_has(27);
  @$pb.TagNumber(29)
  void clearVehicleControlScheduleSoftwareUpdateAction() => $_clearField(29);
  @$pb.TagNumber(29)
  VehicleControlScheduleSoftwareUpdateAction
      ensureVehicleControlScheduleSoftwareUpdateAction() => $_ensure(27);

  @$pb.TagNumber(30)
  VehicleControlSetSentryModeAction get vehicleControlSetSentryModeAction =>
      $_getN(28);
  @$pb.TagNumber(30)
  set vehicleControlSetSentryModeAction(
          VehicleControlSetSentryModeAction value) =>
      $_setField(30, value);
  @$pb.TagNumber(30)
  $core.bool hasVehicleControlSetSentryModeAction() => $_has(28);
  @$pb.TagNumber(30)
  void clearVehicleControlSetSentryModeAction() => $_clearField(30);
  @$pb.TagNumber(30)
  VehicleControlSetSentryModeAction ensureVehicleControlSetSentryModeAction() =>
      $_ensure(28);

  @$pb.TagNumber(31)
  VehicleControlSetValetModeAction get vehicleControlSetValetModeAction =>
      $_getN(29);
  @$pb.TagNumber(31)
  set vehicleControlSetValetModeAction(
          VehicleControlSetValetModeAction value) =>
      $_setField(31, value);
  @$pb.TagNumber(31)
  $core.bool hasVehicleControlSetValetModeAction() => $_has(29);
  @$pb.TagNumber(31)
  void clearVehicleControlSetValetModeAction() => $_clearField(31);
  @$pb.TagNumber(31)
  VehicleControlSetValetModeAction ensureVehicleControlSetValetModeAction() =>
      $_ensure(29);

  @$pb.TagNumber(32)
  VehicleControlSunroofOpenCloseAction
      get vehicleControlSunroofOpenCloseAction => $_getN(30);
  @$pb.TagNumber(32)
  set vehicleControlSunroofOpenCloseAction(
          VehicleControlSunroofOpenCloseAction value) =>
      $_setField(32, value);
  @$pb.TagNumber(32)
  $core.bool hasVehicleControlSunroofOpenCloseAction() => $_has(30);
  @$pb.TagNumber(32)
  void clearVehicleControlSunroofOpenCloseAction() => $_clearField(32);
  @$pb.TagNumber(32)
  VehicleControlSunroofOpenCloseAction
      ensureVehicleControlSunroofOpenCloseAction() => $_ensure(30);

  @$pb.TagNumber(33)
  VehicleControlTriggerHomelinkAction get vehicleControlTriggerHomelinkAction =>
      $_getN(31);
  @$pb.TagNumber(33)
  set vehicleControlTriggerHomelinkAction(
          VehicleControlTriggerHomelinkAction value) =>
      $_setField(33, value);
  @$pb.TagNumber(33)
  $core.bool hasVehicleControlTriggerHomelinkAction() => $_has(31);
  @$pb.TagNumber(33)
  void clearVehicleControlTriggerHomelinkAction() => $_clearField(33);
  @$pb.TagNumber(33)
  VehicleControlTriggerHomelinkAction
      ensureVehicleControlTriggerHomelinkAction() => $_ensure(31);

  @$pb.TagNumber(34)
  VehicleControlWindowAction get vehicleControlWindowAction => $_getN(32);
  @$pb.TagNumber(34)
  set vehicleControlWindowAction(VehicleControlWindowAction value) =>
      $_setField(34, value);
  @$pb.TagNumber(34)
  $core.bool hasVehicleControlWindowAction() => $_has(32);
  @$pb.TagNumber(34)
  void clearVehicleControlWindowAction() => $_clearField(34);
  @$pb.TagNumber(34)
  VehicleControlWindowAction ensureVehicleControlWindowAction() => $_ensure(32);

  @$pb.TagNumber(35)
  HvacBioweaponModeAction get hvacBioweaponModeAction => $_getN(33);
  @$pb.TagNumber(35)
  set hvacBioweaponModeAction(HvacBioweaponModeAction value) =>
      $_setField(35, value);
  @$pb.TagNumber(35)
  $core.bool hasHvacBioweaponModeAction() => $_has(33);
  @$pb.TagNumber(35)
  void clearHvacBioweaponModeAction() => $_clearField(35);
  @$pb.TagNumber(35)
  HvacBioweaponModeAction ensureHvacBioweaponModeAction() => $_ensure(33);

  @$pb.TagNumber(36)
  HvacSeatHeaterActions get hvacSeatHeaterActions => $_getN(34);
  @$pb.TagNumber(36)
  set hvacSeatHeaterActions(HvacSeatHeaterActions value) =>
      $_setField(36, value);
  @$pb.TagNumber(36)
  $core.bool hasHvacSeatHeaterActions() => $_has(34);
  @$pb.TagNumber(36)
  void clearHvacSeatHeaterActions() => $_clearField(36);
  @$pb.TagNumber(36)
  HvacSeatHeaterActions ensureHvacSeatHeaterActions() => $_ensure(34);

  @$pb.TagNumber(37)
  VehicleDataSubscription get vehicleDataSubscription => $_getN(35);
  @$pb.TagNumber(37)
  set vehicleDataSubscription(VehicleDataSubscription value) =>
      $_setField(37, value);
  @$pb.TagNumber(37)
  $core.bool hasVehicleDataSubscription() => $_has(35);
  @$pb.TagNumber(37)
  void clearVehicleDataSubscription() => $_clearField(37);
  @$pb.TagNumber(37)
  VehicleDataSubscription ensureVehicleDataSubscription() => $_ensure(35);

  @$pb.TagNumber(38)
  VehicleDataAck get vehicleDataAck => $_getN(36);
  @$pb.TagNumber(38)
  set vehicleDataAck(VehicleDataAck value) => $_setField(38, value);
  @$pb.TagNumber(38)
  $core.bool hasVehicleDataAck() => $_has(36);
  @$pb.TagNumber(38)
  void clearVehicleDataAck() => $_clearField(38);
  @$pb.TagNumber(38)
  VehicleDataAck ensureVehicleDataAck() => $_ensure(36);

  @$pb.TagNumber(39)
  VitalsSubscription get vitalsSubscription => $_getN(37);
  @$pb.TagNumber(39)
  set vitalsSubscription(VitalsSubscription value) => $_setField(39, value);
  @$pb.TagNumber(39)
  $core.bool hasVitalsSubscription() => $_has(37);
  @$pb.TagNumber(39)
  void clearVitalsSubscription() => $_clearField(39);
  @$pb.TagNumber(39)
  VitalsSubscription ensureVitalsSubscription() => $_ensure(37);

  @$pb.TagNumber(40)
  VitalsAck get vitalsAck => $_getN(38);
  @$pb.TagNumber(40)
  set vitalsAck(VitalsAck value) => $_setField(40, value);
  @$pb.TagNumber(40)
  $core.bool hasVitalsAck() => $_has(38);
  @$pb.TagNumber(40)
  void clearVitalsAck() => $_clearField(40);
  @$pb.TagNumber(40)
  VitalsAck ensureVitalsAck() => $_ensure(38);

  @$pb.TagNumber(41)
  ScheduledChargingAction get scheduledChargingAction => $_getN(39);
  @$pb.TagNumber(41)
  set scheduledChargingAction(ScheduledChargingAction value) =>
      $_setField(41, value);
  @$pb.TagNumber(41)
  $core.bool hasScheduledChargingAction() => $_has(39);
  @$pb.TagNumber(41)
  void clearScheduledChargingAction() => $_clearField(41);
  @$pb.TagNumber(41)
  ScheduledChargingAction ensureScheduledChargingAction() => $_ensure(39);

  @$pb.TagNumber(42)
  ScheduledDepartureAction get scheduledDepartureAction => $_getN(40);
  @$pb.TagNumber(42)
  set scheduledDepartureAction(ScheduledDepartureAction value) =>
      $_setField(42, value);
  @$pb.TagNumber(42)
  $core.bool hasScheduledDepartureAction() => $_has(40);
  @$pb.TagNumber(42)
  void clearScheduledDepartureAction() => $_clearField(42);
  @$pb.TagNumber(42)
  ScheduledDepartureAction ensureScheduledDepartureAction() => $_ensure(40);

  @$pb.TagNumber(43)
  SetChargingAmpsAction get setChargingAmpsAction => $_getN(41);
  @$pb.TagNumber(43)
  set setChargingAmpsAction(SetChargingAmpsAction value) =>
      $_setField(43, value);
  @$pb.TagNumber(43)
  $core.bool hasSetChargingAmpsAction() => $_has(41);
  @$pb.TagNumber(43)
  void clearSetChargingAmpsAction() => $_clearField(43);
  @$pb.TagNumber(43)
  SetChargingAmpsAction ensureSetChargingAmpsAction() => $_ensure(41);

  @$pb.TagNumber(44)
  HvacClimateKeeperAction get hvacClimateKeeperAction => $_getN(42);
  @$pb.TagNumber(44)
  set hvacClimateKeeperAction(HvacClimateKeeperAction value) =>
      $_setField(44, value);
  @$pb.TagNumber(44)
  $core.bool hasHvacClimateKeeperAction() => $_has(42);
  @$pb.TagNumber(44)
  void clearHvacClimateKeeperAction() => $_clearField(44);
  @$pb.TagNumber(44)
  HvacClimateKeeperAction ensureHvacClimateKeeperAction() => $_ensure(42);

  @$pb.TagNumber(45)
  HvacRecirculationAction get hvacRecirculationAction => $_getN(43);
  @$pb.TagNumber(45)
  set hvacRecirculationAction(HvacRecirculationAction value) =>
      $_setField(45, value);
  @$pb.TagNumber(45)
  $core.bool hasHvacRecirculationAction() => $_has(43);
  @$pb.TagNumber(45)
  void clearHvacRecirculationAction() => $_clearField(45);
  @$pb.TagNumber(45)
  HvacRecirculationAction ensureHvacRecirculationAction() => $_ensure(43);

  @$pb.TagNumber(46)
  Ping get ping => $_getN(44);
  @$pb.TagNumber(46)
  set ping(Ping value) => $_setField(46, value);
  @$pb.TagNumber(46)
  $core.bool hasPing() => $_has(44);
  @$pb.TagNumber(46)
  void clearPing() => $_clearField(46);
  @$pb.TagNumber(46)
  Ping ensurePing() => $_ensure(44);

  @$pb.TagNumber(47)
  DashcamSaveClipAction get dashcamSaveClipAction => $_getN(45);
  @$pb.TagNumber(47)
  set dashcamSaveClipAction(DashcamSaveClipAction value) =>
      $_setField(47, value);
  @$pb.TagNumber(47)
  $core.bool hasDashcamSaveClipAction() => $_has(45);
  @$pb.TagNumber(47)
  void clearDashcamSaveClipAction() => $_clearField(47);
  @$pb.TagNumber(47)
  DashcamSaveClipAction ensureDashcamSaveClipAction() => $_ensure(45);

  @$pb.TagNumber(48)
  AutoSeatClimateAction get autoSeatClimateAction => $_getN(46);
  @$pb.TagNumber(48)
  set autoSeatClimateAction(AutoSeatClimateAction value) =>
      $_setField(48, value);
  @$pb.TagNumber(48)
  $core.bool hasAutoSeatClimateAction() => $_has(46);
  @$pb.TagNumber(48)
  void clearAutoSeatClimateAction() => $_clearField(48);
  @$pb.TagNumber(48)
  AutoSeatClimateAction ensureAutoSeatClimateAction() => $_ensure(46);

  @$pb.TagNumber(49)
  HvacSeatCoolerActions get hvacSeatCoolerActions => $_getN(47);
  @$pb.TagNumber(49)
  set hvacSeatCoolerActions(HvacSeatCoolerActions value) =>
      $_setField(49, value);
  @$pb.TagNumber(49)
  $core.bool hasHvacSeatCoolerActions() => $_has(47);
  @$pb.TagNumber(49)
  void clearHvacSeatCoolerActions() => $_clearField(49);
  @$pb.TagNumber(49)
  HvacSeatCoolerActions ensureHvacSeatCoolerActions() => $_ensure(47);

  @$pb.TagNumber(50)
  SetCabinOverheatProtectionAction get setCabinOverheatProtectionAction =>
      $_getN(48);
  @$pb.TagNumber(50)
  set setCabinOverheatProtectionAction(
          SetCabinOverheatProtectionAction value) =>
      $_setField(50, value);
  @$pb.TagNumber(50)
  $core.bool hasSetCabinOverheatProtectionAction() => $_has(48);
  @$pb.TagNumber(50)
  void clearSetCabinOverheatProtectionAction() => $_clearField(50);
  @$pb.TagNumber(50)
  SetCabinOverheatProtectionAction ensureSetCabinOverheatProtectionAction() =>
      $_ensure(48);

  @$pb.TagNumber(51)
  PiiKeyRequest get piiKeyRequest => $_getN(49);
  @$pb.TagNumber(51)
  set piiKeyRequest(PiiKeyRequest value) => $_setField(51, value);
  @$pb.TagNumber(51)
  $core.bool hasPiiKeyRequest() => $_has(49);
  @$pb.TagNumber(51)
  void clearPiiKeyRequest() => $_clearField(51);
  @$pb.TagNumber(51)
  PiiKeyRequest ensurePiiKeyRequest() => $_ensure(49);

  @$pb.TagNumber(52)
  PseudonymSyncRequest get pseudonymSyncRequest => $_getN(50);
  @$pb.TagNumber(52)
  set pseudonymSyncRequest(PseudonymSyncRequest value) => $_setField(52, value);
  @$pb.TagNumber(52)
  $core.bool hasPseudonymSyncRequest() => $_has(50);
  @$pb.TagNumber(52)
  void clearPseudonymSyncRequest() => $_clearField(52);
  @$pb.TagNumber(52)
  PseudonymSyncRequest ensurePseudonymSyncRequest() => $_ensure(50);

  @$pb.TagNumber(53)
  NavigationGpsRequest get navigationGpsRequest => $_getN(51);
  @$pb.TagNumber(53)
  set navigationGpsRequest(NavigationGpsRequest value) => $_setField(53, value);
  @$pb.TagNumber(53)
  $core.bool hasNavigationGpsRequest() => $_has(51);
  @$pb.TagNumber(53)
  void clearNavigationGpsRequest() => $_clearField(53);
  @$pb.TagNumber(53)
  NavigationGpsRequest ensureNavigationGpsRequest() => $_ensure(51);

  @$pb.TagNumber(54)
  SetVehicleNameAction get setVehicleNameAction => $_getN(52);
  @$pb.TagNumber(54)
  set setVehicleNameAction(SetVehicleNameAction value) => $_setField(54, value);
  @$pb.TagNumber(54)
  $core.bool hasSetVehicleNameAction() => $_has(52);
  @$pb.TagNumber(54)
  void clearSetVehicleNameAction() => $_clearField(54);
  @$pb.TagNumber(54)
  SetVehicleNameAction ensureSetVehicleNameAction() => $_ensure(52);

  @$pb.TagNumber(55)
  SetRateTariffRequest get setRateTariffRequest => $_getN(53);
  @$pb.TagNumber(55)
  set setRateTariffRequest(SetRateTariffRequest value) => $_setField(55, value);
  @$pb.TagNumber(55)
  $core.bool hasSetRateTariffRequest() => $_has(53);
  @$pb.TagNumber(55)
  void clearSetRateTariffRequest() => $_clearField(55);
  @$pb.TagNumber(55)
  SetRateTariffRequest ensureSetRateTariffRequest() => $_ensure(53);

  @$pb.TagNumber(56)
  GetRateTariffRequest get getRateTariffRequest => $_getN(54);
  @$pb.TagNumber(56)
  set getRateTariffRequest(GetRateTariffRequest value) => $_setField(56, value);
  @$pb.TagNumber(56)
  $core.bool hasGetRateTariffRequest() => $_has(54);
  @$pb.TagNumber(56)
  void clearGetRateTariffRequest() => $_clearField(56);
  @$pb.TagNumber(56)
  GetRateTariffRequest ensureGetRateTariffRequest() => $_ensure(54);

  @$pb.TagNumber(57)
  VideoRequestAction get videoRequestAction => $_getN(55);
  @$pb.TagNumber(57)
  set videoRequestAction(VideoRequestAction value) => $_setField(57, value);
  @$pb.TagNumber(57)
  $core.bool hasVideoRequestAction() => $_has(55);
  @$pb.TagNumber(57)
  void clearVideoRequestAction() => $_clearField(57);
  @$pb.TagNumber(57)
  VideoRequestAction ensureVideoRequestAction() => $_ensure(55);

  @$pb.TagNumber(58)
  TakeDrivenoteAction get takeDrivenoteAction => $_getN(56);
  @$pb.TagNumber(58)
  set takeDrivenoteAction(TakeDrivenoteAction value) => $_setField(58, value);
  @$pb.TagNumber(58)
  $core.bool hasTakeDrivenoteAction() => $_has(56);
  @$pb.TagNumber(58)
  void clearTakeDrivenoteAction() => $_clearField(58);
  @$pb.TagNumber(58)
  TakeDrivenoteAction ensureTakeDrivenoteAction() => $_ensure(56);

  @$pb.TagNumber(61)
  ChargePortDoorClose get chargePortDoorClose => $_getN(57);
  @$pb.TagNumber(61)
  set chargePortDoorClose(ChargePortDoorClose value) => $_setField(61, value);
  @$pb.TagNumber(61)
  $core.bool hasChargePortDoorClose() => $_has(57);
  @$pb.TagNumber(61)
  void clearChargePortDoorClose() => $_clearField(61);
  @$pb.TagNumber(61)
  ChargePortDoorClose ensureChargePortDoorClose() => $_ensure(57);

  @$pb.TagNumber(62)
  ChargePortDoorOpen get chargePortDoorOpen => $_getN(58);
  @$pb.TagNumber(62)
  set chargePortDoorOpen(ChargePortDoorOpen value) => $_setField(62, value);
  @$pb.TagNumber(62)
  $core.bool hasChargePortDoorOpen() => $_has(58);
  @$pb.TagNumber(62)
  void clearChargePortDoorOpen() => $_clearField(62);
  @$pb.TagNumber(62)
  ChargePortDoorOpen ensureChargePortDoorOpen() => $_ensure(58);

  @$pb.TagNumber(63)
  BluetoothClassicPairingRequest get bluetoothClassicPairingRequest =>
      $_getN(59);
  @$pb.TagNumber(63)
  set bluetoothClassicPairingRequest(BluetoothClassicPairingRequest value) =>
      $_setField(63, value);
  @$pb.TagNumber(63)
  $core.bool hasBluetoothClassicPairingRequest() => $_has(59);
  @$pb.TagNumber(63)
  void clearBluetoothClassicPairingRequest() => $_clearField(63);
  @$pb.TagNumber(63)
  BluetoothClassicPairingRequest ensureBluetoothClassicPairingRequest() =>
      $_ensure(59);

  @$pb.TagNumber(64)
  BoomboxAction get boomboxAction => $_getN(60);
  @$pb.TagNumber(64)
  set boomboxAction(BoomboxAction value) => $_setField(64, value);
  @$pb.TagNumber(64)
  $core.bool hasBoomboxAction() => $_has(60);
  @$pb.TagNumber(64)
  void clearBoomboxAction() => $_clearField(64);
  @$pb.TagNumber(64)
  BoomboxAction ensureBoomboxAction() => $_ensure(60);

  @$pb.TagNumber(65)
  $0.VehicleState_GuestMode get guestModeAction => $_getN(61);
  @$pb.TagNumber(65)
  set guestModeAction($0.VehicleState_GuestMode value) => $_setField(65, value);
  @$pb.TagNumber(65)
  $core.bool hasGuestModeAction() => $_has(61);
  @$pb.TagNumber(65)
  void clearGuestModeAction() => $_clearField(65);
  @$pb.TagNumber(65)
  $0.VehicleState_GuestMode ensureGuestModeAction() => $_ensure(61);

  @$pb.TagNumber(66)
  SetCopTempAction get setCopTempAction => $_getN(62);
  @$pb.TagNumber(66)
  set setCopTempAction(SetCopTempAction value) => $_setField(66, value);
  @$pb.TagNumber(66)
  $core.bool hasSetCopTempAction() => $_has(62);
  @$pb.TagNumber(66)
  void clearSetCopTempAction() => $_clearField(66);
  @$pb.TagNumber(66)
  SetCopTempAction ensureSetCopTempAction() => $_ensure(62);

  @$pb.TagNumber(67)
  AddManagedChargingSiteRequest get addManagedChargingSiteRequest => $_getN(63);
  @$pb.TagNumber(67)
  set addManagedChargingSiteRequest(AddManagedChargingSiteRequest value) =>
      $_setField(67, value);
  @$pb.TagNumber(67)
  $core.bool hasAddManagedChargingSiteRequest() => $_has(63);
  @$pb.TagNumber(67)
  void clearAddManagedChargingSiteRequest() => $_clearField(67);
  @$pb.TagNumber(67)
  AddManagedChargingSiteRequest ensureAddManagedChargingSiteRequest() =>
      $_ensure(63);

  @$pb.TagNumber(68)
  RemoveManagedChargingSiteRequest get removeManagedChargingSiteRequest =>
      $_getN(64);
  @$pb.TagNumber(68)
  set removeManagedChargingSiteRequest(
          RemoveManagedChargingSiteRequest value) =>
      $_setField(68, value);
  @$pb.TagNumber(68)
  $core.bool hasRemoveManagedChargingSiteRequest() => $_has(64);
  @$pb.TagNumber(68)
  void clearRemoveManagedChargingSiteRequest() => $_clearField(68);
  @$pb.TagNumber(68)
  RemoveManagedChargingSiteRequest ensureRemoveManagedChargingSiteRequest() =>
      $_ensure(64);

  @$pb.TagNumber(69)
  NavigationRouteAction get navigationRouteAction => $_getN(65);
  @$pb.TagNumber(69)
  set navigationRouteAction(NavigationRouteAction value) =>
      $_setField(69, value);
  @$pb.TagNumber(69)
  $core.bool hasNavigationRouteAction() => $_has(65);
  @$pb.TagNumber(69)
  void clearNavigationRouteAction() => $_clearField(69);
  @$pb.TagNumber(69)
  NavigationRouteAction ensureNavigationRouteAction() => $_ensure(65);

  @$pb.TagNumber(70)
  AutoStwHeatAction get autoStwHeatAction => $_getN(66);
  @$pb.TagNumber(70)
  set autoStwHeatAction(AutoStwHeatAction value) => $_setField(70, value);
  @$pb.TagNumber(70)
  $core.bool hasAutoStwHeatAction() => $_has(66);
  @$pb.TagNumber(70)
  void clearAutoStwHeatAction() => $_clearField(70);
  @$pb.TagNumber(70)
  AutoStwHeatAction ensureAutoStwHeatAction() => $_ensure(66);

  @$pb.TagNumber(71)
  StwHeatLevelAction get stwHeatLevelAction => $_getN(67);
  @$pb.TagNumber(71)
  set stwHeatLevelAction(StwHeatLevelAction value) => $_setField(71, value);
  @$pb.TagNumber(71)
  $core.bool hasStwHeatLevelAction() => $_has(67);
  @$pb.TagNumber(71)
  void clearStwHeatLevelAction() => $_clearField(71);
  @$pb.TagNumber(71)
  StwHeatLevelAction ensureStwHeatLevelAction() => $_ensure(67);

  @$pb.TagNumber(72)
  EraseUserDataAction get eraseUserDataAction => $_getN(68);
  @$pb.TagNumber(72)
  set eraseUserDataAction(EraseUserDataAction value) => $_setField(72, value);
  @$pb.TagNumber(72)
  $core.bool hasEraseUserDataAction() => $_has(68);
  @$pb.TagNumber(72)
  void clearEraseUserDataAction() => $_clearField(72);
  @$pb.TagNumber(72)
  EraseUserDataAction ensureEraseUserDataAction() => $_ensure(68);

  @$pb.TagNumber(73)
  GetManagedChargingSitesRequest get getManagedChargingSitesRequest =>
      $_getN(69);
  @$pb.TagNumber(73)
  set getManagedChargingSitesRequest(GetManagedChargingSitesRequest value) =>
      $_setField(73, value);
  @$pb.TagNumber(73)
  $core.bool hasGetManagedChargingSitesRequest() => $_has(69);
  @$pb.TagNumber(73)
  void clearGetManagedChargingSitesRequest() => $_clearField(73);
  @$pb.TagNumber(73)
  GetManagedChargingSitesRequest ensureGetManagedChargingSitesRequest() =>
      $_ensure(69);

  @$pb.TagNumber(74)
  UpdateChargeOnSolarFeatureRequest get updateChargeOnSolarFeatureRequest =>
      $_getN(70);
  @$pb.TagNumber(74)
  set updateChargeOnSolarFeatureRequest(
          UpdateChargeOnSolarFeatureRequest value) =>
      $_setField(74, value);
  @$pb.TagNumber(74)
  $core.bool hasUpdateChargeOnSolarFeatureRequest() => $_has(70);
  @$pb.TagNumber(74)
  void clearUpdateChargeOnSolarFeatureRequest() => $_clearField(74);
  @$pb.TagNumber(74)
  UpdateChargeOnSolarFeatureRequest ensureUpdateChargeOnSolarFeatureRequest() =>
      $_ensure(70);

  @$pb.TagNumber(75)
  GetChargeOnSolarFeatureRequest get getChargeOnSolarFeatureRequest =>
      $_getN(71);
  @$pb.TagNumber(75)
  set getChargeOnSolarFeatureRequest(GetChargeOnSolarFeatureRequest value) =>
      $_setField(75, value);
  @$pb.TagNumber(75)
  $core.bool hasGetChargeOnSolarFeatureRequest() => $_has(71);
  @$pb.TagNumber(75)
  void clearGetChargeOnSolarFeatureRequest() => $_clearField(75);
  @$pb.TagNumber(75)
  GetChargeOnSolarFeatureRequest ensureGetChargeOnSolarFeatureRequest() =>
      $_ensure(71);

  @$pb.TagNumber(77)
  VehicleControlSetPinToDriveAction get vehicleControlSetPinToDriveAction =>
      $_getN(72);
  @$pb.TagNumber(77)
  set vehicleControlSetPinToDriveAction(
          VehicleControlSetPinToDriveAction value) =>
      $_setField(77, value);
  @$pb.TagNumber(77)
  $core.bool hasVehicleControlSetPinToDriveAction() => $_has(72);
  @$pb.TagNumber(77)
  void clearVehicleControlSetPinToDriveAction() => $_clearField(77);
  @$pb.TagNumber(77)
  VehicleControlSetPinToDriveAction ensureVehicleControlSetPinToDriveAction() =>
      $_ensure(72);

  @$pb.TagNumber(78)
  VehicleControlResetPinToDriveAction get vehicleControlResetPinToDriveAction =>
      $_getN(73);
  @$pb.TagNumber(78)
  set vehicleControlResetPinToDriveAction(
          VehicleControlResetPinToDriveAction value) =>
      $_setField(78, value);
  @$pb.TagNumber(78)
  $core.bool hasVehicleControlResetPinToDriveAction() => $_has(73);
  @$pb.TagNumber(78)
  void clearVehicleControlResetPinToDriveAction() => $_clearField(78);
  @$pb.TagNumber(78)
  VehicleControlResetPinToDriveAction
      ensureVehicleControlResetPinToDriveAction() => $_ensure(73);

  @$pb.TagNumber(79)
  DrivingClearSpeedLimitPinAdminAction
      get drivingClearSpeedLimitPinAdminAction => $_getN(74);
  @$pb.TagNumber(79)
  set drivingClearSpeedLimitPinAdminAction(
          DrivingClearSpeedLimitPinAdminAction value) =>
      $_setField(79, value);
  @$pb.TagNumber(79)
  $core.bool hasDrivingClearSpeedLimitPinAdminAction() => $_has(74);
  @$pb.TagNumber(79)
  void clearDrivingClearSpeedLimitPinAdminAction() => $_clearField(79);
  @$pb.TagNumber(79)
  DrivingClearSpeedLimitPinAdminAction
      ensureDrivingClearSpeedLimitPinAdminAction() => $_ensure(74);

  @$pb.TagNumber(80)
  SetOutletsOnOffAction get setOutletsOnOffAction => $_getN(75);
  @$pb.TagNumber(80)
  set setOutletsOnOffAction(SetOutletsOnOffAction value) =>
      $_setField(80, value);
  @$pb.TagNumber(80)
  $core.bool hasSetOutletsOnOffAction() => $_has(75);
  @$pb.TagNumber(80)
  void clearSetOutletsOnOffAction() => $_clearField(80);
  @$pb.TagNumber(80)
  SetOutletsOnOffAction ensureSetOutletsOnOffAction() => $_ensure(75);

  @$pb.TagNumber(81)
  SetOutletTimerAction get setOutletTimerAction => $_getN(76);
  @$pb.TagNumber(81)
  set setOutletTimerAction(SetOutletTimerAction value) => $_setField(81, value);
  @$pb.TagNumber(81)
  $core.bool hasSetOutletTimerAction() => $_has(76);
  @$pb.TagNumber(81)
  void clearSetOutletTimerAction() => $_clearField(81);
  @$pb.TagNumber(81)
  SetOutletTimerAction ensureSetOutletTimerAction() => $_ensure(76);

  @$pb.TagNumber(82)
  SetOutletSocLimitAction get setOutletSocLimitAction => $_getN(77);
  @$pb.TagNumber(82)
  set setOutletSocLimitAction(SetOutletSocLimitAction value) =>
      $_setField(82, value);
  @$pb.TagNumber(82)
  $core.bool hasSetOutletSocLimitAction() => $_has(77);
  @$pb.TagNumber(82)
  void clearSetOutletSocLimitAction() => $_clearField(82);
  @$pb.TagNumber(82)
  SetOutletSocLimitAction ensureSetOutletSocLimitAction() => $_ensure(77);

  @$pb.TagNumber(83)
  SetPowerFeedOnOffAction get setPowerFeedOnOffAction => $_getN(78);
  @$pb.TagNumber(83)
  set setPowerFeedOnOffAction(SetPowerFeedOnOffAction value) =>
      $_setField(83, value);
  @$pb.TagNumber(83)
  $core.bool hasSetPowerFeedOnOffAction() => $_has(78);
  @$pb.TagNumber(83)
  void clearSetPowerFeedOnOffAction() => $_clearField(83);
  @$pb.TagNumber(83)
  SetPowerFeedOnOffAction ensureSetPowerFeedOnOffAction() => $_ensure(78);

  @$pb.TagNumber(84)
  SetPowerFeedTimerAction get setPowerFeedTimerAction => $_getN(79);
  @$pb.TagNumber(84)
  set setPowerFeedTimerAction(SetPowerFeedTimerAction value) =>
      $_setField(84, value);
  @$pb.TagNumber(84)
  $core.bool hasSetPowerFeedTimerAction() => $_has(79);
  @$pb.TagNumber(84)
  void clearSetPowerFeedTimerAction() => $_clearField(84);
  @$pb.TagNumber(84)
  SetPowerFeedTimerAction ensureSetPowerFeedTimerAction() => $_ensure(79);

  @$pb.TagNumber(85)
  SetPowerFeedSocLimitAction get setPowerFeedSocLimitAction => $_getN(80);
  @$pb.TagNumber(85)
  set setPowerFeedSocLimitAction(SetPowerFeedSocLimitAction value) =>
      $_setField(85, value);
  @$pb.TagNumber(85)
  $core.bool hasSetPowerFeedSocLimitAction() => $_has(80);
  @$pb.TagNumber(85)
  void clearSetPowerFeedSocLimitAction() => $_clearField(85);
  @$pb.TagNumber(85)
  SetPowerFeedSocLimitAction ensureSetPowerFeedSocLimitAction() => $_ensure(80);

  @$pb.TagNumber(86)
  SetTrailerLightTestStartStopAction get setTrailerLightTestStartStopAction =>
      $_getN(81);
  @$pb.TagNumber(86)
  set setTrailerLightTestStartStopAction(
          SetTrailerLightTestStartStopAction value) =>
      $_setField(86, value);
  @$pb.TagNumber(86)
  $core.bool hasSetTrailerLightTestStartStopAction() => $_has(81);
  @$pb.TagNumber(86)
  void clearSetTrailerLightTestStartStopAction() => $_clearField(86);
  @$pb.TagNumber(86)
  SetTrailerLightTestStartStopAction
      ensureSetTrailerLightTestStartStopAction() => $_ensure(81);

  @$pb.TagNumber(87)
  SetTruckBedLightAutoStateAction get setTruckBedLightAutoStateAction =>
      $_getN(82);
  @$pb.TagNumber(87)
  set setTruckBedLightAutoStateAction(SetTruckBedLightAutoStateAction value) =>
      $_setField(87, value);
  @$pb.TagNumber(87)
  $core.bool hasSetTruckBedLightAutoStateAction() => $_has(82);
  @$pb.TagNumber(87)
  void clearSetTruckBedLightAutoStateAction() => $_clearField(87);
  @$pb.TagNumber(87)
  SetTruckBedLightAutoStateAction ensureSetTruckBedLightAutoStateAction() =>
      $_ensure(82);

  @$pb.TagNumber(88)
  SetTruckBedLightBrightnessAction get setTruckBedLightBrightnessAction =>
      $_getN(83);
  @$pb.TagNumber(88)
  set setTruckBedLightBrightnessAction(
          SetTruckBedLightBrightnessAction value) =>
      $_setField(88, value);
  @$pb.TagNumber(88)
  $core.bool hasSetTruckBedLightBrightnessAction() => $_has(83);
  @$pb.TagNumber(88)
  void clearSetTruckBedLightBrightnessAction() => $_clearField(88);
  @$pb.TagNumber(88)
  SetTruckBedLightBrightnessAction ensureSetTruckBedLightBrightnessAction() =>
      $_ensure(83);

  @$pb.TagNumber(89)
  VehicleControlResetPinToDriveAdminAction
      get vehicleControlResetPinToDriveAdminAction => $_getN(84);
  @$pb.TagNumber(89)
  set vehicleControlResetPinToDriveAdminAction(
          VehicleControlResetPinToDriveAdminAction value) =>
      $_setField(89, value);
  @$pb.TagNumber(89)
  $core.bool hasVehicleControlResetPinToDriveAdminAction() => $_has(84);
  @$pb.TagNumber(89)
  void clearVehicleControlResetPinToDriveAdminAction() => $_clearField(89);
  @$pb.TagNumber(89)
  VehicleControlResetPinToDriveAdminAction
      ensureVehicleControlResetPinToDriveAdminAction() => $_ensure(84);

  @$pb.TagNumber(90)
  NavigationWaypointsRequest get navigationWaypointsRequest => $_getN(85);
  @$pb.TagNumber(90)
  set navigationWaypointsRequest(NavigationWaypointsRequest value) =>
      $_setField(90, value);
  @$pb.TagNumber(90)
  $core.bool hasNavigationWaypointsRequest() => $_has(85);
  @$pb.TagNumber(90)
  void clearNavigationWaypointsRequest() => $_clearField(90);
  @$pb.TagNumber(90)
  NavigationWaypointsRequest ensureNavigationWaypointsRequest() => $_ensure(85);

  @$pb.TagNumber(91)
  SetPowershareFeatureAction get setPowershareFeatureAction => $_getN(86);
  @$pb.TagNumber(91)
  set setPowershareFeatureAction(SetPowershareFeatureAction value) =>
      $_setField(91, value);
  @$pb.TagNumber(91)
  $core.bool hasSetPowershareFeatureAction() => $_has(86);
  @$pb.TagNumber(91)
  void clearSetPowershareFeatureAction() => $_clearField(91);
  @$pb.TagNumber(91)
  SetPowershareFeatureAction ensureSetPowershareFeatureAction() => $_ensure(86);

  @$pb.TagNumber(92)
  SetPowershareDischargeLimitAction get setPowershareDischargeLimitAction =>
      $_getN(87);
  @$pb.TagNumber(92)
  set setPowershareDischargeLimitAction(
          SetPowershareDischargeLimitAction value) =>
      $_setField(92, value);
  @$pb.TagNumber(92)
  $core.bool hasSetPowershareDischargeLimitAction() => $_has(87);
  @$pb.TagNumber(92)
  void clearSetPowershareDischargeLimitAction() => $_clearField(92);
  @$pb.TagNumber(92)
  SetPowershareDischargeLimitAction ensureSetPowershareDischargeLimitAction() =>
      $_ensure(87);

  @$pb.TagNumber(93)
  SetPowershareRequestAction get setPowershareRequestAction => $_getN(88);
  @$pb.TagNumber(93)
  set setPowershareRequestAction(SetPowershareRequestAction value) =>
      $_setField(93, value);
  @$pb.TagNumber(93)
  $core.bool hasSetPowershareRequestAction() => $_has(88);
  @$pb.TagNumber(93)
  void clearSetPowershareRequestAction() => $_clearField(93);
  @$pb.TagNumber(93)
  SetPowershareRequestAction ensureSetPowershareRequestAction() => $_ensure(88);

  @$pb.TagNumber(94)
  SetTentModeRequestAction get setTentModeRequestAction => $_getN(89);
  @$pb.TagNumber(94)
  set setTentModeRequestAction(SetTentModeRequestAction value) =>
      $_setField(94, value);
  @$pb.TagNumber(94)
  $core.bool hasSetTentModeRequestAction() => $_has(89);
  @$pb.TagNumber(94)
  void clearSetTentModeRequestAction() => $_clearField(94);
  @$pb.TagNumber(94)
  SetTentModeRequestAction ensureSetTentModeRequestAction() => $_ensure(89);

  @$pb.TagNumber(95)
  SetZoneLightRequestAction get setFrontZoneLightRequestAction => $_getN(90);
  @$pb.TagNumber(95)
  set setFrontZoneLightRequestAction(SetZoneLightRequestAction value) =>
      $_setField(95, value);
  @$pb.TagNumber(95)
  $core.bool hasSetFrontZoneLightRequestAction() => $_has(90);
  @$pb.TagNumber(95)
  void clearSetFrontZoneLightRequestAction() => $_clearField(95);
  @$pb.TagNumber(95)
  SetZoneLightRequestAction ensureSetFrontZoneLightRequestAction() =>
      $_ensure(90);

  @$pb.TagNumber(96)
  SetZoneLightRequestAction get setRearZoneLightRequestAction => $_getN(91);
  @$pb.TagNumber(96)
  set setRearZoneLightRequestAction(SetZoneLightRequestAction value) =>
      $_setField(96, value);
  @$pb.TagNumber(96)
  $core.bool hasSetRearZoneLightRequestAction() => $_has(91);
  @$pb.TagNumber(96)
  void clearSetRearZoneLightRequestAction() => $_clearField(96);
  @$pb.TagNumber(96)
  SetZoneLightRequestAction ensureSetRearZoneLightRequestAction() =>
      $_ensure(91);

  @$pb.TagNumber(97)
  $1.ChargeSchedule get addChargeScheduleAction => $_getN(92);
  @$pb.TagNumber(97)
  set addChargeScheduleAction($1.ChargeSchedule value) => $_setField(97, value);
  @$pb.TagNumber(97)
  $core.bool hasAddChargeScheduleAction() => $_has(92);
  @$pb.TagNumber(97)
  void clearAddChargeScheduleAction() => $_clearField(97);
  @$pb.TagNumber(97)
  $1.ChargeSchedule ensureAddChargeScheduleAction() => $_ensure(92);

  @$pb.TagNumber(98)
  RemoveChargeScheduleAction get removeChargeScheduleAction => $_getN(93);
  @$pb.TagNumber(98)
  set removeChargeScheduleAction(RemoveChargeScheduleAction value) =>
      $_setField(98, value);
  @$pb.TagNumber(98)
  $core.bool hasRemoveChargeScheduleAction() => $_has(93);
  @$pb.TagNumber(98)
  void clearRemoveChargeScheduleAction() => $_clearField(98);
  @$pb.TagNumber(98)
  RemoveChargeScheduleAction ensureRemoveChargeScheduleAction() => $_ensure(93);

  @$pb.TagNumber(99)
  $1.PreconditionSchedule get addPreconditionScheduleAction => $_getN(94);
  @$pb.TagNumber(99)
  set addPreconditionScheduleAction($1.PreconditionSchedule value) =>
      $_setField(99, value);
  @$pb.TagNumber(99)
  $core.bool hasAddPreconditionScheduleAction() => $_has(94);
  @$pb.TagNumber(99)
  void clearAddPreconditionScheduleAction() => $_clearField(99);
  @$pb.TagNumber(99)
  $1.PreconditionSchedule ensureAddPreconditionScheduleAction() => $_ensure(94);

  @$pb.TagNumber(100)
  RemovePreconditionScheduleAction get removePreconditionScheduleAction =>
      $_getN(95);
  @$pb.TagNumber(100)
  set removePreconditionScheduleAction(
          RemovePreconditionScheduleAction value) =>
      $_setField(100, value);
  @$pb.TagNumber(100)
  $core.bool hasRemovePreconditionScheduleAction() => $_has(95);
  @$pb.TagNumber(100)
  void clearRemovePreconditionScheduleAction() => $_clearField(100);
  @$pb.TagNumber(100)
  RemovePreconditionScheduleAction ensureRemovePreconditionScheduleAction() =>
      $_ensure(95);

  @$pb.TagNumber(101)
  SetLightbarBrightnessAction get setLightbarBrightnessAction => $_getN(96);
  @$pb.TagNumber(101)
  set setLightbarBrightnessAction(SetLightbarBrightnessAction value) =>
      $_setField(101, value);
  @$pb.TagNumber(101)
  $core.bool hasSetLightbarBrightnessAction() => $_has(96);
  @$pb.TagNumber(101)
  void clearSetLightbarBrightnessAction() => $_clearField(101);
  @$pb.TagNumber(101)
  SetLightbarBrightnessAction ensureSetLightbarBrightnessAction() =>
      $_ensure(96);

  @$pb.TagNumber(102)
  SetLightbarMiddleAction get setLightbarMiddleAction => $_getN(97);
  @$pb.TagNumber(102)
  set setLightbarMiddleAction(SetLightbarMiddleAction value) =>
      $_setField(102, value);
  @$pb.TagNumber(102)
  $core.bool hasSetLightbarMiddleAction() => $_has(97);
  @$pb.TagNumber(102)
  void clearSetLightbarMiddleAction() => $_clearField(102);
  @$pb.TagNumber(102)
  SetLightbarMiddleAction ensureSetLightbarMiddleAction() => $_ensure(97);

  @$pb.TagNumber(103)
  SetLightbarDitchAction get setLightbarDitchAction => $_getN(98);
  @$pb.TagNumber(103)
  set setLightbarDitchAction(SetLightbarDitchAction value) =>
      $_setField(103, value);
  @$pb.TagNumber(103)
  $core.bool hasSetLightbarDitchAction() => $_has(98);
  @$pb.TagNumber(103)
  void clearSetLightbarDitchAction() => $_clearField(103);
  @$pb.TagNumber(103)
  SetLightbarDitchAction ensureSetLightbarDitchAction() => $_ensure(98);

  @$pb.TagNumber(104)
  GetMessagesAction get getMessagesAction => $_getN(99);
  @$pb.TagNumber(104)
  set getMessagesAction(GetMessagesAction value) => $_setField(104, value);
  @$pb.TagNumber(104)
  $core.bool hasGetMessagesAction() => $_has(99);
  @$pb.TagNumber(104)
  void clearGetMessagesAction() => $_clearField(104);
  @$pb.TagNumber(104)
  GetMessagesAction ensureGetMessagesAction() => $_ensure(99);

  @$pb.TagNumber(105)
  TeslaAuthResponseAction get teslaAuthResponseAction => $_getN(100);
  @$pb.TagNumber(105)
  set teslaAuthResponseAction(TeslaAuthResponseAction value) =>
      $_setField(105, value);
  @$pb.TagNumber(105)
  $core.bool hasTeslaAuthResponseAction() => $_has(100);
  @$pb.TagNumber(105)
  void clearTeslaAuthResponseAction() => $_clearField(105);
  @$pb.TagNumber(105)
  TeslaAuthResponseAction ensureTeslaAuthResponseAction() => $_ensure(100);

  @$pb.TagNumber(106)
  NavigationGpsDestinationRequest get navigationGpsDestinationRequest =>
      $_getN(101);
  @$pb.TagNumber(106)
  set navigationGpsDestinationRequest(NavigationGpsDestinationRequest value) =>
      $_setField(106, value);
  @$pb.TagNumber(106)
  $core.bool hasNavigationGpsDestinationRequest() => $_has(101);
  @$pb.TagNumber(106)
  void clearNavigationGpsDestinationRequest() => $_clearField(106);
  @$pb.TagNumber(106)
  NavigationGpsDestinationRequest ensureNavigationGpsDestinationRequest() =>
      $_ensure(101);

  @$pb.TagNumber(107)
  BatchRemovePreconditionSchedulesAction
      get batchRemovePreconditionSchedulesAction => $_getN(102);
  @$pb.TagNumber(107)
  set batchRemovePreconditionSchedulesAction(
          BatchRemovePreconditionSchedulesAction value) =>
      $_setField(107, value);
  @$pb.TagNumber(107)
  $core.bool hasBatchRemovePreconditionSchedulesAction() => $_has(102);
  @$pb.TagNumber(107)
  void clearBatchRemovePreconditionSchedulesAction() => $_clearField(107);
  @$pb.TagNumber(107)
  BatchRemovePreconditionSchedulesAction
      ensureBatchRemovePreconditionSchedulesAction() => $_ensure(102);

  @$pb.TagNumber(108)
  BatchRemoveChargeSchedulesAction get batchRemoveChargeSchedulesAction =>
      $_getN(103);
  @$pb.TagNumber(108)
  set batchRemoveChargeSchedulesAction(
          BatchRemoveChargeSchedulesAction value) =>
      $_setField(108, value);
  @$pb.TagNumber(108)
  $core.bool hasBatchRemoveChargeSchedulesAction() => $_has(103);
  @$pb.TagNumber(108)
  void clearBatchRemoveChargeSchedulesAction() => $_clearField(108);
  @$pb.TagNumber(108)
  BatchRemoveChargeSchedulesAction ensureBatchRemoveChargeSchedulesAction() =>
      $_ensure(103);

  @$pb.TagNumber(109)
  ParentalControlsClearPinAction get parentalControlsClearPinAction =>
      $_getN(104);
  @$pb.TagNumber(109)
  set parentalControlsClearPinAction(ParentalControlsClearPinAction value) =>
      $_setField(109, value);
  @$pb.TagNumber(109)
  $core.bool hasParentalControlsClearPinAction() => $_has(104);
  @$pb.TagNumber(109)
  void clearParentalControlsClearPinAction() => $_clearField(109);
  @$pb.TagNumber(109)
  ParentalControlsClearPinAction ensureParentalControlsClearPinAction() =>
      $_ensure(104);

  @$pb.TagNumber(110)
  ParentalControlsClearPinAdminAction get parentalControlsClearPinAdminAction =>
      $_getN(105);
  @$pb.TagNumber(110)
  set parentalControlsClearPinAdminAction(
          ParentalControlsClearPinAdminAction value) =>
      $_setField(110, value);
  @$pb.TagNumber(110)
  $core.bool hasParentalControlsClearPinAdminAction() => $_has(105);
  @$pb.TagNumber(110)
  void clearParentalControlsClearPinAdminAction() => $_clearField(110);
  @$pb.TagNumber(110)
  ParentalControlsClearPinAdminAction
      ensureParentalControlsClearPinAdminAction() => $_ensure(105);

  @$pb.TagNumber(111)
  ParentalControlsAction get parentalControlsAction => $_getN(106);
  @$pb.TagNumber(111)
  set parentalControlsAction(ParentalControlsAction value) =>
      $_setField(111, value);
  @$pb.TagNumber(111)
  $core.bool hasParentalControlsAction() => $_has(106);
  @$pb.TagNumber(111)
  void clearParentalControlsAction() => $_clearField(111);
  @$pb.TagNumber(111)
  ParentalControlsAction ensureParentalControlsAction() => $_ensure(106);

  @$pb.TagNumber(112)
  ParentalControlsEnableSettingsAction
      get parentalControlsEnableSettingsAction => $_getN(107);
  @$pb.TagNumber(112)
  set parentalControlsEnableSettingsAction(
          ParentalControlsEnableSettingsAction value) =>
      $_setField(112, value);
  @$pb.TagNumber(112)
  $core.bool hasParentalControlsEnableSettingsAction() => $_has(107);
  @$pb.TagNumber(112)
  void clearParentalControlsEnableSettingsAction() => $_clearField(112);
  @$pb.TagNumber(112)
  ParentalControlsEnableSettingsAction
      ensureParentalControlsEnableSettingsAction() => $_ensure(107);

  @$pb.TagNumber(113)
  ParentalControlsSetSpeedLimitAction get parentalControlsSetSpeedLimitAction =>
      $_getN(108);
  @$pb.TagNumber(113)
  set parentalControlsSetSpeedLimitAction(
          ParentalControlsSetSpeedLimitAction value) =>
      $_setField(113, value);
  @$pb.TagNumber(113)
  $core.bool hasParentalControlsSetSpeedLimitAction() => $_has(108);
  @$pb.TagNumber(113)
  void clearParentalControlsSetSpeedLimitAction() => $_clearField(113);
  @$pb.TagNumber(113)
  ParentalControlsSetSpeedLimitAction
      ensureParentalControlsSetSpeedLimitAction() => $_ensure(108);

  @$pb.TagNumber(114)
  CancelSohTestAction get cancelSohTestAction => $_getN(109);
  @$pb.TagNumber(114)
  set cancelSohTestAction(CancelSohTestAction value) => $_setField(114, value);
  @$pb.TagNumber(114)
  $core.bool hasCancelSohTestAction() => $_has(109);
  @$pb.TagNumber(114)
  void clearCancelSohTestAction() => $_clearField(114);
  @$pb.TagNumber(114)
  CancelSohTestAction ensureCancelSohTestAction() => $_ensure(109);

  /// Missing = 115;
  @$pb.TagNumber(116)
  StopLightShowAction get stopLightShowAction => $_getN(110);
  @$pb.TagNumber(116)
  set stopLightShowAction(StopLightShowAction value) => $_setField(116, value);
  @$pb.TagNumber(116)
  $core.bool hasStopLightShowAction() => $_has(110);
  @$pb.TagNumber(116)
  void clearStopLightShowAction() => $_clearField(116);
  @$pb.TagNumber(116)
  StopLightShowAction ensureStopLightShowAction() => $_ensure(110);

  @$pb.TagNumber(117)
  StartLightShowAction get startLightShowAction => $_getN(111);
  @$pb.TagNumber(117)
  set startLightShowAction(StartLightShowAction value) =>
      $_setField(117, value);
  @$pb.TagNumber(117)
  $core.bool hasStartLightShowAction() => $_has(111);
  @$pb.TagNumber(117)
  void clearStartLightShowAction() => $_clearField(117);
  @$pb.TagNumber(117)
  StartLightShowAction ensureStartLightShowAction() => $_ensure(111);

  @$pb.TagNumber(118)
  SetSuspensionLevelAction get setSuspensionLevelAction => $_getN(112);
  @$pb.TagNumber(118)
  set setSuspensionLevelAction(SetSuspensionLevelAction value) =>
      $_setField(118, value);
  @$pb.TagNumber(118)
  $core.bool hasSetSuspensionLevelAction() => $_has(112);
  @$pb.TagNumber(118)
  void clearSetSuspensionLevelAction() => $_clearField(118);
  @$pb.TagNumber(118)
  SetSuspensionLevelAction ensureSetSuspensionLevelAction() => $_ensure(112);
}

class GetVehicleData extends $pb.GeneratedMessage {
  factory GetVehicleData({
    GetChargeState? getChargeState,
    GetClimateState? getClimateState,
    GetDriveState? getDriveState,
    GetLocationState? getLocationState,
    GetClosuresState? getClosuresState,
    GetChargeScheduleState? getChargeScheduleState,
    GetPreconditioningScheduleState? getPreconditioningScheduleState,
    GetTirePressureState? getTirePressureState,
    GetMediaState? getMediaState,
    GetMediaDetailState? getMediaDetailState,
    GetSoftwareUpdateState? getSoftwareUpdateState,
    GetParentalControlsState? getParentalControlsState,
  }) {
    final result = create();
    if (getChargeState != null) result.getChargeState = getChargeState;
    if (getClimateState != null) result.getClimateState = getClimateState;
    if (getDriveState != null) result.getDriveState = getDriveState;
    if (getLocationState != null) result.getLocationState = getLocationState;
    if (getClosuresState != null) result.getClosuresState = getClosuresState;
    if (getChargeScheduleState != null)
      result.getChargeScheduleState = getChargeScheduleState;
    if (getPreconditioningScheduleState != null)
      result.getPreconditioningScheduleState = getPreconditioningScheduleState;
    if (getTirePressureState != null)
      result.getTirePressureState = getTirePressureState;
    if (getMediaState != null) result.getMediaState = getMediaState;
    if (getMediaDetailState != null)
      result.getMediaDetailState = getMediaDetailState;
    if (getSoftwareUpdateState != null)
      result.getSoftwareUpdateState = getSoftwareUpdateState;
    if (getParentalControlsState != null)
      result.getParentalControlsState = getParentalControlsState;
    return result;
  }

  GetVehicleData._();

  factory GetVehicleData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetVehicleData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetVehicleData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOM<GetChargeState>(2, _omitFieldNames ? '' : 'getChargeState',
        protoName: 'getChargeState', subBuilder: GetChargeState.create)
    ..aOM<GetClimateState>(3, _omitFieldNames ? '' : 'getClimateState',
        protoName: 'getClimateState', subBuilder: GetClimateState.create)
    ..aOM<GetDriveState>(4, _omitFieldNames ? '' : 'getDriveState',
        protoName: 'getDriveState', subBuilder: GetDriveState.create)
    ..aOM<GetLocationState>(7, _omitFieldNames ? '' : 'getLocationState',
        protoName: 'getLocationState', subBuilder: GetLocationState.create)
    ..aOM<GetClosuresState>(8, _omitFieldNames ? '' : 'getClosuresState',
        protoName: 'getClosuresState', subBuilder: GetClosuresState.create)
    ..aOM<GetChargeScheduleState>(
        10, _omitFieldNames ? '' : 'getChargeScheduleState',
        protoName: 'getChargeScheduleState',
        subBuilder: GetChargeScheduleState.create)
    ..aOM<GetPreconditioningScheduleState>(
        11, _omitFieldNames ? '' : 'getPreconditioningScheduleState',
        protoName: 'getPreconditioningScheduleState',
        subBuilder: GetPreconditioningScheduleState.create)
    ..aOM<GetTirePressureState>(
        14, _omitFieldNames ? '' : 'getTirePressureState',
        protoName: 'getTirePressureState',
        subBuilder: GetTirePressureState.create)
    ..aOM<GetMediaState>(15, _omitFieldNames ? '' : 'getMediaState',
        protoName: 'getMediaState', subBuilder: GetMediaState.create)
    ..aOM<GetMediaDetailState>(16, _omitFieldNames ? '' : 'getMediaDetailState',
        protoName: 'getMediaDetailState',
        subBuilder: GetMediaDetailState.create)
    ..aOM<GetSoftwareUpdateState>(
        17, _omitFieldNames ? '' : 'getSoftwareUpdateState',
        protoName: 'getSoftwareUpdateState',
        subBuilder: GetSoftwareUpdateState.create)
    ..aOM<GetParentalControlsState>(
        19, _omitFieldNames ? '' : 'getParentalControlsState',
        protoName: 'getParentalControlsState',
        subBuilder: GetParentalControlsState.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetVehicleData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetVehicleData copyWith(void Function(GetVehicleData) updates) =>
      super.copyWith((message) => updates(message as GetVehicleData))
          as GetVehicleData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetVehicleData create() => GetVehicleData._();
  @$core.override
  GetVehicleData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetVehicleData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetVehicleData>(create);
  static GetVehicleData? _defaultInstance;

  @$pb.TagNumber(2)
  GetChargeState get getChargeState => $_getN(0);
  @$pb.TagNumber(2)
  set getChargeState(GetChargeState value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasGetChargeState() => $_has(0);
  @$pb.TagNumber(2)
  void clearGetChargeState() => $_clearField(2);
  @$pb.TagNumber(2)
  GetChargeState ensureGetChargeState() => $_ensure(0);

  @$pb.TagNumber(3)
  GetClimateState get getClimateState => $_getN(1);
  @$pb.TagNumber(3)
  set getClimateState(GetClimateState value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasGetClimateState() => $_has(1);
  @$pb.TagNumber(3)
  void clearGetClimateState() => $_clearField(3);
  @$pb.TagNumber(3)
  GetClimateState ensureGetClimateState() => $_ensure(1);

  @$pb.TagNumber(4)
  GetDriveState get getDriveState => $_getN(2);
  @$pb.TagNumber(4)
  set getDriveState(GetDriveState value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasGetDriveState() => $_has(2);
  @$pb.TagNumber(4)
  void clearGetDriveState() => $_clearField(4);
  @$pb.TagNumber(4)
  GetDriveState ensureGetDriveState() => $_ensure(2);

  @$pb.TagNumber(7)
  GetLocationState get getLocationState => $_getN(3);
  @$pb.TagNumber(7)
  set getLocationState(GetLocationState value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasGetLocationState() => $_has(3);
  @$pb.TagNumber(7)
  void clearGetLocationState() => $_clearField(7);
  @$pb.TagNumber(7)
  GetLocationState ensureGetLocationState() => $_ensure(3);

  @$pb.TagNumber(8)
  GetClosuresState get getClosuresState => $_getN(4);
  @$pb.TagNumber(8)
  set getClosuresState(GetClosuresState value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasGetClosuresState() => $_has(4);
  @$pb.TagNumber(8)
  void clearGetClosuresState() => $_clearField(8);
  @$pb.TagNumber(8)
  GetClosuresState ensureGetClosuresState() => $_ensure(4);

  @$pb.TagNumber(10)
  GetChargeScheduleState get getChargeScheduleState => $_getN(5);
  @$pb.TagNumber(10)
  set getChargeScheduleState(GetChargeScheduleState value) =>
      $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasGetChargeScheduleState() => $_has(5);
  @$pb.TagNumber(10)
  void clearGetChargeScheduleState() => $_clearField(10);
  @$pb.TagNumber(10)
  GetChargeScheduleState ensureGetChargeScheduleState() => $_ensure(5);

  @$pb.TagNumber(11)
  GetPreconditioningScheduleState get getPreconditioningScheduleState =>
      $_getN(6);
  @$pb.TagNumber(11)
  set getPreconditioningScheduleState(GetPreconditioningScheduleState value) =>
      $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasGetPreconditioningScheduleState() => $_has(6);
  @$pb.TagNumber(11)
  void clearGetPreconditioningScheduleState() => $_clearField(11);
  @$pb.TagNumber(11)
  GetPreconditioningScheduleState ensureGetPreconditioningScheduleState() =>
      $_ensure(6);

  @$pb.TagNumber(14)
  GetTirePressureState get getTirePressureState => $_getN(7);
  @$pb.TagNumber(14)
  set getTirePressureState(GetTirePressureState value) => $_setField(14, value);
  @$pb.TagNumber(14)
  $core.bool hasGetTirePressureState() => $_has(7);
  @$pb.TagNumber(14)
  void clearGetTirePressureState() => $_clearField(14);
  @$pb.TagNumber(14)
  GetTirePressureState ensureGetTirePressureState() => $_ensure(7);

  @$pb.TagNumber(15)
  GetMediaState get getMediaState => $_getN(8);
  @$pb.TagNumber(15)
  set getMediaState(GetMediaState value) => $_setField(15, value);
  @$pb.TagNumber(15)
  $core.bool hasGetMediaState() => $_has(8);
  @$pb.TagNumber(15)
  void clearGetMediaState() => $_clearField(15);
  @$pb.TagNumber(15)
  GetMediaState ensureGetMediaState() => $_ensure(8);

  @$pb.TagNumber(16)
  GetMediaDetailState get getMediaDetailState => $_getN(9);
  @$pb.TagNumber(16)
  set getMediaDetailState(GetMediaDetailState value) => $_setField(16, value);
  @$pb.TagNumber(16)
  $core.bool hasGetMediaDetailState() => $_has(9);
  @$pb.TagNumber(16)
  void clearGetMediaDetailState() => $_clearField(16);
  @$pb.TagNumber(16)
  GetMediaDetailState ensureGetMediaDetailState() => $_ensure(9);

  @$pb.TagNumber(17)
  GetSoftwareUpdateState get getSoftwareUpdateState => $_getN(10);
  @$pb.TagNumber(17)
  set getSoftwareUpdateState(GetSoftwareUpdateState value) =>
      $_setField(17, value);
  @$pb.TagNumber(17)
  $core.bool hasGetSoftwareUpdateState() => $_has(10);
  @$pb.TagNumber(17)
  void clearGetSoftwareUpdateState() => $_clearField(17);
  @$pb.TagNumber(17)
  GetSoftwareUpdateState ensureGetSoftwareUpdateState() => $_ensure(10);

  @$pb.TagNumber(19)
  GetParentalControlsState get getParentalControlsState => $_getN(11);
  @$pb.TagNumber(19)
  set getParentalControlsState(GetParentalControlsState value) =>
      $_setField(19, value);
  @$pb.TagNumber(19)
  $core.bool hasGetParentalControlsState() => $_has(11);
  @$pb.TagNumber(19)
  void clearGetParentalControlsState() => $_clearField(19);
  @$pb.TagNumber(19)
  GetParentalControlsState ensureGetParentalControlsState() => $_ensure(11);
}

class GetTirePressureState extends $pb.GeneratedMessage {
  factory GetTirePressureState() => create();

  GetTirePressureState._();

  factory GetTirePressureState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetTirePressureState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetTirePressureState',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTirePressureState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTirePressureState copyWith(void Function(GetTirePressureState) updates) =>
      super.copyWith((message) => updates(message as GetTirePressureState))
          as GetTirePressureState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTirePressureState create() => GetTirePressureState._();
  @$core.override
  GetTirePressureState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetTirePressureState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetTirePressureState>(create);
  static GetTirePressureState? _defaultInstance;
}

class GetMediaState extends $pb.GeneratedMessage {
  factory GetMediaState() => create();

  GetMediaState._();

  factory GetMediaState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetMediaState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetMediaState',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMediaState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMediaState copyWith(void Function(GetMediaState) updates) =>
      super.copyWith((message) => updates(message as GetMediaState))
          as GetMediaState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMediaState create() => GetMediaState._();
  @$core.override
  GetMediaState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetMediaState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetMediaState>(create);
  static GetMediaState? _defaultInstance;
}

class GetMediaDetailState extends $pb.GeneratedMessage {
  factory GetMediaDetailState() => create();

  GetMediaDetailState._();

  factory GetMediaDetailState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetMediaDetailState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetMediaDetailState',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMediaDetailState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMediaDetailState copyWith(void Function(GetMediaDetailState) updates) =>
      super.copyWith((message) => updates(message as GetMediaDetailState))
          as GetMediaDetailState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMediaDetailState create() => GetMediaDetailState._();
  @$core.override
  GetMediaDetailState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetMediaDetailState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetMediaDetailState>(create);
  static GetMediaDetailState? _defaultInstance;
}

class GetSoftwareUpdateState extends $pb.GeneratedMessage {
  factory GetSoftwareUpdateState() => create();

  GetSoftwareUpdateState._();

  factory GetSoftwareUpdateState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSoftwareUpdateState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSoftwareUpdateState',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSoftwareUpdateState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSoftwareUpdateState copyWith(
          void Function(GetSoftwareUpdateState) updates) =>
      super.copyWith((message) => updates(message as GetSoftwareUpdateState))
          as GetSoftwareUpdateState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSoftwareUpdateState create() => GetSoftwareUpdateState._();
  @$core.override
  GetSoftwareUpdateState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetSoftwareUpdateState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSoftwareUpdateState>(create);
  static GetSoftwareUpdateState? _defaultInstance;
}

class GetChargeState extends $pb.GeneratedMessage {
  factory GetChargeState() => create();

  GetChargeState._();

  factory GetChargeState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetChargeState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetChargeState',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetChargeState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetChargeState copyWith(void Function(GetChargeState) updates) =>
      super.copyWith((message) => updates(message as GetChargeState))
          as GetChargeState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetChargeState create() => GetChargeState._();
  @$core.override
  GetChargeState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetChargeState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetChargeState>(create);
  static GetChargeState? _defaultInstance;
}

class GetClimateState extends $pb.GeneratedMessage {
  factory GetClimateState() => create();

  GetClimateState._();

  factory GetClimateState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetClimateState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetClimateState',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetClimateState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetClimateState copyWith(void Function(GetClimateState) updates) =>
      super.copyWith((message) => updates(message as GetClimateState))
          as GetClimateState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetClimateState create() => GetClimateState._();
  @$core.override
  GetClimateState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetClimateState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetClimateState>(create);
  static GetClimateState? _defaultInstance;
}

class GetDriveState extends $pb.GeneratedMessage {
  factory GetDriveState() => create();

  GetDriveState._();

  factory GetDriveState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetDriveState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetDriveState',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDriveState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDriveState copyWith(void Function(GetDriveState) updates) =>
      super.copyWith((message) => updates(message as GetDriveState))
          as GetDriveState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetDriveState create() => GetDriveState._();
  @$core.override
  GetDriveState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetDriveState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetDriveState>(create);
  static GetDriveState? _defaultInstance;
}

class GetLocationState extends $pb.GeneratedMessage {
  factory GetLocationState() => create();

  GetLocationState._();

  factory GetLocationState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetLocationState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetLocationState',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetLocationState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetLocationState copyWith(void Function(GetLocationState) updates) =>
      super.copyWith((message) => updates(message as GetLocationState))
          as GetLocationState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetLocationState create() => GetLocationState._();
  @$core.override
  GetLocationState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetLocationState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetLocationState>(create);
  static GetLocationState? _defaultInstance;
}

class GetClosuresState extends $pb.GeneratedMessage {
  factory GetClosuresState() => create();

  GetClosuresState._();

  factory GetClosuresState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetClosuresState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetClosuresState',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetClosuresState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetClosuresState copyWith(void Function(GetClosuresState) updates) =>
      super.copyWith((message) => updates(message as GetClosuresState))
          as GetClosuresState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetClosuresState create() => GetClosuresState._();
  @$core.override
  GetClosuresState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetClosuresState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetClosuresState>(create);
  static GetClosuresState? _defaultInstance;
}

class GetChargeScheduleState extends $pb.GeneratedMessage {
  factory GetChargeScheduleState() => create();

  GetChargeScheduleState._();

  factory GetChargeScheduleState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetChargeScheduleState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetChargeScheduleState',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetChargeScheduleState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetChargeScheduleState copyWith(
          void Function(GetChargeScheduleState) updates) =>
      super.copyWith((message) => updates(message as GetChargeScheduleState))
          as GetChargeScheduleState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetChargeScheduleState create() => GetChargeScheduleState._();
  @$core.override
  GetChargeScheduleState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetChargeScheduleState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetChargeScheduleState>(create);
  static GetChargeScheduleState? _defaultInstance;
}

class GetPreconditioningScheduleState extends $pb.GeneratedMessage {
  factory GetPreconditioningScheduleState() => create();

  GetPreconditioningScheduleState._();

  factory GetPreconditioningScheduleState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetPreconditioningScheduleState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetPreconditioningScheduleState',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPreconditioningScheduleState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPreconditioningScheduleState copyWith(
          void Function(GetPreconditioningScheduleState) updates) =>
      super.copyWith(
              (message) => updates(message as GetPreconditioningScheduleState))
          as GetPreconditioningScheduleState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPreconditioningScheduleState create() =>
      GetPreconditioningScheduleState._();
  @$core.override
  GetPreconditioningScheduleState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetPreconditioningScheduleState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPreconditioningScheduleState>(
          create);
  static GetPreconditioningScheduleState? _defaultInstance;
}

class GetParentalControlsState extends $pb.GeneratedMessage {
  factory GetParentalControlsState() => create();

  GetParentalControlsState._();

  factory GetParentalControlsState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetParentalControlsState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetParentalControlsState',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetParentalControlsState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetParentalControlsState copyWith(
          void Function(GetParentalControlsState) updates) =>
      super.copyWith((message) => updates(message as GetParentalControlsState))
          as GetParentalControlsState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetParentalControlsState create() => GetParentalControlsState._();
  @$core.override
  GetParentalControlsState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetParentalControlsState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetParentalControlsState>(create);
  static GetParentalControlsState? _defaultInstance;
}

class EraseUserDataAction extends $pb.GeneratedMessage {
  factory EraseUserDataAction({
    $core.String? reason,
  }) {
    final result = create();
    if (reason != null) result.reason = reason;
    return result;
  }

  EraseUserDataAction._();

  factory EraseUserDataAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EraseUserDataAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EraseUserDataAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'reason')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EraseUserDataAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EraseUserDataAction copyWith(void Function(EraseUserDataAction) updates) =>
      super.copyWith((message) => updates(message as EraseUserDataAction))
          as EraseUserDataAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EraseUserDataAction create() => EraseUserDataAction._();
  @$core.override
  EraseUserDataAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EraseUserDataAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EraseUserDataAction>(create);
  static EraseUserDataAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get reason => $_getSZ(0);
  @$pb.TagNumber(1)
  set reason($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReason() => $_has(0);
  @$pb.TagNumber(1)
  void clearReason() => $_clearField(1);
}

enum Response_ResponseMsg {
  vehicleData,
  getSessionInfoResponse,
  getNearbyChargingSites,
  ping,
  notSet
}

class Response extends $pb.GeneratedMessage {
  factory Response({
    ActionStatus? actionStatus,
    $0.VehicleData? vehicleData,
    $2.SessionInfo? getSessionInfoResponse,
    NearbyChargingSites? getNearbyChargingSites,
    Ping? ping,
  }) {
    final result = create();
    if (actionStatus != null) result.actionStatus = actionStatus;
    if (vehicleData != null) result.vehicleData = vehicleData;
    if (getSessionInfoResponse != null)
      result.getSessionInfoResponse = getSessionInfoResponse;
    if (getNearbyChargingSites != null)
      result.getNearbyChargingSites = getNearbyChargingSites;
    if (ping != null) result.ping = ping;
    return result;
  }

  Response._();

  factory Response.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Response.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, Response_ResponseMsg>
      _Response_ResponseMsgByTag = {
    2: Response_ResponseMsg.vehicleData,
    3: Response_ResponseMsg.getSessionInfoResponse,
    5: Response_ResponseMsg.getNearbyChargingSites,
    9: Response_ResponseMsg.ping,
    0: Response_ResponseMsg.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Response',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..oo(0, [2, 3, 5, 9])
    ..aOM<ActionStatus>(1, _omitFieldNames ? '' : 'actionStatus',
        protoName: 'actionStatus', subBuilder: ActionStatus.create)
    ..aOM<$0.VehicleData>(2, _omitFieldNames ? '' : 'vehicleData',
        protoName: 'vehicleData', subBuilder: $0.VehicleData.create)
    ..aOM<$2.SessionInfo>(3, _omitFieldNames ? '' : 'getSessionInfoResponse',
        protoName: 'getSessionInfoResponse', subBuilder: $2.SessionInfo.create)
    ..aOM<NearbyChargingSites>(
        5, _omitFieldNames ? '' : 'getNearbyChargingSites',
        protoName: 'getNearbyChargingSites',
        subBuilder: NearbyChargingSites.create)
    ..aOM<Ping>(9, _omitFieldNames ? '' : 'ping', subBuilder: Ping.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Response clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Response copyWith(void Function(Response) updates) =>
      super.copyWith((message) => updates(message as Response)) as Response;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Response create() => Response._();
  @$core.override
  Response createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Response getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Response>(create);
  static Response? _defaultInstance;

  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(5)
  @$pb.TagNumber(9)
  Response_ResponseMsg whichResponseMsg() =>
      _Response_ResponseMsgByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(5)
  @$pb.TagNumber(9)
  void clearResponseMsg() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  ActionStatus get actionStatus => $_getN(0);
  @$pb.TagNumber(1)
  set actionStatus(ActionStatus value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasActionStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearActionStatus() => $_clearField(1);
  @$pb.TagNumber(1)
  ActionStatus ensureActionStatus() => $_ensure(0);

  @$pb.TagNumber(2)
  $0.VehicleData get vehicleData => $_getN(1);
  @$pb.TagNumber(2)
  set vehicleData($0.VehicleData value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasVehicleData() => $_has(1);
  @$pb.TagNumber(2)
  void clearVehicleData() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.VehicleData ensureVehicleData() => $_ensure(1);

  @$pb.TagNumber(3)
  $2.SessionInfo get getSessionInfoResponse => $_getN(2);
  @$pb.TagNumber(3)
  set getSessionInfoResponse($2.SessionInfo value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasGetSessionInfoResponse() => $_has(2);
  @$pb.TagNumber(3)
  void clearGetSessionInfoResponse() => $_clearField(3);
  @$pb.TagNumber(3)
  $2.SessionInfo ensureGetSessionInfoResponse() => $_ensure(2);

  @$pb.TagNumber(5)
  NearbyChargingSites get getNearbyChargingSites => $_getN(3);
  @$pb.TagNumber(5)
  set getNearbyChargingSites(NearbyChargingSites value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasGetNearbyChargingSites() => $_has(3);
  @$pb.TagNumber(5)
  void clearGetNearbyChargingSites() => $_clearField(5);
  @$pb.TagNumber(5)
  NearbyChargingSites ensureGetNearbyChargingSites() => $_ensure(3);

  @$pb.TagNumber(9)
  Ping get ping => $_getN(4);
  @$pb.TagNumber(9)
  set ping(Ping value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasPing() => $_has(4);
  @$pb.TagNumber(9)
  void clearPing() => $_clearField(9);
  @$pb.TagNumber(9)
  Ping ensurePing() => $_ensure(4);
}

class ActionStatus extends $pb.GeneratedMessage {
  factory ActionStatus({
    OperationStatus_E? result,
    ResultReason? resultReason,
  }) {
    final result$ = create();
    if (result != null) result$.result = result;
    if (resultReason != null) result$.resultReason = resultReason;
    return result$;
  }

  ActionStatus._();

  factory ActionStatus.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ActionStatus.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ActionStatus',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aE<OperationStatus_E>(1, _omitFieldNames ? '' : 'result',
        enumValues: OperationStatus_E.values)
    ..aOM<ResultReason>(2, _omitFieldNames ? '' : 'resultReason',
        subBuilder: ResultReason.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ActionStatus clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ActionStatus copyWith(void Function(ActionStatus) updates) =>
      super.copyWith((message) => updates(message as ActionStatus))
          as ActionStatus;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ActionStatus create() => ActionStatus._();
  @$core.override
  ActionStatus createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ActionStatus getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ActionStatus>(create);
  static ActionStatus? _defaultInstance;

  @$pb.TagNumber(1)
  OperationStatus_E get result => $_getN(0);
  @$pb.TagNumber(1)
  set result(OperationStatus_E value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => $_clearField(1);

  @$pb.TagNumber(2)
  ResultReason get resultReason => $_getN(1);
  @$pb.TagNumber(2)
  set resultReason(ResultReason value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasResultReason() => $_has(1);
  @$pb.TagNumber(2)
  void clearResultReason() => $_clearField(2);
  @$pb.TagNumber(2)
  ResultReason ensureResultReason() => $_ensure(1);
}

enum ResultReason_Reason { plainText, notSet }

class ResultReason extends $pb.GeneratedMessage {
  factory ResultReason({
    $core.String? plainText,
  }) {
    final result = create();
    if (plainText != null) result.plainText = plainText;
    return result;
  }

  ResultReason._();

  factory ResultReason.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ResultReason.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ResultReason_Reason>
      _ResultReason_ReasonByTag = {
    1: ResultReason_Reason.plainText,
    0: ResultReason_Reason.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResultReason',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..oo(0, [1])
    ..aOS(1, _omitFieldNames ? '' : 'plainText')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResultReason clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResultReason copyWith(void Function(ResultReason) updates) =>
      super.copyWith((message) => updates(message as ResultReason))
          as ResultReason;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResultReason create() => ResultReason._();
  @$core.override
  ResultReason createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ResultReason getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResultReason>(create);
  static ResultReason? _defaultInstance;

  @$pb.TagNumber(1)
  ResultReason_Reason whichReason() =>
      _ResultReason_ReasonByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  void clearReason() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get plainText => $_getSZ(0);
  @$pb.TagNumber(1)
  set plainText($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPlainText() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlainText() => $_clearField(1);
}

class EncryptedData extends $pb.GeneratedMessage {
  factory EncryptedData({
    $core.int? fieldNumber,
    $core.List<$core.int>? ciphertext,
    $core.List<$core.int>? tag,
  }) {
    final result = create();
    if (fieldNumber != null) result.fieldNumber = fieldNumber;
    if (ciphertext != null) result.ciphertext = ciphertext;
    if (tag != null) result.tag = tag;
    return result;
  }

  EncryptedData._();

  factory EncryptedData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EncryptedData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EncryptedData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'fieldNumber')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'ciphertext', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'tag', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EncryptedData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EncryptedData copyWith(void Function(EncryptedData) updates) =>
      super.copyWith((message) => updates(message as EncryptedData))
          as EncryptedData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EncryptedData create() => EncryptedData._();
  @$core.override
  EncryptedData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EncryptedData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EncryptedData>(create);
  static EncryptedData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get fieldNumber => $_getIZ(0);
  @$pb.TagNumber(1)
  set fieldNumber($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFieldNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearFieldNumber() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get ciphertext => $_getN(1);
  @$pb.TagNumber(2)
  set ciphertext($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCiphertext() => $_has(1);
  @$pb.TagNumber(2)
  void clearCiphertext() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get tag => $_getN(2);
  @$pb.TagNumber(3)
  set tag($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTag() => $_has(2);
  @$pb.TagNumber(3)
  void clearTag() => $_clearField(3);
}

class ChargingSetLimitAction extends $pb.GeneratedMessage {
  factory ChargingSetLimitAction({
    $core.int? percent,
  }) {
    final result = create();
    if (percent != null) result.percent = percent;
    return result;
  }

  ChargingSetLimitAction._();

  factory ChargingSetLimitAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChargingSetLimitAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChargingSetLimitAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'percent')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChargingSetLimitAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChargingSetLimitAction copyWith(
          void Function(ChargingSetLimitAction) updates) =>
      super.copyWith((message) => updates(message as ChargingSetLimitAction))
          as ChargingSetLimitAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChargingSetLimitAction create() => ChargingSetLimitAction._();
  @$core.override
  ChargingSetLimitAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChargingSetLimitAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChargingSetLimitAction>(create);
  static ChargingSetLimitAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get percent => $_getIZ(0);
  @$pb.TagNumber(1)
  set percent($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPercent() => $_has(0);
  @$pb.TagNumber(1)
  void clearPercent() => $_clearField(1);
}

enum ChargingStartStopAction_ChargingAction {
  unknown,
  start,
  startStandard,
  startMaxRange,
  stop,
  notSet
}

class ChargingStartStopAction extends $pb.GeneratedMessage {
  factory ChargingStartStopAction({
    $1.Void? unknown,
    $1.Void? start,
    $1.Void? startStandard,
    $1.Void? startMaxRange,
    $1.Void? stop,
  }) {
    final result = create();
    if (unknown != null) result.unknown = unknown;
    if (start != null) result.start = start;
    if (startStandard != null) result.startStandard = startStandard;
    if (startMaxRange != null) result.startMaxRange = startMaxRange;
    if (stop != null) result.stop = stop;
    return result;
  }

  ChargingStartStopAction._();

  factory ChargingStartStopAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChargingStartStopAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ChargingStartStopAction_ChargingAction>
      _ChargingStartStopAction_ChargingActionByTag = {
    1: ChargingStartStopAction_ChargingAction.unknown,
    2: ChargingStartStopAction_ChargingAction.start,
    3: ChargingStartStopAction_ChargingAction.startStandard,
    4: ChargingStartStopAction_ChargingAction.startMaxRange,
    5: ChargingStartStopAction_ChargingAction.stop,
    0: ChargingStartStopAction_ChargingAction.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChargingStartStopAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5])
    ..aOM<$1.Void>(1, _omitFieldNames ? '' : 'unknown',
        subBuilder: $1.Void.create)
    ..aOM<$1.Void>(2, _omitFieldNames ? '' : 'start',
        subBuilder: $1.Void.create)
    ..aOM<$1.Void>(3, _omitFieldNames ? '' : 'startStandard',
        subBuilder: $1.Void.create)
    ..aOM<$1.Void>(4, _omitFieldNames ? '' : 'startMaxRange',
        subBuilder: $1.Void.create)
    ..aOM<$1.Void>(5, _omitFieldNames ? '' : 'stop', subBuilder: $1.Void.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChargingStartStopAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChargingStartStopAction copyWith(
          void Function(ChargingStartStopAction) updates) =>
      super.copyWith((message) => updates(message as ChargingStartStopAction))
          as ChargingStartStopAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChargingStartStopAction create() => ChargingStartStopAction._();
  @$core.override
  ChargingStartStopAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChargingStartStopAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChargingStartStopAction>(create);
  static ChargingStartStopAction? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  ChargingStartStopAction_ChargingAction whichChargingAction() =>
      _ChargingStartStopAction_ChargingActionByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  void clearChargingAction() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $1.Void get unknown => $_getN(0);
  @$pb.TagNumber(1)
  set unknown($1.Void value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasUnknown() => $_has(0);
  @$pb.TagNumber(1)
  void clearUnknown() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.Void ensureUnknown() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.Void get start => $_getN(1);
  @$pb.TagNumber(2)
  set start($1.Void value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasStart() => $_has(1);
  @$pb.TagNumber(2)
  void clearStart() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.Void ensureStart() => $_ensure(1);

  @$pb.TagNumber(3)
  $1.Void get startStandard => $_getN(2);
  @$pb.TagNumber(3)
  set startStandard($1.Void value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasStartStandard() => $_has(2);
  @$pb.TagNumber(3)
  void clearStartStandard() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.Void ensureStartStandard() => $_ensure(2);

  @$pb.TagNumber(4)
  $1.Void get startMaxRange => $_getN(3);
  @$pb.TagNumber(4)
  set startMaxRange($1.Void value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasStartMaxRange() => $_has(3);
  @$pb.TagNumber(4)
  void clearStartMaxRange() => $_clearField(4);
  @$pb.TagNumber(4)
  $1.Void ensureStartMaxRange() => $_ensure(3);

  @$pb.TagNumber(5)
  $1.Void get stop => $_getN(4);
  @$pb.TagNumber(5)
  set stop($1.Void value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasStop() => $_has(4);
  @$pb.TagNumber(5)
  void clearStop() => $_clearField(5);
  @$pb.TagNumber(5)
  $1.Void ensureStop() => $_ensure(4);
}

class DrivingClearSpeedLimitPinAction extends $pb.GeneratedMessage {
  factory DrivingClearSpeedLimitPinAction({
    $core.String? pin,
  }) {
    final result = create();
    if (pin != null) result.pin = pin;
    return result;
  }

  DrivingClearSpeedLimitPinAction._();

  factory DrivingClearSpeedLimitPinAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DrivingClearSpeedLimitPinAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DrivingClearSpeedLimitPinAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'pin')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DrivingClearSpeedLimitPinAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DrivingClearSpeedLimitPinAction copyWith(
          void Function(DrivingClearSpeedLimitPinAction) updates) =>
      super.copyWith(
              (message) => updates(message as DrivingClearSpeedLimitPinAction))
          as DrivingClearSpeedLimitPinAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DrivingClearSpeedLimitPinAction create() =>
      DrivingClearSpeedLimitPinAction._();
  @$core.override
  DrivingClearSpeedLimitPinAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DrivingClearSpeedLimitPinAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DrivingClearSpeedLimitPinAction>(
          create);
  static DrivingClearSpeedLimitPinAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get pin => $_getSZ(0);
  @$pb.TagNumber(1)
  set pin($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPin() => $_has(0);
  @$pb.TagNumber(1)
  void clearPin() => $_clearField(1);
}

class DrivingSetSpeedLimitAction extends $pb.GeneratedMessage {
  factory DrivingSetSpeedLimitAction({
    $core.double? limitMph,
  }) {
    final result = create();
    if (limitMph != null) result.limitMph = limitMph;
    return result;
  }

  DrivingSetSpeedLimitAction._();

  factory DrivingSetSpeedLimitAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DrivingSetSpeedLimitAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DrivingSetSpeedLimitAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aD(1, _omitFieldNames ? '' : 'limitMph')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DrivingSetSpeedLimitAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DrivingSetSpeedLimitAction copyWith(
          void Function(DrivingSetSpeedLimitAction) updates) =>
      super.copyWith(
              (message) => updates(message as DrivingSetSpeedLimitAction))
          as DrivingSetSpeedLimitAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DrivingSetSpeedLimitAction create() => DrivingSetSpeedLimitAction._();
  @$core.override
  DrivingSetSpeedLimitAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DrivingSetSpeedLimitAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DrivingSetSpeedLimitAction>(create);
  static DrivingSetSpeedLimitAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get limitMph => $_getN(0);
  @$pb.TagNumber(1)
  set limitMph($core.double value) => $_setDouble(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLimitMph() => $_has(0);
  @$pb.TagNumber(1)
  void clearLimitMph() => $_clearField(1);
}

class DrivingSpeedLimitAction extends $pb.GeneratedMessage {
  factory DrivingSpeedLimitAction({
    $core.bool? activate,
    $core.String? pin,
  }) {
    final result = create();
    if (activate != null) result.activate = activate;
    if (pin != null) result.pin = pin;
    return result;
  }

  DrivingSpeedLimitAction._();

  factory DrivingSpeedLimitAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DrivingSpeedLimitAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DrivingSpeedLimitAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'activate')
    ..aOS(2, _omitFieldNames ? '' : 'pin')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DrivingSpeedLimitAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DrivingSpeedLimitAction copyWith(
          void Function(DrivingSpeedLimitAction) updates) =>
      super.copyWith((message) => updates(message as DrivingSpeedLimitAction))
          as DrivingSpeedLimitAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DrivingSpeedLimitAction create() => DrivingSpeedLimitAction._();
  @$core.override
  DrivingSpeedLimitAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DrivingSpeedLimitAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DrivingSpeedLimitAction>(create);
  static DrivingSpeedLimitAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get activate => $_getBF(0);
  @$pb.TagNumber(1)
  set activate($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasActivate() => $_has(0);
  @$pb.TagNumber(1)
  void clearActivate() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get pin => $_getSZ(1);
  @$pb.TagNumber(2)
  set pin($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPin() => $_has(1);
  @$pb.TagNumber(2)
  void clearPin() => $_clearField(2);
}

class HvacAutoAction extends $pb.GeneratedMessage {
  factory HvacAutoAction({
    $core.bool? powerOn,
    $core.bool? manualOverride,
  }) {
    final result = create();
    if (powerOn != null) result.powerOn = powerOn;
    if (manualOverride != null) result.manualOverride = manualOverride;
    return result;
  }

  HvacAutoAction._();

  factory HvacAutoAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HvacAutoAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HvacAutoAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'powerOn')
    ..aOB(2, _omitFieldNames ? '' : 'manualOverride')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HvacAutoAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HvacAutoAction copyWith(void Function(HvacAutoAction) updates) =>
      super.copyWith((message) => updates(message as HvacAutoAction))
          as HvacAutoAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HvacAutoAction create() => HvacAutoAction._();
  @$core.override
  HvacAutoAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HvacAutoAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HvacAutoAction>(create);
  static HvacAutoAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get powerOn => $_getBF(0);
  @$pb.TagNumber(1)
  set powerOn($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPowerOn() => $_has(0);
  @$pb.TagNumber(1)
  void clearPowerOn() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get manualOverride => $_getBF(1);
  @$pb.TagNumber(2)
  set manualOverride($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasManualOverride() => $_has(1);
  @$pb.TagNumber(2)
  void clearManualOverride() => $_clearField(2);
}

enum HvacSeatHeaterActions_HvacSeatHeaterAction_SeatHeaterLevel {
  sEATHEATERUNKNOWN,
  sEATHEATEROFF,
  sEATHEATERLOW,
  sEATHEATERMED,
  sEATHEATERHIGH,
  notSet
}

enum HvacSeatHeaterActions_HvacSeatHeaterAction_SeatPosition {
  cARSEATUNKNOWN,
  cARSEATFRONTLEFT,
  cARSEATFRONTRIGHT,
  cARSEATREARLEFT,
  cARSEATREARLEFTBACK,
  cARSEATREARCENTER,
  cARSEATREARRIGHT,
  cARSEATREARRIGHTBACK,
  cARSEATTHIRDROWLEFT,
  cARSEATTHIRDROWRIGHT,
  notSet
}

class HvacSeatHeaterActions_HvacSeatHeaterAction extends $pb.GeneratedMessage {
  factory HvacSeatHeaterActions_HvacSeatHeaterAction({
    $1.Void? sEATHEATERUNKNOWN,
    $1.Void? sEATHEATEROFF,
    $1.Void? sEATHEATERLOW,
    $1.Void? sEATHEATERMED,
    $1.Void? sEATHEATERHIGH,
    $1.Void? cARSEATUNKNOWN,
    $1.Void? cARSEATFRONTLEFT,
    $1.Void? cARSEATFRONTRIGHT,
    $1.Void? cARSEATREARLEFT,
    $1.Void? cARSEATREARLEFTBACK,
    $1.Void? cARSEATREARCENTER,
    $1.Void? cARSEATREARRIGHT,
    $1.Void? cARSEATREARRIGHTBACK,
    $1.Void? cARSEATTHIRDROWLEFT,
    $1.Void? cARSEATTHIRDROWRIGHT,
  }) {
    final result = create();
    if (sEATHEATERUNKNOWN != null) result.sEATHEATERUNKNOWN = sEATHEATERUNKNOWN;
    if (sEATHEATEROFF != null) result.sEATHEATEROFF = sEATHEATEROFF;
    if (sEATHEATERLOW != null) result.sEATHEATERLOW = sEATHEATERLOW;
    if (sEATHEATERMED != null) result.sEATHEATERMED = sEATHEATERMED;
    if (sEATHEATERHIGH != null) result.sEATHEATERHIGH = sEATHEATERHIGH;
    if (cARSEATUNKNOWN != null) result.cARSEATUNKNOWN = cARSEATUNKNOWN;
    if (cARSEATFRONTLEFT != null) result.cARSEATFRONTLEFT = cARSEATFRONTLEFT;
    if (cARSEATFRONTRIGHT != null) result.cARSEATFRONTRIGHT = cARSEATFRONTRIGHT;
    if (cARSEATREARLEFT != null) result.cARSEATREARLEFT = cARSEATREARLEFT;
    if (cARSEATREARLEFTBACK != null)
      result.cARSEATREARLEFTBACK = cARSEATREARLEFTBACK;
    if (cARSEATREARCENTER != null) result.cARSEATREARCENTER = cARSEATREARCENTER;
    if (cARSEATREARRIGHT != null) result.cARSEATREARRIGHT = cARSEATREARRIGHT;
    if (cARSEATREARRIGHTBACK != null)
      result.cARSEATREARRIGHTBACK = cARSEATREARRIGHTBACK;
    if (cARSEATTHIRDROWLEFT != null)
      result.cARSEATTHIRDROWLEFT = cARSEATTHIRDROWLEFT;
    if (cARSEATTHIRDROWRIGHT != null)
      result.cARSEATTHIRDROWRIGHT = cARSEATTHIRDROWRIGHT;
    return result;
  }

  HvacSeatHeaterActions_HvacSeatHeaterAction._();

  factory HvacSeatHeaterActions_HvacSeatHeaterAction.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HvacSeatHeaterActions_HvacSeatHeaterAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int,
          HvacSeatHeaterActions_HvacSeatHeaterAction_SeatHeaterLevel>
      _HvacSeatHeaterActions_HvacSeatHeaterAction_SeatHeaterLevelByTag = {
    1: HvacSeatHeaterActions_HvacSeatHeaterAction_SeatHeaterLevel
        .sEATHEATERUNKNOWN,
    2: HvacSeatHeaterActions_HvacSeatHeaterAction_SeatHeaterLevel.sEATHEATEROFF,
    3: HvacSeatHeaterActions_HvacSeatHeaterAction_SeatHeaterLevel.sEATHEATERLOW,
    4: HvacSeatHeaterActions_HvacSeatHeaterAction_SeatHeaterLevel.sEATHEATERMED,
    5: HvacSeatHeaterActions_HvacSeatHeaterAction_SeatHeaterLevel
        .sEATHEATERHIGH,
    0: HvacSeatHeaterActions_HvacSeatHeaterAction_SeatHeaterLevel.notSet
  };
  static const $core
      .Map<$core.int, HvacSeatHeaterActions_HvacSeatHeaterAction_SeatPosition>
      _HvacSeatHeaterActions_HvacSeatHeaterAction_SeatPositionByTag = {
    6: HvacSeatHeaterActions_HvacSeatHeaterAction_SeatPosition.cARSEATUNKNOWN,
    7: HvacSeatHeaterActions_HvacSeatHeaterAction_SeatPosition.cARSEATFRONTLEFT,
    8: HvacSeatHeaterActions_HvacSeatHeaterAction_SeatPosition
        .cARSEATFRONTRIGHT,
    9: HvacSeatHeaterActions_HvacSeatHeaterAction_SeatPosition.cARSEATREARLEFT,
    10: HvacSeatHeaterActions_HvacSeatHeaterAction_SeatPosition
        .cARSEATREARLEFTBACK,
    11: HvacSeatHeaterActions_HvacSeatHeaterAction_SeatPosition
        .cARSEATREARCENTER,
    12: HvacSeatHeaterActions_HvacSeatHeaterAction_SeatPosition
        .cARSEATREARRIGHT,
    13: HvacSeatHeaterActions_HvacSeatHeaterAction_SeatPosition
        .cARSEATREARRIGHTBACK,
    14: HvacSeatHeaterActions_HvacSeatHeaterAction_SeatPosition
        .cARSEATTHIRDROWLEFT,
    15: HvacSeatHeaterActions_HvacSeatHeaterAction_SeatPosition
        .cARSEATTHIRDROWRIGHT,
    0: HvacSeatHeaterActions_HvacSeatHeaterAction_SeatPosition.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HvacSeatHeaterActions.HvacSeatHeaterAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5])
    ..oo(1, [6, 7, 8, 9, 10, 11, 12, 13, 14, 15])
    ..aOM<$1.Void>(1, _omitFieldNames ? '' : 'SEATHEATERUNKNOWN',
        protoName: 'SEAT_HEATER_UNKNOWN', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(2, _omitFieldNames ? '' : 'SEATHEATEROFF',
        protoName: 'SEAT_HEATER_OFF', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(3, _omitFieldNames ? '' : 'SEATHEATERLOW',
        protoName: 'SEAT_HEATER_LOW', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(4, _omitFieldNames ? '' : 'SEATHEATERMED',
        protoName: 'SEAT_HEATER_MED', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(5, _omitFieldNames ? '' : 'SEATHEATERHIGH',
        protoName: 'SEAT_HEATER_HIGH', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(6, _omitFieldNames ? '' : 'CARSEATUNKNOWN',
        protoName: 'CAR_SEAT_UNKNOWN', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(7, _omitFieldNames ? '' : 'CARSEATFRONTLEFT',
        protoName: 'CAR_SEAT_FRONT_LEFT', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(8, _omitFieldNames ? '' : 'CARSEATFRONTRIGHT',
        protoName: 'CAR_SEAT_FRONT_RIGHT', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(9, _omitFieldNames ? '' : 'CARSEATREARLEFT',
        protoName: 'CAR_SEAT_REAR_LEFT', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(10, _omitFieldNames ? '' : 'CARSEATREARLEFTBACK',
        protoName: 'CAR_SEAT_REAR_LEFT_BACK', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(11, _omitFieldNames ? '' : 'CARSEATREARCENTER',
        protoName: 'CAR_SEAT_REAR_CENTER', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(12, _omitFieldNames ? '' : 'CARSEATREARRIGHT',
        protoName: 'CAR_SEAT_REAR_RIGHT', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(13, _omitFieldNames ? '' : 'CARSEATREARRIGHTBACK',
        protoName: 'CAR_SEAT_REAR_RIGHT_BACK', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(14, _omitFieldNames ? '' : 'CARSEATTHIRDROWLEFT',
        protoName: 'CAR_SEAT_THIRD_ROW_LEFT', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(15, _omitFieldNames ? '' : 'CARSEATTHIRDROWRIGHT',
        protoName: 'CAR_SEAT_THIRD_ROW_RIGHT', subBuilder: $1.Void.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HvacSeatHeaterActions_HvacSeatHeaterAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HvacSeatHeaterActions_HvacSeatHeaterAction copyWith(
          void Function(HvacSeatHeaterActions_HvacSeatHeaterAction) updates) =>
      super.copyWith((message) =>
              updates(message as HvacSeatHeaterActions_HvacSeatHeaterAction))
          as HvacSeatHeaterActions_HvacSeatHeaterAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HvacSeatHeaterActions_HvacSeatHeaterAction create() =>
      HvacSeatHeaterActions_HvacSeatHeaterAction._();
  @$core.override
  HvacSeatHeaterActions_HvacSeatHeaterAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HvacSeatHeaterActions_HvacSeatHeaterAction getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          HvacSeatHeaterActions_HvacSeatHeaterAction>(create);
  static HvacSeatHeaterActions_HvacSeatHeaterAction? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  HvacSeatHeaterActions_HvacSeatHeaterAction_SeatHeaterLevel
      whichSeatHeaterLevel() =>
          _HvacSeatHeaterActions_HvacSeatHeaterAction_SeatHeaterLevelByTag[
              $_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  void clearSeatHeaterLevel() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  @$pb.TagNumber(10)
  @$pb.TagNumber(11)
  @$pb.TagNumber(12)
  @$pb.TagNumber(13)
  @$pb.TagNumber(14)
  @$pb.TagNumber(15)
  HvacSeatHeaterActions_HvacSeatHeaterAction_SeatPosition whichSeatPosition() =>
      _HvacSeatHeaterActions_HvacSeatHeaterAction_SeatPositionByTag[
          $_whichOneof(1)]!;
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  @$pb.TagNumber(10)
  @$pb.TagNumber(11)
  @$pb.TagNumber(12)
  @$pb.TagNumber(13)
  @$pb.TagNumber(14)
  @$pb.TagNumber(15)
  void clearSeatPosition() => $_clearField($_whichOneof(1));

  @$pb.TagNumber(1)
  $1.Void get sEATHEATERUNKNOWN => $_getN(0);
  @$pb.TagNumber(1)
  set sEATHEATERUNKNOWN($1.Void value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSEATHEATERUNKNOWN() => $_has(0);
  @$pb.TagNumber(1)
  void clearSEATHEATERUNKNOWN() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.Void ensureSEATHEATERUNKNOWN() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.Void get sEATHEATEROFF => $_getN(1);
  @$pb.TagNumber(2)
  set sEATHEATEROFF($1.Void value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasSEATHEATEROFF() => $_has(1);
  @$pb.TagNumber(2)
  void clearSEATHEATEROFF() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.Void ensureSEATHEATEROFF() => $_ensure(1);

  @$pb.TagNumber(3)
  $1.Void get sEATHEATERLOW => $_getN(2);
  @$pb.TagNumber(3)
  set sEATHEATERLOW($1.Void value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasSEATHEATERLOW() => $_has(2);
  @$pb.TagNumber(3)
  void clearSEATHEATERLOW() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.Void ensureSEATHEATERLOW() => $_ensure(2);

  @$pb.TagNumber(4)
  $1.Void get sEATHEATERMED => $_getN(3);
  @$pb.TagNumber(4)
  set sEATHEATERMED($1.Void value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasSEATHEATERMED() => $_has(3);
  @$pb.TagNumber(4)
  void clearSEATHEATERMED() => $_clearField(4);
  @$pb.TagNumber(4)
  $1.Void ensureSEATHEATERMED() => $_ensure(3);

  @$pb.TagNumber(5)
  $1.Void get sEATHEATERHIGH => $_getN(4);
  @$pb.TagNumber(5)
  set sEATHEATERHIGH($1.Void value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasSEATHEATERHIGH() => $_has(4);
  @$pb.TagNumber(5)
  void clearSEATHEATERHIGH() => $_clearField(5);
  @$pb.TagNumber(5)
  $1.Void ensureSEATHEATERHIGH() => $_ensure(4);

  @$pb.TagNumber(6)
  $1.Void get cARSEATUNKNOWN => $_getN(5);
  @$pb.TagNumber(6)
  set cARSEATUNKNOWN($1.Void value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasCARSEATUNKNOWN() => $_has(5);
  @$pb.TagNumber(6)
  void clearCARSEATUNKNOWN() => $_clearField(6);
  @$pb.TagNumber(6)
  $1.Void ensureCARSEATUNKNOWN() => $_ensure(5);

  @$pb.TagNumber(7)
  $1.Void get cARSEATFRONTLEFT => $_getN(6);
  @$pb.TagNumber(7)
  set cARSEATFRONTLEFT($1.Void value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasCARSEATFRONTLEFT() => $_has(6);
  @$pb.TagNumber(7)
  void clearCARSEATFRONTLEFT() => $_clearField(7);
  @$pb.TagNumber(7)
  $1.Void ensureCARSEATFRONTLEFT() => $_ensure(6);

  @$pb.TagNumber(8)
  $1.Void get cARSEATFRONTRIGHT => $_getN(7);
  @$pb.TagNumber(8)
  set cARSEATFRONTRIGHT($1.Void value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasCARSEATFRONTRIGHT() => $_has(7);
  @$pb.TagNumber(8)
  void clearCARSEATFRONTRIGHT() => $_clearField(8);
  @$pb.TagNumber(8)
  $1.Void ensureCARSEATFRONTRIGHT() => $_ensure(7);

  @$pb.TagNumber(9)
  $1.Void get cARSEATREARLEFT => $_getN(8);
  @$pb.TagNumber(9)
  set cARSEATREARLEFT($1.Void value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasCARSEATREARLEFT() => $_has(8);
  @$pb.TagNumber(9)
  void clearCARSEATREARLEFT() => $_clearField(9);
  @$pb.TagNumber(9)
  $1.Void ensureCARSEATREARLEFT() => $_ensure(8);

  @$pb.TagNumber(10)
  $1.Void get cARSEATREARLEFTBACK => $_getN(9);
  @$pb.TagNumber(10)
  set cARSEATREARLEFTBACK($1.Void value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasCARSEATREARLEFTBACK() => $_has(9);
  @$pb.TagNumber(10)
  void clearCARSEATREARLEFTBACK() => $_clearField(10);
  @$pb.TagNumber(10)
  $1.Void ensureCARSEATREARLEFTBACK() => $_ensure(9);

  @$pb.TagNumber(11)
  $1.Void get cARSEATREARCENTER => $_getN(10);
  @$pb.TagNumber(11)
  set cARSEATREARCENTER($1.Void value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasCARSEATREARCENTER() => $_has(10);
  @$pb.TagNumber(11)
  void clearCARSEATREARCENTER() => $_clearField(11);
  @$pb.TagNumber(11)
  $1.Void ensureCARSEATREARCENTER() => $_ensure(10);

  @$pb.TagNumber(12)
  $1.Void get cARSEATREARRIGHT => $_getN(11);
  @$pb.TagNumber(12)
  set cARSEATREARRIGHT($1.Void value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasCARSEATREARRIGHT() => $_has(11);
  @$pb.TagNumber(12)
  void clearCARSEATREARRIGHT() => $_clearField(12);
  @$pb.TagNumber(12)
  $1.Void ensureCARSEATREARRIGHT() => $_ensure(11);

  @$pb.TagNumber(13)
  $1.Void get cARSEATREARRIGHTBACK => $_getN(12);
  @$pb.TagNumber(13)
  set cARSEATREARRIGHTBACK($1.Void value) => $_setField(13, value);
  @$pb.TagNumber(13)
  $core.bool hasCARSEATREARRIGHTBACK() => $_has(12);
  @$pb.TagNumber(13)
  void clearCARSEATREARRIGHTBACK() => $_clearField(13);
  @$pb.TagNumber(13)
  $1.Void ensureCARSEATREARRIGHTBACK() => $_ensure(12);

  @$pb.TagNumber(14)
  $1.Void get cARSEATTHIRDROWLEFT => $_getN(13);
  @$pb.TagNumber(14)
  set cARSEATTHIRDROWLEFT($1.Void value) => $_setField(14, value);
  @$pb.TagNumber(14)
  $core.bool hasCARSEATTHIRDROWLEFT() => $_has(13);
  @$pb.TagNumber(14)
  void clearCARSEATTHIRDROWLEFT() => $_clearField(14);
  @$pb.TagNumber(14)
  $1.Void ensureCARSEATTHIRDROWLEFT() => $_ensure(13);

  @$pb.TagNumber(15)
  $1.Void get cARSEATTHIRDROWRIGHT => $_getN(14);
  @$pb.TagNumber(15)
  set cARSEATTHIRDROWRIGHT($1.Void value) => $_setField(15, value);
  @$pb.TagNumber(15)
  $core.bool hasCARSEATTHIRDROWRIGHT() => $_has(14);
  @$pb.TagNumber(15)
  void clearCARSEATTHIRDROWRIGHT() => $_clearField(15);
  @$pb.TagNumber(15)
  $1.Void ensureCARSEATTHIRDROWRIGHT() => $_ensure(14);
}

class HvacSeatHeaterActions extends $pb.GeneratedMessage {
  factory HvacSeatHeaterActions({
    $core.Iterable<HvacSeatHeaterActions_HvacSeatHeaterAction>?
        hvacSeatHeaterAction,
  }) {
    final result = create();
    if (hvacSeatHeaterAction != null)
      result.hvacSeatHeaterAction.addAll(hvacSeatHeaterAction);
    return result;
  }

  HvacSeatHeaterActions._();

  factory HvacSeatHeaterActions.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HvacSeatHeaterActions.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HvacSeatHeaterActions',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..pPM<HvacSeatHeaterActions_HvacSeatHeaterAction>(
        1, _omitFieldNames ? '' : 'hvacSeatHeaterAction',
        protoName: 'hvacSeatHeaterAction',
        subBuilder: HvacSeatHeaterActions_HvacSeatHeaterAction.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HvacSeatHeaterActions clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HvacSeatHeaterActions copyWith(
          void Function(HvacSeatHeaterActions) updates) =>
      super.copyWith((message) => updates(message as HvacSeatHeaterActions))
          as HvacSeatHeaterActions;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HvacSeatHeaterActions create() => HvacSeatHeaterActions._();
  @$core.override
  HvacSeatHeaterActions createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HvacSeatHeaterActions getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HvacSeatHeaterActions>(create);
  static HvacSeatHeaterActions? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<HvacSeatHeaterActions_HvacSeatHeaterAction>
      get hvacSeatHeaterAction => $_getList(0);
}

class HvacSeatCoolerActions_HvacSeatCoolerAction extends $pb.GeneratedMessage {
  factory HvacSeatCoolerActions_HvacSeatCoolerAction({
    HvacSeatCoolerActions_HvacSeatCoolerLevel_E? seatCoolerLevel,
    HvacSeatCoolerActions_HvacSeatCoolerPosition_E? seatPosition,
  }) {
    final result = create();
    if (seatCoolerLevel != null) result.seatCoolerLevel = seatCoolerLevel;
    if (seatPosition != null) result.seatPosition = seatPosition;
    return result;
  }

  HvacSeatCoolerActions_HvacSeatCoolerAction._();

  factory HvacSeatCoolerActions_HvacSeatCoolerAction.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HvacSeatCoolerActions_HvacSeatCoolerAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HvacSeatCoolerActions.HvacSeatCoolerAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aE<HvacSeatCoolerActions_HvacSeatCoolerLevel_E>(
        1, _omitFieldNames ? '' : 'seatCoolerLevel',
        enumValues: HvacSeatCoolerActions_HvacSeatCoolerLevel_E.values)
    ..aE<HvacSeatCoolerActions_HvacSeatCoolerPosition_E>(
        2, _omitFieldNames ? '' : 'seatPosition',
        enumValues: HvacSeatCoolerActions_HvacSeatCoolerPosition_E.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HvacSeatCoolerActions_HvacSeatCoolerAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HvacSeatCoolerActions_HvacSeatCoolerAction copyWith(
          void Function(HvacSeatCoolerActions_HvacSeatCoolerAction) updates) =>
      super.copyWith((message) =>
              updates(message as HvacSeatCoolerActions_HvacSeatCoolerAction))
          as HvacSeatCoolerActions_HvacSeatCoolerAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HvacSeatCoolerActions_HvacSeatCoolerAction create() =>
      HvacSeatCoolerActions_HvacSeatCoolerAction._();
  @$core.override
  HvacSeatCoolerActions_HvacSeatCoolerAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HvacSeatCoolerActions_HvacSeatCoolerAction getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          HvacSeatCoolerActions_HvacSeatCoolerAction>(create);
  static HvacSeatCoolerActions_HvacSeatCoolerAction? _defaultInstance;

  @$pb.TagNumber(1)
  HvacSeatCoolerActions_HvacSeatCoolerLevel_E get seatCoolerLevel => $_getN(0);
  @$pb.TagNumber(1)
  set seatCoolerLevel(HvacSeatCoolerActions_HvacSeatCoolerLevel_E value) =>
      $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSeatCoolerLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearSeatCoolerLevel() => $_clearField(1);

  @$pb.TagNumber(2)
  HvacSeatCoolerActions_HvacSeatCoolerPosition_E get seatPosition => $_getN(1);
  @$pb.TagNumber(2)
  set seatPosition(HvacSeatCoolerActions_HvacSeatCoolerPosition_E value) =>
      $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasSeatPosition() => $_has(1);
  @$pb.TagNumber(2)
  void clearSeatPosition() => $_clearField(2);
}

class HvacSeatCoolerActions extends $pb.GeneratedMessage {
  factory HvacSeatCoolerActions({
    $core.Iterable<HvacSeatCoolerActions_HvacSeatCoolerAction>?
        hvacSeatCoolerAction,
  }) {
    final result = create();
    if (hvacSeatCoolerAction != null)
      result.hvacSeatCoolerAction.addAll(hvacSeatCoolerAction);
    return result;
  }

  HvacSeatCoolerActions._();

  factory HvacSeatCoolerActions.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HvacSeatCoolerActions.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HvacSeatCoolerActions',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..pPM<HvacSeatCoolerActions_HvacSeatCoolerAction>(
        1, _omitFieldNames ? '' : 'hvacSeatCoolerAction',
        protoName: 'hvacSeatCoolerAction',
        subBuilder: HvacSeatCoolerActions_HvacSeatCoolerAction.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HvacSeatCoolerActions clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HvacSeatCoolerActions copyWith(
          void Function(HvacSeatCoolerActions) updates) =>
      super.copyWith((message) => updates(message as HvacSeatCoolerActions))
          as HvacSeatCoolerActions;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HvacSeatCoolerActions create() => HvacSeatCoolerActions._();
  @$core.override
  HvacSeatCoolerActions createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HvacSeatCoolerActions getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HvacSeatCoolerActions>(create);
  static HvacSeatCoolerActions? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<HvacSeatCoolerActions_HvacSeatCoolerAction>
      get hvacSeatCoolerAction => $_getList(0);
}

class HvacSetPreconditioningMaxAction extends $pb.GeneratedMessage {
  factory HvacSetPreconditioningMaxAction({
    $core.bool? on,
    $core.bool? manualOverride,
    $core.Iterable<HvacSetPreconditioningMaxAction_ManualOverrideMode_E>?
        manualOverrideMode,
  }) {
    final result = create();
    if (on != null) result.on = on;
    if (manualOverride != null) result.manualOverride = manualOverride;
    if (manualOverrideMode != null)
      result.manualOverrideMode.addAll(manualOverrideMode);
    return result;
  }

  HvacSetPreconditioningMaxAction._();

  factory HvacSetPreconditioningMaxAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HvacSetPreconditioningMaxAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HvacSetPreconditioningMaxAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'on')
    ..aOB(2, _omitFieldNames ? '' : 'manualOverride')
    ..pc<HvacSetPreconditioningMaxAction_ManualOverrideMode_E>(
        3, _omitFieldNames ? '' : 'manualOverrideMode', $pb.PbFieldType.KE,
        valueOf: HvacSetPreconditioningMaxAction_ManualOverrideMode_E.valueOf,
        enumValues: HvacSetPreconditioningMaxAction_ManualOverrideMode_E.values,
        defaultEnumValue:
            HvacSetPreconditioningMaxAction_ManualOverrideMode_E.DogMode)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HvacSetPreconditioningMaxAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HvacSetPreconditioningMaxAction copyWith(
          void Function(HvacSetPreconditioningMaxAction) updates) =>
      super.copyWith(
              (message) => updates(message as HvacSetPreconditioningMaxAction))
          as HvacSetPreconditioningMaxAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HvacSetPreconditioningMaxAction create() =>
      HvacSetPreconditioningMaxAction._();
  @$core.override
  HvacSetPreconditioningMaxAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HvacSetPreconditioningMaxAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HvacSetPreconditioningMaxAction>(
          create);
  static HvacSetPreconditioningMaxAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get on => $_getBF(0);
  @$pb.TagNumber(1)
  set on($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOn() => $_has(0);
  @$pb.TagNumber(1)
  void clearOn() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get manualOverride => $_getBF(1);
  @$pb.TagNumber(2)
  set manualOverride($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasManualOverride() => $_has(1);
  @$pb.TagNumber(2)
  void clearManualOverride() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<HvacSetPreconditioningMaxAction_ManualOverrideMode_E>
      get manualOverrideMode => $_getList(2);
}

class HvacSteeringWheelHeaterAction extends $pb.GeneratedMessage {
  factory HvacSteeringWheelHeaterAction({
    $core.bool? powerOn,
  }) {
    final result = create();
    if (powerOn != null) result.powerOn = powerOn;
    return result;
  }

  HvacSteeringWheelHeaterAction._();

  factory HvacSteeringWheelHeaterAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HvacSteeringWheelHeaterAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HvacSteeringWheelHeaterAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'powerOn')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HvacSteeringWheelHeaterAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HvacSteeringWheelHeaterAction copyWith(
          void Function(HvacSteeringWheelHeaterAction) updates) =>
      super.copyWith(
              (message) => updates(message as HvacSteeringWheelHeaterAction))
          as HvacSteeringWheelHeaterAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HvacSteeringWheelHeaterAction create() =>
      HvacSteeringWheelHeaterAction._();
  @$core.override
  HvacSteeringWheelHeaterAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HvacSteeringWheelHeaterAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HvacSteeringWheelHeaterAction>(create);
  static HvacSteeringWheelHeaterAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get powerOn => $_getBF(0);
  @$pb.TagNumber(1)
  set powerOn($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPowerOn() => $_has(0);
  @$pb.TagNumber(1)
  void clearPowerOn() => $_clearField(1);
}

enum HvacTemperatureAdjustmentAction_Temperature_Type {
  tEMPUNKNOWN,
  tEMPMIN,
  tEMPMAX,
  notSet
}

class HvacTemperatureAdjustmentAction_Temperature extends $pb.GeneratedMessage {
  factory HvacTemperatureAdjustmentAction_Temperature({
    $1.Void? tEMPUNKNOWN,
    $1.Void? tEMPMIN,
    $1.Void? tEMPMAX,
  }) {
    final result = create();
    if (tEMPUNKNOWN != null) result.tEMPUNKNOWN = tEMPUNKNOWN;
    if (tEMPMIN != null) result.tEMPMIN = tEMPMIN;
    if (tEMPMAX != null) result.tEMPMAX = tEMPMAX;
    return result;
  }

  HvacTemperatureAdjustmentAction_Temperature._();

  factory HvacTemperatureAdjustmentAction_Temperature.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HvacTemperatureAdjustmentAction_Temperature.fromJson(
          $core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core
      .Map<$core.int, HvacTemperatureAdjustmentAction_Temperature_Type>
      _HvacTemperatureAdjustmentAction_Temperature_TypeByTag = {
    1: HvacTemperatureAdjustmentAction_Temperature_Type.tEMPUNKNOWN,
    2: HvacTemperatureAdjustmentAction_Temperature_Type.tEMPMIN,
    3: HvacTemperatureAdjustmentAction_Temperature_Type.tEMPMAX,
    0: HvacTemperatureAdjustmentAction_Temperature_Type.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HvacTemperatureAdjustmentAction.Temperature',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..aOM<$1.Void>(1, _omitFieldNames ? '' : 'TEMPUNKNOWN',
        protoName: 'TEMP_UNKNOWN', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(2, _omitFieldNames ? '' : 'TEMPMIN',
        protoName: 'TEMP_MIN', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(3, _omitFieldNames ? '' : 'TEMPMAX',
        protoName: 'TEMP_MAX', subBuilder: $1.Void.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HvacTemperatureAdjustmentAction_Temperature clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HvacTemperatureAdjustmentAction_Temperature copyWith(
          void Function(HvacTemperatureAdjustmentAction_Temperature) updates) =>
      super.copyWith((message) =>
              updates(message as HvacTemperatureAdjustmentAction_Temperature))
          as HvacTemperatureAdjustmentAction_Temperature;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HvacTemperatureAdjustmentAction_Temperature create() =>
      HvacTemperatureAdjustmentAction_Temperature._();
  @$core.override
  HvacTemperatureAdjustmentAction_Temperature createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HvacTemperatureAdjustmentAction_Temperature getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          HvacTemperatureAdjustmentAction_Temperature>(create);
  static HvacTemperatureAdjustmentAction_Temperature? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  HvacTemperatureAdjustmentAction_Temperature_Type whichType() =>
      _HvacTemperatureAdjustmentAction_Temperature_TypeByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  void clearType() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $1.Void get tEMPUNKNOWN => $_getN(0);
  @$pb.TagNumber(1)
  set tEMPUNKNOWN($1.Void value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTEMPUNKNOWN() => $_has(0);
  @$pb.TagNumber(1)
  void clearTEMPUNKNOWN() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.Void ensureTEMPUNKNOWN() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.Void get tEMPMIN => $_getN(1);
  @$pb.TagNumber(2)
  set tEMPMIN($1.Void value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasTEMPMIN() => $_has(1);
  @$pb.TagNumber(2)
  void clearTEMPMIN() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.Void ensureTEMPMIN() => $_ensure(1);

  @$pb.TagNumber(3)
  $1.Void get tEMPMAX => $_getN(2);
  @$pb.TagNumber(3)
  set tEMPMAX($1.Void value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasTEMPMAX() => $_has(2);
  @$pb.TagNumber(3)
  void clearTEMPMAX() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.Void ensureTEMPMAX() => $_ensure(2);
}

enum HvacTemperatureAdjustmentAction_HvacTemperatureZone_Type {
  tEMPZONEUNKNOWN,
  tEMPZONEFRONTLEFT,
  tEMPZONEFRONTRIGHT,
  tEMPZONEREAR,
  notSet
}

class HvacTemperatureAdjustmentAction_HvacTemperatureZone
    extends $pb.GeneratedMessage {
  factory HvacTemperatureAdjustmentAction_HvacTemperatureZone({
    $1.Void? tEMPZONEUNKNOWN,
    $1.Void? tEMPZONEFRONTLEFT,
    $1.Void? tEMPZONEFRONTRIGHT,
    $1.Void? tEMPZONEREAR,
  }) {
    final result = create();
    if (tEMPZONEUNKNOWN != null) result.tEMPZONEUNKNOWN = tEMPZONEUNKNOWN;
    if (tEMPZONEFRONTLEFT != null) result.tEMPZONEFRONTLEFT = tEMPZONEFRONTLEFT;
    if (tEMPZONEFRONTRIGHT != null)
      result.tEMPZONEFRONTRIGHT = tEMPZONEFRONTRIGHT;
    if (tEMPZONEREAR != null) result.tEMPZONEREAR = tEMPZONEREAR;
    return result;
  }

  HvacTemperatureAdjustmentAction_HvacTemperatureZone._();

  factory HvacTemperatureAdjustmentAction_HvacTemperatureZone.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HvacTemperatureAdjustmentAction_HvacTemperatureZone.fromJson(
          $core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core
      .Map<$core.int, HvacTemperatureAdjustmentAction_HvacTemperatureZone_Type>
      _HvacTemperatureAdjustmentAction_HvacTemperatureZone_TypeByTag = {
    1: HvacTemperatureAdjustmentAction_HvacTemperatureZone_Type.tEMPZONEUNKNOWN,
    2: HvacTemperatureAdjustmentAction_HvacTemperatureZone_Type
        .tEMPZONEFRONTLEFT,
    3: HvacTemperatureAdjustmentAction_HvacTemperatureZone_Type
        .tEMPZONEFRONTRIGHT,
    4: HvacTemperatureAdjustmentAction_HvacTemperatureZone_Type.tEMPZONEREAR,
    0: HvacTemperatureAdjustmentAction_HvacTemperatureZone_Type.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames
          ? ''
          : 'HvacTemperatureAdjustmentAction.HvacTemperatureZone',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4])
    ..aOM<$1.Void>(1, _omitFieldNames ? '' : 'TEMPZONEUNKNOWN',
        protoName: 'TEMP_ZONE_UNKNOWN', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(2, _omitFieldNames ? '' : 'TEMPZONEFRONTLEFT',
        protoName: 'TEMP_ZONE_FRONT_LEFT', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(3, _omitFieldNames ? '' : 'TEMPZONEFRONTRIGHT',
        protoName: 'TEMP_ZONE_FRONT_RIGHT', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(4, _omitFieldNames ? '' : 'TEMPZONEREAR',
        protoName: 'TEMP_ZONE_REAR', subBuilder: $1.Void.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HvacTemperatureAdjustmentAction_HvacTemperatureZone clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HvacTemperatureAdjustmentAction_HvacTemperatureZone copyWith(
          void Function(HvacTemperatureAdjustmentAction_HvacTemperatureZone)
              updates) =>
      super.copyWith((message) => updates(
              message as HvacTemperatureAdjustmentAction_HvacTemperatureZone))
          as HvacTemperatureAdjustmentAction_HvacTemperatureZone;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HvacTemperatureAdjustmentAction_HvacTemperatureZone create() =>
      HvacTemperatureAdjustmentAction_HvacTemperatureZone._();
  @$core.override
  HvacTemperatureAdjustmentAction_HvacTemperatureZone createEmptyInstance() =>
      create();
  @$core.pragma('dart2js:noInline')
  static HvacTemperatureAdjustmentAction_HvacTemperatureZone getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          HvacTemperatureAdjustmentAction_HvacTemperatureZone>(create);
  static HvacTemperatureAdjustmentAction_HvacTemperatureZone? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  HvacTemperatureAdjustmentAction_HvacTemperatureZone_Type whichType() =>
      _HvacTemperatureAdjustmentAction_HvacTemperatureZone_TypeByTag[
          $_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  void clearType() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $1.Void get tEMPZONEUNKNOWN => $_getN(0);
  @$pb.TagNumber(1)
  set tEMPZONEUNKNOWN($1.Void value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTEMPZONEUNKNOWN() => $_has(0);
  @$pb.TagNumber(1)
  void clearTEMPZONEUNKNOWN() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.Void ensureTEMPZONEUNKNOWN() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.Void get tEMPZONEFRONTLEFT => $_getN(1);
  @$pb.TagNumber(2)
  set tEMPZONEFRONTLEFT($1.Void value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasTEMPZONEFRONTLEFT() => $_has(1);
  @$pb.TagNumber(2)
  void clearTEMPZONEFRONTLEFT() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.Void ensureTEMPZONEFRONTLEFT() => $_ensure(1);

  @$pb.TagNumber(3)
  $1.Void get tEMPZONEFRONTRIGHT => $_getN(2);
  @$pb.TagNumber(3)
  set tEMPZONEFRONTRIGHT($1.Void value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasTEMPZONEFRONTRIGHT() => $_has(2);
  @$pb.TagNumber(3)
  void clearTEMPZONEFRONTRIGHT() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.Void ensureTEMPZONEFRONTRIGHT() => $_ensure(2);

  @$pb.TagNumber(4)
  $1.Void get tEMPZONEREAR => $_getN(3);
  @$pb.TagNumber(4)
  set tEMPZONEREAR($1.Void value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasTEMPZONEREAR() => $_has(3);
  @$pb.TagNumber(4)
  void clearTEMPZONEREAR() => $_clearField(4);
  @$pb.TagNumber(4)
  $1.Void ensureTEMPZONEREAR() => $_ensure(3);
}

class HvacTemperatureAdjustmentAction extends $pb.GeneratedMessage {
  factory HvacTemperatureAdjustmentAction({
    $core.double? deltaCelsius,
    $core.int? deltaPercent,
    $core.double? absoluteCelsius,
    $core.Iterable<HvacTemperatureAdjustmentAction_HvacTemperatureZone>?
        hvacTemperatureZone,
    HvacTemperatureAdjustmentAction_Temperature? level,
    $core.double? driverTempCelsius,
    $core.double? passengerTempCelsius,
  }) {
    final result = create();
    if (deltaCelsius != null) result.deltaCelsius = deltaCelsius;
    if (deltaPercent != null) result.deltaPercent = deltaPercent;
    if (absoluteCelsius != null) result.absoluteCelsius = absoluteCelsius;
    if (hvacTemperatureZone != null)
      result.hvacTemperatureZone.addAll(hvacTemperatureZone);
    if (level != null) result.level = level;
    if (driverTempCelsius != null) result.driverTempCelsius = driverTempCelsius;
    if (passengerTempCelsius != null)
      result.passengerTempCelsius = passengerTempCelsius;
    return result;
  }

  HvacTemperatureAdjustmentAction._();

  factory HvacTemperatureAdjustmentAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HvacTemperatureAdjustmentAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HvacTemperatureAdjustmentAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aD(1, _omitFieldNames ? '' : 'deltaCelsius',
        fieldType: $pb.PbFieldType.OF)
    ..aI(2, _omitFieldNames ? '' : 'deltaPercent',
        fieldType: $pb.PbFieldType.OS3)
    ..aD(3, _omitFieldNames ? '' : 'absoluteCelsius',
        fieldType: $pb.PbFieldType.OF)
    ..pPM<HvacTemperatureAdjustmentAction_HvacTemperatureZone>(
        4, _omitFieldNames ? '' : 'hvacTemperatureZone',
        subBuilder: HvacTemperatureAdjustmentAction_HvacTemperatureZone.create)
    ..aOM<HvacTemperatureAdjustmentAction_Temperature>(
        5, _omitFieldNames ? '' : 'level',
        subBuilder: HvacTemperatureAdjustmentAction_Temperature.create)
    ..aD(6, _omitFieldNames ? '' : 'driverTempCelsius',
        fieldType: $pb.PbFieldType.OF)
    ..aD(7, _omitFieldNames ? '' : 'passengerTempCelsius',
        fieldType: $pb.PbFieldType.OF)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HvacTemperatureAdjustmentAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HvacTemperatureAdjustmentAction copyWith(
          void Function(HvacTemperatureAdjustmentAction) updates) =>
      super.copyWith(
              (message) => updates(message as HvacTemperatureAdjustmentAction))
          as HvacTemperatureAdjustmentAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HvacTemperatureAdjustmentAction create() =>
      HvacTemperatureAdjustmentAction._();
  @$core.override
  HvacTemperatureAdjustmentAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HvacTemperatureAdjustmentAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HvacTemperatureAdjustmentAction>(
          create);
  static HvacTemperatureAdjustmentAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get deltaCelsius => $_getN(0);
  @$pb.TagNumber(1)
  set deltaCelsius($core.double value) => $_setFloat(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDeltaCelsius() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeltaCelsius() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get deltaPercent => $_getIZ(1);
  @$pb.TagNumber(2)
  set deltaPercent($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDeltaPercent() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeltaPercent() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get absoluteCelsius => $_getN(2);
  @$pb.TagNumber(3)
  set absoluteCelsius($core.double value) => $_setFloat(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAbsoluteCelsius() => $_has(2);
  @$pb.TagNumber(3)
  void clearAbsoluteCelsius() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<HvacTemperatureAdjustmentAction_HvacTemperatureZone>
      get hvacTemperatureZone => $_getList(3);

  @$pb.TagNumber(5)
  HvacTemperatureAdjustmentAction_Temperature get level => $_getN(4);
  @$pb.TagNumber(5)
  set level(HvacTemperatureAdjustmentAction_Temperature value) =>
      $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasLevel() => $_has(4);
  @$pb.TagNumber(5)
  void clearLevel() => $_clearField(5);
  @$pb.TagNumber(5)
  HvacTemperatureAdjustmentAction_Temperature ensureLevel() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.double get driverTempCelsius => $_getN(5);
  @$pb.TagNumber(6)
  set driverTempCelsius($core.double value) => $_setFloat(5, value);
  @$pb.TagNumber(6)
  $core.bool hasDriverTempCelsius() => $_has(5);
  @$pb.TagNumber(6)
  void clearDriverTempCelsius() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.double get passengerTempCelsius => $_getN(6);
  @$pb.TagNumber(7)
  set passengerTempCelsius($core.double value) => $_setFloat(6, value);
  @$pb.TagNumber(7)
  $core.bool hasPassengerTempCelsius() => $_has(6);
  @$pb.TagNumber(7)
  void clearPassengerTempCelsius() => $_clearField(7);
}

class GetNearbyChargingSites extends $pb.GeneratedMessage {
  factory GetNearbyChargingSites({
    $core.bool? includeMetaData,
    $core.int? radius,
    $core.int? count,
  }) {
    final result = create();
    if (includeMetaData != null) result.includeMetaData = includeMetaData;
    if (radius != null) result.radius = radius;
    if (count != null) result.count = count;
    return result;
  }

  GetNearbyChargingSites._();

  factory GetNearbyChargingSites.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetNearbyChargingSites.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetNearbyChargingSites',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'includeMetaData')
    ..aI(2, _omitFieldNames ? '' : 'radius')
    ..aI(3, _omitFieldNames ? '' : 'count')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetNearbyChargingSites clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetNearbyChargingSites copyWith(
          void Function(GetNearbyChargingSites) updates) =>
      super.copyWith((message) => updates(message as GetNearbyChargingSites))
          as GetNearbyChargingSites;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNearbyChargingSites create() => GetNearbyChargingSites._();
  @$core.override
  GetNearbyChargingSites createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetNearbyChargingSites getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetNearbyChargingSites>(create);
  static GetNearbyChargingSites? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get includeMetaData => $_getBF(0);
  @$pb.TagNumber(1)
  set includeMetaData($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIncludeMetaData() => $_has(0);
  @$pb.TagNumber(1)
  void clearIncludeMetaData() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get radius => $_getIZ(1);
  @$pb.TagNumber(2)
  set radius($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRadius() => $_has(1);
  @$pb.TagNumber(2)
  void clearRadius() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get count => $_getIZ(2);
  @$pb.TagNumber(3)
  set count($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearCount() => $_clearField(3);
}

class NearbyChargingSites extends $pb.GeneratedMessage {
  factory NearbyChargingSites({
    $3.Timestamp? timestamp,
    $core.Iterable<Superchargers>? superchargers,
    $fixnum.Int64? congestionSyncTimeUtcSecs,
  }) {
    final result = create();
    if (timestamp != null) result.timestamp = timestamp;
    if (superchargers != null) result.superchargers.addAll(superchargers);
    if (congestionSyncTimeUtcSecs != null)
      result.congestionSyncTimeUtcSecs = congestionSyncTimeUtcSecs;
    return result;
  }

  NearbyChargingSites._();

  factory NearbyChargingSites.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NearbyChargingSites.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NearbyChargingSites',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOM<$3.Timestamp>(1, _omitFieldNames ? '' : 'timestamp',
        subBuilder: $3.Timestamp.create)
    ..pPM<Superchargers>(3, _omitFieldNames ? '' : 'superchargers',
        subBuilder: Superchargers.create)
    ..aInt64(4, _omitFieldNames ? '' : 'congestionSyncTimeUtcSecs')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NearbyChargingSites clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NearbyChargingSites copyWith(void Function(NearbyChargingSites) updates) =>
      super.copyWith((message) => updates(message as NearbyChargingSites))
          as NearbyChargingSites;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NearbyChargingSites create() => NearbyChargingSites._();
  @$core.override
  NearbyChargingSites createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NearbyChargingSites getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NearbyChargingSites>(create);
  static NearbyChargingSites? _defaultInstance;

  @$pb.TagNumber(1)
  $3.Timestamp get timestamp => $_getN(0);
  @$pb.TagNumber(1)
  set timestamp($3.Timestamp value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTimestamp() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimestamp() => $_clearField(1);
  @$pb.TagNumber(1)
  $3.Timestamp ensureTimestamp() => $_ensure(0);

  @$pb.TagNumber(3)
  $pb.PbList<Superchargers> get superchargers => $_getList(1);

  @$pb.TagNumber(4)
  $fixnum.Int64 get congestionSyncTimeUtcSecs => $_getI64(2);
  @$pb.TagNumber(4)
  set congestionSyncTimeUtcSecs($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(4)
  $core.bool hasCongestionSyncTimeUtcSecs() => $_has(2);
  @$pb.TagNumber(4)
  void clearCongestionSyncTimeUtcSecs() => $_clearField(4);
}

class Superchargers extends $pb.GeneratedMessage {
  factory Superchargers({
    $fixnum.Int64? id,
    $core.String? amenities,
    $core.int? availableStalls,
    $core.String? billingInfo,
    $core.String? billingTime,
    $core.String? city,
    $core.String? country,
    $core.double? distanceMiles,
    $core.String? district,
    $1.LatLong? location,
    $core.String? name,
    $core.String? postalCode,
    $core.bool? siteClosed,
    $core.String? state,
    $core.String? streetAddress,
    $core.int? totalStalls,
    $core.bool? withinRange,
    $core.int? maxPowerKw,
    $core.int? outOfOrderStallsNumber,
    $core.String? outOfOrderStallsNames,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (amenities != null) result.amenities = amenities;
    if (availableStalls != null) result.availableStalls = availableStalls;
    if (billingInfo != null) result.billingInfo = billingInfo;
    if (billingTime != null) result.billingTime = billingTime;
    if (city != null) result.city = city;
    if (country != null) result.country = country;
    if (distanceMiles != null) result.distanceMiles = distanceMiles;
    if (district != null) result.district = district;
    if (location != null) result.location = location;
    if (name != null) result.name = name;
    if (postalCode != null) result.postalCode = postalCode;
    if (siteClosed != null) result.siteClosed = siteClosed;
    if (state != null) result.state = state;
    if (streetAddress != null) result.streetAddress = streetAddress;
    if (totalStalls != null) result.totalStalls = totalStalls;
    if (withinRange != null) result.withinRange = withinRange;
    if (maxPowerKw != null) result.maxPowerKw = maxPowerKw;
    if (outOfOrderStallsNumber != null)
      result.outOfOrderStallsNumber = outOfOrderStallsNumber;
    if (outOfOrderStallsNames != null)
      result.outOfOrderStallsNames = outOfOrderStallsNames;
    return result;
  }

  Superchargers._();

  factory Superchargers.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Superchargers.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Superchargers',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'amenities')
    ..aI(3, _omitFieldNames ? '' : 'availableStalls')
    ..aOS(4, _omitFieldNames ? '' : 'billingInfo')
    ..aOS(5, _omitFieldNames ? '' : 'billingTime')
    ..aOS(6, _omitFieldNames ? '' : 'city')
    ..aOS(7, _omitFieldNames ? '' : 'country')
    ..aD(8, _omitFieldNames ? '' : 'distanceMiles',
        fieldType: $pb.PbFieldType.OF)
    ..aOS(9, _omitFieldNames ? '' : 'district')
    ..aOM<$1.LatLong>(10, _omitFieldNames ? '' : 'location',
        subBuilder: $1.LatLong.create)
    ..aOS(11, _omitFieldNames ? '' : 'name')
    ..aOS(12, _omitFieldNames ? '' : 'postalCode')
    ..aOB(13, _omitFieldNames ? '' : 'siteClosed')
    ..aOS(14, _omitFieldNames ? '' : 'state')
    ..aOS(15, _omitFieldNames ? '' : 'streetAddress')
    ..aI(16, _omitFieldNames ? '' : 'totalStalls')
    ..aOB(17, _omitFieldNames ? '' : 'withinRange')
    ..aI(18, _omitFieldNames ? '' : 'maxPowerKw')
    ..aI(19, _omitFieldNames ? '' : 'outOfOrderStallsNumber')
    ..aOS(20, _omitFieldNames ? '' : 'outOfOrderStallsNames')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Superchargers clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Superchargers copyWith(void Function(Superchargers) updates) =>
      super.copyWith((message) => updates(message as Superchargers))
          as Superchargers;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Superchargers create() => Superchargers._();
  @$core.override
  Superchargers createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Superchargers getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Superchargers>(create);
  static Superchargers? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get amenities => $_getSZ(1);
  @$pb.TagNumber(2)
  set amenities($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAmenities() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmenities() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get availableStalls => $_getIZ(2);
  @$pb.TagNumber(3)
  set availableStalls($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAvailableStalls() => $_has(2);
  @$pb.TagNumber(3)
  void clearAvailableStalls() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get billingInfo => $_getSZ(3);
  @$pb.TagNumber(4)
  set billingInfo($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasBillingInfo() => $_has(3);
  @$pb.TagNumber(4)
  void clearBillingInfo() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get billingTime => $_getSZ(4);
  @$pb.TagNumber(5)
  set billingTime($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasBillingTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearBillingTime() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get city => $_getSZ(5);
  @$pb.TagNumber(6)
  set city($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCity() => $_has(5);
  @$pb.TagNumber(6)
  void clearCity() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get country => $_getSZ(6);
  @$pb.TagNumber(7)
  set country($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasCountry() => $_has(6);
  @$pb.TagNumber(7)
  void clearCountry() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.double get distanceMiles => $_getN(7);
  @$pb.TagNumber(8)
  set distanceMiles($core.double value) => $_setFloat(7, value);
  @$pb.TagNumber(8)
  $core.bool hasDistanceMiles() => $_has(7);
  @$pb.TagNumber(8)
  void clearDistanceMiles() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get district => $_getSZ(8);
  @$pb.TagNumber(9)
  set district($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasDistrict() => $_has(8);
  @$pb.TagNumber(9)
  void clearDistrict() => $_clearField(9);

  @$pb.TagNumber(10)
  $1.LatLong get location => $_getN(9);
  @$pb.TagNumber(10)
  set location($1.LatLong value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasLocation() => $_has(9);
  @$pb.TagNumber(10)
  void clearLocation() => $_clearField(10);
  @$pb.TagNumber(10)
  $1.LatLong ensureLocation() => $_ensure(9);

  @$pb.TagNumber(11)
  $core.String get name => $_getSZ(10);
  @$pb.TagNumber(11)
  set name($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasName() => $_has(10);
  @$pb.TagNumber(11)
  void clearName() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get postalCode => $_getSZ(11);
  @$pb.TagNumber(12)
  set postalCode($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasPostalCode() => $_has(11);
  @$pb.TagNumber(12)
  void clearPostalCode() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.bool get siteClosed => $_getBF(12);
  @$pb.TagNumber(13)
  set siteClosed($core.bool value) => $_setBool(12, value);
  @$pb.TagNumber(13)
  $core.bool hasSiteClosed() => $_has(12);
  @$pb.TagNumber(13)
  void clearSiteClosed() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.String get state => $_getSZ(13);
  @$pb.TagNumber(14)
  set state($core.String value) => $_setString(13, value);
  @$pb.TagNumber(14)
  $core.bool hasState() => $_has(13);
  @$pb.TagNumber(14)
  void clearState() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.String get streetAddress => $_getSZ(14);
  @$pb.TagNumber(15)
  set streetAddress($core.String value) => $_setString(14, value);
  @$pb.TagNumber(15)
  $core.bool hasStreetAddress() => $_has(14);
  @$pb.TagNumber(15)
  void clearStreetAddress() => $_clearField(15);

  @$pb.TagNumber(16)
  $core.int get totalStalls => $_getIZ(15);
  @$pb.TagNumber(16)
  set totalStalls($core.int value) => $_setSignedInt32(15, value);
  @$pb.TagNumber(16)
  $core.bool hasTotalStalls() => $_has(15);
  @$pb.TagNumber(16)
  void clearTotalStalls() => $_clearField(16);

  @$pb.TagNumber(17)
  $core.bool get withinRange => $_getBF(16);
  @$pb.TagNumber(17)
  set withinRange($core.bool value) => $_setBool(16, value);
  @$pb.TagNumber(17)
  $core.bool hasWithinRange() => $_has(16);
  @$pb.TagNumber(17)
  void clearWithinRange() => $_clearField(17);

  @$pb.TagNumber(18)
  $core.int get maxPowerKw => $_getIZ(17);
  @$pb.TagNumber(18)
  set maxPowerKw($core.int value) => $_setSignedInt32(17, value);
  @$pb.TagNumber(18)
  $core.bool hasMaxPowerKw() => $_has(17);
  @$pb.TagNumber(18)
  void clearMaxPowerKw() => $_clearField(18);

  @$pb.TagNumber(19)
  $core.int get outOfOrderStallsNumber => $_getIZ(18);
  @$pb.TagNumber(19)
  set outOfOrderStallsNumber($core.int value) => $_setSignedInt32(18, value);
  @$pb.TagNumber(19)
  $core.bool hasOutOfOrderStallsNumber() => $_has(18);
  @$pb.TagNumber(19)
  void clearOutOfOrderStallsNumber() => $_clearField(19);

  @$pb.TagNumber(20)
  $core.String get outOfOrderStallsNames => $_getSZ(19);
  @$pb.TagNumber(20)
  set outOfOrderStallsNames($core.String value) => $_setString(19, value);
  @$pb.TagNumber(20)
  $core.bool hasOutOfOrderStallsNames() => $_has(19);
  @$pb.TagNumber(20)
  void clearOutOfOrderStallsNames() => $_clearField(20);
}

class MediaPlayAction extends $pb.GeneratedMessage {
  factory MediaPlayAction() => create();

  MediaPlayAction._();

  factory MediaPlayAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MediaPlayAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MediaPlayAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MediaPlayAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MediaPlayAction copyWith(void Function(MediaPlayAction) updates) =>
      super.copyWith((message) => updates(message as MediaPlayAction))
          as MediaPlayAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MediaPlayAction create() => MediaPlayAction._();
  @$core.override
  MediaPlayAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MediaPlayAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MediaPlayAction>(create);
  static MediaPlayAction? _defaultInstance;
}

enum MediaUpdateVolume_MediaVolume { volumeDelta, volumeAbsoluteFloat, notSet }

class MediaUpdateVolume extends $pb.GeneratedMessage {
  factory MediaUpdateVolume({
    $core.int? volumeDelta,
    $core.double? volumeAbsoluteFloat,
  }) {
    final result = create();
    if (volumeDelta != null) result.volumeDelta = volumeDelta;
    if (volumeAbsoluteFloat != null)
      result.volumeAbsoluteFloat = volumeAbsoluteFloat;
    return result;
  }

  MediaUpdateVolume._();

  factory MediaUpdateVolume.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MediaUpdateVolume.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, MediaUpdateVolume_MediaVolume>
      _MediaUpdateVolume_MediaVolumeByTag = {
    1: MediaUpdateVolume_MediaVolume.volumeDelta,
    3: MediaUpdateVolume_MediaVolume.volumeAbsoluteFloat,
    0: MediaUpdateVolume_MediaVolume.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MediaUpdateVolume',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..oo(0, [1, 3])
    ..aI(1, _omitFieldNames ? '' : 'volumeDelta',
        fieldType: $pb.PbFieldType.OS3)
    ..aD(3, _omitFieldNames ? '' : 'volumeAbsoluteFloat',
        fieldType: $pb.PbFieldType.OF)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MediaUpdateVolume clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MediaUpdateVolume copyWith(void Function(MediaUpdateVolume) updates) =>
      super.copyWith((message) => updates(message as MediaUpdateVolume))
          as MediaUpdateVolume;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MediaUpdateVolume create() => MediaUpdateVolume._();
  @$core.override
  MediaUpdateVolume createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MediaUpdateVolume getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MediaUpdateVolume>(create);
  static MediaUpdateVolume? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(3)
  MediaUpdateVolume_MediaVolume whichMediaVolume() =>
      _MediaUpdateVolume_MediaVolumeByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(3)
  void clearMediaVolume() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.int get volumeDelta => $_getIZ(0);
  @$pb.TagNumber(1)
  set volumeDelta($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasVolumeDelta() => $_has(0);
  @$pb.TagNumber(1)
  void clearVolumeDelta() => $_clearField(1);

  @$pb.TagNumber(3)
  $core.double get volumeAbsoluteFloat => $_getN(1);
  @$pb.TagNumber(3)
  set volumeAbsoluteFloat($core.double value) => $_setFloat(1, value);
  @$pb.TagNumber(3)
  $core.bool hasVolumeAbsoluteFloat() => $_has(1);
  @$pb.TagNumber(3)
  void clearVolumeAbsoluteFloat() => $_clearField(3);
}

class MediaNextFavorite extends $pb.GeneratedMessage {
  factory MediaNextFavorite() => create();

  MediaNextFavorite._();

  factory MediaNextFavorite.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MediaNextFavorite.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MediaNextFavorite',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MediaNextFavorite clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MediaNextFavorite copyWith(void Function(MediaNextFavorite) updates) =>
      super.copyWith((message) => updates(message as MediaNextFavorite))
          as MediaNextFavorite;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MediaNextFavorite create() => MediaNextFavorite._();
  @$core.override
  MediaNextFavorite createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MediaNextFavorite getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MediaNextFavorite>(create);
  static MediaNextFavorite? _defaultInstance;
}

class MediaPreviousFavorite extends $pb.GeneratedMessage {
  factory MediaPreviousFavorite() => create();

  MediaPreviousFavorite._();

  factory MediaPreviousFavorite.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MediaPreviousFavorite.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MediaPreviousFavorite',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MediaPreviousFavorite clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MediaPreviousFavorite copyWith(
          void Function(MediaPreviousFavorite) updates) =>
      super.copyWith((message) => updates(message as MediaPreviousFavorite))
          as MediaPreviousFavorite;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MediaPreviousFavorite create() => MediaPreviousFavorite._();
  @$core.override
  MediaPreviousFavorite createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MediaPreviousFavorite getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MediaPreviousFavorite>(create);
  static MediaPreviousFavorite? _defaultInstance;
}

class MediaNextTrack extends $pb.GeneratedMessage {
  factory MediaNextTrack() => create();

  MediaNextTrack._();

  factory MediaNextTrack.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MediaNextTrack.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MediaNextTrack',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MediaNextTrack clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MediaNextTrack copyWith(void Function(MediaNextTrack) updates) =>
      super.copyWith((message) => updates(message as MediaNextTrack))
          as MediaNextTrack;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MediaNextTrack create() => MediaNextTrack._();
  @$core.override
  MediaNextTrack createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MediaNextTrack getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MediaNextTrack>(create);
  static MediaNextTrack? _defaultInstance;
}

class MediaPreviousTrack extends $pb.GeneratedMessage {
  factory MediaPreviousTrack() => create();

  MediaPreviousTrack._();

  factory MediaPreviousTrack.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MediaPreviousTrack.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MediaPreviousTrack',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MediaPreviousTrack clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MediaPreviousTrack copyWith(void Function(MediaPreviousTrack) updates) =>
      super.copyWith((message) => updates(message as MediaPreviousTrack))
          as MediaPreviousTrack;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MediaPreviousTrack create() => MediaPreviousTrack._();
  @$core.override
  MediaPreviousTrack createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MediaPreviousTrack getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MediaPreviousTrack>(create);
  static MediaPreviousTrack? _defaultInstance;
}

class VehicleControlCancelSoftwareUpdateAction extends $pb.GeneratedMessage {
  factory VehicleControlCancelSoftwareUpdateAction() => create();

  VehicleControlCancelSoftwareUpdateAction._();

  factory VehicleControlCancelSoftwareUpdateAction.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VehicleControlCancelSoftwareUpdateAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VehicleControlCancelSoftwareUpdateAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VehicleControlCancelSoftwareUpdateAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VehicleControlCancelSoftwareUpdateAction copyWith(
          void Function(VehicleControlCancelSoftwareUpdateAction) updates) =>
      super.copyWith((message) =>
              updates(message as VehicleControlCancelSoftwareUpdateAction))
          as VehicleControlCancelSoftwareUpdateAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VehicleControlCancelSoftwareUpdateAction create() =>
      VehicleControlCancelSoftwareUpdateAction._();
  @$core.override
  VehicleControlCancelSoftwareUpdateAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VehicleControlCancelSoftwareUpdateAction getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          VehicleControlCancelSoftwareUpdateAction>(create);
  static VehicleControlCancelSoftwareUpdateAction? _defaultInstance;
}

class VehicleControlFlashLightsAction extends $pb.GeneratedMessage {
  factory VehicleControlFlashLightsAction() => create();

  VehicleControlFlashLightsAction._();

  factory VehicleControlFlashLightsAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VehicleControlFlashLightsAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VehicleControlFlashLightsAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VehicleControlFlashLightsAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VehicleControlFlashLightsAction copyWith(
          void Function(VehicleControlFlashLightsAction) updates) =>
      super.copyWith(
              (message) => updates(message as VehicleControlFlashLightsAction))
          as VehicleControlFlashLightsAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VehicleControlFlashLightsAction create() =>
      VehicleControlFlashLightsAction._();
  @$core.override
  VehicleControlFlashLightsAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VehicleControlFlashLightsAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VehicleControlFlashLightsAction>(
          create);
  static VehicleControlFlashLightsAction? _defaultInstance;
}

class VehicleControlHonkHornAction extends $pb.GeneratedMessage {
  factory VehicleControlHonkHornAction() => create();

  VehicleControlHonkHornAction._();

  factory VehicleControlHonkHornAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VehicleControlHonkHornAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VehicleControlHonkHornAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VehicleControlHonkHornAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VehicleControlHonkHornAction copyWith(
          void Function(VehicleControlHonkHornAction) updates) =>
      super.copyWith(
              (message) => updates(message as VehicleControlHonkHornAction))
          as VehicleControlHonkHornAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VehicleControlHonkHornAction create() =>
      VehicleControlHonkHornAction._();
  @$core.override
  VehicleControlHonkHornAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VehicleControlHonkHornAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VehicleControlHonkHornAction>(create);
  static VehicleControlHonkHornAction? _defaultInstance;
}

class VehicleControlResetValetPinAction extends $pb.GeneratedMessage {
  factory VehicleControlResetValetPinAction() => create();

  VehicleControlResetValetPinAction._();

  factory VehicleControlResetValetPinAction.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VehicleControlResetValetPinAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VehicleControlResetValetPinAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VehicleControlResetValetPinAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VehicleControlResetValetPinAction copyWith(
          void Function(VehicleControlResetValetPinAction) updates) =>
      super.copyWith((message) =>
              updates(message as VehicleControlResetValetPinAction))
          as VehicleControlResetValetPinAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VehicleControlResetValetPinAction create() =>
      VehicleControlResetValetPinAction._();
  @$core.override
  VehicleControlResetValetPinAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VehicleControlResetValetPinAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VehicleControlResetValetPinAction>(
          create);
  static VehicleControlResetValetPinAction? _defaultInstance;
}

class VehicleControlScheduleSoftwareUpdateAction extends $pb.GeneratedMessage {
  factory VehicleControlScheduleSoftwareUpdateAction({
    $core.int? offsetSec,
  }) {
    final result = create();
    if (offsetSec != null) result.offsetSec = offsetSec;
    return result;
  }

  VehicleControlScheduleSoftwareUpdateAction._();

  factory VehicleControlScheduleSoftwareUpdateAction.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VehicleControlScheduleSoftwareUpdateAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VehicleControlScheduleSoftwareUpdateAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'offsetSec')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VehicleControlScheduleSoftwareUpdateAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VehicleControlScheduleSoftwareUpdateAction copyWith(
          void Function(VehicleControlScheduleSoftwareUpdateAction) updates) =>
      super.copyWith((message) =>
              updates(message as VehicleControlScheduleSoftwareUpdateAction))
          as VehicleControlScheduleSoftwareUpdateAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VehicleControlScheduleSoftwareUpdateAction create() =>
      VehicleControlScheduleSoftwareUpdateAction._();
  @$core.override
  VehicleControlScheduleSoftwareUpdateAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VehicleControlScheduleSoftwareUpdateAction getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          VehicleControlScheduleSoftwareUpdateAction>(create);
  static VehicleControlScheduleSoftwareUpdateAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get offsetSec => $_getIZ(0);
  @$pb.TagNumber(1)
  set offsetSec($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOffsetSec() => $_has(0);
  @$pb.TagNumber(1)
  void clearOffsetSec() => $_clearField(1);
}

class VehicleControlSetSentryModeAction extends $pb.GeneratedMessage {
  factory VehicleControlSetSentryModeAction({
    $core.bool? on,
  }) {
    final result = create();
    if (on != null) result.on = on;
    return result;
  }

  VehicleControlSetSentryModeAction._();

  factory VehicleControlSetSentryModeAction.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VehicleControlSetSentryModeAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VehicleControlSetSentryModeAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'on')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VehicleControlSetSentryModeAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VehicleControlSetSentryModeAction copyWith(
          void Function(VehicleControlSetSentryModeAction) updates) =>
      super.copyWith((message) =>
              updates(message as VehicleControlSetSentryModeAction))
          as VehicleControlSetSentryModeAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VehicleControlSetSentryModeAction create() =>
      VehicleControlSetSentryModeAction._();
  @$core.override
  VehicleControlSetSentryModeAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VehicleControlSetSentryModeAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VehicleControlSetSentryModeAction>(
          create);
  static VehicleControlSetSentryModeAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get on => $_getBF(0);
  @$pb.TagNumber(1)
  set on($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOn() => $_has(0);
  @$pb.TagNumber(1)
  void clearOn() => $_clearField(1);
}

class VehicleControlSetValetModeAction extends $pb.GeneratedMessage {
  factory VehicleControlSetValetModeAction({
    $core.bool? on,
    $core.String? password,
  }) {
    final result = create();
    if (on != null) result.on = on;
    if (password != null) result.password = password;
    return result;
  }

  VehicleControlSetValetModeAction._();

  factory VehicleControlSetValetModeAction.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VehicleControlSetValetModeAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VehicleControlSetValetModeAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'on')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VehicleControlSetValetModeAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VehicleControlSetValetModeAction copyWith(
          void Function(VehicleControlSetValetModeAction) updates) =>
      super.copyWith(
              (message) => updates(message as VehicleControlSetValetModeAction))
          as VehicleControlSetValetModeAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VehicleControlSetValetModeAction create() =>
      VehicleControlSetValetModeAction._();
  @$core.override
  VehicleControlSetValetModeAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VehicleControlSetValetModeAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VehicleControlSetValetModeAction>(
          create);
  static VehicleControlSetValetModeAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get on => $_getBF(0);
  @$pb.TagNumber(1)
  set on($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOn() => $_has(0);
  @$pb.TagNumber(1)
  void clearOn() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => $_clearField(2);
}

enum VehicleControlSunroofOpenCloseAction_SunroofLevel {
  absoluteLevel,
  deltaLevel,
  notSet
}

enum VehicleControlSunroofOpenCloseAction_Action { vent, close, open, notSet }

class VehicleControlSunroofOpenCloseAction extends $pb.GeneratedMessage {
  factory VehicleControlSunroofOpenCloseAction({
    $core.int? absoluteLevel,
    $core.int? deltaLevel,
    $1.Void? vent,
    $1.Void? close,
    $1.Void? open,
  }) {
    final result = create();
    if (absoluteLevel != null) result.absoluteLevel = absoluteLevel;
    if (deltaLevel != null) result.deltaLevel = deltaLevel;
    if (vent != null) result.vent = vent;
    if (close != null) result.close = close;
    if (open != null) result.open = open;
    return result;
  }

  VehicleControlSunroofOpenCloseAction._();

  factory VehicleControlSunroofOpenCloseAction.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VehicleControlSunroofOpenCloseAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core
      .Map<$core.int, VehicleControlSunroofOpenCloseAction_SunroofLevel>
      _VehicleControlSunroofOpenCloseAction_SunroofLevelByTag = {
    1: VehicleControlSunroofOpenCloseAction_SunroofLevel.absoluteLevel,
    2: VehicleControlSunroofOpenCloseAction_SunroofLevel.deltaLevel,
    0: VehicleControlSunroofOpenCloseAction_SunroofLevel.notSet
  };
  static const $core.Map<$core.int, VehicleControlSunroofOpenCloseAction_Action>
      _VehicleControlSunroofOpenCloseAction_ActionByTag = {
    3: VehicleControlSunroofOpenCloseAction_Action.vent,
    4: VehicleControlSunroofOpenCloseAction_Action.close,
    5: VehicleControlSunroofOpenCloseAction_Action.open,
    0: VehicleControlSunroofOpenCloseAction_Action.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VehicleControlSunroofOpenCloseAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..oo(1, [3, 4, 5])
    ..aI(1, _omitFieldNames ? '' : 'absoluteLevel')
    ..aI(2, _omitFieldNames ? '' : 'deltaLevel', fieldType: $pb.PbFieldType.OS3)
    ..aOM<$1.Void>(3, _omitFieldNames ? '' : 'vent', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(4, _omitFieldNames ? '' : 'close',
        subBuilder: $1.Void.create)
    ..aOM<$1.Void>(5, _omitFieldNames ? '' : 'open', subBuilder: $1.Void.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VehicleControlSunroofOpenCloseAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VehicleControlSunroofOpenCloseAction copyWith(
          void Function(VehicleControlSunroofOpenCloseAction) updates) =>
      super.copyWith((message) =>
              updates(message as VehicleControlSunroofOpenCloseAction))
          as VehicleControlSunroofOpenCloseAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VehicleControlSunroofOpenCloseAction create() =>
      VehicleControlSunroofOpenCloseAction._();
  @$core.override
  VehicleControlSunroofOpenCloseAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VehicleControlSunroofOpenCloseAction getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          VehicleControlSunroofOpenCloseAction>(create);
  static VehicleControlSunroofOpenCloseAction? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  VehicleControlSunroofOpenCloseAction_SunroofLevel whichSunroofLevel() =>
      _VehicleControlSunroofOpenCloseAction_SunroofLevelByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  void clearSunroofLevel() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  VehicleControlSunroofOpenCloseAction_Action whichAction() =>
      _VehicleControlSunroofOpenCloseAction_ActionByTag[$_whichOneof(1)]!;
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  void clearAction() => $_clearField($_whichOneof(1));

  @$pb.TagNumber(1)
  $core.int get absoluteLevel => $_getIZ(0);
  @$pb.TagNumber(1)
  set absoluteLevel($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAbsoluteLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearAbsoluteLevel() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get deltaLevel => $_getIZ(1);
  @$pb.TagNumber(2)
  set deltaLevel($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDeltaLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeltaLevel() => $_clearField(2);

  @$pb.TagNumber(3)
  $1.Void get vent => $_getN(2);
  @$pb.TagNumber(3)
  set vent($1.Void value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasVent() => $_has(2);
  @$pb.TagNumber(3)
  void clearVent() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.Void ensureVent() => $_ensure(2);

  @$pb.TagNumber(4)
  $1.Void get close => $_getN(3);
  @$pb.TagNumber(4)
  set close($1.Void value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasClose() => $_has(3);
  @$pb.TagNumber(4)
  void clearClose() => $_clearField(4);
  @$pb.TagNumber(4)
  $1.Void ensureClose() => $_ensure(3);

  @$pb.TagNumber(5)
  $1.Void get open => $_getN(4);
  @$pb.TagNumber(5)
  set open($1.Void value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasOpen() => $_has(4);
  @$pb.TagNumber(5)
  void clearOpen() => $_clearField(5);
  @$pb.TagNumber(5)
  $1.Void ensureOpen() => $_ensure(4);
}

class VehicleControlTriggerHomelinkAction extends $pb.GeneratedMessage {
  factory VehicleControlTriggerHomelinkAction({
    $1.LatLong? location,
    $core.String? token,
  }) {
    final result = create();
    if (location != null) result.location = location;
    if (token != null) result.token = token;
    return result;
  }

  VehicleControlTriggerHomelinkAction._();

  factory VehicleControlTriggerHomelinkAction.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VehicleControlTriggerHomelinkAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VehicleControlTriggerHomelinkAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOM<$1.LatLong>(1, _omitFieldNames ? '' : 'location',
        subBuilder: $1.LatLong.create)
    ..aOS(2, _omitFieldNames ? '' : 'token')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VehicleControlTriggerHomelinkAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VehicleControlTriggerHomelinkAction copyWith(
          void Function(VehicleControlTriggerHomelinkAction) updates) =>
      super.copyWith((message) =>
              updates(message as VehicleControlTriggerHomelinkAction))
          as VehicleControlTriggerHomelinkAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VehicleControlTriggerHomelinkAction create() =>
      VehicleControlTriggerHomelinkAction._();
  @$core.override
  VehicleControlTriggerHomelinkAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VehicleControlTriggerHomelinkAction getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          VehicleControlTriggerHomelinkAction>(create);
  static VehicleControlTriggerHomelinkAction? _defaultInstance;

  @$pb.TagNumber(1)
  $1.LatLong get location => $_getN(0);
  @$pb.TagNumber(1)
  set location($1.LatLong value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasLocation() => $_has(0);
  @$pb.TagNumber(1)
  void clearLocation() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.LatLong ensureLocation() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get token => $_getSZ(1);
  @$pb.TagNumber(2)
  set token($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearToken() => $_clearField(2);
}

enum VehicleControlWindowAction_Action { unknown, vent, close, notSet }

class VehicleControlWindowAction extends $pb.GeneratedMessage {
  factory VehicleControlWindowAction({
    $1.Void? unknown,
    $1.Void? vent,
    $1.Void? close,
  }) {
    final result = create();
    if (unknown != null) result.unknown = unknown;
    if (vent != null) result.vent = vent;
    if (close != null) result.close = close;
    return result;
  }

  VehicleControlWindowAction._();

  factory VehicleControlWindowAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VehicleControlWindowAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, VehicleControlWindowAction_Action>
      _VehicleControlWindowAction_ActionByTag = {
    2: VehicleControlWindowAction_Action.unknown,
    3: VehicleControlWindowAction_Action.vent,
    4: VehicleControlWindowAction_Action.close,
    0: VehicleControlWindowAction_Action.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VehicleControlWindowAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..oo(0, [2, 3, 4])
    ..aOM<$1.Void>(2, _omitFieldNames ? '' : 'unknown',
        subBuilder: $1.Void.create)
    ..aOM<$1.Void>(3, _omitFieldNames ? '' : 'vent', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(4, _omitFieldNames ? '' : 'close',
        subBuilder: $1.Void.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VehicleControlWindowAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VehicleControlWindowAction copyWith(
          void Function(VehicleControlWindowAction) updates) =>
      super.copyWith(
              (message) => updates(message as VehicleControlWindowAction))
          as VehicleControlWindowAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VehicleControlWindowAction create() => VehicleControlWindowAction._();
  @$core.override
  VehicleControlWindowAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VehicleControlWindowAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VehicleControlWindowAction>(create);
  static VehicleControlWindowAction? _defaultInstance;

  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  VehicleControlWindowAction_Action whichAction() =>
      _VehicleControlWindowAction_ActionByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  void clearAction() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(2)
  $1.Void get unknown => $_getN(0);
  @$pb.TagNumber(2)
  set unknown($1.Void value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasUnknown() => $_has(0);
  @$pb.TagNumber(2)
  void clearUnknown() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.Void ensureUnknown() => $_ensure(0);

  @$pb.TagNumber(3)
  $1.Void get vent => $_getN(1);
  @$pb.TagNumber(3)
  set vent($1.Void value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasVent() => $_has(1);
  @$pb.TagNumber(3)
  void clearVent() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.Void ensureVent() => $_ensure(1);

  @$pb.TagNumber(4)
  $1.Void get close => $_getN(2);
  @$pb.TagNumber(4)
  set close($1.Void value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasClose() => $_has(2);
  @$pb.TagNumber(4)
  void clearClose() => $_clearField(4);
  @$pb.TagNumber(4)
  $1.Void ensureClose() => $_ensure(2);
}

class HvacBioweaponModeAction extends $pb.GeneratedMessage {
  factory HvacBioweaponModeAction({
    $core.bool? on,
    $core.bool? manualOverride,
  }) {
    final result = create();
    if (on != null) result.on = on;
    if (manualOverride != null) result.manualOverride = manualOverride;
    return result;
  }

  HvacBioweaponModeAction._();

  factory HvacBioweaponModeAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HvacBioweaponModeAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HvacBioweaponModeAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'on')
    ..aOB(2, _omitFieldNames ? '' : 'manualOverride')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HvacBioweaponModeAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HvacBioweaponModeAction copyWith(
          void Function(HvacBioweaponModeAction) updates) =>
      super.copyWith((message) => updates(message as HvacBioweaponModeAction))
          as HvacBioweaponModeAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HvacBioweaponModeAction create() => HvacBioweaponModeAction._();
  @$core.override
  HvacBioweaponModeAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HvacBioweaponModeAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HvacBioweaponModeAction>(create);
  static HvacBioweaponModeAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get on => $_getBF(0);
  @$pb.TagNumber(1)
  set on($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOn() => $_has(0);
  @$pb.TagNumber(1)
  void clearOn() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get manualOverride => $_getBF(1);
  @$pb.TagNumber(2)
  set manualOverride($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasManualOverride() => $_has(1);
  @$pb.TagNumber(2)
  void clearManualOverride() => $_clearField(2);
}

class AutoSeatClimateAction_CarSeat extends $pb.GeneratedMessage {
  factory AutoSeatClimateAction_CarSeat({
    $core.bool? on,
    AutoSeatClimateAction_AutoSeatPosition_E? seatPosition,
  }) {
    final result = create();
    if (on != null) result.on = on;
    if (seatPosition != null) result.seatPosition = seatPosition;
    return result;
  }

  AutoSeatClimateAction_CarSeat._();

  factory AutoSeatClimateAction_CarSeat.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AutoSeatClimateAction_CarSeat.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AutoSeatClimateAction.CarSeat',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'on')
    ..aE<AutoSeatClimateAction_AutoSeatPosition_E>(
        2, _omitFieldNames ? '' : 'seatPosition',
        enumValues: AutoSeatClimateAction_AutoSeatPosition_E.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AutoSeatClimateAction_CarSeat clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AutoSeatClimateAction_CarSeat copyWith(
          void Function(AutoSeatClimateAction_CarSeat) updates) =>
      super.copyWith(
              (message) => updates(message as AutoSeatClimateAction_CarSeat))
          as AutoSeatClimateAction_CarSeat;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AutoSeatClimateAction_CarSeat create() =>
      AutoSeatClimateAction_CarSeat._();
  @$core.override
  AutoSeatClimateAction_CarSeat createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AutoSeatClimateAction_CarSeat getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AutoSeatClimateAction_CarSeat>(create);
  static AutoSeatClimateAction_CarSeat? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get on => $_getBF(0);
  @$pb.TagNumber(1)
  set on($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOn() => $_has(0);
  @$pb.TagNumber(1)
  void clearOn() => $_clearField(1);

  @$pb.TagNumber(2)
  AutoSeatClimateAction_AutoSeatPosition_E get seatPosition => $_getN(1);
  @$pb.TagNumber(2)
  set seatPosition(AutoSeatClimateAction_AutoSeatPosition_E value) =>
      $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasSeatPosition() => $_has(1);
  @$pb.TagNumber(2)
  void clearSeatPosition() => $_clearField(2);
}

class AutoSeatClimateAction extends $pb.GeneratedMessage {
  factory AutoSeatClimateAction({
    $core.Iterable<AutoSeatClimateAction_CarSeat>? carseat,
  }) {
    final result = create();
    if (carseat != null) result.carseat.addAll(carseat);
    return result;
  }

  AutoSeatClimateAction._();

  factory AutoSeatClimateAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AutoSeatClimateAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AutoSeatClimateAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..pPM<AutoSeatClimateAction_CarSeat>(1, _omitFieldNames ? '' : 'carseat',
        subBuilder: AutoSeatClimateAction_CarSeat.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AutoSeatClimateAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AutoSeatClimateAction copyWith(
          void Function(AutoSeatClimateAction) updates) =>
      super.copyWith((message) => updates(message as AutoSeatClimateAction))
          as AutoSeatClimateAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AutoSeatClimateAction create() => AutoSeatClimateAction._();
  @$core.override
  AutoSeatClimateAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AutoSeatClimateAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AutoSeatClimateAction>(create);
  static AutoSeatClimateAction? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<AutoSeatClimateAction_CarSeat> get carseat => $_getList(0);
}

class Ping extends $pb.GeneratedMessage {
  factory Ping({
    $core.int? pingId,
    $3.Timestamp? localTimestamp,
    $3.Timestamp? lastRemoteTimestamp,
  }) {
    final result = create();
    if (pingId != null) result.pingId = pingId;
    if (localTimestamp != null) result.localTimestamp = localTimestamp;
    if (lastRemoteTimestamp != null)
      result.lastRemoteTimestamp = lastRemoteTimestamp;
    return result;
  }

  Ping._();

  factory Ping.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Ping.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Ping',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'pingId')
    ..aOM<$3.Timestamp>(2, _omitFieldNames ? '' : 'localTimestamp',
        subBuilder: $3.Timestamp.create)
    ..aOM<$3.Timestamp>(3, _omitFieldNames ? '' : 'lastRemoteTimestamp',
        subBuilder: $3.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Ping clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Ping copyWith(void Function(Ping) updates) =>
      super.copyWith((message) => updates(message as Ping)) as Ping;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Ping create() => Ping._();
  @$core.override
  Ping createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Ping getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Ping>(create);
  static Ping? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get pingId => $_getIZ(0);
  @$pb.TagNumber(1)
  set pingId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPingId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPingId() => $_clearField(1);

  @$pb.TagNumber(2)
  $3.Timestamp get localTimestamp => $_getN(1);
  @$pb.TagNumber(2)
  set localTimestamp($3.Timestamp value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasLocalTimestamp() => $_has(1);
  @$pb.TagNumber(2)
  void clearLocalTimestamp() => $_clearField(2);
  @$pb.TagNumber(2)
  $3.Timestamp ensureLocalTimestamp() => $_ensure(1);

  @$pb.TagNumber(3)
  $3.Timestamp get lastRemoteTimestamp => $_getN(2);
  @$pb.TagNumber(3)
  set lastRemoteTimestamp($3.Timestamp value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasLastRemoteTimestamp() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastRemoteTimestamp() => $_clearField(3);
  @$pb.TagNumber(3)
  $3.Timestamp ensureLastRemoteTimestamp() => $_ensure(2);
}

class ScheduledChargingAction extends $pb.GeneratedMessage {
  factory ScheduledChargingAction({
    $core.bool? enabled,
    $core.int? chargingTime,
  }) {
    final result = create();
    if (enabled != null) result.enabled = enabled;
    if (chargingTime != null) result.chargingTime = chargingTime;
    return result;
  }

  ScheduledChargingAction._();

  factory ScheduledChargingAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ScheduledChargingAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ScheduledChargingAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'enabled')
    ..aI(2, _omitFieldNames ? '' : 'chargingTime')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ScheduledChargingAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ScheduledChargingAction copyWith(
          void Function(ScheduledChargingAction) updates) =>
      super.copyWith((message) => updates(message as ScheduledChargingAction))
          as ScheduledChargingAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ScheduledChargingAction create() => ScheduledChargingAction._();
  @$core.override
  ScheduledChargingAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ScheduledChargingAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScheduledChargingAction>(create);
  static ScheduledChargingAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get enabled => $_getBF(0);
  @$pb.TagNumber(1)
  set enabled($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEnabled() => $_has(0);
  @$pb.TagNumber(1)
  void clearEnabled() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get chargingTime => $_getIZ(1);
  @$pb.TagNumber(2)
  set chargingTime($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasChargingTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearChargingTime() => $_clearField(2);
}

class ScheduledDepartureAction extends $pb.GeneratedMessage {
  factory ScheduledDepartureAction({
    $core.bool? enabled,
    $core.int? departureTime,
    $1.PreconditioningTimes? preconditioningTimes,
    $1.OffPeakChargingTimes? offPeakChargingTimes,
    $core.int? offPeakHoursEndTime,
  }) {
    final result = create();
    if (enabled != null) result.enabled = enabled;
    if (departureTime != null) result.departureTime = departureTime;
    if (preconditioningTimes != null)
      result.preconditioningTimes = preconditioningTimes;
    if (offPeakChargingTimes != null)
      result.offPeakChargingTimes = offPeakChargingTimes;
    if (offPeakHoursEndTime != null)
      result.offPeakHoursEndTime = offPeakHoursEndTime;
    return result;
  }

  ScheduledDepartureAction._();

  factory ScheduledDepartureAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ScheduledDepartureAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ScheduledDepartureAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'enabled')
    ..aI(2, _omitFieldNames ? '' : 'departureTime')
    ..aOM<$1.PreconditioningTimes>(
        3, _omitFieldNames ? '' : 'preconditioningTimes',
        subBuilder: $1.PreconditioningTimes.create)
    ..aOM<$1.OffPeakChargingTimes>(
        4, _omitFieldNames ? '' : 'offPeakChargingTimes',
        subBuilder: $1.OffPeakChargingTimes.create)
    ..aI(5, _omitFieldNames ? '' : 'offPeakHoursEndTime')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ScheduledDepartureAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ScheduledDepartureAction copyWith(
          void Function(ScheduledDepartureAction) updates) =>
      super.copyWith((message) => updates(message as ScheduledDepartureAction))
          as ScheduledDepartureAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ScheduledDepartureAction create() => ScheduledDepartureAction._();
  @$core.override
  ScheduledDepartureAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ScheduledDepartureAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScheduledDepartureAction>(create);
  static ScheduledDepartureAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get enabled => $_getBF(0);
  @$pb.TagNumber(1)
  set enabled($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEnabled() => $_has(0);
  @$pb.TagNumber(1)
  void clearEnabled() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get departureTime => $_getIZ(1);
  @$pb.TagNumber(2)
  set departureTime($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDepartureTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearDepartureTime() => $_clearField(2);

  @$pb.TagNumber(3)
  $1.PreconditioningTimes get preconditioningTimes => $_getN(2);
  @$pb.TagNumber(3)
  set preconditioningTimes($1.PreconditioningTimes value) =>
      $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasPreconditioningTimes() => $_has(2);
  @$pb.TagNumber(3)
  void clearPreconditioningTimes() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.PreconditioningTimes ensurePreconditioningTimes() => $_ensure(2);

  @$pb.TagNumber(4)
  $1.OffPeakChargingTimes get offPeakChargingTimes => $_getN(3);
  @$pb.TagNumber(4)
  set offPeakChargingTimes($1.OffPeakChargingTimes value) =>
      $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasOffPeakChargingTimes() => $_has(3);
  @$pb.TagNumber(4)
  void clearOffPeakChargingTimes() => $_clearField(4);
  @$pb.TagNumber(4)
  $1.OffPeakChargingTimes ensureOffPeakChargingTimes() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.int get offPeakHoursEndTime => $_getIZ(4);
  @$pb.TagNumber(5)
  set offPeakHoursEndTime($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasOffPeakHoursEndTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearOffPeakHoursEndTime() => $_clearField(5);
}

class HvacClimateKeeperAction extends $pb.GeneratedMessage {
  factory HvacClimateKeeperAction({
    HvacClimateKeeperAction_ClimateKeeperAction_E? climateKeeperAction,
    $core.bool? manualOverride,
  }) {
    final result = create();
    if (climateKeeperAction != null)
      result.climateKeeperAction = climateKeeperAction;
    if (manualOverride != null) result.manualOverride = manualOverride;
    return result;
  }

  HvacClimateKeeperAction._();

  factory HvacClimateKeeperAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HvacClimateKeeperAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HvacClimateKeeperAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aE<HvacClimateKeeperAction_ClimateKeeperAction_E>(
        1, _omitFieldNames ? '' : 'ClimateKeeperAction',
        protoName: 'ClimateKeeperAction',
        enumValues: HvacClimateKeeperAction_ClimateKeeperAction_E.values)
    ..aOB(2, _omitFieldNames ? '' : 'manualOverride')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HvacClimateKeeperAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HvacClimateKeeperAction copyWith(
          void Function(HvacClimateKeeperAction) updates) =>
      super.copyWith((message) => updates(message as HvacClimateKeeperAction))
          as HvacClimateKeeperAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HvacClimateKeeperAction create() => HvacClimateKeeperAction._();
  @$core.override
  HvacClimateKeeperAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HvacClimateKeeperAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HvacClimateKeeperAction>(create);
  static HvacClimateKeeperAction? _defaultInstance;

  @$pb.TagNumber(1)
  HvacClimateKeeperAction_ClimateKeeperAction_E get climateKeeperAction =>
      $_getN(0);
  @$pb.TagNumber(1)
  set climateKeeperAction(
          HvacClimateKeeperAction_ClimateKeeperAction_E value) =>
      $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasClimateKeeperAction() => $_has(0);
  @$pb.TagNumber(1)
  void clearClimateKeeperAction() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get manualOverride => $_getBF(1);
  @$pb.TagNumber(2)
  set manualOverride($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasManualOverride() => $_has(1);
  @$pb.TagNumber(2)
  void clearManualOverride() => $_clearField(2);
}

class HvacRecirculationAction extends $pb.GeneratedMessage {
  factory HvacRecirculationAction({
    $core.bool? on,
  }) {
    final result = create();
    if (on != null) result.on = on;
    return result;
  }

  HvacRecirculationAction._();

  factory HvacRecirculationAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HvacRecirculationAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HvacRecirculationAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'on')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HvacRecirculationAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HvacRecirculationAction copyWith(
          void Function(HvacRecirculationAction) updates) =>
      super.copyWith((message) => updates(message as HvacRecirculationAction))
          as HvacRecirculationAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HvacRecirculationAction create() => HvacRecirculationAction._();
  @$core.override
  HvacRecirculationAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HvacRecirculationAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HvacRecirculationAction>(create);
  static HvacRecirculationAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get on => $_getBF(0);
  @$pb.TagNumber(1)
  set on($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOn() => $_has(0);
  @$pb.TagNumber(1)
  void clearOn() => $_clearField(1);
}

class SetChargingAmpsAction extends $pb.GeneratedMessage {
  factory SetChargingAmpsAction({
    $core.int? chargingAmps,
  }) {
    final result = create();
    if (chargingAmps != null) result.chargingAmps = chargingAmps;
    return result;
  }

  SetChargingAmpsAction._();

  factory SetChargingAmpsAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetChargingAmpsAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetChargingAmpsAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'chargingAmps')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetChargingAmpsAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetChargingAmpsAction copyWith(
          void Function(SetChargingAmpsAction) updates) =>
      super.copyWith((message) => updates(message as SetChargingAmpsAction))
          as SetChargingAmpsAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetChargingAmpsAction create() => SetChargingAmpsAction._();
  @$core.override
  SetChargingAmpsAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SetChargingAmpsAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetChargingAmpsAction>(create);
  static SetChargingAmpsAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get chargingAmps => $_getIZ(0);
  @$pb.TagNumber(1)
  set chargingAmps($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChargingAmps() => $_has(0);
  @$pb.TagNumber(1)
  void clearChargingAmps() => $_clearField(1);
}

class RemoveChargeScheduleAction extends $pb.GeneratedMessage {
  factory RemoveChargeScheduleAction({
    $fixnum.Int64? id,
  }) {
    final result = create();
    if (id != null) result.id = id;
    return result;
  }

  RemoveChargeScheduleAction._();

  factory RemoveChargeScheduleAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoveChargeScheduleAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoveChargeScheduleAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoveChargeScheduleAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoveChargeScheduleAction copyWith(
          void Function(RemoveChargeScheduleAction) updates) =>
      super.copyWith(
              (message) => updates(message as RemoveChargeScheduleAction))
          as RemoveChargeScheduleAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveChargeScheduleAction create() => RemoveChargeScheduleAction._();
  @$core.override
  RemoveChargeScheduleAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RemoveChargeScheduleAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoveChargeScheduleAction>(create);
  static RemoveChargeScheduleAction? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
}

class BatchRemoveChargeSchedulesAction extends $pb.GeneratedMessage {
  factory BatchRemoveChargeSchedulesAction({
    $core.bool? home,
    $core.bool? work,
    $core.bool? other,
  }) {
    final result = create();
    if (home != null) result.home = home;
    if (work != null) result.work = work;
    if (other != null) result.other = other;
    return result;
  }

  BatchRemoveChargeSchedulesAction._();

  factory BatchRemoveChargeSchedulesAction.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BatchRemoveChargeSchedulesAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BatchRemoveChargeSchedulesAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'home')
    ..aOB(2, _omitFieldNames ? '' : 'work')
    ..aOB(3, _omitFieldNames ? '' : 'other')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BatchRemoveChargeSchedulesAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BatchRemoveChargeSchedulesAction copyWith(
          void Function(BatchRemoveChargeSchedulesAction) updates) =>
      super.copyWith(
              (message) => updates(message as BatchRemoveChargeSchedulesAction))
          as BatchRemoveChargeSchedulesAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BatchRemoveChargeSchedulesAction create() =>
      BatchRemoveChargeSchedulesAction._();
  @$core.override
  BatchRemoveChargeSchedulesAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BatchRemoveChargeSchedulesAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BatchRemoveChargeSchedulesAction>(
          create);
  static BatchRemoveChargeSchedulesAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get home => $_getBF(0);
  @$pb.TagNumber(1)
  set home($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasHome() => $_has(0);
  @$pb.TagNumber(1)
  void clearHome() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get work => $_getBF(1);
  @$pb.TagNumber(2)
  set work($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasWork() => $_has(1);
  @$pb.TagNumber(2)
  void clearWork() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get other => $_getBF(2);
  @$pb.TagNumber(3)
  set other($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasOther() => $_has(2);
  @$pb.TagNumber(3)
  void clearOther() => $_clearField(3);
}

class BatchRemovePreconditionSchedulesAction extends $pb.GeneratedMessage {
  factory BatchRemovePreconditionSchedulesAction({
    $core.bool? home,
    $core.bool? work,
    $core.bool? other,
  }) {
    final result = create();
    if (home != null) result.home = home;
    if (work != null) result.work = work;
    if (other != null) result.other = other;
    return result;
  }

  BatchRemovePreconditionSchedulesAction._();

  factory BatchRemovePreconditionSchedulesAction.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BatchRemovePreconditionSchedulesAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BatchRemovePreconditionSchedulesAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'home')
    ..aOB(2, _omitFieldNames ? '' : 'work')
    ..aOB(3, _omitFieldNames ? '' : 'other')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BatchRemovePreconditionSchedulesAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BatchRemovePreconditionSchedulesAction copyWith(
          void Function(BatchRemovePreconditionSchedulesAction) updates) =>
      super.copyWith((message) =>
              updates(message as BatchRemovePreconditionSchedulesAction))
          as BatchRemovePreconditionSchedulesAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BatchRemovePreconditionSchedulesAction create() =>
      BatchRemovePreconditionSchedulesAction._();
  @$core.override
  BatchRemovePreconditionSchedulesAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BatchRemovePreconditionSchedulesAction getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          BatchRemovePreconditionSchedulesAction>(create);
  static BatchRemovePreconditionSchedulesAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get home => $_getBF(0);
  @$pb.TagNumber(1)
  set home($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasHome() => $_has(0);
  @$pb.TagNumber(1)
  void clearHome() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get work => $_getBF(1);
  @$pb.TagNumber(2)
  set work($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasWork() => $_has(1);
  @$pb.TagNumber(2)
  void clearWork() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get other => $_getBF(2);
  @$pb.TagNumber(3)
  set other($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasOther() => $_has(2);
  @$pb.TagNumber(3)
  void clearOther() => $_clearField(3);
}

class RemovePreconditionScheduleAction extends $pb.GeneratedMessage {
  factory RemovePreconditionScheduleAction({
    $fixnum.Int64? id,
  }) {
    final result = create();
    if (id != null) result.id = id;
    return result;
  }

  RemovePreconditionScheduleAction._();

  factory RemovePreconditionScheduleAction.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemovePreconditionScheduleAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemovePreconditionScheduleAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemovePreconditionScheduleAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemovePreconditionScheduleAction copyWith(
          void Function(RemovePreconditionScheduleAction) updates) =>
      super.copyWith(
              (message) => updates(message as RemovePreconditionScheduleAction))
          as RemovePreconditionScheduleAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemovePreconditionScheduleAction create() =>
      RemovePreconditionScheduleAction._();
  @$core.override
  RemovePreconditionScheduleAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RemovePreconditionScheduleAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemovePreconditionScheduleAction>(
          create);
  static RemovePreconditionScheduleAction? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
}

class SetCabinOverheatProtectionAction extends $pb.GeneratedMessage {
  factory SetCabinOverheatProtectionAction({
    $core.bool? on,
    $core.bool? fanOnly,
  }) {
    final result = create();
    if (on != null) result.on = on;
    if (fanOnly != null) result.fanOnly = fanOnly;
    return result;
  }

  SetCabinOverheatProtectionAction._();

  factory SetCabinOverheatProtectionAction.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetCabinOverheatProtectionAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetCabinOverheatProtectionAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'on')
    ..aOB(2, _omitFieldNames ? '' : 'fanOnly')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetCabinOverheatProtectionAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetCabinOverheatProtectionAction copyWith(
          void Function(SetCabinOverheatProtectionAction) updates) =>
      super.copyWith(
              (message) => updates(message as SetCabinOverheatProtectionAction))
          as SetCabinOverheatProtectionAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetCabinOverheatProtectionAction create() =>
      SetCabinOverheatProtectionAction._();
  @$core.override
  SetCabinOverheatProtectionAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SetCabinOverheatProtectionAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetCabinOverheatProtectionAction>(
          create);
  static SetCabinOverheatProtectionAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get on => $_getBF(0);
  @$pb.TagNumber(1)
  set on($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOn() => $_has(0);
  @$pb.TagNumber(1)
  void clearOn() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get fanOnly => $_getBF(1);
  @$pb.TagNumber(2)
  set fanOnly($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFanOnly() => $_has(1);
  @$pb.TagNumber(2)
  void clearFanOnly() => $_clearField(2);
}

class SetVehicleNameAction extends $pb.GeneratedMessage {
  factory SetVehicleNameAction({
    $core.String? vehicleName,
  }) {
    final result = create();
    if (vehicleName != null) result.vehicleName = vehicleName;
    return result;
  }

  SetVehicleNameAction._();

  factory SetVehicleNameAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetVehicleNameAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetVehicleNameAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'vehicleName', protoName: 'vehicleName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetVehicleNameAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetVehicleNameAction copyWith(void Function(SetVehicleNameAction) updates) =>
      super.copyWith((message) => updates(message as SetVehicleNameAction))
          as SetVehicleNameAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetVehicleNameAction create() => SetVehicleNameAction._();
  @$core.override
  SetVehicleNameAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SetVehicleNameAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetVehicleNameAction>(create);
  static SetVehicleNameAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get vehicleName => $_getSZ(0);
  @$pb.TagNumber(1)
  set vehicleName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasVehicleName() => $_has(0);
  @$pb.TagNumber(1)
  void clearVehicleName() => $_clearField(1);
}

class ChargePortDoorClose extends $pb.GeneratedMessage {
  factory ChargePortDoorClose() => create();

  ChargePortDoorClose._();

  factory ChargePortDoorClose.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChargePortDoorClose.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChargePortDoorClose',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChargePortDoorClose clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChargePortDoorClose copyWith(void Function(ChargePortDoorClose) updates) =>
      super.copyWith((message) => updates(message as ChargePortDoorClose))
          as ChargePortDoorClose;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChargePortDoorClose create() => ChargePortDoorClose._();
  @$core.override
  ChargePortDoorClose createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChargePortDoorClose getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChargePortDoorClose>(create);
  static ChargePortDoorClose? _defaultInstance;
}

class ChargePortDoorOpen extends $pb.GeneratedMessage {
  factory ChargePortDoorOpen() => create();

  ChargePortDoorOpen._();

  factory ChargePortDoorOpen.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChargePortDoorOpen.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChargePortDoorOpen',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChargePortDoorOpen clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChargePortDoorOpen copyWith(void Function(ChargePortDoorOpen) updates) =>
      super.copyWith((message) => updates(message as ChargePortDoorOpen))
          as ChargePortDoorOpen;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChargePortDoorOpen create() => ChargePortDoorOpen._();
  @$core.override
  ChargePortDoorOpen createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChargePortDoorOpen getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChargePortDoorOpen>(create);
  static ChargePortDoorOpen? _defaultInstance;
}

class BoomboxAction extends $pb.GeneratedMessage {
  factory BoomboxAction({
    $core.int? sound,
  }) {
    final result = create();
    if (sound != null) result.sound = sound;
    return result;
  }

  BoomboxAction._();

  factory BoomboxAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BoomboxAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BoomboxAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'sound', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BoomboxAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BoomboxAction copyWith(void Function(BoomboxAction) updates) =>
      super.copyWith((message) => updates(message as BoomboxAction))
          as BoomboxAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BoomboxAction create() => BoomboxAction._();
  @$core.override
  BoomboxAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BoomboxAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BoomboxAction>(create);
  static BoomboxAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get sound => $_getIZ(0);
  @$pb.TagNumber(1)
  set sound($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSound() => $_has(0);
  @$pb.TagNumber(1)
  void clearSound() => $_clearField(1);
}

class SetCopTempAction extends $pb.GeneratedMessage {
  factory SetCopTempAction({
    $0.ClimateState_CopActivationTemp? copActivationTemp,
  }) {
    final result = create();
    if (copActivationTemp != null) result.copActivationTemp = copActivationTemp;
    return result;
  }

  SetCopTempAction._();

  factory SetCopTempAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetCopTempAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetCopTempAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aE<$0.ClimateState_CopActivationTemp>(
        1, _omitFieldNames ? '' : 'copActivationTemp',
        protoName: 'copActivationTemp',
        enumValues: $0.ClimateState_CopActivationTemp.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetCopTempAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetCopTempAction copyWith(void Function(SetCopTempAction) updates) =>
      super.copyWith((message) => updates(message as SetCopTempAction))
          as SetCopTempAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetCopTempAction create() => SetCopTempAction._();
  @$core.override
  SetCopTempAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SetCopTempAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetCopTempAction>(create);
  static SetCopTempAction? _defaultInstance;

  @$pb.TagNumber(1)
  $0.ClimateState_CopActivationTemp get copActivationTemp => $_getN(0);
  @$pb.TagNumber(1)
  set copActivationTemp($0.ClimateState_CopActivationTemp value) =>
      $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasCopActivationTemp() => $_has(0);
  @$pb.TagNumber(1)
  void clearCopActivationTemp() => $_clearField(1);
}

class VehicleControlSetPinToDriveAction extends $pb.GeneratedMessage {
  factory VehicleControlSetPinToDriveAction({
    $core.bool? on,
    $core.String? password,
  }) {
    final result = create();
    if (on != null) result.on = on;
    if (password != null) result.password = password;
    return result;
  }

  VehicleControlSetPinToDriveAction._();

  factory VehicleControlSetPinToDriveAction.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VehicleControlSetPinToDriveAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VehicleControlSetPinToDriveAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'on')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VehicleControlSetPinToDriveAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VehicleControlSetPinToDriveAction copyWith(
          void Function(VehicleControlSetPinToDriveAction) updates) =>
      super.copyWith((message) =>
              updates(message as VehicleControlSetPinToDriveAction))
          as VehicleControlSetPinToDriveAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VehicleControlSetPinToDriveAction create() =>
      VehicleControlSetPinToDriveAction._();
  @$core.override
  VehicleControlSetPinToDriveAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VehicleControlSetPinToDriveAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VehicleControlSetPinToDriveAction>(
          create);
  static VehicleControlSetPinToDriveAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get on => $_getBF(0);
  @$pb.TagNumber(1)
  set on($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOn() => $_has(0);
  @$pb.TagNumber(1)
  void clearOn() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => $_clearField(2);
}

class VehicleControlResetPinToDriveAction extends $pb.GeneratedMessage {
  factory VehicleControlResetPinToDriveAction() => create();

  VehicleControlResetPinToDriveAction._();

  factory VehicleControlResetPinToDriveAction.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VehicleControlResetPinToDriveAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VehicleControlResetPinToDriveAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VehicleControlResetPinToDriveAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VehicleControlResetPinToDriveAction copyWith(
          void Function(VehicleControlResetPinToDriveAction) updates) =>
      super.copyWith((message) =>
              updates(message as VehicleControlResetPinToDriveAction))
          as VehicleControlResetPinToDriveAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VehicleControlResetPinToDriveAction create() =>
      VehicleControlResetPinToDriveAction._();
  @$core.override
  VehicleControlResetPinToDriveAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VehicleControlResetPinToDriveAction getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          VehicleControlResetPinToDriveAction>(create);
  static VehicleControlResetPinToDriveAction? _defaultInstance;
}

class RemoteStartDrive extends $pb.GeneratedMessage {
  factory RemoteStartDrive() => create();

  RemoteStartDrive._();

  factory RemoteStartDrive.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoteStartDrive.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoteStartDrive',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteStartDrive clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteStartDrive copyWith(void Function(RemoteStartDrive) updates) =>
      super.copyWith((message) => updates(message as RemoteStartDrive))
          as RemoteStartDrive;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoteStartDrive create() => RemoteStartDrive._();
  @$core.override
  RemoteStartDrive createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RemoteStartDrive getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoteStartDrive>(create);
  static RemoteStartDrive? _defaultInstance;
}

class CreateStreamSession extends $pb.GeneratedMessage {
  factory CreateStreamSession({
    $core.String? sessionId,
  }) {
    final result = create();
    if (sessionId != null) result.sessionId = sessionId;
    return result;
  }

  CreateStreamSession._();

  factory CreateStreamSession.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateStreamSession.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateStreamSession',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sessionId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateStreamSession clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateStreamSession copyWith(void Function(CreateStreamSession) updates) =>
      super.copyWith((message) => updates(message as CreateStreamSession))
          as CreateStreamSession;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateStreamSession create() => CreateStreamSession._();
  @$core.override
  CreateStreamSession createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateStreamSession getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateStreamSession>(create);
  static CreateStreamSession? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionId() => $_clearField(1);
}

class StreamMessage extends $pb.GeneratedMessage {
  factory StreamMessage({
    $core.String? sessionId,
    $core.List<$core.int>? data,
  }) {
    final result = create();
    if (sessionId != null) result.sessionId = sessionId;
    if (data != null) result.data = data;
    return result;
  }

  StreamMessage._();

  factory StreamMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StreamMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StreamMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sessionId')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamMessage copyWith(void Function(StreamMessage) updates) =>
      super.copyWith((message) => updates(message as StreamMessage))
          as StreamMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamMessage create() => StreamMessage._();
  @$core.override
  StreamMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StreamMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StreamMessage>(create);
  static StreamMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get data => $_getN(1);
  @$pb.TagNumber(2)
  set data($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasData() => $_has(1);
  @$pb.TagNumber(2)
  void clearData() => $_clearField(2);
}

class NavigationRequest extends $pb.GeneratedMessage {
  factory NavigationRequest({
    $core.String? destination,
    $core.int? order,
  }) {
    final result = create();
    if (destination != null) result.destination = destination;
    if (order != null) result.order = order;
    return result;
  }

  NavigationRequest._();

  factory NavigationRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NavigationRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NavigationRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'destination')
    ..aI(2, _omitFieldNames ? '' : 'order')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NavigationRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NavigationRequest copyWith(void Function(NavigationRequest) updates) =>
      super.copyWith((message) => updates(message as NavigationRequest))
          as NavigationRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NavigationRequest create() => NavigationRequest._();
  @$core.override
  NavigationRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NavigationRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NavigationRequest>(create);
  static NavigationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get destination => $_getSZ(0);
  @$pb.TagNumber(1)
  set destination($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDestination() => $_has(0);
  @$pb.TagNumber(1)
  void clearDestination() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get order => $_getIZ(1);
  @$pb.TagNumber(2)
  set order($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOrder() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrder() => $_clearField(2);
}

class NavigationSuperchargerRequest extends $pb.GeneratedMessage {
  factory NavigationSuperchargerRequest({
    $core.int? order,
  }) {
    final result = create();
    if (order != null) result.order = order;
    return result;
  }

  NavigationSuperchargerRequest._();

  factory NavigationSuperchargerRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NavigationSuperchargerRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NavigationSuperchargerRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'order')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NavigationSuperchargerRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NavigationSuperchargerRequest copyWith(
          void Function(NavigationSuperchargerRequest) updates) =>
      super.copyWith(
              (message) => updates(message as NavigationSuperchargerRequest))
          as NavigationSuperchargerRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NavigationSuperchargerRequest create() =>
      NavigationSuperchargerRequest._();
  @$core.override
  NavigationSuperchargerRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NavigationSuperchargerRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NavigationSuperchargerRequest>(create);
  static NavigationSuperchargerRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get order => $_getIZ(0);
  @$pb.TagNumber(1)
  set order($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOrder() => $_has(0);
  @$pb.TagNumber(1)
  void clearOrder() => $_clearField(1);
}

class UiSetUpcomingCalendarEntries extends $pb.GeneratedMessage {
  factory UiSetUpcomingCalendarEntries({
    $core.String? calendarData,
  }) {
    final result = create();
    if (calendarData != null) result.calendarData = calendarData;
    return result;
  }

  UiSetUpcomingCalendarEntries._();

  factory UiSetUpcomingCalendarEntries.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UiSetUpcomingCalendarEntries.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UiSetUpcomingCalendarEntries',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'calendarData')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UiSetUpcomingCalendarEntries clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UiSetUpcomingCalendarEntries copyWith(
          void Function(UiSetUpcomingCalendarEntries) updates) =>
      super.copyWith(
              (message) => updates(message as UiSetUpcomingCalendarEntries))
          as UiSetUpcomingCalendarEntries;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UiSetUpcomingCalendarEntries create() =>
      UiSetUpcomingCalendarEntries._();
  @$core.override
  UiSetUpcomingCalendarEntries createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UiSetUpcomingCalendarEntries getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UiSetUpcomingCalendarEntries>(create);
  static UiSetUpcomingCalendarEntries? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get calendarData => $_getSZ(0);
  @$pb.TagNumber(1)
  set calendarData($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCalendarData() => $_has(0);
  @$pb.TagNumber(1)
  void clearCalendarData() => $_clearField(1);
}

/// Privacy/security request for handling PII (Personally Identifiable Information)
class VehicleDataSubscription_PiiKeyRequest extends $pb.GeneratedMessage {
  factory VehicleDataSubscription_PiiKeyRequest({
    $core.String? subscriberPublicKey,
  }) {
    final result = create();
    if (subscriberPublicKey != null)
      result.subscriberPublicKey = subscriberPublicKey;
    return result;
  }

  VehicleDataSubscription_PiiKeyRequest._();

  factory VehicleDataSubscription_PiiKeyRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VehicleDataSubscription_PiiKeyRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VehicleDataSubscription.PiiKeyRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'subscriberPublicKey')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VehicleDataSubscription_PiiKeyRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VehicleDataSubscription_PiiKeyRequest copyWith(
          void Function(VehicleDataSubscription_PiiKeyRequest) updates) =>
      super.copyWith((message) =>
              updates(message as VehicleDataSubscription_PiiKeyRequest))
          as VehicleDataSubscription_PiiKeyRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VehicleDataSubscription_PiiKeyRequest create() =>
      VehicleDataSubscription_PiiKeyRequest._();
  @$core.override
  VehicleDataSubscription_PiiKeyRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VehicleDataSubscription_PiiKeyRequest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          VehicleDataSubscription_PiiKeyRequest>(create);
  static VehicleDataSubscription_PiiKeyRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get subscriberPublicKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set subscriberPublicKey($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSubscriberPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSubscriberPublicKey() => $_clearField(1);
}

class VehicleDataSubscription extends $pb.GeneratedMessage {
  factory VehicleDataSubscription({
    $core.int? subscriptionDurationS,
    $core.int? guiSettingsMaxUpdateRateMs,
    $core.int? chargeStateMaxUpdateRateMs,
    $core.int? climateStateMaxUpdateRateMs,
    $core.int? driveStateMaxUpdateRateMs,
    $core.int? vehicleStateMaxUpdateRateMs,
    $core.int? vehicleConfigMaxUpdateRateMs,
    $core.int? locationStateMaxUpdateRateMs,
    $core.int? closuresStateMaxUpdateRateMs,
    $core.int? subscriptionPingS,
    VehicleDataSubscription_PiiKeyRequest? piiKeyRequest,
    $core.int? parkedAccessoryStateMaxUpdateRateMs,
    $core.int? chargeScheduleStateMaxUpdateRateMs,
    $core.int? preconditioningScheduleStateMaxUpdateRateMs,
    $core.int? alertStateMaxUpdateRateMs,
    $core.int? suspensionStateMaxUpdateRateMs,
  }) {
    final result = create();
    if (subscriptionDurationS != null)
      result.subscriptionDurationS = subscriptionDurationS;
    if (guiSettingsMaxUpdateRateMs != null)
      result.guiSettingsMaxUpdateRateMs = guiSettingsMaxUpdateRateMs;
    if (chargeStateMaxUpdateRateMs != null)
      result.chargeStateMaxUpdateRateMs = chargeStateMaxUpdateRateMs;
    if (climateStateMaxUpdateRateMs != null)
      result.climateStateMaxUpdateRateMs = climateStateMaxUpdateRateMs;
    if (driveStateMaxUpdateRateMs != null)
      result.driveStateMaxUpdateRateMs = driveStateMaxUpdateRateMs;
    if (vehicleStateMaxUpdateRateMs != null)
      result.vehicleStateMaxUpdateRateMs = vehicleStateMaxUpdateRateMs;
    if (vehicleConfigMaxUpdateRateMs != null)
      result.vehicleConfigMaxUpdateRateMs = vehicleConfigMaxUpdateRateMs;
    if (locationStateMaxUpdateRateMs != null)
      result.locationStateMaxUpdateRateMs = locationStateMaxUpdateRateMs;
    if (closuresStateMaxUpdateRateMs != null)
      result.closuresStateMaxUpdateRateMs = closuresStateMaxUpdateRateMs;
    if (subscriptionPingS != null) result.subscriptionPingS = subscriptionPingS;
    if (piiKeyRequest != null) result.piiKeyRequest = piiKeyRequest;
    if (parkedAccessoryStateMaxUpdateRateMs != null)
      result.parkedAccessoryStateMaxUpdateRateMs =
          parkedAccessoryStateMaxUpdateRateMs;
    if (chargeScheduleStateMaxUpdateRateMs != null)
      result.chargeScheduleStateMaxUpdateRateMs =
          chargeScheduleStateMaxUpdateRateMs;
    if (preconditioningScheduleStateMaxUpdateRateMs != null)
      result.preconditioningScheduleStateMaxUpdateRateMs =
          preconditioningScheduleStateMaxUpdateRateMs;
    if (alertStateMaxUpdateRateMs != null)
      result.alertStateMaxUpdateRateMs = alertStateMaxUpdateRateMs;
    if (suspensionStateMaxUpdateRateMs != null)
      result.suspensionStateMaxUpdateRateMs = suspensionStateMaxUpdateRateMs;
    return result;
  }

  VehicleDataSubscription._();

  factory VehicleDataSubscription.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VehicleDataSubscription.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VehicleDataSubscription',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aI(3, _omitFieldNames ? '' : 'subscriptionDurationS')
    ..aI(4, _omitFieldNames ? '' : 'guiSettingsMaxUpdateRateMs')
    ..aI(5, _omitFieldNames ? '' : 'chargeStateMaxUpdateRateMs')
    ..aI(6, _omitFieldNames ? '' : 'climateStateMaxUpdateRateMs')
    ..aI(7, _omitFieldNames ? '' : 'driveStateMaxUpdateRateMs')
    ..aI(8, _omitFieldNames ? '' : 'vehicleStateMaxUpdateRateMs')
    ..aI(9, _omitFieldNames ? '' : 'vehicleConfigMaxUpdateRateMs')
    ..aI(10, _omitFieldNames ? '' : 'locationStateMaxUpdateRateMs')
    ..aI(11, _omitFieldNames ? '' : 'closuresStateMaxUpdateRateMs')
    ..aI(12, _omitFieldNames ? '' : 'subscriptionPingS')
    ..aOM<VehicleDataSubscription_PiiKeyRequest>(
        13, _omitFieldNames ? '' : 'piiKeyRequest',
        subBuilder: VehicleDataSubscription_PiiKeyRequest.create)
    ..aI(14, _omitFieldNames ? '' : 'parkedAccessoryStateMaxUpdateRateMs')
    ..aI(15, _omitFieldNames ? '' : 'chargeScheduleStateMaxUpdateRateMs')
    ..aI(16,
        _omitFieldNames ? '' : 'preconditioningScheduleStateMaxUpdateRateMs')
    ..aI(17, _omitFieldNames ? '' : 'alertStateMaxUpdateRateMs')
    ..aI(18, _omitFieldNames ? '' : 'suspensionStateMaxUpdateRateMs')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VehicleDataSubscription clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VehicleDataSubscription copyWith(
          void Function(VehicleDataSubscription) updates) =>
      super.copyWith((message) => updates(message as VehicleDataSubscription))
          as VehicleDataSubscription;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VehicleDataSubscription create() => VehicleDataSubscription._();
  @$core.override
  VehicleDataSubscription createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VehicleDataSubscription getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VehicleDataSubscription>(create);
  static VehicleDataSubscription? _defaultInstance;

  /// Subscription configuration parameters
  @$pb.TagNumber(3)
  $core.int get subscriptionDurationS => $_getIZ(0);
  @$pb.TagNumber(3)
  set subscriptionDurationS($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(3)
  $core.bool hasSubscriptionDurationS() => $_has(0);
  @$pb.TagNumber(3)
  void clearSubscriptionDurationS() => $_clearField(3);

  /// Maximum update rates for different state types (in milliseconds)
  @$pb.TagNumber(4)
  $core.int get guiSettingsMaxUpdateRateMs => $_getIZ(1);
  @$pb.TagNumber(4)
  set guiSettingsMaxUpdateRateMs($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(4)
  $core.bool hasGuiSettingsMaxUpdateRateMs() => $_has(1);
  @$pb.TagNumber(4)
  void clearGuiSettingsMaxUpdateRateMs() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get chargeStateMaxUpdateRateMs => $_getIZ(2);
  @$pb.TagNumber(5)
  set chargeStateMaxUpdateRateMs($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(5)
  $core.bool hasChargeStateMaxUpdateRateMs() => $_has(2);
  @$pb.TagNumber(5)
  void clearChargeStateMaxUpdateRateMs() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get climateStateMaxUpdateRateMs => $_getIZ(3);
  @$pb.TagNumber(6)
  set climateStateMaxUpdateRateMs($core.int value) =>
      $_setSignedInt32(3, value);
  @$pb.TagNumber(6)
  $core.bool hasClimateStateMaxUpdateRateMs() => $_has(3);
  @$pb.TagNumber(6)
  void clearClimateStateMaxUpdateRateMs() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get driveStateMaxUpdateRateMs => $_getIZ(4);
  @$pb.TagNumber(7)
  set driveStateMaxUpdateRateMs($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(7)
  $core.bool hasDriveStateMaxUpdateRateMs() => $_has(4);
  @$pb.TagNumber(7)
  void clearDriveStateMaxUpdateRateMs() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get vehicleStateMaxUpdateRateMs => $_getIZ(5);
  @$pb.TagNumber(8)
  set vehicleStateMaxUpdateRateMs($core.int value) =>
      $_setSignedInt32(5, value);
  @$pb.TagNumber(8)
  $core.bool hasVehicleStateMaxUpdateRateMs() => $_has(5);
  @$pb.TagNumber(8)
  void clearVehicleStateMaxUpdateRateMs() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.int get vehicleConfigMaxUpdateRateMs => $_getIZ(6);
  @$pb.TagNumber(9)
  set vehicleConfigMaxUpdateRateMs($core.int value) =>
      $_setSignedInt32(6, value);
  @$pb.TagNumber(9)
  $core.bool hasVehicleConfigMaxUpdateRateMs() => $_has(6);
  @$pb.TagNumber(9)
  void clearVehicleConfigMaxUpdateRateMs() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.int get locationStateMaxUpdateRateMs => $_getIZ(7);
  @$pb.TagNumber(10)
  set locationStateMaxUpdateRateMs($core.int value) =>
      $_setSignedInt32(7, value);
  @$pb.TagNumber(10)
  $core.bool hasLocationStateMaxUpdateRateMs() => $_has(7);
  @$pb.TagNumber(10)
  void clearLocationStateMaxUpdateRateMs() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.int get closuresStateMaxUpdateRateMs => $_getIZ(8);
  @$pb.TagNumber(11)
  set closuresStateMaxUpdateRateMs($core.int value) =>
      $_setSignedInt32(8, value);
  @$pb.TagNumber(11)
  $core.bool hasClosuresStateMaxUpdateRateMs() => $_has(8);
  @$pb.TagNumber(11)
  void clearClosuresStateMaxUpdateRateMs() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.int get subscriptionPingS => $_getIZ(9);
  @$pb.TagNumber(12)
  set subscriptionPingS($core.int value) => $_setSignedInt32(9, value);
  @$pb.TagNumber(12)
  $core.bool hasSubscriptionPingS() => $_has(9);
  @$pb.TagNumber(12)
  void clearSubscriptionPingS() => $_clearField(12);

  /// Security-related field for handling PII data
  @$pb.TagNumber(13)
  VehicleDataSubscription_PiiKeyRequest get piiKeyRequest => $_getN(10);
  @$pb.TagNumber(13)
  set piiKeyRequest(VehicleDataSubscription_PiiKeyRequest value) =>
      $_setField(13, value);
  @$pb.TagNumber(13)
  $core.bool hasPiiKeyRequest() => $_has(10);
  @$pb.TagNumber(13)
  void clearPiiKeyRequest() => $_clearField(13);
  @$pb.TagNumber(13)
  VehicleDataSubscription_PiiKeyRequest ensurePiiKeyRequest() => $_ensure(10);

  @$pb.TagNumber(14)
  $core.int get parkedAccessoryStateMaxUpdateRateMs => $_getIZ(11);
  @$pb.TagNumber(14)
  set parkedAccessoryStateMaxUpdateRateMs($core.int value) =>
      $_setSignedInt32(11, value);
  @$pb.TagNumber(14)
  $core.bool hasParkedAccessoryStateMaxUpdateRateMs() => $_has(11);
  @$pb.TagNumber(14)
  void clearParkedAccessoryStateMaxUpdateRateMs() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.int get chargeScheduleStateMaxUpdateRateMs => $_getIZ(12);
  @$pb.TagNumber(15)
  set chargeScheduleStateMaxUpdateRateMs($core.int value) =>
      $_setSignedInt32(12, value);
  @$pb.TagNumber(15)
  $core.bool hasChargeScheduleStateMaxUpdateRateMs() => $_has(12);
  @$pb.TagNumber(15)
  void clearChargeScheduleStateMaxUpdateRateMs() => $_clearField(15);

  @$pb.TagNumber(16)
  $core.int get preconditioningScheduleStateMaxUpdateRateMs => $_getIZ(13);
  @$pb.TagNumber(16)
  set preconditioningScheduleStateMaxUpdateRateMs($core.int value) =>
      $_setSignedInt32(13, value);
  @$pb.TagNumber(16)
  $core.bool hasPreconditioningScheduleStateMaxUpdateRateMs() => $_has(13);
  @$pb.TagNumber(16)
  void clearPreconditioningScheduleStateMaxUpdateRateMs() => $_clearField(16);

  @$pb.TagNumber(17)
  $core.int get alertStateMaxUpdateRateMs => $_getIZ(14);
  @$pb.TagNumber(17)
  set alertStateMaxUpdateRateMs($core.int value) => $_setSignedInt32(14, value);
  @$pb.TagNumber(17)
  $core.bool hasAlertStateMaxUpdateRateMs() => $_has(14);
  @$pb.TagNumber(17)
  void clearAlertStateMaxUpdateRateMs() => $_clearField(17);

  @$pb.TagNumber(18)
  $core.int get suspensionStateMaxUpdateRateMs => $_getIZ(15);
  @$pb.TagNumber(18)
  set suspensionStateMaxUpdateRateMs($core.int value) =>
      $_setSignedInt32(15, value);
  @$pb.TagNumber(18)
  $core.bool hasSuspensionStateMaxUpdateRateMs() => $_has(15);
  @$pb.TagNumber(18)
  void clearSuspensionStateMaxUpdateRateMs() => $_clearField(18);
}

class VehicleDataAck extends $pb.GeneratedMessage {
  factory VehicleDataAck({
    $3.Timestamp? chargeStateTimestamp,
    $3.Timestamp? climateStateTimestamp,
    $3.Timestamp? closuresStateTimestamp,
    $3.Timestamp? driveStateTimestamp,
    $3.Timestamp? guiSettingsTimestamp,
    $3.Timestamp? locationStateTimestamp,
    $3.Timestamp? vehicleConfigTimestamp,
    $3.Timestamp? vehicleStateTimestamp,
    $core.Iterable<$core.int>? decryptionErrorField,
    $3.Timestamp? parkedAccessoryStateTimestamp,
    $3.Timestamp? chargeScheduleStateTimestamp,
    $3.Timestamp? preconditioningScheduleStateTimestamp,
    $3.Timestamp? alertStateTimestamp,
    $3.Timestamp? suspensionStateTimestamp,
  }) {
    final result = create();
    if (chargeStateTimestamp != null)
      result.chargeStateTimestamp = chargeStateTimestamp;
    if (climateStateTimestamp != null)
      result.climateStateTimestamp = climateStateTimestamp;
    if (closuresStateTimestamp != null)
      result.closuresStateTimestamp = closuresStateTimestamp;
    if (driveStateTimestamp != null)
      result.driveStateTimestamp = driveStateTimestamp;
    if (guiSettingsTimestamp != null)
      result.guiSettingsTimestamp = guiSettingsTimestamp;
    if (locationStateTimestamp != null)
      result.locationStateTimestamp = locationStateTimestamp;
    if (vehicleConfigTimestamp != null)
      result.vehicleConfigTimestamp = vehicleConfigTimestamp;
    if (vehicleStateTimestamp != null)
      result.vehicleStateTimestamp = vehicleStateTimestamp;
    if (decryptionErrorField != null)
      result.decryptionErrorField.addAll(decryptionErrorField);
    if (parkedAccessoryStateTimestamp != null)
      result.parkedAccessoryStateTimestamp = parkedAccessoryStateTimestamp;
    if (chargeScheduleStateTimestamp != null)
      result.chargeScheduleStateTimestamp = chargeScheduleStateTimestamp;
    if (preconditioningScheduleStateTimestamp != null)
      result.preconditioningScheduleStateTimestamp =
          preconditioningScheduleStateTimestamp;
    if (alertStateTimestamp != null)
      result.alertStateTimestamp = alertStateTimestamp;
    if (suspensionStateTimestamp != null)
      result.suspensionStateTimestamp = suspensionStateTimestamp;
    return result;
  }

  VehicleDataAck._();

  factory VehicleDataAck.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VehicleDataAck.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VehicleDataAck',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOM<$3.Timestamp>(2, _omitFieldNames ? '' : 'chargeStateTimestamp',
        subBuilder: $3.Timestamp.create)
    ..aOM<$3.Timestamp>(3, _omitFieldNames ? '' : 'climateStateTimestamp',
        subBuilder: $3.Timestamp.create)
    ..aOM<$3.Timestamp>(4, _omitFieldNames ? '' : 'closuresStateTimestamp',
        subBuilder: $3.Timestamp.create)
    ..aOM<$3.Timestamp>(5, _omitFieldNames ? '' : 'driveStateTimestamp',
        subBuilder: $3.Timestamp.create)
    ..aOM<$3.Timestamp>(6, _omitFieldNames ? '' : 'guiSettingsTimestamp',
        subBuilder: $3.Timestamp.create)
    ..aOM<$3.Timestamp>(7, _omitFieldNames ? '' : 'locationStateTimestamp',
        subBuilder: $3.Timestamp.create)
    ..aOM<$3.Timestamp>(8, _omitFieldNames ? '' : 'vehicleConfigTimestamp',
        subBuilder: $3.Timestamp.create)
    ..aOM<$3.Timestamp>(9, _omitFieldNames ? '' : 'vehicleStateTimestamp',
        subBuilder: $3.Timestamp.create)
    ..p<$core.int>(
        10, _omitFieldNames ? '' : 'decryptionErrorField', $pb.PbFieldType.K3)
    ..aOM<$3.Timestamp>(
        11, _omitFieldNames ? '' : 'parkedAccessoryStateTimestamp',
        subBuilder: $3.Timestamp.create)
    ..aOM<$3.Timestamp>(
        12, _omitFieldNames ? '' : 'chargeScheduleStateTimestamp',
        subBuilder: $3.Timestamp.create)
    ..aOM<$3.Timestamp>(
        13, _omitFieldNames ? '' : 'preconditioningScheduleStateTimestamp',
        subBuilder: $3.Timestamp.create)
    ..aOM<$3.Timestamp>(14, _omitFieldNames ? '' : 'alertStateTimestamp',
        subBuilder: $3.Timestamp.create)
    ..aOM<$3.Timestamp>(15, _omitFieldNames ? '' : 'suspensionStateTimestamp',
        subBuilder: $3.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VehicleDataAck clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VehicleDataAck copyWith(void Function(VehicleDataAck) updates) =>
      super.copyWith((message) => updates(message as VehicleDataAck))
          as VehicleDataAck;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VehicleDataAck create() => VehicleDataAck._();
  @$core.override
  VehicleDataAck createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VehicleDataAck getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VehicleDataAck>(create);
  static VehicleDataAck? _defaultInstance;

  /// Timestamps for different vehicle state types to acknowledge receipt
  @$pb.TagNumber(2)
  $3.Timestamp get chargeStateTimestamp => $_getN(0);
  @$pb.TagNumber(2)
  set chargeStateTimestamp($3.Timestamp value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasChargeStateTimestamp() => $_has(0);
  @$pb.TagNumber(2)
  void clearChargeStateTimestamp() => $_clearField(2);
  @$pb.TagNumber(2)
  $3.Timestamp ensureChargeStateTimestamp() => $_ensure(0);

  @$pb.TagNumber(3)
  $3.Timestamp get climateStateTimestamp => $_getN(1);
  @$pb.TagNumber(3)
  set climateStateTimestamp($3.Timestamp value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasClimateStateTimestamp() => $_has(1);
  @$pb.TagNumber(3)
  void clearClimateStateTimestamp() => $_clearField(3);
  @$pb.TagNumber(3)
  $3.Timestamp ensureClimateStateTimestamp() => $_ensure(1);

  @$pb.TagNumber(4)
  $3.Timestamp get closuresStateTimestamp => $_getN(2);
  @$pb.TagNumber(4)
  set closuresStateTimestamp($3.Timestamp value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasClosuresStateTimestamp() => $_has(2);
  @$pb.TagNumber(4)
  void clearClosuresStateTimestamp() => $_clearField(4);
  @$pb.TagNumber(4)
  $3.Timestamp ensureClosuresStateTimestamp() => $_ensure(2);

  @$pb.TagNumber(5)
  $3.Timestamp get driveStateTimestamp => $_getN(3);
  @$pb.TagNumber(5)
  set driveStateTimestamp($3.Timestamp value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasDriveStateTimestamp() => $_has(3);
  @$pb.TagNumber(5)
  void clearDriveStateTimestamp() => $_clearField(5);
  @$pb.TagNumber(5)
  $3.Timestamp ensureDriveStateTimestamp() => $_ensure(3);

  @$pb.TagNumber(6)
  $3.Timestamp get guiSettingsTimestamp => $_getN(4);
  @$pb.TagNumber(6)
  set guiSettingsTimestamp($3.Timestamp value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasGuiSettingsTimestamp() => $_has(4);
  @$pb.TagNumber(6)
  void clearGuiSettingsTimestamp() => $_clearField(6);
  @$pb.TagNumber(6)
  $3.Timestamp ensureGuiSettingsTimestamp() => $_ensure(4);

  @$pb.TagNumber(7)
  $3.Timestamp get locationStateTimestamp => $_getN(5);
  @$pb.TagNumber(7)
  set locationStateTimestamp($3.Timestamp value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasLocationStateTimestamp() => $_has(5);
  @$pb.TagNumber(7)
  void clearLocationStateTimestamp() => $_clearField(7);
  @$pb.TagNumber(7)
  $3.Timestamp ensureLocationStateTimestamp() => $_ensure(5);

  @$pb.TagNumber(8)
  $3.Timestamp get vehicleConfigTimestamp => $_getN(6);
  @$pb.TagNumber(8)
  set vehicleConfigTimestamp($3.Timestamp value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasVehicleConfigTimestamp() => $_has(6);
  @$pb.TagNumber(8)
  void clearVehicleConfigTimestamp() => $_clearField(8);
  @$pb.TagNumber(8)
  $3.Timestamp ensureVehicleConfigTimestamp() => $_ensure(6);

  @$pb.TagNumber(9)
  $3.Timestamp get vehicleStateTimestamp => $_getN(7);
  @$pb.TagNumber(9)
  set vehicleStateTimestamp($3.Timestamp value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasVehicleStateTimestamp() => $_has(7);
  @$pb.TagNumber(9)
  void clearVehicleStateTimestamp() => $_clearField(9);
  @$pb.TagNumber(9)
  $3.Timestamp ensureVehicleStateTimestamp() => $_ensure(7);

  /// Field to report decryption errors encountered during processing
  @$pb.TagNumber(10)
  $pb.PbList<$core.int> get decryptionErrorField => $_getList(8);

  @$pb.TagNumber(11)
  $3.Timestamp get parkedAccessoryStateTimestamp => $_getN(9);
  @$pb.TagNumber(11)
  set parkedAccessoryStateTimestamp($3.Timestamp value) =>
      $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasParkedAccessoryStateTimestamp() => $_has(9);
  @$pb.TagNumber(11)
  void clearParkedAccessoryStateTimestamp() => $_clearField(11);
  @$pb.TagNumber(11)
  $3.Timestamp ensureParkedAccessoryStateTimestamp() => $_ensure(9);

  @$pb.TagNumber(12)
  $3.Timestamp get chargeScheduleStateTimestamp => $_getN(10);
  @$pb.TagNumber(12)
  set chargeScheduleStateTimestamp($3.Timestamp value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasChargeScheduleStateTimestamp() => $_has(10);
  @$pb.TagNumber(12)
  void clearChargeScheduleStateTimestamp() => $_clearField(12);
  @$pb.TagNumber(12)
  $3.Timestamp ensureChargeScheduleStateTimestamp() => $_ensure(10);

  @$pb.TagNumber(13)
  $3.Timestamp get preconditioningScheduleStateTimestamp => $_getN(11);
  @$pb.TagNumber(13)
  set preconditioningScheduleStateTimestamp($3.Timestamp value) =>
      $_setField(13, value);
  @$pb.TagNumber(13)
  $core.bool hasPreconditioningScheduleStateTimestamp() => $_has(11);
  @$pb.TagNumber(13)
  void clearPreconditioningScheduleStateTimestamp() => $_clearField(13);
  @$pb.TagNumber(13)
  $3.Timestamp ensurePreconditioningScheduleStateTimestamp() => $_ensure(11);

  @$pb.TagNumber(14)
  $3.Timestamp get alertStateTimestamp => $_getN(12);
  @$pb.TagNumber(14)
  set alertStateTimestamp($3.Timestamp value) => $_setField(14, value);
  @$pb.TagNumber(14)
  $core.bool hasAlertStateTimestamp() => $_has(12);
  @$pb.TagNumber(14)
  void clearAlertStateTimestamp() => $_clearField(14);
  @$pb.TagNumber(14)
  $3.Timestamp ensureAlertStateTimestamp() => $_ensure(12);

  @$pb.TagNumber(15)
  $3.Timestamp get suspensionStateTimestamp => $_getN(13);
  @$pb.TagNumber(15)
  set suspensionStateTimestamp($3.Timestamp value) => $_setField(15, value);
  @$pb.TagNumber(15)
  $core.bool hasSuspensionStateTimestamp() => $_has(13);
  @$pb.TagNumber(15)
  void clearSuspensionStateTimestamp() => $_clearField(15);
  @$pb.TagNumber(15)
  $3.Timestamp ensureSuspensionStateTimestamp() => $_ensure(13);
}

class VitalsSubscription extends $pb.GeneratedMessage {
  factory VitalsSubscription({
    $core.int? sessionId,
  }) {
    final result = create();
    if (sessionId != null) result.sessionId = sessionId;
    return result;
  }

  VitalsSubscription._();

  factory VitalsSubscription.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VitalsSubscription.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VitalsSubscription',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'sessionId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VitalsSubscription clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VitalsSubscription copyWith(void Function(VitalsSubscription) updates) =>
      super.copyWith((message) => updates(message as VitalsSubscription))
          as VitalsSubscription;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VitalsSubscription create() => VitalsSubscription._();
  @$core.override
  VitalsSubscription createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VitalsSubscription getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VitalsSubscription>(create);
  static VitalsSubscription? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get sessionId => $_getIZ(0);
  @$pb.TagNumber(1)
  set sessionId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionId() => $_clearField(1);
}

class VitalsAck extends $pb.GeneratedMessage {
  factory VitalsAck() => create();

  VitalsAck._();

  factory VitalsAck.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VitalsAck.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VitalsAck',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VitalsAck clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VitalsAck copyWith(void Function(VitalsAck) updates) =>
      super.copyWith((message) => updates(message as VitalsAck)) as VitalsAck;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VitalsAck create() => VitalsAck._();
  @$core.override
  VitalsAck createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VitalsAck getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VitalsAck>(create);
  static VitalsAck? _defaultInstance;
}

class DashcamSaveClipAction extends $pb.GeneratedMessage {
  factory DashcamSaveClipAction() => create();

  DashcamSaveClipAction._();

  factory DashcamSaveClipAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DashcamSaveClipAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DashcamSaveClipAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DashcamSaveClipAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DashcamSaveClipAction copyWith(
          void Function(DashcamSaveClipAction) updates) =>
      super.copyWith((message) => updates(message as DashcamSaveClipAction))
          as DashcamSaveClipAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DashcamSaveClipAction create() => DashcamSaveClipAction._();
  @$core.override
  DashcamSaveClipAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DashcamSaveClipAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DashcamSaveClipAction>(create);
  static DashcamSaveClipAction? _defaultInstance;
}

class PiiKeyRequest extends $pb.GeneratedMessage {
  factory PiiKeyRequest({
    $core.String? subscriberPublicKey,
    $3.Timestamp? piiKeyExpiration,
  }) {
    final result = create();
    if (subscriberPublicKey != null)
      result.subscriberPublicKey = subscriberPublicKey;
    if (piiKeyExpiration != null) result.piiKeyExpiration = piiKeyExpiration;
    return result;
  }

  PiiKeyRequest._();

  factory PiiKeyRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PiiKeyRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PiiKeyRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOS(2, _omitFieldNames ? '' : 'subscriberPublicKey')
    ..aOM<$3.Timestamp>(4, _omitFieldNames ? '' : 'piiKeyExpiration',
        subBuilder: $3.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PiiKeyRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PiiKeyRequest copyWith(void Function(PiiKeyRequest) updates) =>
      super.copyWith((message) => updates(message as PiiKeyRequest))
          as PiiKeyRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PiiKeyRequest create() => PiiKeyRequest._();
  @$core.override
  PiiKeyRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PiiKeyRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PiiKeyRequest>(create);
  static PiiKeyRequest? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get subscriberPublicKey => $_getSZ(0);
  @$pb.TagNumber(2)
  set subscriberPublicKey($core.String value) => $_setString(0, value);
  @$pb.TagNumber(2)
  $core.bool hasSubscriberPublicKey() => $_has(0);
  @$pb.TagNumber(2)
  void clearSubscriberPublicKey() => $_clearField(2);

  @$pb.TagNumber(4)
  $3.Timestamp get piiKeyExpiration => $_getN(1);
  @$pb.TagNumber(4)
  set piiKeyExpiration($3.Timestamp value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasPiiKeyExpiration() => $_has(1);
  @$pb.TagNumber(4)
  void clearPiiKeyExpiration() => $_clearField(4);
  @$pb.TagNumber(4)
  $3.Timestamp ensurePiiKeyExpiration() => $_ensure(1);
}

class PseudonymSyncRequest extends $pb.GeneratedMessage {
  factory PseudonymSyncRequest({
    $core.List<$core.int>? lastKnownPseudonymHashed,
  }) {
    final result = create();
    if (lastKnownPseudonymHashed != null)
      result.lastKnownPseudonymHashed = lastKnownPseudonymHashed;
    return result;
  }

  PseudonymSyncRequest._();

  factory PseudonymSyncRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PseudonymSyncRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PseudonymSyncRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1,
        _omitFieldNames ? '' : 'lastKnownPseudonymHashed', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PseudonymSyncRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PseudonymSyncRequest copyWith(void Function(PseudonymSyncRequest) updates) =>
      super.copyWith((message) => updates(message as PseudonymSyncRequest))
          as PseudonymSyncRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PseudonymSyncRequest create() => PseudonymSyncRequest._();
  @$core.override
  PseudonymSyncRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PseudonymSyncRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PseudonymSyncRequest>(create);
  static PseudonymSyncRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get lastKnownPseudonymHashed => $_getN(0);
  @$pb.TagNumber(1)
  set lastKnownPseudonymHashed($core.List<$core.int> value) =>
      $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLastKnownPseudonymHashed() => $_has(0);
  @$pb.TagNumber(1)
  void clearLastKnownPseudonymHashed() => $_clearField(1);
}

class NavigationGpsRequest extends $pb.GeneratedMessage {
  factory NavigationGpsRequest({
    $core.double? lat,
    $core.double? lon,
    NavigationGpsRequest_RemoteNavTripOrder? order,
  }) {
    final result = create();
    if (lat != null) result.lat = lat;
    if (lon != null) result.lon = lon;
    if (order != null) result.order = order;
    return result;
  }

  NavigationGpsRequest._();

  factory NavigationGpsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NavigationGpsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NavigationGpsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aD(1, _omitFieldNames ? '' : 'lat')
    ..aD(2, _omitFieldNames ? '' : 'lon')
    ..aE<NavigationGpsRequest_RemoteNavTripOrder>(
        3, _omitFieldNames ? '' : 'order',
        enumValues: NavigationGpsRequest_RemoteNavTripOrder.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NavigationGpsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NavigationGpsRequest copyWith(void Function(NavigationGpsRequest) updates) =>
      super.copyWith((message) => updates(message as NavigationGpsRequest))
          as NavigationGpsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NavigationGpsRequest create() => NavigationGpsRequest._();
  @$core.override
  NavigationGpsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NavigationGpsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NavigationGpsRequest>(create);
  static NavigationGpsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get lat => $_getN(0);
  @$pb.TagNumber(1)
  set lat($core.double value) => $_setDouble(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLat() => $_has(0);
  @$pb.TagNumber(1)
  void clearLat() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get lon => $_getN(1);
  @$pb.TagNumber(2)
  set lon($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLon() => $_has(1);
  @$pb.TagNumber(2)
  void clearLon() => $_clearField(2);

  @$pb.TagNumber(3)
  NavigationGpsRequest_RemoteNavTripOrder get order => $_getN(2);
  @$pb.TagNumber(3)
  set order(NavigationGpsRequest_RemoteNavTripOrder value) =>
      $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasOrder() => $_has(2);
  @$pb.TagNumber(3)
  void clearOrder() => $_clearField(3);
}

class SetRateTariffRequest extends $pb.GeneratedMessage {
  factory SetRateTariffRequest() => create();

  SetRateTariffRequest._();

  factory SetRateTariffRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetRateTariffRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetRateTariffRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetRateTariffRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetRateTariffRequest copyWith(void Function(SetRateTariffRequest) updates) =>
      super.copyWith((message) => updates(message as SetRateTariffRequest))
          as SetRateTariffRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetRateTariffRequest create() => SetRateTariffRequest._();
  @$core.override
  SetRateTariffRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SetRateTariffRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetRateTariffRequest>(create);
  static SetRateTariffRequest? _defaultInstance;
}

class GetRateTariffRequest extends $pb.GeneratedMessage {
  factory GetRateTariffRequest() => create();

  GetRateTariffRequest._();

  factory GetRateTariffRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetRateTariffRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetRateTariffRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetRateTariffRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetRateTariffRequest copyWith(void Function(GetRateTariffRequest) updates) =>
      super.copyWith((message) => updates(message as GetRateTariffRequest))
          as GetRateTariffRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRateTariffRequest create() => GetRateTariffRequest._();
  @$core.override
  GetRateTariffRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetRateTariffRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetRateTariffRequest>(create);
  static GetRateTariffRequest? _defaultInstance;
}

class VideoRequestAction extends $pb.GeneratedMessage {
  factory VideoRequestAction({
    $core.String? url,
  }) {
    final result = create();
    if (url != null) result.url = url;
    return result;
  }

  VideoRequestAction._();

  factory VideoRequestAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VideoRequestAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VideoRequestAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VideoRequestAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VideoRequestAction copyWith(void Function(VideoRequestAction) updates) =>
      super.copyWith((message) => updates(message as VideoRequestAction))
          as VideoRequestAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VideoRequestAction create() => VideoRequestAction._();
  @$core.override
  VideoRequestAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VideoRequestAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VideoRequestAction>(create);
  static VideoRequestAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => $_clearField(1);
}

class TakeDrivenoteAction extends $pb.GeneratedMessage {
  factory TakeDrivenoteAction({
    $core.String? note,
  }) {
    final result = create();
    if (note != null) result.note = note;
    return result;
  }

  TakeDrivenoteAction._();

  factory TakeDrivenoteAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TakeDrivenoteAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TakeDrivenoteAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'note')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TakeDrivenoteAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TakeDrivenoteAction copyWith(void Function(TakeDrivenoteAction) updates) =>
      super.copyWith((message) => updates(message as TakeDrivenoteAction))
          as TakeDrivenoteAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TakeDrivenoteAction create() => TakeDrivenoteAction._();
  @$core.override
  TakeDrivenoteAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TakeDrivenoteAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TakeDrivenoteAction>(create);
  static TakeDrivenoteAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get note => $_getSZ(0);
  @$pb.TagNumber(1)
  set note($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNote() => $_has(0);
  @$pb.TagNumber(1)
  void clearNote() => $_clearField(1);
}

class BluetoothClassicPairingRequest extends $pb.GeneratedMessage {
  factory BluetoothClassicPairingRequest({
    $core.String? utf8Name,
    $core.List<$core.int>? macAddress,
  }) {
    final result = create();
    if (utf8Name != null) result.utf8Name = utf8Name;
    if (macAddress != null) result.macAddress = macAddress;
    return result;
  }

  BluetoothClassicPairingRequest._();

  factory BluetoothClassicPairingRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BluetoothClassicPairingRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BluetoothClassicPairingRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'utf8Name')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'macAddress', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BluetoothClassicPairingRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BluetoothClassicPairingRequest copyWith(
          void Function(BluetoothClassicPairingRequest) updates) =>
      super.copyWith(
              (message) => updates(message as BluetoothClassicPairingRequest))
          as BluetoothClassicPairingRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BluetoothClassicPairingRequest create() =>
      BluetoothClassicPairingRequest._();
  @$core.override
  BluetoothClassicPairingRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BluetoothClassicPairingRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BluetoothClassicPairingRequest>(create);
  static BluetoothClassicPairingRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get utf8Name => $_getSZ(0);
  @$pb.TagNumber(1)
  set utf8Name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUtf8Name() => $_has(0);
  @$pb.TagNumber(1)
  void clearUtf8Name() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get macAddress => $_getN(1);
  @$pb.TagNumber(2)
  set macAddress($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMacAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearMacAddress() => $_clearField(2);
}

class AddManagedChargingSiteRequest extends $pb.GeneratedMessage {
  factory AddManagedChargingSiteRequest() => create();

  AddManagedChargingSiteRequest._();

  factory AddManagedChargingSiteRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddManagedChargingSiteRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddManagedChargingSiteRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddManagedChargingSiteRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddManagedChargingSiteRequest copyWith(
          void Function(AddManagedChargingSiteRequest) updates) =>
      super.copyWith(
              (message) => updates(message as AddManagedChargingSiteRequest))
          as AddManagedChargingSiteRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddManagedChargingSiteRequest create() =>
      AddManagedChargingSiteRequest._();
  @$core.override
  AddManagedChargingSiteRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AddManagedChargingSiteRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddManagedChargingSiteRequest>(create);
  static AddManagedChargingSiteRequest? _defaultInstance;
}

class RemoveManagedChargingSiteRequest extends $pb.GeneratedMessage {
  factory RemoveManagedChargingSiteRequest({
    $core.String? publicKey,
  }) {
    final result = create();
    if (publicKey != null) result.publicKey = publicKey;
    return result;
  }

  RemoveManagedChargingSiteRequest._();

  factory RemoveManagedChargingSiteRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoveManagedChargingSiteRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoveManagedChargingSiteRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'publicKey')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoveManagedChargingSiteRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoveManagedChargingSiteRequest copyWith(
          void Function(RemoveManagedChargingSiteRequest) updates) =>
      super.copyWith(
              (message) => updates(message as RemoveManagedChargingSiteRequest))
          as RemoveManagedChargingSiteRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveManagedChargingSiteRequest create() =>
      RemoveManagedChargingSiteRequest._();
  @$core.override
  RemoveManagedChargingSiteRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RemoveManagedChargingSiteRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoveManagedChargingSiteRequest>(
          create);
  static RemoveManagedChargingSiteRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get publicKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set publicKey($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPublicKey() => $_clearField(1);
}

class NavigationRouteAction extends $pb.GeneratedMessage {
  factory NavigationRouteAction() => create();

  NavigationRouteAction._();

  factory NavigationRouteAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NavigationRouteAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NavigationRouteAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NavigationRouteAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NavigationRouteAction copyWith(
          void Function(NavigationRouteAction) updates) =>
      super.copyWith((message) => updates(message as NavigationRouteAction))
          as NavigationRouteAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NavigationRouteAction create() => NavigationRouteAction._();
  @$core.override
  NavigationRouteAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NavigationRouteAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NavigationRouteAction>(create);
  static NavigationRouteAction? _defaultInstance;
}

class AutoStwHeatAction extends $pb.GeneratedMessage {
  factory AutoStwHeatAction({
    $core.bool? on,
  }) {
    final result = create();
    if (on != null) result.on = on;
    return result;
  }

  AutoStwHeatAction._();

  factory AutoStwHeatAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AutoStwHeatAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AutoStwHeatAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'on')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AutoStwHeatAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AutoStwHeatAction copyWith(void Function(AutoStwHeatAction) updates) =>
      super.copyWith((message) => updates(message as AutoStwHeatAction))
          as AutoStwHeatAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AutoStwHeatAction create() => AutoStwHeatAction._();
  @$core.override
  AutoStwHeatAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AutoStwHeatAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AutoStwHeatAction>(create);
  static AutoStwHeatAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get on => $_getBF(0);
  @$pb.TagNumber(1)
  set on($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOn() => $_has(0);
  @$pb.TagNumber(1)
  void clearOn() => $_clearField(1);
}

class StwHeatLevelAction extends $pb.GeneratedMessage {
  factory StwHeatLevelAction({
    $1.StwHeatLevel? stwHeatLevel,
  }) {
    final result = create();
    if (stwHeatLevel != null) result.stwHeatLevel = stwHeatLevel;
    return result;
  }

  StwHeatLevelAction._();

  factory StwHeatLevelAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StwHeatLevelAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StwHeatLevelAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aE<$1.StwHeatLevel>(1, _omitFieldNames ? '' : 'stwHeatLevel',
        enumValues: $1.StwHeatLevel.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StwHeatLevelAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StwHeatLevelAction copyWith(void Function(StwHeatLevelAction) updates) =>
      super.copyWith((message) => updates(message as StwHeatLevelAction))
          as StwHeatLevelAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StwHeatLevelAction create() => StwHeatLevelAction._();
  @$core.override
  StwHeatLevelAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StwHeatLevelAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StwHeatLevelAction>(create);
  static StwHeatLevelAction? _defaultInstance;

  @$pb.TagNumber(1)
  $1.StwHeatLevel get stwHeatLevel => $_getN(0);
  @$pb.TagNumber(1)
  set stwHeatLevel($1.StwHeatLevel value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStwHeatLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearStwHeatLevel() => $_clearField(1);
}

class GetManagedChargingSitesRequest extends $pb.GeneratedMessage {
  factory GetManagedChargingSitesRequest() => create();

  GetManagedChargingSitesRequest._();

  factory GetManagedChargingSitesRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetManagedChargingSitesRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetManagedChargingSitesRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetManagedChargingSitesRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetManagedChargingSitesRequest copyWith(
          void Function(GetManagedChargingSitesRequest) updates) =>
      super.copyWith(
              (message) => updates(message as GetManagedChargingSitesRequest))
          as GetManagedChargingSitesRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetManagedChargingSitesRequest create() =>
      GetManagedChargingSitesRequest._();
  @$core.override
  GetManagedChargingSitesRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetManagedChargingSitesRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetManagedChargingSitesRequest>(create);
  static GetManagedChargingSitesRequest? _defaultInstance;
}

class UpdateChargeOnSolarFeatureRequest extends $pb.GeneratedMessage {
  factory UpdateChargeOnSolarFeatureRequest({
    ChargeOnSolarFeature? chargeOnSolar,
  }) {
    final result = create();
    if (chargeOnSolar != null) result.chargeOnSolar = chargeOnSolar;
    return result;
  }

  UpdateChargeOnSolarFeatureRequest._();

  factory UpdateChargeOnSolarFeatureRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateChargeOnSolarFeatureRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateChargeOnSolarFeatureRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOM<ChargeOnSolarFeature>(1, _omitFieldNames ? '' : 'chargeOnSolar',
        subBuilder: ChargeOnSolarFeature.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateChargeOnSolarFeatureRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateChargeOnSolarFeatureRequest copyWith(
          void Function(UpdateChargeOnSolarFeatureRequest) updates) =>
      super.copyWith((message) =>
              updates(message as UpdateChargeOnSolarFeatureRequest))
          as UpdateChargeOnSolarFeatureRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateChargeOnSolarFeatureRequest create() =>
      UpdateChargeOnSolarFeatureRequest._();
  @$core.override
  UpdateChargeOnSolarFeatureRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UpdateChargeOnSolarFeatureRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateChargeOnSolarFeatureRequest>(
          create);
  static UpdateChargeOnSolarFeatureRequest? _defaultInstance;

  @$pb.TagNumber(1)
  ChargeOnSolarFeature get chargeOnSolar => $_getN(0);
  @$pb.TagNumber(1)
  set chargeOnSolar(ChargeOnSolarFeature value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasChargeOnSolar() => $_has(0);
  @$pb.TagNumber(1)
  void clearChargeOnSolar() => $_clearField(1);
  @$pb.TagNumber(1)
  ChargeOnSolarFeature ensureChargeOnSolar() => $_ensure(0);
}

class GetChargeOnSolarFeatureRequest extends $pb.GeneratedMessage {
  factory GetChargeOnSolarFeatureRequest() => create();

  GetChargeOnSolarFeatureRequest._();

  factory GetChargeOnSolarFeatureRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetChargeOnSolarFeatureRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetChargeOnSolarFeatureRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetChargeOnSolarFeatureRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetChargeOnSolarFeatureRequest copyWith(
          void Function(GetChargeOnSolarFeatureRequest) updates) =>
      super.copyWith(
              (message) => updates(message as GetChargeOnSolarFeatureRequest))
          as GetChargeOnSolarFeatureRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetChargeOnSolarFeatureRequest create() =>
      GetChargeOnSolarFeatureRequest._();
  @$core.override
  GetChargeOnSolarFeatureRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetChargeOnSolarFeatureRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetChargeOnSolarFeatureRequest>(create);
  static GetChargeOnSolarFeatureRequest? _defaultInstance;
}

class ChargeOnSolarFeature extends $pb.GeneratedMessage {
  factory ChargeOnSolarFeature({
    $core.bool? enabled,
    $core.double? lowerChargeLimit,
    $core.double? upperChargeLimit,
  }) {
    final result = create();
    if (enabled != null) result.enabled = enabled;
    if (lowerChargeLimit != null) result.lowerChargeLimit = lowerChargeLimit;
    if (upperChargeLimit != null) result.upperChargeLimit = upperChargeLimit;
    return result;
  }

  ChargeOnSolarFeature._();

  factory ChargeOnSolarFeature.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChargeOnSolarFeature.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChargeOnSolarFeature',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'enabled')
    ..aD(2, _omitFieldNames ? '' : 'lowerChargeLimit',
        fieldType: $pb.PbFieldType.OF)
    ..aD(3, _omitFieldNames ? '' : 'upperChargeLimit',
        fieldType: $pb.PbFieldType.OF)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChargeOnSolarFeature clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChargeOnSolarFeature copyWith(void Function(ChargeOnSolarFeature) updates) =>
      super.copyWith((message) => updates(message as ChargeOnSolarFeature))
          as ChargeOnSolarFeature;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChargeOnSolarFeature create() => ChargeOnSolarFeature._();
  @$core.override
  ChargeOnSolarFeature createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChargeOnSolarFeature getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChargeOnSolarFeature>(create);
  static ChargeOnSolarFeature? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get enabled => $_getBF(0);
  @$pb.TagNumber(1)
  set enabled($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEnabled() => $_has(0);
  @$pb.TagNumber(1)
  void clearEnabled() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get lowerChargeLimit => $_getN(1);
  @$pb.TagNumber(2)
  set lowerChargeLimit($core.double value) => $_setFloat(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLowerChargeLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLowerChargeLimit() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get upperChargeLimit => $_getN(2);
  @$pb.TagNumber(3)
  set upperChargeLimit($core.double value) => $_setFloat(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUpperChargeLimit() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpperChargeLimit() => $_clearField(3);
}

class DrivingClearSpeedLimitPinAdminAction extends $pb.GeneratedMessage {
  factory DrivingClearSpeedLimitPinAdminAction() => create();

  DrivingClearSpeedLimitPinAdminAction._();

  factory DrivingClearSpeedLimitPinAdminAction.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DrivingClearSpeedLimitPinAdminAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DrivingClearSpeedLimitPinAdminAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DrivingClearSpeedLimitPinAdminAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DrivingClearSpeedLimitPinAdminAction copyWith(
          void Function(DrivingClearSpeedLimitPinAdminAction) updates) =>
      super.copyWith((message) =>
              updates(message as DrivingClearSpeedLimitPinAdminAction))
          as DrivingClearSpeedLimitPinAdminAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DrivingClearSpeedLimitPinAdminAction create() =>
      DrivingClearSpeedLimitPinAdminAction._();
  @$core.override
  DrivingClearSpeedLimitPinAdminAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DrivingClearSpeedLimitPinAdminAction getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          DrivingClearSpeedLimitPinAdminAction>(create);
  static DrivingClearSpeedLimitPinAdminAction? _defaultInstance;
}

class SetOutletsOnOffAction extends $pb.GeneratedMessage {
  factory SetOutletsOnOffAction({
    SetOutletsOnOffAction_OutletRequest? outletRequest,
  }) {
    final result = create();
    if (outletRequest != null) result.outletRequest = outletRequest;
    return result;
  }

  SetOutletsOnOffAction._();

  factory SetOutletsOnOffAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetOutletsOnOffAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetOutletsOnOffAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aE<SetOutletsOnOffAction_OutletRequest>(
        1, _omitFieldNames ? '' : 'outletRequest',
        enumValues: SetOutletsOnOffAction_OutletRequest.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetOutletsOnOffAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetOutletsOnOffAction copyWith(
          void Function(SetOutletsOnOffAction) updates) =>
      super.copyWith((message) => updates(message as SetOutletsOnOffAction))
          as SetOutletsOnOffAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetOutletsOnOffAction create() => SetOutletsOnOffAction._();
  @$core.override
  SetOutletsOnOffAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SetOutletsOnOffAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetOutletsOnOffAction>(create);
  static SetOutletsOnOffAction? _defaultInstance;

  @$pb.TagNumber(1)
  SetOutletsOnOffAction_OutletRequest get outletRequest => $_getN(0);
  @$pb.TagNumber(1)
  set outletRequest(SetOutletsOnOffAction_OutletRequest value) =>
      $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasOutletRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearOutletRequest() => $_clearField(1);
}

class SetOutletTimerAction extends $pb.GeneratedMessage {
  factory SetOutletTimerAction({
    $core.int? numMinutes,
  }) {
    final result = create();
    if (numMinutes != null) result.numMinutes = numMinutes;
    return result;
  }

  SetOutletTimerAction._();

  factory SetOutletTimerAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetOutletTimerAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetOutletTimerAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'numMinutes')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetOutletTimerAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetOutletTimerAction copyWith(void Function(SetOutletTimerAction) updates) =>
      super.copyWith((message) => updates(message as SetOutletTimerAction))
          as SetOutletTimerAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetOutletTimerAction create() => SetOutletTimerAction._();
  @$core.override
  SetOutletTimerAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SetOutletTimerAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetOutletTimerAction>(create);
  static SetOutletTimerAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get numMinutes => $_getIZ(0);
  @$pb.TagNumber(1)
  set numMinutes($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNumMinutes() => $_has(0);
  @$pb.TagNumber(1)
  void clearNumMinutes() => $_clearField(1);
}

class SetOutletSocLimitAction extends $pb.GeneratedMessage {
  factory SetOutletSocLimitAction({
    $core.int? percent,
  }) {
    final result = create();
    if (percent != null) result.percent = percent;
    return result;
  }

  SetOutletSocLimitAction._();

  factory SetOutletSocLimitAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetOutletSocLimitAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetOutletSocLimitAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'percent')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetOutletSocLimitAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetOutletSocLimitAction copyWith(
          void Function(SetOutletSocLimitAction) updates) =>
      super.copyWith((message) => updates(message as SetOutletSocLimitAction))
          as SetOutletSocLimitAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetOutletSocLimitAction create() => SetOutletSocLimitAction._();
  @$core.override
  SetOutletSocLimitAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SetOutletSocLimitAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetOutletSocLimitAction>(create);
  static SetOutletSocLimitAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get percent => $_getIZ(0);
  @$pb.TagNumber(1)
  set percent($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPercent() => $_has(0);
  @$pb.TagNumber(1)
  void clearPercent() => $_clearField(1);
}

class SetPowerFeedOnOffAction extends $pb.GeneratedMessage {
  factory SetPowerFeedOnOffAction({
    SetPowerFeedOnOffAction_PowerFeedRequest? powerFeedRequest,
  }) {
    final result = create();
    if (powerFeedRequest != null) result.powerFeedRequest = powerFeedRequest;
    return result;
  }

  SetPowerFeedOnOffAction._();

  factory SetPowerFeedOnOffAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetPowerFeedOnOffAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetPowerFeedOnOffAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aE<SetPowerFeedOnOffAction_PowerFeedRequest>(
        1, _omitFieldNames ? '' : 'powerFeedRequest',
        enumValues: SetPowerFeedOnOffAction_PowerFeedRequest.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetPowerFeedOnOffAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetPowerFeedOnOffAction copyWith(
          void Function(SetPowerFeedOnOffAction) updates) =>
      super.copyWith((message) => updates(message as SetPowerFeedOnOffAction))
          as SetPowerFeedOnOffAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetPowerFeedOnOffAction create() => SetPowerFeedOnOffAction._();
  @$core.override
  SetPowerFeedOnOffAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SetPowerFeedOnOffAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetPowerFeedOnOffAction>(create);
  static SetPowerFeedOnOffAction? _defaultInstance;

  @$pb.TagNumber(1)
  SetPowerFeedOnOffAction_PowerFeedRequest get powerFeedRequest => $_getN(0);
  @$pb.TagNumber(1)
  set powerFeedRequest(SetPowerFeedOnOffAction_PowerFeedRequest value) =>
      $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPowerFeedRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearPowerFeedRequest() => $_clearField(1);
}

class SetPowerFeedTimerAction extends $pb.GeneratedMessage {
  factory SetPowerFeedTimerAction({
    $core.int? numMinutes,
  }) {
    final result = create();
    if (numMinutes != null) result.numMinutes = numMinutes;
    return result;
  }

  SetPowerFeedTimerAction._();

  factory SetPowerFeedTimerAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetPowerFeedTimerAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetPowerFeedTimerAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'numMinutes')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetPowerFeedTimerAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetPowerFeedTimerAction copyWith(
          void Function(SetPowerFeedTimerAction) updates) =>
      super.copyWith((message) => updates(message as SetPowerFeedTimerAction))
          as SetPowerFeedTimerAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetPowerFeedTimerAction create() => SetPowerFeedTimerAction._();
  @$core.override
  SetPowerFeedTimerAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SetPowerFeedTimerAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetPowerFeedTimerAction>(create);
  static SetPowerFeedTimerAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get numMinutes => $_getIZ(0);
  @$pb.TagNumber(1)
  set numMinutes($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNumMinutes() => $_has(0);
  @$pb.TagNumber(1)
  void clearNumMinutes() => $_clearField(1);
}

class SetPowerFeedSocLimitAction extends $pb.GeneratedMessage {
  factory SetPowerFeedSocLimitAction({
    $core.int? percent,
  }) {
    final result = create();
    if (percent != null) result.percent = percent;
    return result;
  }

  SetPowerFeedSocLimitAction._();

  factory SetPowerFeedSocLimitAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetPowerFeedSocLimitAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetPowerFeedSocLimitAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'percent')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetPowerFeedSocLimitAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetPowerFeedSocLimitAction copyWith(
          void Function(SetPowerFeedSocLimitAction) updates) =>
      super.copyWith(
              (message) => updates(message as SetPowerFeedSocLimitAction))
          as SetPowerFeedSocLimitAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetPowerFeedSocLimitAction create() => SetPowerFeedSocLimitAction._();
  @$core.override
  SetPowerFeedSocLimitAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SetPowerFeedSocLimitAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetPowerFeedSocLimitAction>(create);
  static SetPowerFeedSocLimitAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get percent => $_getIZ(0);
  @$pb.TagNumber(1)
  set percent($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPercent() => $_has(0);
  @$pb.TagNumber(1)
  void clearPercent() => $_clearField(1);
}

class SetTrailerLightTestStartStopAction extends $pb.GeneratedMessage {
  factory SetTrailerLightTestStartStopAction({
    $core.bool? startStop,
  }) {
    final result = create();
    if (startStop != null) result.startStop = startStop;
    return result;
  }

  SetTrailerLightTestStartStopAction._();

  factory SetTrailerLightTestStartStopAction.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetTrailerLightTestStartStopAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetTrailerLightTestStartStopAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'startStop')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetTrailerLightTestStartStopAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetTrailerLightTestStartStopAction copyWith(
          void Function(SetTrailerLightTestStartStopAction) updates) =>
      super.copyWith((message) =>
              updates(message as SetTrailerLightTestStartStopAction))
          as SetTrailerLightTestStartStopAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetTrailerLightTestStartStopAction create() =>
      SetTrailerLightTestStartStopAction._();
  @$core.override
  SetTrailerLightTestStartStopAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SetTrailerLightTestStartStopAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetTrailerLightTestStartStopAction>(
          create);
  static SetTrailerLightTestStartStopAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get startStop => $_getBF(0);
  @$pb.TagNumber(1)
  set startStop($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStartStop() => $_has(0);
  @$pb.TagNumber(1)
  void clearStartStop() => $_clearField(1);
}

class SetTruckBedLightAutoStateAction extends $pb.GeneratedMessage {
  factory SetTruckBedLightAutoStateAction({
    $core.bool? powerState,
  }) {
    final result = create();
    if (powerState != null) result.powerState = powerState;
    return result;
  }

  SetTruckBedLightAutoStateAction._();

  factory SetTruckBedLightAutoStateAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetTruckBedLightAutoStateAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetTruckBedLightAutoStateAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'powerState')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetTruckBedLightAutoStateAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetTruckBedLightAutoStateAction copyWith(
          void Function(SetTruckBedLightAutoStateAction) updates) =>
      super.copyWith(
              (message) => updates(message as SetTruckBedLightAutoStateAction))
          as SetTruckBedLightAutoStateAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetTruckBedLightAutoStateAction create() =>
      SetTruckBedLightAutoStateAction._();
  @$core.override
  SetTruckBedLightAutoStateAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SetTruckBedLightAutoStateAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetTruckBedLightAutoStateAction>(
          create);
  static SetTruckBedLightAutoStateAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get powerState => $_getBF(0);
  @$pb.TagNumber(1)
  set powerState($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPowerState() => $_has(0);
  @$pb.TagNumber(1)
  void clearPowerState() => $_clearField(1);
}

class SetTruckBedLightBrightnessAction extends $pb.GeneratedMessage {
  factory SetTruckBedLightBrightnessAction({
    $core.int? brightness,
  }) {
    final result = create();
    if (brightness != null) result.brightness = brightness;
    return result;
  }

  SetTruckBedLightBrightnessAction._();

  factory SetTruckBedLightBrightnessAction.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetTruckBedLightBrightnessAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetTruckBedLightBrightnessAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'brightness', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetTruckBedLightBrightnessAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetTruckBedLightBrightnessAction copyWith(
          void Function(SetTruckBedLightBrightnessAction) updates) =>
      super.copyWith(
              (message) => updates(message as SetTruckBedLightBrightnessAction))
          as SetTruckBedLightBrightnessAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetTruckBedLightBrightnessAction create() =>
      SetTruckBedLightBrightnessAction._();
  @$core.override
  SetTruckBedLightBrightnessAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SetTruckBedLightBrightnessAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetTruckBedLightBrightnessAction>(
          create);
  static SetTruckBedLightBrightnessAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get brightness => $_getIZ(0);
  @$pb.TagNumber(1)
  set brightness($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBrightness() => $_has(0);
  @$pb.TagNumber(1)
  void clearBrightness() => $_clearField(1);
}

class VehicleControlResetPinToDriveAdminAction extends $pb.GeneratedMessage {
  factory VehicleControlResetPinToDriveAdminAction() => create();

  VehicleControlResetPinToDriveAdminAction._();

  factory VehicleControlResetPinToDriveAdminAction.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VehicleControlResetPinToDriveAdminAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VehicleControlResetPinToDriveAdminAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VehicleControlResetPinToDriveAdminAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VehicleControlResetPinToDriveAdminAction copyWith(
          void Function(VehicleControlResetPinToDriveAdminAction) updates) =>
      super.copyWith((message) =>
              updates(message as VehicleControlResetPinToDriveAdminAction))
          as VehicleControlResetPinToDriveAdminAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VehicleControlResetPinToDriveAdminAction create() =>
      VehicleControlResetPinToDriveAdminAction._();
  @$core.override
  VehicleControlResetPinToDriveAdminAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VehicleControlResetPinToDriveAdminAction getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          VehicleControlResetPinToDriveAdminAction>(create);
  static VehicleControlResetPinToDriveAdminAction? _defaultInstance;
}

class NavigationWaypointsRequest_TripPlanOptions extends $pb.GeneratedMessage {
  factory NavigationWaypointsRequest_TripPlanOptions({
    $core.int? destinationStartSoe,
    $core.int? destinationArrivalSoe,
  }) {
    final result = create();
    if (destinationStartSoe != null)
      result.destinationStartSoe = destinationStartSoe;
    if (destinationArrivalSoe != null)
      result.destinationArrivalSoe = destinationArrivalSoe;
    return result;
  }

  NavigationWaypointsRequest_TripPlanOptions._();

  factory NavigationWaypointsRequest_TripPlanOptions.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NavigationWaypointsRequest_TripPlanOptions.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NavigationWaypointsRequest.TripPlanOptions',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'destinationStartSoe')
    ..aI(2, _omitFieldNames ? '' : 'destinationArrivalSoe')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NavigationWaypointsRequest_TripPlanOptions clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NavigationWaypointsRequest_TripPlanOptions copyWith(
          void Function(NavigationWaypointsRequest_TripPlanOptions) updates) =>
      super.copyWith((message) =>
              updates(message as NavigationWaypointsRequest_TripPlanOptions))
          as NavigationWaypointsRequest_TripPlanOptions;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NavigationWaypointsRequest_TripPlanOptions create() =>
      NavigationWaypointsRequest_TripPlanOptions._();
  @$core.override
  NavigationWaypointsRequest_TripPlanOptions createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NavigationWaypointsRequest_TripPlanOptions getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          NavigationWaypointsRequest_TripPlanOptions>(create);
  static NavigationWaypointsRequest_TripPlanOptions? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get destinationStartSoe => $_getIZ(0);
  @$pb.TagNumber(1)
  set destinationStartSoe($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDestinationStartSoe() => $_has(0);
  @$pb.TagNumber(1)
  void clearDestinationStartSoe() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get destinationArrivalSoe => $_getIZ(1);
  @$pb.TagNumber(2)
  set destinationArrivalSoe($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDestinationArrivalSoe() => $_has(1);
  @$pb.TagNumber(2)
  void clearDestinationArrivalSoe() => $_clearField(2);
}

class NavigationWaypointsRequest extends $pb.GeneratedMessage {
  factory NavigationWaypointsRequest({
    $core.String? waypoints,
    NavigationWaypointsRequest_TripPlanOptions? tripPlanOptions,
  }) {
    final result = create();
    if (waypoints != null) result.waypoints = waypoints;
    if (tripPlanOptions != null) result.tripPlanOptions = tripPlanOptions;
    return result;
  }

  NavigationWaypointsRequest._();

  factory NavigationWaypointsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NavigationWaypointsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NavigationWaypointsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'waypoints')
    ..aOM<NavigationWaypointsRequest_TripPlanOptions>(
        2, _omitFieldNames ? '' : 'tripPlanOptions',
        subBuilder: NavigationWaypointsRequest_TripPlanOptions.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NavigationWaypointsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NavigationWaypointsRequest copyWith(
          void Function(NavigationWaypointsRequest) updates) =>
      super.copyWith(
              (message) => updates(message as NavigationWaypointsRequest))
          as NavigationWaypointsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NavigationWaypointsRequest create() => NavigationWaypointsRequest._();
  @$core.override
  NavigationWaypointsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NavigationWaypointsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NavigationWaypointsRequest>(create);
  static NavigationWaypointsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get waypoints => $_getSZ(0);
  @$pb.TagNumber(1)
  set waypoints($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWaypoints() => $_has(0);
  @$pb.TagNumber(1)
  void clearWaypoints() => $_clearField(1);

  @$pb.TagNumber(2)
  NavigationWaypointsRequest_TripPlanOptions get tripPlanOptions => $_getN(1);
  @$pb.TagNumber(2)
  set tripPlanOptions(NavigationWaypointsRequest_TripPlanOptions value) =>
      $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasTripPlanOptions() => $_has(1);
  @$pb.TagNumber(2)
  void clearTripPlanOptions() => $_clearField(2);
  @$pb.TagNumber(2)
  NavigationWaypointsRequest_TripPlanOptions ensureTripPlanOptions() =>
      $_ensure(1);
}

class SetPowershareFeatureAction extends $pb.GeneratedMessage {
  factory SetPowershareFeatureAction({
    SetPowershareFeatureAction_PowershareFeatureRequest?
        powershareFeatureRequest,
  }) {
    final result = create();
    if (powershareFeatureRequest != null)
      result.powershareFeatureRequest = powershareFeatureRequest;
    return result;
  }

  SetPowershareFeatureAction._();

  factory SetPowershareFeatureAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetPowershareFeatureAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetPowershareFeatureAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aE<SetPowershareFeatureAction_PowershareFeatureRequest>(
        1, _omitFieldNames ? '' : 'powershareFeatureRequest',
        enumValues: SetPowershareFeatureAction_PowershareFeatureRequest.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetPowershareFeatureAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetPowershareFeatureAction copyWith(
          void Function(SetPowershareFeatureAction) updates) =>
      super.copyWith(
              (message) => updates(message as SetPowershareFeatureAction))
          as SetPowershareFeatureAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetPowershareFeatureAction create() => SetPowershareFeatureAction._();
  @$core.override
  SetPowershareFeatureAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SetPowershareFeatureAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetPowershareFeatureAction>(create);
  static SetPowershareFeatureAction? _defaultInstance;

  @$pb.TagNumber(1)
  SetPowershareFeatureAction_PowershareFeatureRequest
      get powershareFeatureRequest => $_getN(0);
  @$pb.TagNumber(1)
  set powershareFeatureRequest(
          SetPowershareFeatureAction_PowershareFeatureRequest value) =>
      $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPowershareFeatureRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearPowershareFeatureRequest() => $_clearField(1);
}

class SetPowershareDischargeLimitAction extends $pb.GeneratedMessage {
  factory SetPowershareDischargeLimitAction({
    $core.int? powershareDischargeLimit,
  }) {
    final result = create();
    if (powershareDischargeLimit != null)
      result.powershareDischargeLimit = powershareDischargeLimit;
    return result;
  }

  SetPowershareDischargeLimitAction._();

  factory SetPowershareDischargeLimitAction.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetPowershareDischargeLimitAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetPowershareDischargeLimitAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'powershareDischargeLimit')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetPowershareDischargeLimitAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetPowershareDischargeLimitAction copyWith(
          void Function(SetPowershareDischargeLimitAction) updates) =>
      super.copyWith((message) =>
              updates(message as SetPowershareDischargeLimitAction))
          as SetPowershareDischargeLimitAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetPowershareDischargeLimitAction create() =>
      SetPowershareDischargeLimitAction._();
  @$core.override
  SetPowershareDischargeLimitAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SetPowershareDischargeLimitAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetPowershareDischargeLimitAction>(
          create);
  static SetPowershareDischargeLimitAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get powershareDischargeLimit => $_getIZ(0);
  @$pb.TagNumber(1)
  set powershareDischargeLimit($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPowershareDischargeLimit() => $_has(0);
  @$pb.TagNumber(1)
  void clearPowershareDischargeLimit() => $_clearField(1);
}

class SetPowershareRequestAction extends $pb.GeneratedMessage {
  factory SetPowershareRequestAction({
    SetPowershareRequestAction_PowershareRequest? powershareRequest,
  }) {
    final result = create();
    if (powershareRequest != null) result.powershareRequest = powershareRequest;
    return result;
  }

  SetPowershareRequestAction._();

  factory SetPowershareRequestAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetPowershareRequestAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetPowershareRequestAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aE<SetPowershareRequestAction_PowershareRequest>(
        1, _omitFieldNames ? '' : 'powershareRequest',
        enumValues: SetPowershareRequestAction_PowershareRequest.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetPowershareRequestAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetPowershareRequestAction copyWith(
          void Function(SetPowershareRequestAction) updates) =>
      super.copyWith(
              (message) => updates(message as SetPowershareRequestAction))
          as SetPowershareRequestAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetPowershareRequestAction create() => SetPowershareRequestAction._();
  @$core.override
  SetPowershareRequestAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SetPowershareRequestAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetPowershareRequestAction>(create);
  static SetPowershareRequestAction? _defaultInstance;

  @$pb.TagNumber(1)
  SetPowershareRequestAction_PowershareRequest get powershareRequest =>
      $_getN(0);
  @$pb.TagNumber(1)
  set powershareRequest(SetPowershareRequestAction_PowershareRequest value) =>
      $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPowershareRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearPowershareRequest() => $_clearField(1);
}

class SetTentModeRequestAction extends $pb.GeneratedMessage {
  factory SetTentModeRequestAction({
    $core.bool? on,
  }) {
    final result = create();
    if (on != null) result.on = on;
    return result;
  }

  SetTentModeRequestAction._();

  factory SetTentModeRequestAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetTentModeRequestAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetTentModeRequestAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'on')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetTentModeRequestAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetTentModeRequestAction copyWith(
          void Function(SetTentModeRequestAction) updates) =>
      super.copyWith((message) => updates(message as SetTentModeRequestAction))
          as SetTentModeRequestAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetTentModeRequestAction create() => SetTentModeRequestAction._();
  @$core.override
  SetTentModeRequestAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SetTentModeRequestAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetTentModeRequestAction>(create);
  static SetTentModeRequestAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get on => $_getBF(0);
  @$pb.TagNumber(1)
  set on($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOn() => $_has(0);
  @$pb.TagNumber(1)
  void clearOn() => $_clearField(1);
}

class SetZoneLightRequestAction extends $pb.GeneratedMessage {
  factory SetZoneLightRequestAction({
    SetZoneLightRequestAction_ZoneLightRequest? zoneLightRequest,
  }) {
    final result = create();
    if (zoneLightRequest != null) result.zoneLightRequest = zoneLightRequest;
    return result;
  }

  SetZoneLightRequestAction._();

  factory SetZoneLightRequestAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetZoneLightRequestAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetZoneLightRequestAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aE<SetZoneLightRequestAction_ZoneLightRequest>(
        1, _omitFieldNames ? '' : 'zoneLightRequest',
        enumValues: SetZoneLightRequestAction_ZoneLightRequest.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetZoneLightRequestAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetZoneLightRequestAction copyWith(
          void Function(SetZoneLightRequestAction) updates) =>
      super.copyWith((message) => updates(message as SetZoneLightRequestAction))
          as SetZoneLightRequestAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetZoneLightRequestAction create() => SetZoneLightRequestAction._();
  @$core.override
  SetZoneLightRequestAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SetZoneLightRequestAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetZoneLightRequestAction>(create);
  static SetZoneLightRequestAction? _defaultInstance;

  @$pb.TagNumber(1)
  SetZoneLightRequestAction_ZoneLightRequest get zoneLightRequest => $_getN(0);
  @$pb.TagNumber(1)
  set zoneLightRequest(SetZoneLightRequestAction_ZoneLightRequest value) =>
      $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasZoneLightRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearZoneLightRequest() => $_clearField(1);
}

class SetLightbarBrightnessAction extends $pb.GeneratedMessage {
  factory SetLightbarBrightnessAction({
    $core.int? brightnessRequest,
  }) {
    final result = create();
    if (brightnessRequest != null) result.brightnessRequest = brightnessRequest;
    return result;
  }

  SetLightbarBrightnessAction._();

  factory SetLightbarBrightnessAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetLightbarBrightnessAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetLightbarBrightnessAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'brightnessRequest',
        fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetLightbarBrightnessAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetLightbarBrightnessAction copyWith(
          void Function(SetLightbarBrightnessAction) updates) =>
      super.copyWith(
              (message) => updates(message as SetLightbarBrightnessAction))
          as SetLightbarBrightnessAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetLightbarBrightnessAction create() =>
      SetLightbarBrightnessAction._();
  @$core.override
  SetLightbarBrightnessAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SetLightbarBrightnessAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetLightbarBrightnessAction>(create);
  static SetLightbarBrightnessAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get brightnessRequest => $_getIZ(0);
  @$pb.TagNumber(1)
  set brightnessRequest($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBrightnessRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearBrightnessRequest() => $_clearField(1);
}

class SetLightbarMiddleAction extends $pb.GeneratedMessage {
  factory SetLightbarMiddleAction({
    $core.bool? middleLightRequest,
  }) {
    final result = create();
    if (middleLightRequest != null)
      result.middleLightRequest = middleLightRequest;
    return result;
  }

  SetLightbarMiddleAction._();

  factory SetLightbarMiddleAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetLightbarMiddleAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetLightbarMiddleAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'middleLightRequest')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetLightbarMiddleAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetLightbarMiddleAction copyWith(
          void Function(SetLightbarMiddleAction) updates) =>
      super.copyWith((message) => updates(message as SetLightbarMiddleAction))
          as SetLightbarMiddleAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetLightbarMiddleAction create() => SetLightbarMiddleAction._();
  @$core.override
  SetLightbarMiddleAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SetLightbarMiddleAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetLightbarMiddleAction>(create);
  static SetLightbarMiddleAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get middleLightRequest => $_getBF(0);
  @$pb.TagNumber(1)
  set middleLightRequest($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMiddleLightRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearMiddleLightRequest() => $_clearField(1);
}

class SetLightbarDitchAction extends $pb.GeneratedMessage {
  factory SetLightbarDitchAction({
    $core.bool? ditchLightsRequest,
  }) {
    final result = create();
    if (ditchLightsRequest != null)
      result.ditchLightsRequest = ditchLightsRequest;
    return result;
  }

  SetLightbarDitchAction._();

  factory SetLightbarDitchAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetLightbarDitchAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetLightbarDitchAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'ditchLightsRequest')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetLightbarDitchAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetLightbarDitchAction copyWith(
          void Function(SetLightbarDitchAction) updates) =>
      super.copyWith((message) => updates(message as SetLightbarDitchAction))
          as SetLightbarDitchAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetLightbarDitchAction create() => SetLightbarDitchAction._();
  @$core.override
  SetLightbarDitchAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SetLightbarDitchAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetLightbarDitchAction>(create);
  static SetLightbarDitchAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get ditchLightsRequest => $_getBF(0);
  @$pb.TagNumber(1)
  set ditchLightsRequest($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDitchLightsRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearDitchLightsRequest() => $_clearField(1);
}

class GetMessagesAction extends $pb.GeneratedMessage {
  factory GetMessagesAction() => create();

  GetMessagesAction._();

  factory GetMessagesAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetMessagesAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetMessagesAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMessagesAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMessagesAction copyWith(void Function(GetMessagesAction) updates) =>
      super.copyWith((message) => updates(message as GetMessagesAction))
          as GetMessagesAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMessagesAction create() => GetMessagesAction._();
  @$core.override
  GetMessagesAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetMessagesAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetMessagesAction>(create);
  static GetMessagesAction? _defaultInstance;
}

class TeslaAuthResponseAction extends $pb.GeneratedMessage {
  factory TeslaAuthResponseAction({
    $core.String? clientId,
    $core.String? scope,
    $core.String? accessToken,
    $core.String? refreshToken,
    $fixnum.Int64? expiryTimestamp,
    $core.String? error,
    $core.String? scopedToken,
  }) {
    final result = create();
    if (clientId != null) result.clientId = clientId;
    if (scope != null) result.scope = scope;
    if (accessToken != null) result.accessToken = accessToken;
    if (refreshToken != null) result.refreshToken = refreshToken;
    if (expiryTimestamp != null) result.expiryTimestamp = expiryTimestamp;
    if (error != null) result.error = error;
    if (scopedToken != null) result.scopedToken = scopedToken;
    return result;
  }

  TeslaAuthResponseAction._();

  factory TeslaAuthResponseAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TeslaAuthResponseAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TeslaAuthResponseAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'clientId')
    ..aOS(2, _omitFieldNames ? '' : 'scope')
    ..aOS(3, _omitFieldNames ? '' : 'accessToken')
    ..aOS(4, _omitFieldNames ? '' : 'refreshToken')
    ..aInt64(5, _omitFieldNames ? '' : 'expiryTimestamp')
    ..aOS(6, _omitFieldNames ? '' : 'error')
    ..aOS(7, _omitFieldNames ? '' : 'scopedToken')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TeslaAuthResponseAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TeslaAuthResponseAction copyWith(
          void Function(TeslaAuthResponseAction) updates) =>
      super.copyWith((message) => updates(message as TeslaAuthResponseAction))
          as TeslaAuthResponseAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TeslaAuthResponseAction create() => TeslaAuthResponseAction._();
  @$core.override
  TeslaAuthResponseAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TeslaAuthResponseAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TeslaAuthResponseAction>(create);
  static TeslaAuthResponseAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get clientId => $_getSZ(0);
  @$pb.TagNumber(1)
  set clientId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasClientId() => $_has(0);
  @$pb.TagNumber(1)
  void clearClientId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get scope => $_getSZ(1);
  @$pb.TagNumber(2)
  set scope($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasScope() => $_has(1);
  @$pb.TagNumber(2)
  void clearScope() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get accessToken => $_getSZ(2);
  @$pb.TagNumber(3)
  set accessToken($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAccessToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearAccessToken() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get refreshToken => $_getSZ(3);
  @$pb.TagNumber(4)
  set refreshToken($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasRefreshToken() => $_has(3);
  @$pb.TagNumber(4)
  void clearRefreshToken() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get expiryTimestamp => $_getI64(4);
  @$pb.TagNumber(5)
  set expiryTimestamp($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasExpiryTimestamp() => $_has(4);
  @$pb.TagNumber(5)
  void clearExpiryTimestamp() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get error => $_getSZ(5);
  @$pb.TagNumber(6)
  set error($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasError() => $_has(5);
  @$pb.TagNumber(6)
  void clearError() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get scopedToken => $_getSZ(6);
  @$pb.TagNumber(7)
  set scopedToken($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasScopedToken() => $_has(6);
  @$pb.TagNumber(7)
  void clearScopedToken() => $_clearField(7);
}

class NavigationGpsDestinationRequest extends $pb.GeneratedMessage {
  factory NavigationGpsDestinationRequest({
    $core.double? lat,
    $core.double? lon,
    $core.String? destination,
    NavigationGpsDestinationRequest_RemoteNavTripOrder? order,
  }) {
    final result = create();
    if (lat != null) result.lat = lat;
    if (lon != null) result.lon = lon;
    if (destination != null) result.destination = destination;
    if (order != null) result.order = order;
    return result;
  }

  NavigationGpsDestinationRequest._();

  factory NavigationGpsDestinationRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NavigationGpsDestinationRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NavigationGpsDestinationRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aD(1, _omitFieldNames ? '' : 'lat')
    ..aD(2, _omitFieldNames ? '' : 'lon')
    ..aOS(3, _omitFieldNames ? '' : 'destination')
    ..aE<NavigationGpsDestinationRequest_RemoteNavTripOrder>(
        4, _omitFieldNames ? '' : 'order',
        enumValues: NavigationGpsDestinationRequest_RemoteNavTripOrder.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NavigationGpsDestinationRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NavigationGpsDestinationRequest copyWith(
          void Function(NavigationGpsDestinationRequest) updates) =>
      super.copyWith(
              (message) => updates(message as NavigationGpsDestinationRequest))
          as NavigationGpsDestinationRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NavigationGpsDestinationRequest create() =>
      NavigationGpsDestinationRequest._();
  @$core.override
  NavigationGpsDestinationRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NavigationGpsDestinationRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NavigationGpsDestinationRequest>(
          create);
  static NavigationGpsDestinationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get lat => $_getN(0);
  @$pb.TagNumber(1)
  set lat($core.double value) => $_setDouble(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLat() => $_has(0);
  @$pb.TagNumber(1)
  void clearLat() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get lon => $_getN(1);
  @$pb.TagNumber(2)
  set lon($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLon() => $_has(1);
  @$pb.TagNumber(2)
  void clearLon() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get destination => $_getSZ(2);
  @$pb.TagNumber(3)
  set destination($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDestination() => $_has(2);
  @$pb.TagNumber(3)
  void clearDestination() => $_clearField(3);

  @$pb.TagNumber(4)
  NavigationGpsDestinationRequest_RemoteNavTripOrder get order => $_getN(3);
  @$pb.TagNumber(4)
  set order(NavigationGpsDestinationRequest_RemoteNavTripOrder value) =>
      $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasOrder() => $_has(3);
  @$pb.TagNumber(4)
  void clearOrder() => $_clearField(4);
}

class ParentalControlsClearPinAction extends $pb.GeneratedMessage {
  factory ParentalControlsClearPinAction({
    $core.String? pin,
  }) {
    final result = create();
    if (pin != null) result.pin = pin;
    return result;
  }

  ParentalControlsClearPinAction._();

  factory ParentalControlsClearPinAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ParentalControlsClearPinAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ParentalControlsClearPinAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'pin')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ParentalControlsClearPinAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ParentalControlsClearPinAction copyWith(
          void Function(ParentalControlsClearPinAction) updates) =>
      super.copyWith(
              (message) => updates(message as ParentalControlsClearPinAction))
          as ParentalControlsClearPinAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ParentalControlsClearPinAction create() =>
      ParentalControlsClearPinAction._();
  @$core.override
  ParentalControlsClearPinAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ParentalControlsClearPinAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParentalControlsClearPinAction>(create);
  static ParentalControlsClearPinAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get pin => $_getSZ(0);
  @$pb.TagNumber(1)
  set pin($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPin() => $_has(0);
  @$pb.TagNumber(1)
  void clearPin() => $_clearField(1);
}

class ParentalControlsClearPinAdminAction extends $pb.GeneratedMessage {
  factory ParentalControlsClearPinAdminAction() => create();

  ParentalControlsClearPinAdminAction._();

  factory ParentalControlsClearPinAdminAction.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ParentalControlsClearPinAdminAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ParentalControlsClearPinAdminAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ParentalControlsClearPinAdminAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ParentalControlsClearPinAdminAction copyWith(
          void Function(ParentalControlsClearPinAdminAction) updates) =>
      super.copyWith((message) =>
              updates(message as ParentalControlsClearPinAdminAction))
          as ParentalControlsClearPinAdminAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ParentalControlsClearPinAdminAction create() =>
      ParentalControlsClearPinAdminAction._();
  @$core.override
  ParentalControlsClearPinAdminAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ParentalControlsClearPinAdminAction getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          ParentalControlsClearPinAdminAction>(create);
  static ParentalControlsClearPinAdminAction? _defaultInstance;
}

class ParentalControlsAction extends $pb.GeneratedMessage {
  factory ParentalControlsAction({
    $core.bool? activate,
    $core.String? pin,
  }) {
    final result = create();
    if (activate != null) result.activate = activate;
    if (pin != null) result.pin = pin;
    return result;
  }

  ParentalControlsAction._();

  factory ParentalControlsAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ParentalControlsAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ParentalControlsAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'activate')
    ..aOS(2, _omitFieldNames ? '' : 'pin')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ParentalControlsAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ParentalControlsAction copyWith(
          void Function(ParentalControlsAction) updates) =>
      super.copyWith((message) => updates(message as ParentalControlsAction))
          as ParentalControlsAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ParentalControlsAction create() => ParentalControlsAction._();
  @$core.override
  ParentalControlsAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ParentalControlsAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParentalControlsAction>(create);
  static ParentalControlsAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get activate => $_getBF(0);
  @$pb.TagNumber(1)
  set activate($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasActivate() => $_has(0);
  @$pb.TagNumber(1)
  void clearActivate() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get pin => $_getSZ(1);
  @$pb.TagNumber(2)
  set pin($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPin() => $_has(1);
  @$pb.TagNumber(2)
  void clearPin() => $_clearField(2);
}

class ParentalControlsEnableSettingsAction extends $pb.GeneratedMessage {
  factory ParentalControlsEnableSettingsAction({
    ParentalControlsEnableSettingsAction_ParentalControlsSetting? setting,
    $core.bool? enable,
  }) {
    final result = create();
    if (setting != null) result.setting = setting;
    if (enable != null) result.enable = enable;
    return result;
  }

  ParentalControlsEnableSettingsAction._();

  factory ParentalControlsEnableSettingsAction.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ParentalControlsEnableSettingsAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ParentalControlsEnableSettingsAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aE<ParentalControlsEnableSettingsAction_ParentalControlsSetting>(
        1, _omitFieldNames ? '' : 'setting',
        enumValues:
            ParentalControlsEnableSettingsAction_ParentalControlsSetting.values)
    ..aOB(2, _omitFieldNames ? '' : 'enable')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ParentalControlsEnableSettingsAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ParentalControlsEnableSettingsAction copyWith(
          void Function(ParentalControlsEnableSettingsAction) updates) =>
      super.copyWith((message) =>
              updates(message as ParentalControlsEnableSettingsAction))
          as ParentalControlsEnableSettingsAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ParentalControlsEnableSettingsAction create() =>
      ParentalControlsEnableSettingsAction._();
  @$core.override
  ParentalControlsEnableSettingsAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ParentalControlsEnableSettingsAction getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          ParentalControlsEnableSettingsAction>(create);
  static ParentalControlsEnableSettingsAction? _defaultInstance;

  @$pb.TagNumber(1)
  ParentalControlsEnableSettingsAction_ParentalControlsSetting get setting =>
      $_getN(0);
  @$pb.TagNumber(1)
  set setting(
          ParentalControlsEnableSettingsAction_ParentalControlsSetting value) =>
      $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSetting() => $_has(0);
  @$pb.TagNumber(1)
  void clearSetting() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get enable => $_getBF(1);
  @$pb.TagNumber(2)
  set enable($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasEnable() => $_has(1);
  @$pb.TagNumber(2)
  void clearEnable() => $_clearField(2);
}

class ParentalControlsSetSpeedLimitAction extends $pb.GeneratedMessage {
  factory ParentalControlsSetSpeedLimitAction({
    $core.double? limitMph,
  }) {
    final result = create();
    if (limitMph != null) result.limitMph = limitMph;
    return result;
  }

  ParentalControlsSetSpeedLimitAction._();

  factory ParentalControlsSetSpeedLimitAction.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ParentalControlsSetSpeedLimitAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ParentalControlsSetSpeedLimitAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aD(1, _omitFieldNames ? '' : 'limitMph')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ParentalControlsSetSpeedLimitAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ParentalControlsSetSpeedLimitAction copyWith(
          void Function(ParentalControlsSetSpeedLimitAction) updates) =>
      super.copyWith((message) =>
              updates(message as ParentalControlsSetSpeedLimitAction))
          as ParentalControlsSetSpeedLimitAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ParentalControlsSetSpeedLimitAction create() =>
      ParentalControlsSetSpeedLimitAction._();
  @$core.override
  ParentalControlsSetSpeedLimitAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ParentalControlsSetSpeedLimitAction getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          ParentalControlsSetSpeedLimitAction>(create);
  static ParentalControlsSetSpeedLimitAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get limitMph => $_getN(0);
  @$pb.TagNumber(1)
  set limitMph($core.double value) => $_setDouble(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLimitMph() => $_has(0);
  @$pb.TagNumber(1)
  void clearLimitMph() => $_clearField(1);
}

class CancelSohTestAction extends $pb.GeneratedMessage {
  factory CancelSohTestAction() => create();

  CancelSohTestAction._();

  factory CancelSohTestAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CancelSohTestAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CancelSohTestAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CancelSohTestAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CancelSohTestAction copyWith(void Function(CancelSohTestAction) updates) =>
      super.copyWith((message) => updates(message as CancelSohTestAction))
          as CancelSohTestAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CancelSohTestAction create() => CancelSohTestAction._();
  @$core.override
  CancelSohTestAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CancelSohTestAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CancelSohTestAction>(create);
  static CancelSohTestAction? _defaultInstance;
}

class StopLightShowAction extends $pb.GeneratedMessage {
  factory StopLightShowAction() => create();

  StopLightShowAction._();

  factory StopLightShowAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StopLightShowAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StopLightShowAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StopLightShowAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StopLightShowAction copyWith(void Function(StopLightShowAction) updates) =>
      super.copyWith((message) => updates(message as StopLightShowAction))
          as StopLightShowAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StopLightShowAction create() => StopLightShowAction._();
  @$core.override
  StopLightShowAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StopLightShowAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StopLightShowAction>(create);
  static StopLightShowAction? _defaultInstance;
}

class StartLightShowAction extends $pb.GeneratedMessage {
  factory StartLightShowAction({
    $core.int? showIndex,
    $fixnum.Int64? startTime,
    $core.double? volume,
    $core.bool? danceMoves,
  }) {
    final result = create();
    if (showIndex != null) result.showIndex = showIndex;
    if (startTime != null) result.startTime = startTime;
    if (volume != null) result.volume = volume;
    if (danceMoves != null) result.danceMoves = danceMoves;
    return result;
  }

  StartLightShowAction._();

  factory StartLightShowAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StartLightShowAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StartLightShowAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'showIndex')
    ..aInt64(2, _omitFieldNames ? '' : 'startTime')
    ..aD(3, _omitFieldNames ? '' : 'volume', fieldType: $pb.PbFieldType.OF)
    ..aOB(4, _omitFieldNames ? '' : 'danceMoves')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartLightShowAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartLightShowAction copyWith(void Function(StartLightShowAction) updates) =>
      super.copyWith((message) => updates(message as StartLightShowAction))
          as StartLightShowAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartLightShowAction create() => StartLightShowAction._();
  @$core.override
  StartLightShowAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StartLightShowAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartLightShowAction>(create);
  static StartLightShowAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get showIndex => $_getIZ(0);
  @$pb.TagNumber(1)
  set showIndex($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasShowIndex() => $_has(0);
  @$pb.TagNumber(1)
  void clearShowIndex() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get startTime => $_getI64(1);
  @$pb.TagNumber(2)
  set startTime($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStartTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartTime() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get volume => $_getN(2);
  @$pb.TagNumber(3)
  set volume($core.double value) => $_setFloat(2, value);
  @$pb.TagNumber(3)
  $core.bool hasVolume() => $_has(2);
  @$pb.TagNumber(3)
  void clearVolume() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get danceMoves => $_getBF(3);
  @$pb.TagNumber(4)
  set danceMoves($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDanceMoves() => $_has(3);
  @$pb.TagNumber(4)
  void clearDanceMoves() => $_clearField(4);
}

class SetSuspensionLevelAction extends $pb.GeneratedMessage {
  factory SetSuspensionLevelAction({
    SetSuspensionLevelAction_SuspensionLevel? suspensionLevel,
  }) {
    final result = create();
    if (suspensionLevel != null) result.suspensionLevel = suspensionLevel;
    return result;
  }

  SetSuspensionLevelAction._();

  factory SetSuspensionLevelAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetSuspensionLevelAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetSuspensionLevelAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aE<SetSuspensionLevelAction_SuspensionLevel>(
        1, _omitFieldNames ? '' : 'suspensionLevel',
        enumValues: SetSuspensionLevelAction_SuspensionLevel.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetSuspensionLevelAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetSuspensionLevelAction copyWith(
          void Function(SetSuspensionLevelAction) updates) =>
      super.copyWith((message) => updates(message as SetSuspensionLevelAction))
          as SetSuspensionLevelAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetSuspensionLevelAction create() => SetSuspensionLevelAction._();
  @$core.override
  SetSuspensionLevelAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SetSuspensionLevelAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetSuspensionLevelAction>(create);
  static SetSuspensionLevelAction? _defaultInstance;

  @$pb.TagNumber(1)
  SetSuspensionLevelAction_SuspensionLevel get suspensionLevel => $_getN(0);
  @$pb.TagNumber(1)
  set suspensionLevel(SetSuspensionLevelAction_SuspensionLevel value) =>
      $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSuspensionLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuspensionLevel() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

// This is a generated file - do not edit.
//
// Generated from car_server.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use operationStatus_EDescriptor instead')
const OperationStatus_E$json = {
  '1': 'OperationStatus_E',
  '2': [
    {'1': 'OPERATIONSTATUS_OK', '2': 0},
    {'1': 'OPERATIONSTATUS_ERROR', '2': 1},
  ],
};

/// Descriptor for `OperationStatus_E`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List operationStatus_EDescriptor = $convert.base64Decode(
    'ChFPcGVyYXRpb25TdGF0dXNfRRIWChJPUEVSQVRJT05TVEFUVVNfT0sQABIZChVPUEVSQVRJT0'
    '5TVEFUVVNfRVJST1IQAQ==');

@$core.Deprecated('Use actionDescriptor instead')
const Action$json = {
  '1': 'Action',
  '2': [
    {
      '1': 'vehicleAction',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.CarServer.VehicleAction',
      '9': 0,
      '10': 'vehicleAction'
    },
  ],
  '8': [
    {'1': 'action_msg'},
  ],
  '9': [
    {'1': 3, '2': 6},
  ],
};

/// Descriptor for `Action`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List actionDescriptor = $convert.base64Decode(
    'CgZBY3Rpb24SQAoNdmVoaWNsZUFjdGlvbhgCIAEoCzIYLkNhclNlcnZlci5WZWhpY2xlQWN0aW'
    '9uSABSDXZlaGljbGVBY3Rpb25CDAoKYWN0aW9uX21zZ0oECAMQBg==');

@$core.Deprecated('Use vehicleActionDescriptor instead')
const VehicleAction$json = {
  '1': 'VehicleAction',
  '2': [
    {
      '1': 'getVehicleData',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.CarServer.GetVehicleData',
      '9': 0,
      '10': 'getVehicleData'
    },
    {
      '1': 'remoteStartDrive',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.CarServer.RemoteStartDrive',
      '9': 0,
      '10': 'remoteStartDrive'
    },
    {
      '1': 'createStreamSession',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.CarServer.CreateStreamSession',
      '9': 0,
      '10': 'createStreamSession'
    },
    {
      '1': 'streamMessage',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.CarServer.StreamMessage',
      '9': 0,
      '10': 'streamMessage'
    },
    {
      '1': 'chargingSetLimitAction',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.CarServer.ChargingSetLimitAction',
      '9': 0,
      '10': 'chargingSetLimitAction'
    },
    {
      '1': 'chargingStartStopAction',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.CarServer.ChargingStartStopAction',
      '9': 0,
      '10': 'chargingStartStopAction'
    },
    {
      '1': 'drivingClearSpeedLimitPinAction',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.CarServer.DrivingClearSpeedLimitPinAction',
      '9': 0,
      '10': 'drivingClearSpeedLimitPinAction'
    },
    {
      '1': 'drivingSetSpeedLimitAction',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.CarServer.DrivingSetSpeedLimitAction',
      '9': 0,
      '10': 'drivingSetSpeedLimitAction'
    },
    {
      '1': 'drivingSpeedLimitAction',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.CarServer.DrivingSpeedLimitAction',
      '9': 0,
      '10': 'drivingSpeedLimitAction'
    },
    {
      '1': 'hvacAutoAction',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.CarServer.HvacAutoAction',
      '9': 0,
      '10': 'hvacAutoAction'
    },
    {
      '1': 'hvacSetPreconditioningMaxAction',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.CarServer.HvacSetPreconditioningMaxAction',
      '9': 0,
      '10': 'hvacSetPreconditioningMaxAction'
    },
    {
      '1': 'hvacSteeringWheelHeaterAction',
      '3': 13,
      '4': 1,
      '5': 11,
      '6': '.CarServer.HvacSteeringWheelHeaterAction',
      '9': 0,
      '10': 'hvacSteeringWheelHeaterAction'
    },
    {
      '1': 'hvacTemperatureAdjustmentAction',
      '3': 14,
      '4': 1,
      '5': 11,
      '6': '.CarServer.HvacTemperatureAdjustmentAction',
      '9': 0,
      '10': 'hvacTemperatureAdjustmentAction'
    },
    {
      '1': 'mediaPlayAction',
      '3': 15,
      '4': 1,
      '5': 11,
      '6': '.CarServer.MediaPlayAction',
      '9': 0,
      '10': 'mediaPlayAction'
    },
    {
      '1': 'mediaUpdateVolume',
      '3': 16,
      '4': 1,
      '5': 11,
      '6': '.CarServer.MediaUpdateVolume',
      '9': 0,
      '10': 'mediaUpdateVolume'
    },
    {
      '1': 'mediaNextFavorite',
      '3': 17,
      '4': 1,
      '5': 11,
      '6': '.CarServer.MediaNextFavorite',
      '9': 0,
      '10': 'mediaNextFavorite'
    },
    {
      '1': 'mediaPreviousFavorite',
      '3': 18,
      '4': 1,
      '5': 11,
      '6': '.CarServer.MediaPreviousFavorite',
      '9': 0,
      '10': 'mediaPreviousFavorite'
    },
    {
      '1': 'mediaNextTrack',
      '3': 19,
      '4': 1,
      '5': 11,
      '6': '.CarServer.MediaNextTrack',
      '9': 0,
      '10': 'mediaNextTrack'
    },
    {
      '1': 'mediaPreviousTrack',
      '3': 20,
      '4': 1,
      '5': 11,
      '6': '.CarServer.MediaPreviousTrack',
      '9': 0,
      '10': 'mediaPreviousTrack'
    },
    {
      '1': 'navigationRequest',
      '3': 21,
      '4': 1,
      '5': 11,
      '6': '.CarServer.NavigationRequest',
      '9': 0,
      '10': 'navigationRequest'
    },
    {
      '1': 'navigationSuperchargerRequest',
      '3': 22,
      '4': 1,
      '5': 11,
      '6': '.CarServer.NavigationSuperchargerRequest',
      '9': 0,
      '10': 'navigationSuperchargerRequest'
    },
    {
      '1': 'getNearbyChargingSites',
      '3': 23,
      '4': 1,
      '5': 11,
      '6': '.CarServer.GetNearbyChargingSites',
      '9': 0,
      '10': 'getNearbyChargingSites'
    },
    {
      '1': 'uiSetUpcomingCalendarEntries',
      '3': 24,
      '4': 1,
      '5': 11,
      '6': '.CarServer.UiSetUpcomingCalendarEntries',
      '9': 0,
      '10': 'uiSetUpcomingCalendarEntries'
    },
    {
      '1': 'vehicleControlCancelSoftwareUpdateAction',
      '3': 25,
      '4': 1,
      '5': 11,
      '6': '.CarServer.VehicleControlCancelSoftwareUpdateAction',
      '9': 0,
      '10': 'vehicleControlCancelSoftwareUpdateAction'
    },
    {
      '1': 'vehicleControlFlashLightsAction',
      '3': 26,
      '4': 1,
      '5': 11,
      '6': '.CarServer.VehicleControlFlashLightsAction',
      '9': 0,
      '10': 'vehicleControlFlashLightsAction'
    },
    {
      '1': 'vehicleControlHonkHornAction',
      '3': 27,
      '4': 1,
      '5': 11,
      '6': '.CarServer.VehicleControlHonkHornAction',
      '9': 0,
      '10': 'vehicleControlHonkHornAction'
    },
    {
      '1': 'vehicleControlResetValetPinAction',
      '3': 28,
      '4': 1,
      '5': 11,
      '6': '.CarServer.VehicleControlResetValetPinAction',
      '9': 0,
      '10': 'vehicleControlResetValetPinAction'
    },
    {
      '1': 'vehicleControlScheduleSoftwareUpdateAction',
      '3': 29,
      '4': 1,
      '5': 11,
      '6': '.CarServer.VehicleControlScheduleSoftwareUpdateAction',
      '9': 0,
      '10': 'vehicleControlScheduleSoftwareUpdateAction'
    },
    {
      '1': 'vehicleControlSetSentryModeAction',
      '3': 30,
      '4': 1,
      '5': 11,
      '6': '.CarServer.VehicleControlSetSentryModeAction',
      '9': 0,
      '10': 'vehicleControlSetSentryModeAction'
    },
    {
      '1': 'vehicleControlSetValetModeAction',
      '3': 31,
      '4': 1,
      '5': 11,
      '6': '.CarServer.VehicleControlSetValetModeAction',
      '9': 0,
      '10': 'vehicleControlSetValetModeAction'
    },
    {
      '1': 'vehicleControlSunroofOpenCloseAction',
      '3': 32,
      '4': 1,
      '5': 11,
      '6': '.CarServer.VehicleControlSunroofOpenCloseAction',
      '9': 0,
      '10': 'vehicleControlSunroofOpenCloseAction'
    },
    {
      '1': 'vehicleControlTriggerHomelinkAction',
      '3': 33,
      '4': 1,
      '5': 11,
      '6': '.CarServer.VehicleControlTriggerHomelinkAction',
      '9': 0,
      '10': 'vehicleControlTriggerHomelinkAction'
    },
    {
      '1': 'vehicleControlWindowAction',
      '3': 34,
      '4': 1,
      '5': 11,
      '6': '.CarServer.VehicleControlWindowAction',
      '9': 0,
      '10': 'vehicleControlWindowAction'
    },
    {
      '1': 'hvacBioweaponModeAction',
      '3': 35,
      '4': 1,
      '5': 11,
      '6': '.CarServer.HvacBioweaponModeAction',
      '9': 0,
      '10': 'hvacBioweaponModeAction'
    },
    {
      '1': 'hvacSeatHeaterActions',
      '3': 36,
      '4': 1,
      '5': 11,
      '6': '.CarServer.HvacSeatHeaterActions',
      '9': 0,
      '10': 'hvacSeatHeaterActions'
    },
    {
      '1': 'vehicleDataSubscription',
      '3': 37,
      '4': 1,
      '5': 11,
      '6': '.CarServer.VehicleDataSubscription',
      '9': 0,
      '10': 'vehicleDataSubscription'
    },
    {
      '1': 'vehicleDataAck',
      '3': 38,
      '4': 1,
      '5': 11,
      '6': '.CarServer.VehicleDataAck',
      '9': 0,
      '10': 'vehicleDataAck'
    },
    {
      '1': 'vitalsSubscription',
      '3': 39,
      '4': 1,
      '5': 11,
      '6': '.CarServer.VitalsSubscription',
      '9': 0,
      '10': 'vitalsSubscription'
    },
    {
      '1': 'vitalsAck',
      '3': 40,
      '4': 1,
      '5': 11,
      '6': '.CarServer.VitalsAck',
      '9': 0,
      '10': 'vitalsAck'
    },
    {
      '1': 'scheduledChargingAction',
      '3': 41,
      '4': 1,
      '5': 11,
      '6': '.CarServer.ScheduledChargingAction',
      '9': 0,
      '10': 'scheduledChargingAction'
    },
    {
      '1': 'scheduledDepartureAction',
      '3': 42,
      '4': 1,
      '5': 11,
      '6': '.CarServer.ScheduledDepartureAction',
      '9': 0,
      '10': 'scheduledDepartureAction'
    },
    {
      '1': 'setChargingAmpsAction',
      '3': 43,
      '4': 1,
      '5': 11,
      '6': '.CarServer.SetChargingAmpsAction',
      '9': 0,
      '10': 'setChargingAmpsAction'
    },
    {
      '1': 'hvacClimateKeeperAction',
      '3': 44,
      '4': 1,
      '5': 11,
      '6': '.CarServer.HvacClimateKeeperAction',
      '9': 0,
      '10': 'hvacClimateKeeperAction'
    },
    {
      '1': 'hvacRecirculationAction',
      '3': 45,
      '4': 1,
      '5': 11,
      '6': '.CarServer.HvacRecirculationAction',
      '9': 0,
      '10': 'hvacRecirculationAction'
    },
    {
      '1': 'ping',
      '3': 46,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Ping',
      '9': 0,
      '10': 'ping'
    },
    {
      '1': 'dashcamSaveClipAction',
      '3': 47,
      '4': 1,
      '5': 11,
      '6': '.CarServer.DashcamSaveClipAction',
      '9': 0,
      '10': 'dashcamSaveClipAction'
    },
    {
      '1': 'autoSeatClimateAction',
      '3': 48,
      '4': 1,
      '5': 11,
      '6': '.CarServer.AutoSeatClimateAction',
      '9': 0,
      '10': 'autoSeatClimateAction'
    },
    {
      '1': 'hvacSeatCoolerActions',
      '3': 49,
      '4': 1,
      '5': 11,
      '6': '.CarServer.HvacSeatCoolerActions',
      '9': 0,
      '10': 'hvacSeatCoolerActions'
    },
    {
      '1': 'setCabinOverheatProtectionAction',
      '3': 50,
      '4': 1,
      '5': 11,
      '6': '.CarServer.SetCabinOverheatProtectionAction',
      '9': 0,
      '10': 'setCabinOverheatProtectionAction'
    },
    {
      '1': 'piiKeyRequest',
      '3': 51,
      '4': 1,
      '5': 11,
      '6': '.CarServer.PiiKeyRequest',
      '9': 0,
      '10': 'piiKeyRequest'
    },
    {
      '1': 'pseudonymSyncRequest',
      '3': 52,
      '4': 1,
      '5': 11,
      '6': '.CarServer.PseudonymSyncRequest',
      '9': 0,
      '10': 'pseudonymSyncRequest'
    },
    {
      '1': 'navigationGpsRequest',
      '3': 53,
      '4': 1,
      '5': 11,
      '6': '.CarServer.NavigationGpsRequest',
      '9': 0,
      '10': 'navigationGpsRequest'
    },
    {
      '1': 'setVehicleNameAction',
      '3': 54,
      '4': 1,
      '5': 11,
      '6': '.CarServer.SetVehicleNameAction',
      '9': 0,
      '10': 'setVehicleNameAction'
    },
    {
      '1': 'setRateTariffRequest',
      '3': 55,
      '4': 1,
      '5': 11,
      '6': '.CarServer.SetRateTariffRequest',
      '9': 0,
      '10': 'setRateTariffRequest'
    },
    {
      '1': 'getRateTariffRequest',
      '3': 56,
      '4': 1,
      '5': 11,
      '6': '.CarServer.GetRateTariffRequest',
      '9': 0,
      '10': 'getRateTariffRequest'
    },
    {
      '1': 'videoRequestAction',
      '3': 57,
      '4': 1,
      '5': 11,
      '6': '.CarServer.VideoRequestAction',
      '9': 0,
      '10': 'videoRequestAction'
    },
    {
      '1': 'takeDrivenoteAction',
      '3': 58,
      '4': 1,
      '5': 11,
      '6': '.CarServer.TakeDrivenoteAction',
      '9': 0,
      '10': 'takeDrivenoteAction'
    },
    {
      '1': 'chargePortDoorClose',
      '3': 61,
      '4': 1,
      '5': 11,
      '6': '.CarServer.ChargePortDoorClose',
      '9': 0,
      '10': 'chargePortDoorClose'
    },
    {
      '1': 'chargePortDoorOpen',
      '3': 62,
      '4': 1,
      '5': 11,
      '6': '.CarServer.ChargePortDoorOpen',
      '9': 0,
      '10': 'chargePortDoorOpen'
    },
    {
      '1': 'bluetoothClassicPairingRequest',
      '3': 63,
      '4': 1,
      '5': 11,
      '6': '.CarServer.BluetoothClassicPairingRequest',
      '9': 0,
      '10': 'bluetoothClassicPairingRequest'
    },
    {
      '1': 'boomboxAction',
      '3': 64,
      '4': 1,
      '5': 11,
      '6': '.CarServer.BoomboxAction',
      '9': 0,
      '10': 'boomboxAction'
    },
    {
      '1': 'guestModeAction',
      '3': 65,
      '4': 1,
      '5': 11,
      '6': '.CarServer.VehicleState.GuestMode',
      '9': 0,
      '10': 'guestModeAction'
    },
    {
      '1': 'setCopTempAction',
      '3': 66,
      '4': 1,
      '5': 11,
      '6': '.CarServer.SetCopTempAction',
      '9': 0,
      '10': 'setCopTempAction'
    },
    {
      '1': 'addManagedChargingSiteRequest',
      '3': 67,
      '4': 1,
      '5': 11,
      '6': '.CarServer.AddManagedChargingSiteRequest',
      '9': 0,
      '10': 'addManagedChargingSiteRequest'
    },
    {
      '1': 'removeManagedChargingSiteRequest',
      '3': 68,
      '4': 1,
      '5': 11,
      '6': '.CarServer.RemoveManagedChargingSiteRequest',
      '9': 0,
      '10': 'removeManagedChargingSiteRequest'
    },
    {
      '1': 'navigationRouteAction',
      '3': 69,
      '4': 1,
      '5': 11,
      '6': '.CarServer.NavigationRouteAction',
      '9': 0,
      '10': 'navigationRouteAction'
    },
    {
      '1': 'autoStwHeatAction',
      '3': 70,
      '4': 1,
      '5': 11,
      '6': '.CarServer.AutoStwHeatAction',
      '9': 0,
      '10': 'autoStwHeatAction'
    },
    {
      '1': 'stwHeatLevelAction',
      '3': 71,
      '4': 1,
      '5': 11,
      '6': '.CarServer.StwHeatLevelAction',
      '9': 0,
      '10': 'stwHeatLevelAction'
    },
    {
      '1': 'eraseUserDataAction',
      '3': 72,
      '4': 1,
      '5': 11,
      '6': '.CarServer.EraseUserDataAction',
      '9': 0,
      '10': 'eraseUserDataAction'
    },
    {
      '1': 'getManagedChargingSitesRequest',
      '3': 73,
      '4': 1,
      '5': 11,
      '6': '.CarServer.GetManagedChargingSitesRequest',
      '9': 0,
      '10': 'getManagedChargingSitesRequest'
    },
    {
      '1': 'updateChargeOnSolarFeatureRequest',
      '3': 74,
      '4': 1,
      '5': 11,
      '6': '.CarServer.UpdateChargeOnSolarFeatureRequest',
      '9': 0,
      '10': 'updateChargeOnSolarFeatureRequest'
    },
    {
      '1': 'getChargeOnSolarFeatureRequest',
      '3': 75,
      '4': 1,
      '5': 11,
      '6': '.CarServer.GetChargeOnSolarFeatureRequest',
      '9': 0,
      '10': 'getChargeOnSolarFeatureRequest'
    },
    {
      '1': 'vehicleControlSetPinToDriveAction',
      '3': 77,
      '4': 1,
      '5': 11,
      '6': '.CarServer.VehicleControlSetPinToDriveAction',
      '9': 0,
      '10': 'vehicleControlSetPinToDriveAction'
    },
    {
      '1': 'vehicleControlResetPinToDriveAction',
      '3': 78,
      '4': 1,
      '5': 11,
      '6': '.CarServer.VehicleControlResetPinToDriveAction',
      '9': 0,
      '10': 'vehicleControlResetPinToDriveAction'
    },
    {
      '1': 'drivingClearSpeedLimitPinAdminAction',
      '3': 79,
      '4': 1,
      '5': 11,
      '6': '.CarServer.DrivingClearSpeedLimitPinAdminAction',
      '9': 0,
      '10': 'drivingClearSpeedLimitPinAdminAction'
    },
    {
      '1': 'setOutletsOnOffAction',
      '3': 80,
      '4': 1,
      '5': 11,
      '6': '.CarServer.SetOutletsOnOffAction',
      '9': 0,
      '10': 'setOutletsOnOffAction'
    },
    {
      '1': 'setOutletTimerAction',
      '3': 81,
      '4': 1,
      '5': 11,
      '6': '.CarServer.SetOutletTimerAction',
      '9': 0,
      '10': 'setOutletTimerAction'
    },
    {
      '1': 'setOutletSocLimitAction',
      '3': 82,
      '4': 1,
      '5': 11,
      '6': '.CarServer.SetOutletSocLimitAction',
      '9': 0,
      '10': 'setOutletSocLimitAction'
    },
    {
      '1': 'setPowerFeedOnOffAction',
      '3': 83,
      '4': 1,
      '5': 11,
      '6': '.CarServer.SetPowerFeedOnOffAction',
      '9': 0,
      '10': 'setPowerFeedOnOffAction'
    },
    {
      '1': 'setPowerFeedTimerAction',
      '3': 84,
      '4': 1,
      '5': 11,
      '6': '.CarServer.SetPowerFeedTimerAction',
      '9': 0,
      '10': 'setPowerFeedTimerAction'
    },
    {
      '1': 'setPowerFeedSocLimitAction',
      '3': 85,
      '4': 1,
      '5': 11,
      '6': '.CarServer.SetPowerFeedSocLimitAction',
      '9': 0,
      '10': 'setPowerFeedSocLimitAction'
    },
    {
      '1': 'setTrailerLightTestStartStopAction',
      '3': 86,
      '4': 1,
      '5': 11,
      '6': '.CarServer.SetTrailerLightTestStartStopAction',
      '9': 0,
      '10': 'setTrailerLightTestStartStopAction'
    },
    {
      '1': 'setTruckBedLightAutoStateAction',
      '3': 87,
      '4': 1,
      '5': 11,
      '6': '.CarServer.SetTruckBedLightAutoStateAction',
      '9': 0,
      '10': 'setTruckBedLightAutoStateAction'
    },
    {
      '1': 'setTruckBedLightBrightnessAction',
      '3': 88,
      '4': 1,
      '5': 11,
      '6': '.CarServer.SetTruckBedLightBrightnessAction',
      '9': 0,
      '10': 'setTruckBedLightBrightnessAction'
    },
    {
      '1': 'vehicleControlResetPinToDriveAdminAction',
      '3': 89,
      '4': 1,
      '5': 11,
      '6': '.CarServer.VehicleControlResetPinToDriveAdminAction',
      '9': 0,
      '10': 'vehicleControlResetPinToDriveAdminAction'
    },
    {
      '1': 'navigationWaypointsRequest',
      '3': 90,
      '4': 1,
      '5': 11,
      '6': '.CarServer.NavigationWaypointsRequest',
      '9': 0,
      '10': 'navigationWaypointsRequest'
    },
    {
      '1': 'setPowershareFeatureAction',
      '3': 91,
      '4': 1,
      '5': 11,
      '6': '.CarServer.SetPowershareFeatureAction',
      '9': 0,
      '10': 'setPowershareFeatureAction'
    },
    {
      '1': 'setPowershareDischargeLimitAction',
      '3': 92,
      '4': 1,
      '5': 11,
      '6': '.CarServer.SetPowershareDischargeLimitAction',
      '9': 0,
      '10': 'setPowershareDischargeLimitAction'
    },
    {
      '1': 'setPowershareRequestAction',
      '3': 93,
      '4': 1,
      '5': 11,
      '6': '.CarServer.SetPowershareRequestAction',
      '9': 0,
      '10': 'setPowershareRequestAction'
    },
    {
      '1': 'setTentModeRequestAction',
      '3': 94,
      '4': 1,
      '5': 11,
      '6': '.CarServer.SetTentModeRequestAction',
      '9': 0,
      '10': 'setTentModeRequestAction'
    },
    {
      '1': 'setFrontZoneLightRequestAction',
      '3': 95,
      '4': 1,
      '5': 11,
      '6': '.CarServer.SetZoneLightRequestAction',
      '9': 0,
      '10': 'setFrontZoneLightRequestAction'
    },
    {
      '1': 'setRearZoneLightRequestAction',
      '3': 96,
      '4': 1,
      '5': 11,
      '6': '.CarServer.SetZoneLightRequestAction',
      '9': 0,
      '10': 'setRearZoneLightRequestAction'
    },
    {
      '1': 'addChargeScheduleAction',
      '3': 97,
      '4': 1,
      '5': 11,
      '6': '.CarServer.ChargeSchedule',
      '9': 0,
      '10': 'addChargeScheduleAction'
    },
    {
      '1': 'removeChargeScheduleAction',
      '3': 98,
      '4': 1,
      '5': 11,
      '6': '.CarServer.RemoveChargeScheduleAction',
      '9': 0,
      '10': 'removeChargeScheduleAction'
    },
    {
      '1': 'addPreconditionScheduleAction',
      '3': 99,
      '4': 1,
      '5': 11,
      '6': '.CarServer.PreconditionSchedule',
      '9': 0,
      '10': 'addPreconditionScheduleAction'
    },
    {
      '1': 'removePreconditionScheduleAction',
      '3': 100,
      '4': 1,
      '5': 11,
      '6': '.CarServer.RemovePreconditionScheduleAction',
      '9': 0,
      '10': 'removePreconditionScheduleAction'
    },
    {
      '1': 'setLightbarBrightnessAction',
      '3': 101,
      '4': 1,
      '5': 11,
      '6': '.CarServer.SetLightbarBrightnessAction',
      '9': 0,
      '10': 'setLightbarBrightnessAction'
    },
    {
      '1': 'setLightbarMiddleAction',
      '3': 102,
      '4': 1,
      '5': 11,
      '6': '.CarServer.SetLightbarMiddleAction',
      '9': 0,
      '10': 'setLightbarMiddleAction'
    },
    {
      '1': 'setLightbarDitchAction',
      '3': 103,
      '4': 1,
      '5': 11,
      '6': '.CarServer.SetLightbarDitchAction',
      '9': 0,
      '10': 'setLightbarDitchAction'
    },
    {
      '1': 'getMessagesAction',
      '3': 104,
      '4': 1,
      '5': 11,
      '6': '.CarServer.GetMessagesAction',
      '9': 0,
      '10': 'getMessagesAction'
    },
    {
      '1': 'teslaAuthResponseAction',
      '3': 105,
      '4': 1,
      '5': 11,
      '6': '.CarServer.TeslaAuthResponseAction',
      '9': 0,
      '10': 'teslaAuthResponseAction'
    },
    {
      '1': 'navigationGpsDestinationRequest',
      '3': 106,
      '4': 1,
      '5': 11,
      '6': '.CarServer.NavigationGpsDestinationRequest',
      '9': 0,
      '10': 'navigationGpsDestinationRequest'
    },
    {
      '1': 'batchRemovePreconditionSchedulesAction',
      '3': 107,
      '4': 1,
      '5': 11,
      '6': '.CarServer.BatchRemovePreconditionSchedulesAction',
      '9': 0,
      '10': 'batchRemovePreconditionSchedulesAction'
    },
    {
      '1': 'batchRemoveChargeSchedulesAction',
      '3': 108,
      '4': 1,
      '5': 11,
      '6': '.CarServer.BatchRemoveChargeSchedulesAction',
      '9': 0,
      '10': 'batchRemoveChargeSchedulesAction'
    },
    {
      '1': 'parentalControlsClearPinAction',
      '3': 109,
      '4': 1,
      '5': 11,
      '6': '.CarServer.ParentalControlsClearPinAction',
      '9': 0,
      '10': 'parentalControlsClearPinAction'
    },
    {
      '1': 'parentalControlsClearPinAdminAction',
      '3': 110,
      '4': 1,
      '5': 11,
      '6': '.CarServer.ParentalControlsClearPinAdminAction',
      '9': 0,
      '10': 'parentalControlsClearPinAdminAction'
    },
    {
      '1': 'parentalControlsAction',
      '3': 111,
      '4': 1,
      '5': 11,
      '6': '.CarServer.ParentalControlsAction',
      '9': 0,
      '10': 'parentalControlsAction'
    },
    {
      '1': 'parentalControlsEnableSettingsAction',
      '3': 112,
      '4': 1,
      '5': 11,
      '6': '.CarServer.ParentalControlsEnableSettingsAction',
      '9': 0,
      '10': 'parentalControlsEnableSettingsAction'
    },
    {
      '1': 'parentalControlsSetSpeedLimitAction',
      '3': 113,
      '4': 1,
      '5': 11,
      '6': '.CarServer.ParentalControlsSetSpeedLimitAction',
      '9': 0,
      '10': 'parentalControlsSetSpeedLimitAction'
    },
    {
      '1': 'cancelSohTestAction',
      '3': 114,
      '4': 1,
      '5': 11,
      '6': '.CarServer.CancelSohTestAction',
      '9': 0,
      '10': 'cancelSohTestAction'
    },
    {
      '1': 'stopLightShowAction',
      '3': 116,
      '4': 1,
      '5': 11,
      '6': '.CarServer.StopLightShowAction',
      '9': 0,
      '10': 'stopLightShowAction'
    },
    {
      '1': 'startLightShowAction',
      '3': 117,
      '4': 1,
      '5': 11,
      '6': '.CarServer.StartLightShowAction',
      '9': 0,
      '10': 'startLightShowAction'
    },
    {
      '1': 'setSuspensionLevelAction',
      '3': 118,
      '4': 1,
      '5': 11,
      '6': '.CarServer.SetSuspensionLevelAction',
      '9': 0,
      '10': 'setSuspensionLevelAction'
    },
  ],
  '8': [
    {'1': 'vehicle_action_msg'},
  ],
  '9': [
    {'1': 11, '2': 12},
    {'1': 60, '2': 61},
    {'1': 76, '2': 77},
  ],
};

/// Descriptor for `VehicleAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List vehicleActionDescriptor = $convert.base64Decode(
    'Cg1WZWhpY2xlQWN0aW9uEkMKDmdldFZlaGljbGVEYXRhGAEgASgLMhkuQ2FyU2VydmVyLkdldF'
    'ZlaGljbGVEYXRhSABSDmdldFZlaGljbGVEYXRhEkkKEHJlbW90ZVN0YXJ0RHJpdmUYAiABKAsy'
    'Gy5DYXJTZXJ2ZXIuUmVtb3RlU3RhcnREcml2ZUgAUhByZW1vdGVTdGFydERyaXZlElIKE2NyZW'
    'F0ZVN0cmVhbVNlc3Npb24YAyABKAsyHi5DYXJTZXJ2ZXIuQ3JlYXRlU3RyZWFtU2Vzc2lvbkgA'
    'UhNjcmVhdGVTdHJlYW1TZXNzaW9uEkAKDXN0cmVhbU1lc3NhZ2UYBCABKAsyGC5DYXJTZXJ2ZX'
    'IuU3RyZWFtTWVzc2FnZUgAUg1zdHJlYW1NZXNzYWdlElsKFmNoYXJnaW5nU2V0TGltaXRBY3Rp'
    'b24YBSABKAsyIS5DYXJTZXJ2ZXIuQ2hhcmdpbmdTZXRMaW1pdEFjdGlvbkgAUhZjaGFyZ2luZ1'
    'NldExpbWl0QWN0aW9uEl4KF2NoYXJnaW5nU3RhcnRTdG9wQWN0aW9uGAYgASgLMiIuQ2FyU2Vy'
    'dmVyLkNoYXJnaW5nU3RhcnRTdG9wQWN0aW9uSABSF2NoYXJnaW5nU3RhcnRTdG9wQWN0aW9uEn'
    'YKH2RyaXZpbmdDbGVhclNwZWVkTGltaXRQaW5BY3Rpb24YByABKAsyKi5DYXJTZXJ2ZXIuRHJp'
    'dmluZ0NsZWFyU3BlZWRMaW1pdFBpbkFjdGlvbkgAUh9kcml2aW5nQ2xlYXJTcGVlZExpbWl0UG'
    'luQWN0aW9uEmcKGmRyaXZpbmdTZXRTcGVlZExpbWl0QWN0aW9uGAggASgLMiUuQ2FyU2VydmVy'
    'LkRyaXZpbmdTZXRTcGVlZExpbWl0QWN0aW9uSABSGmRyaXZpbmdTZXRTcGVlZExpbWl0QWN0aW'
    '9uEl4KF2RyaXZpbmdTcGVlZExpbWl0QWN0aW9uGAkgASgLMiIuQ2FyU2VydmVyLkRyaXZpbmdT'
    'cGVlZExpbWl0QWN0aW9uSABSF2RyaXZpbmdTcGVlZExpbWl0QWN0aW9uEkMKDmh2YWNBdXRvQW'
    'N0aW9uGAogASgLMhkuQ2FyU2VydmVyLkh2YWNBdXRvQWN0aW9uSABSDmh2YWNBdXRvQWN0aW9u'
    'EnYKH2h2YWNTZXRQcmVjb25kaXRpb25pbmdNYXhBY3Rpb24YDCABKAsyKi5DYXJTZXJ2ZXIuSH'
    'ZhY1NldFByZWNvbmRpdGlvbmluZ01heEFjdGlvbkgAUh9odmFjU2V0UHJlY29uZGl0aW9uaW5n'
    'TWF4QWN0aW9uEnAKHWh2YWNTdGVlcmluZ1doZWVsSGVhdGVyQWN0aW9uGA0gASgLMiguQ2FyU2'
    'VydmVyLkh2YWNTdGVlcmluZ1doZWVsSGVhdGVyQWN0aW9uSABSHWh2YWNTdGVlcmluZ1doZWVs'
    'SGVhdGVyQWN0aW9uEnYKH2h2YWNUZW1wZXJhdHVyZUFkanVzdG1lbnRBY3Rpb24YDiABKAsyKi'
    '5DYXJTZXJ2ZXIuSHZhY1RlbXBlcmF0dXJlQWRqdXN0bWVudEFjdGlvbkgAUh9odmFjVGVtcGVy'
    'YXR1cmVBZGp1c3RtZW50QWN0aW9uEkYKD21lZGlhUGxheUFjdGlvbhgPIAEoCzIaLkNhclNlcn'
    'Zlci5NZWRpYVBsYXlBY3Rpb25IAFIPbWVkaWFQbGF5QWN0aW9uEkwKEW1lZGlhVXBkYXRlVm9s'
    'dW1lGBAgASgLMhwuQ2FyU2VydmVyLk1lZGlhVXBkYXRlVm9sdW1lSABSEW1lZGlhVXBkYXRlVm'
    '9sdW1lEkwKEW1lZGlhTmV4dEZhdm9yaXRlGBEgASgLMhwuQ2FyU2VydmVyLk1lZGlhTmV4dEZh'
    'dm9yaXRlSABSEW1lZGlhTmV4dEZhdm9yaXRlElgKFW1lZGlhUHJldmlvdXNGYXZvcml0ZRgSIA'
    'EoCzIgLkNhclNlcnZlci5NZWRpYVByZXZpb3VzRmF2b3JpdGVIAFIVbWVkaWFQcmV2aW91c0Zh'
    'dm9yaXRlEkMKDm1lZGlhTmV4dFRyYWNrGBMgASgLMhkuQ2FyU2VydmVyLk1lZGlhTmV4dFRyYW'
    'NrSABSDm1lZGlhTmV4dFRyYWNrEk8KEm1lZGlhUHJldmlvdXNUcmFjaxgUIAEoCzIdLkNhclNl'
    'cnZlci5NZWRpYVByZXZpb3VzVHJhY2tIAFISbWVkaWFQcmV2aW91c1RyYWNrEkwKEW5hdmlnYX'
    'Rpb25SZXF1ZXN0GBUgASgLMhwuQ2FyU2VydmVyLk5hdmlnYXRpb25SZXF1ZXN0SABSEW5hdmln'
    'YXRpb25SZXF1ZXN0EnAKHW5hdmlnYXRpb25TdXBlcmNoYXJnZXJSZXF1ZXN0GBYgASgLMiguQ2'
    'FyU2VydmVyLk5hdmlnYXRpb25TdXBlcmNoYXJnZXJSZXF1ZXN0SABSHW5hdmlnYXRpb25TdXBl'
    'cmNoYXJnZXJSZXF1ZXN0ElsKFmdldE5lYXJieUNoYXJnaW5nU2l0ZXMYFyABKAsyIS5DYXJTZX'
    'J2ZXIuR2V0TmVhcmJ5Q2hhcmdpbmdTaXRlc0gAUhZnZXROZWFyYnlDaGFyZ2luZ1NpdGVzEm0K'
    'HHVpU2V0VXBjb21pbmdDYWxlbmRhckVudHJpZXMYGCABKAsyJy5DYXJTZXJ2ZXIuVWlTZXRVcG'
    'NvbWluZ0NhbGVuZGFyRW50cmllc0gAUhx1aVNldFVwY29taW5nQ2FsZW5kYXJFbnRyaWVzEpEB'
    'Cih2ZWhpY2xlQ29udHJvbENhbmNlbFNvZnR3YXJlVXBkYXRlQWN0aW9uGBkgASgLMjMuQ2FyU2'
    'VydmVyLlZlaGljbGVDb250cm9sQ2FuY2VsU29mdHdhcmVVcGRhdGVBY3Rpb25IAFIodmVoaWNs'
    'ZUNvbnRyb2xDYW5jZWxTb2Z0d2FyZVVwZGF0ZUFjdGlvbhJ2Ch92ZWhpY2xlQ29udHJvbEZsYX'
    'NoTGlnaHRzQWN0aW9uGBogASgLMiouQ2FyU2VydmVyLlZlaGljbGVDb250cm9sRmxhc2hMaWdo'
    'dHNBY3Rpb25IAFIfdmVoaWNsZUNvbnRyb2xGbGFzaExpZ2h0c0FjdGlvbhJtChx2ZWhpY2xlQ2'
    '9udHJvbEhvbmtIb3JuQWN0aW9uGBsgASgLMicuQ2FyU2VydmVyLlZlaGljbGVDb250cm9sSG9u'
    'a0hvcm5BY3Rpb25IAFIcdmVoaWNsZUNvbnRyb2xIb25rSG9ybkFjdGlvbhJ8CiF2ZWhpY2xlQ2'
    '9udHJvbFJlc2V0VmFsZXRQaW5BY3Rpb24YHCABKAsyLC5DYXJTZXJ2ZXIuVmVoaWNsZUNvbnRy'
    'b2xSZXNldFZhbGV0UGluQWN0aW9uSABSIXZlaGljbGVDb250cm9sUmVzZXRWYWxldFBpbkFjdG'
    'lvbhKXAQoqdmVoaWNsZUNvbnRyb2xTY2hlZHVsZVNvZnR3YXJlVXBkYXRlQWN0aW9uGB0gASgL'
    'MjUuQ2FyU2VydmVyLlZlaGljbGVDb250cm9sU2NoZWR1bGVTb2Z0d2FyZVVwZGF0ZUFjdGlvbk'
    'gAUip2ZWhpY2xlQ29udHJvbFNjaGVkdWxlU29mdHdhcmVVcGRhdGVBY3Rpb24SfAohdmVoaWNs'
    'ZUNvbnRyb2xTZXRTZW50cnlNb2RlQWN0aW9uGB4gASgLMiwuQ2FyU2VydmVyLlZlaGljbGVDb2'
    '50cm9sU2V0U2VudHJ5TW9kZUFjdGlvbkgAUiF2ZWhpY2xlQ29udHJvbFNldFNlbnRyeU1vZGVB'
    'Y3Rpb24SeQogdmVoaWNsZUNvbnRyb2xTZXRWYWxldE1vZGVBY3Rpb24YHyABKAsyKy5DYXJTZX'
    'J2ZXIuVmVoaWNsZUNvbnRyb2xTZXRWYWxldE1vZGVBY3Rpb25IAFIgdmVoaWNsZUNvbnRyb2xT'
    'ZXRWYWxldE1vZGVBY3Rpb24ShQEKJHZlaGljbGVDb250cm9sU3Vucm9vZk9wZW5DbG9zZUFjdG'
    'lvbhggIAEoCzIvLkNhclNlcnZlci5WZWhpY2xlQ29udHJvbFN1bnJvb2ZPcGVuQ2xvc2VBY3Rp'
    'b25IAFIkdmVoaWNsZUNvbnRyb2xTdW5yb29mT3BlbkNsb3NlQWN0aW9uEoIBCiN2ZWhpY2xlQ2'
    '9udHJvbFRyaWdnZXJIb21lbGlua0FjdGlvbhghIAEoCzIuLkNhclNlcnZlci5WZWhpY2xlQ29u'
    'dHJvbFRyaWdnZXJIb21lbGlua0FjdGlvbkgAUiN2ZWhpY2xlQ29udHJvbFRyaWdnZXJIb21lbG'
    'lua0FjdGlvbhJnChp2ZWhpY2xlQ29udHJvbFdpbmRvd0FjdGlvbhgiIAEoCzIlLkNhclNlcnZl'
    'ci5WZWhpY2xlQ29udHJvbFdpbmRvd0FjdGlvbkgAUhp2ZWhpY2xlQ29udHJvbFdpbmRvd0FjdG'
    'lvbhJeChdodmFjQmlvd2VhcG9uTW9kZUFjdGlvbhgjIAEoCzIiLkNhclNlcnZlci5IdmFjQmlv'
    'd2VhcG9uTW9kZUFjdGlvbkgAUhdodmFjQmlvd2VhcG9uTW9kZUFjdGlvbhJYChVodmFjU2VhdE'
    'hlYXRlckFjdGlvbnMYJCABKAsyIC5DYXJTZXJ2ZXIuSHZhY1NlYXRIZWF0ZXJBY3Rpb25zSABS'
    'FWh2YWNTZWF0SGVhdGVyQWN0aW9ucxJeChd2ZWhpY2xlRGF0YVN1YnNjcmlwdGlvbhglIAEoCz'
    'IiLkNhclNlcnZlci5WZWhpY2xlRGF0YVN1YnNjcmlwdGlvbkgAUhd2ZWhpY2xlRGF0YVN1YnNj'
    'cmlwdGlvbhJDCg52ZWhpY2xlRGF0YUFjaxgmIAEoCzIZLkNhclNlcnZlci5WZWhpY2xlRGF0YU'
    'Fja0gAUg52ZWhpY2xlRGF0YUFjaxJPChJ2aXRhbHNTdWJzY3JpcHRpb24YJyABKAsyHS5DYXJT'
    'ZXJ2ZXIuVml0YWxzU3Vic2NyaXB0aW9uSABSEnZpdGFsc1N1YnNjcmlwdGlvbhI0Cgl2aXRhbH'
    'NBY2sYKCABKAsyFC5DYXJTZXJ2ZXIuVml0YWxzQWNrSABSCXZpdGFsc0FjaxJeChdzY2hlZHVs'
    'ZWRDaGFyZ2luZ0FjdGlvbhgpIAEoCzIiLkNhclNlcnZlci5TY2hlZHVsZWRDaGFyZ2luZ0FjdG'
    'lvbkgAUhdzY2hlZHVsZWRDaGFyZ2luZ0FjdGlvbhJhChhzY2hlZHVsZWREZXBhcnR1cmVBY3Rp'
    'b24YKiABKAsyIy5DYXJTZXJ2ZXIuU2NoZWR1bGVkRGVwYXJ0dXJlQWN0aW9uSABSGHNjaGVkdW'
    'xlZERlcGFydHVyZUFjdGlvbhJYChVzZXRDaGFyZ2luZ0FtcHNBY3Rpb24YKyABKAsyIC5DYXJT'
    'ZXJ2ZXIuU2V0Q2hhcmdpbmdBbXBzQWN0aW9uSABSFXNldENoYXJnaW5nQW1wc0FjdGlvbhJeCh'
    'dodmFjQ2xpbWF0ZUtlZXBlckFjdGlvbhgsIAEoCzIiLkNhclNlcnZlci5IdmFjQ2xpbWF0ZUtl'
    'ZXBlckFjdGlvbkgAUhdodmFjQ2xpbWF0ZUtlZXBlckFjdGlvbhJeChdodmFjUmVjaXJjdWxhdG'
    'lvbkFjdGlvbhgtIAEoCzIiLkNhclNlcnZlci5IdmFjUmVjaXJjdWxhdGlvbkFjdGlvbkgAUhdo'
    'dmFjUmVjaXJjdWxhdGlvbkFjdGlvbhIlCgRwaW5nGC4gASgLMg8uQ2FyU2VydmVyLlBpbmdIAF'
    'IEcGluZxJYChVkYXNoY2FtU2F2ZUNsaXBBY3Rpb24YLyABKAsyIC5DYXJTZXJ2ZXIuRGFzaGNh'
    'bVNhdmVDbGlwQWN0aW9uSABSFWRhc2hjYW1TYXZlQ2xpcEFjdGlvbhJYChVhdXRvU2VhdENsaW'
    '1hdGVBY3Rpb24YMCABKAsyIC5DYXJTZXJ2ZXIuQXV0b1NlYXRDbGltYXRlQWN0aW9uSABSFWF1'
    'dG9TZWF0Q2xpbWF0ZUFjdGlvbhJYChVodmFjU2VhdENvb2xlckFjdGlvbnMYMSABKAsyIC5DYX'
    'JTZXJ2ZXIuSHZhY1NlYXRDb29sZXJBY3Rpb25zSABSFWh2YWNTZWF0Q29vbGVyQWN0aW9ucxJ5'
    'CiBzZXRDYWJpbk92ZXJoZWF0UHJvdGVjdGlvbkFjdGlvbhgyIAEoCzIrLkNhclNlcnZlci5TZX'
    'RDYWJpbk92ZXJoZWF0UHJvdGVjdGlvbkFjdGlvbkgAUiBzZXRDYWJpbk92ZXJoZWF0UHJvdGVj'
    'dGlvbkFjdGlvbhJACg1waWlLZXlSZXF1ZXN0GDMgASgLMhguQ2FyU2VydmVyLlBpaUtleVJlcX'
    'Vlc3RIAFINcGlpS2V5UmVxdWVzdBJVChRwc2V1ZG9ueW1TeW5jUmVxdWVzdBg0IAEoCzIfLkNh'
    'clNlcnZlci5Qc2V1ZG9ueW1TeW5jUmVxdWVzdEgAUhRwc2V1ZG9ueW1TeW5jUmVxdWVzdBJVCh'
    'RuYXZpZ2F0aW9uR3BzUmVxdWVzdBg1IAEoCzIfLkNhclNlcnZlci5OYXZpZ2F0aW9uR3BzUmVx'
    'dWVzdEgAUhRuYXZpZ2F0aW9uR3BzUmVxdWVzdBJVChRzZXRWZWhpY2xlTmFtZUFjdGlvbhg2IA'
    'EoCzIfLkNhclNlcnZlci5TZXRWZWhpY2xlTmFtZUFjdGlvbkgAUhRzZXRWZWhpY2xlTmFtZUFj'
    'dGlvbhJVChRzZXRSYXRlVGFyaWZmUmVxdWVzdBg3IAEoCzIfLkNhclNlcnZlci5TZXRSYXRlVG'
    'FyaWZmUmVxdWVzdEgAUhRzZXRSYXRlVGFyaWZmUmVxdWVzdBJVChRnZXRSYXRlVGFyaWZmUmVx'
    'dWVzdBg4IAEoCzIfLkNhclNlcnZlci5HZXRSYXRlVGFyaWZmUmVxdWVzdEgAUhRnZXRSYXRlVG'
    'FyaWZmUmVxdWVzdBJPChJ2aWRlb1JlcXVlc3RBY3Rpb24YOSABKAsyHS5DYXJTZXJ2ZXIuVmlk'
    'ZW9SZXF1ZXN0QWN0aW9uSABSEnZpZGVvUmVxdWVzdEFjdGlvbhJSChN0YWtlRHJpdmVub3RlQW'
    'N0aW9uGDogASgLMh4uQ2FyU2VydmVyLlRha2VEcml2ZW5vdGVBY3Rpb25IAFITdGFrZURyaXZl'
    'bm90ZUFjdGlvbhJSChNjaGFyZ2VQb3J0RG9vckNsb3NlGD0gASgLMh4uQ2FyU2VydmVyLkNoYX'
    'JnZVBvcnREb29yQ2xvc2VIAFITY2hhcmdlUG9ydERvb3JDbG9zZRJPChJjaGFyZ2VQb3J0RG9v'
    'ck9wZW4YPiABKAsyHS5DYXJTZXJ2ZXIuQ2hhcmdlUG9ydERvb3JPcGVuSABSEmNoYXJnZVBvcn'
    'REb29yT3BlbhJzCh5ibHVldG9vdGhDbGFzc2ljUGFpcmluZ1JlcXVlc3QYPyABKAsyKS5DYXJT'
    'ZXJ2ZXIuQmx1ZXRvb3RoQ2xhc3NpY1BhaXJpbmdSZXF1ZXN0SABSHmJsdWV0b290aENsYXNzaW'
    'NQYWlyaW5nUmVxdWVzdBJACg1ib29tYm94QWN0aW9uGEAgASgLMhguQ2FyU2VydmVyLkJvb21i'
    'b3hBY3Rpb25IAFINYm9vbWJveEFjdGlvbhJNCg9ndWVzdE1vZGVBY3Rpb24YQSABKAsyIS5DYX'
    'JTZXJ2ZXIuVmVoaWNsZVN0YXRlLkd1ZXN0TW9kZUgAUg9ndWVzdE1vZGVBY3Rpb24SSQoQc2V0'
    'Q29wVGVtcEFjdGlvbhhCIAEoCzIbLkNhclNlcnZlci5TZXRDb3BUZW1wQWN0aW9uSABSEHNldE'
    'NvcFRlbXBBY3Rpb24ScAodYWRkTWFuYWdlZENoYXJnaW5nU2l0ZVJlcXVlc3QYQyABKAsyKC5D'
    'YXJTZXJ2ZXIuQWRkTWFuYWdlZENoYXJnaW5nU2l0ZVJlcXVlc3RIAFIdYWRkTWFuYWdlZENoYX'
    'JnaW5nU2l0ZVJlcXVlc3QSeQogcmVtb3ZlTWFuYWdlZENoYXJnaW5nU2l0ZVJlcXVlc3QYRCAB'
    'KAsyKy5DYXJTZXJ2ZXIuUmVtb3ZlTWFuYWdlZENoYXJnaW5nU2l0ZVJlcXVlc3RIAFIgcmVtb3'
    'ZlTWFuYWdlZENoYXJnaW5nU2l0ZVJlcXVlc3QSWAoVbmF2aWdhdGlvblJvdXRlQWN0aW9uGEUg'
    'ASgLMiAuQ2FyU2VydmVyLk5hdmlnYXRpb25Sb3V0ZUFjdGlvbkgAUhVuYXZpZ2F0aW9uUm91dG'
    'VBY3Rpb24STAoRYXV0b1N0d0hlYXRBY3Rpb24YRiABKAsyHC5DYXJTZXJ2ZXIuQXV0b1N0d0hl'
    'YXRBY3Rpb25IAFIRYXV0b1N0d0hlYXRBY3Rpb24STwoSc3R3SGVhdExldmVsQWN0aW9uGEcgAS'
    'gLMh0uQ2FyU2VydmVyLlN0d0hlYXRMZXZlbEFjdGlvbkgAUhJzdHdIZWF0TGV2ZWxBY3Rpb24S'
    'UgoTZXJhc2VVc2VyRGF0YUFjdGlvbhhIIAEoCzIeLkNhclNlcnZlci5FcmFzZVVzZXJEYXRhQW'
    'N0aW9uSABSE2VyYXNlVXNlckRhdGFBY3Rpb24ScwoeZ2V0TWFuYWdlZENoYXJnaW5nU2l0ZXNS'
    'ZXF1ZXN0GEkgASgLMikuQ2FyU2VydmVyLkdldE1hbmFnZWRDaGFyZ2luZ1NpdGVzUmVxdWVzdE'
    'gAUh5nZXRNYW5hZ2VkQ2hhcmdpbmdTaXRlc1JlcXVlc3QSfAohdXBkYXRlQ2hhcmdlT25Tb2xh'
    'ckZlYXR1cmVSZXF1ZXN0GEogASgLMiwuQ2FyU2VydmVyLlVwZGF0ZUNoYXJnZU9uU29sYXJGZW'
    'F0dXJlUmVxdWVzdEgAUiF1cGRhdGVDaGFyZ2VPblNvbGFyRmVhdHVyZVJlcXVlc3QScwoeZ2V0'
    'Q2hhcmdlT25Tb2xhckZlYXR1cmVSZXF1ZXN0GEsgASgLMikuQ2FyU2VydmVyLkdldENoYXJnZU'
    '9uU29sYXJGZWF0dXJlUmVxdWVzdEgAUh5nZXRDaGFyZ2VPblNvbGFyRmVhdHVyZVJlcXVlc3QS'
    'fAohdmVoaWNsZUNvbnRyb2xTZXRQaW5Ub0RyaXZlQWN0aW9uGE0gASgLMiwuQ2FyU2VydmVyLl'
    'ZlaGljbGVDb250cm9sU2V0UGluVG9Ecml2ZUFjdGlvbkgAUiF2ZWhpY2xlQ29udHJvbFNldFBp'
    'blRvRHJpdmVBY3Rpb24SggEKI3ZlaGljbGVDb250cm9sUmVzZXRQaW5Ub0RyaXZlQWN0aW9uGE'
    '4gASgLMi4uQ2FyU2VydmVyLlZlaGljbGVDb250cm9sUmVzZXRQaW5Ub0RyaXZlQWN0aW9uSABS'
    'I3ZlaGljbGVDb250cm9sUmVzZXRQaW5Ub0RyaXZlQWN0aW9uEoUBCiRkcml2aW5nQ2xlYXJTcG'
    'VlZExpbWl0UGluQWRtaW5BY3Rpb24YTyABKAsyLy5DYXJTZXJ2ZXIuRHJpdmluZ0NsZWFyU3Bl'
    'ZWRMaW1pdFBpbkFkbWluQWN0aW9uSABSJGRyaXZpbmdDbGVhclNwZWVkTGltaXRQaW5BZG1pbk'
    'FjdGlvbhJYChVzZXRPdXRsZXRzT25PZmZBY3Rpb24YUCABKAsyIC5DYXJTZXJ2ZXIuU2V0T3V0'
    'bGV0c09uT2ZmQWN0aW9uSABSFXNldE91dGxldHNPbk9mZkFjdGlvbhJVChRzZXRPdXRsZXRUaW'
    '1lckFjdGlvbhhRIAEoCzIfLkNhclNlcnZlci5TZXRPdXRsZXRUaW1lckFjdGlvbkgAUhRzZXRP'
    'dXRsZXRUaW1lckFjdGlvbhJeChdzZXRPdXRsZXRTb2NMaW1pdEFjdGlvbhhSIAEoCzIiLkNhcl'
    'NlcnZlci5TZXRPdXRsZXRTb2NMaW1pdEFjdGlvbkgAUhdzZXRPdXRsZXRTb2NMaW1pdEFjdGlv'
    'bhJeChdzZXRQb3dlckZlZWRPbk9mZkFjdGlvbhhTIAEoCzIiLkNhclNlcnZlci5TZXRQb3dlck'
    'ZlZWRPbk9mZkFjdGlvbkgAUhdzZXRQb3dlckZlZWRPbk9mZkFjdGlvbhJeChdzZXRQb3dlckZl'
    'ZWRUaW1lckFjdGlvbhhUIAEoCzIiLkNhclNlcnZlci5TZXRQb3dlckZlZWRUaW1lckFjdGlvbk'
    'gAUhdzZXRQb3dlckZlZWRUaW1lckFjdGlvbhJnChpzZXRQb3dlckZlZWRTb2NMaW1pdEFjdGlv'
    'bhhVIAEoCzIlLkNhclNlcnZlci5TZXRQb3dlckZlZWRTb2NMaW1pdEFjdGlvbkgAUhpzZXRQb3'
    'dlckZlZWRTb2NMaW1pdEFjdGlvbhJ/CiJzZXRUcmFpbGVyTGlnaHRUZXN0U3RhcnRTdG9wQWN0'
    'aW9uGFYgASgLMi0uQ2FyU2VydmVyLlNldFRyYWlsZXJMaWdodFRlc3RTdGFydFN0b3BBY3Rpb2'
    '5IAFIic2V0VHJhaWxlckxpZ2h0VGVzdFN0YXJ0U3RvcEFjdGlvbhJ2Ch9zZXRUcnVja0JlZExp'
    'Z2h0QXV0b1N0YXRlQWN0aW9uGFcgASgLMiouQ2FyU2VydmVyLlNldFRydWNrQmVkTGlnaHRBdX'
    'RvU3RhdGVBY3Rpb25IAFIfc2V0VHJ1Y2tCZWRMaWdodEF1dG9TdGF0ZUFjdGlvbhJ5CiBzZXRU'
    'cnVja0JlZExpZ2h0QnJpZ2h0bmVzc0FjdGlvbhhYIAEoCzIrLkNhclNlcnZlci5TZXRUcnVja0'
    'JlZExpZ2h0QnJpZ2h0bmVzc0FjdGlvbkgAUiBzZXRUcnVja0JlZExpZ2h0QnJpZ2h0bmVzc0Fj'
    'dGlvbhKRAQoodmVoaWNsZUNvbnRyb2xSZXNldFBpblRvRHJpdmVBZG1pbkFjdGlvbhhZIAEoCz'
    'IzLkNhclNlcnZlci5WZWhpY2xlQ29udHJvbFJlc2V0UGluVG9Ecml2ZUFkbWluQWN0aW9uSABS'
    'KHZlaGljbGVDb250cm9sUmVzZXRQaW5Ub0RyaXZlQWRtaW5BY3Rpb24SZwoabmF2aWdhdGlvbl'
    'dheXBvaW50c1JlcXVlc3QYWiABKAsyJS5DYXJTZXJ2ZXIuTmF2aWdhdGlvbldheXBvaW50c1Jl'
    'cXVlc3RIAFIabmF2aWdhdGlvbldheXBvaW50c1JlcXVlc3QSZwoac2V0UG93ZXJzaGFyZUZlYX'
    'R1cmVBY3Rpb24YWyABKAsyJS5DYXJTZXJ2ZXIuU2V0UG93ZXJzaGFyZUZlYXR1cmVBY3Rpb25I'
    'AFIac2V0UG93ZXJzaGFyZUZlYXR1cmVBY3Rpb24SfAohc2V0UG93ZXJzaGFyZURpc2NoYXJnZU'
    'xpbWl0QWN0aW9uGFwgASgLMiwuQ2FyU2VydmVyLlNldFBvd2Vyc2hhcmVEaXNjaGFyZ2VMaW1p'
    'dEFjdGlvbkgAUiFzZXRQb3dlcnNoYXJlRGlzY2hhcmdlTGltaXRBY3Rpb24SZwoac2V0UG93ZX'
    'JzaGFyZVJlcXVlc3RBY3Rpb24YXSABKAsyJS5DYXJTZXJ2ZXIuU2V0UG93ZXJzaGFyZVJlcXVl'
    'c3RBY3Rpb25IAFIac2V0UG93ZXJzaGFyZVJlcXVlc3RBY3Rpb24SYQoYc2V0VGVudE1vZGVSZX'
    'F1ZXN0QWN0aW9uGF4gASgLMiMuQ2FyU2VydmVyLlNldFRlbnRNb2RlUmVxdWVzdEFjdGlvbkgA'
    'UhhzZXRUZW50TW9kZVJlcXVlc3RBY3Rpb24Sbgoec2V0RnJvbnRab25lTGlnaHRSZXF1ZXN0QW'
    'N0aW9uGF8gASgLMiQuQ2FyU2VydmVyLlNldFpvbmVMaWdodFJlcXVlc3RBY3Rpb25IAFIec2V0'
    'RnJvbnRab25lTGlnaHRSZXF1ZXN0QWN0aW9uEmwKHXNldFJlYXJab25lTGlnaHRSZXF1ZXN0QW'
    'N0aW9uGGAgASgLMiQuQ2FyU2VydmVyLlNldFpvbmVMaWdodFJlcXVlc3RBY3Rpb25IAFIdc2V0'
    'UmVhclpvbmVMaWdodFJlcXVlc3RBY3Rpb24SVQoXYWRkQ2hhcmdlU2NoZWR1bGVBY3Rpb24YYS'
    'ABKAsyGS5DYXJTZXJ2ZXIuQ2hhcmdlU2NoZWR1bGVIAFIXYWRkQ2hhcmdlU2NoZWR1bGVBY3Rp'
    'b24SZwoacmVtb3ZlQ2hhcmdlU2NoZWR1bGVBY3Rpb24YYiABKAsyJS5DYXJTZXJ2ZXIuUmVtb3'
    'ZlQ2hhcmdlU2NoZWR1bGVBY3Rpb25IAFIacmVtb3ZlQ2hhcmdlU2NoZWR1bGVBY3Rpb24SZwod'
    'YWRkUHJlY29uZGl0aW9uU2NoZWR1bGVBY3Rpb24YYyABKAsyHy5DYXJTZXJ2ZXIuUHJlY29uZG'
    'l0aW9uU2NoZWR1bGVIAFIdYWRkUHJlY29uZGl0aW9uU2NoZWR1bGVBY3Rpb24SeQogcmVtb3Zl'
    'UHJlY29uZGl0aW9uU2NoZWR1bGVBY3Rpb24YZCABKAsyKy5DYXJTZXJ2ZXIuUmVtb3ZlUHJlY2'
    '9uZGl0aW9uU2NoZWR1bGVBY3Rpb25IAFIgcmVtb3ZlUHJlY29uZGl0aW9uU2NoZWR1bGVBY3Rp'
    'b24Sagobc2V0TGlnaHRiYXJCcmlnaHRuZXNzQWN0aW9uGGUgASgLMiYuQ2FyU2VydmVyLlNldE'
    'xpZ2h0YmFyQnJpZ2h0bmVzc0FjdGlvbkgAUhtzZXRMaWdodGJhckJyaWdodG5lc3NBY3Rpb24S'
    'XgoXc2V0TGlnaHRiYXJNaWRkbGVBY3Rpb24YZiABKAsyIi5DYXJTZXJ2ZXIuU2V0TGlnaHRiYX'
    'JNaWRkbGVBY3Rpb25IAFIXc2V0TGlnaHRiYXJNaWRkbGVBY3Rpb24SWwoWc2V0TGlnaHRiYXJE'
    'aXRjaEFjdGlvbhhnIAEoCzIhLkNhclNlcnZlci5TZXRMaWdodGJhckRpdGNoQWN0aW9uSABSFn'
    'NldExpZ2h0YmFyRGl0Y2hBY3Rpb24STAoRZ2V0TWVzc2FnZXNBY3Rpb24YaCABKAsyHC5DYXJT'
    'ZXJ2ZXIuR2V0TWVzc2FnZXNBY3Rpb25IAFIRZ2V0TWVzc2FnZXNBY3Rpb24SXgoXdGVzbGFBdX'
    'RoUmVzcG9uc2VBY3Rpb24YaSABKAsyIi5DYXJTZXJ2ZXIuVGVzbGFBdXRoUmVzcG9uc2VBY3Rp'
    'b25IAFIXdGVzbGFBdXRoUmVzcG9uc2VBY3Rpb24SdgofbmF2aWdhdGlvbkdwc0Rlc3RpbmF0aW'
    '9uUmVxdWVzdBhqIAEoCzIqLkNhclNlcnZlci5OYXZpZ2F0aW9uR3BzRGVzdGluYXRpb25SZXF1'
    'ZXN0SABSH25hdmlnYXRpb25HcHNEZXN0aW5hdGlvblJlcXVlc3QSiwEKJmJhdGNoUmVtb3ZlUH'
    'JlY29uZGl0aW9uU2NoZWR1bGVzQWN0aW9uGGsgASgLMjEuQ2FyU2VydmVyLkJhdGNoUmVtb3Zl'
    'UHJlY29uZGl0aW9uU2NoZWR1bGVzQWN0aW9uSABSJmJhdGNoUmVtb3ZlUHJlY29uZGl0aW9uU2'
    'NoZWR1bGVzQWN0aW9uEnkKIGJhdGNoUmVtb3ZlQ2hhcmdlU2NoZWR1bGVzQWN0aW9uGGwgASgL'
    'MisuQ2FyU2VydmVyLkJhdGNoUmVtb3ZlQ2hhcmdlU2NoZWR1bGVzQWN0aW9uSABSIGJhdGNoUm'
    'Vtb3ZlQ2hhcmdlU2NoZWR1bGVzQWN0aW9uEnMKHnBhcmVudGFsQ29udHJvbHNDbGVhclBpbkFj'
    'dGlvbhhtIAEoCzIpLkNhclNlcnZlci5QYXJlbnRhbENvbnRyb2xzQ2xlYXJQaW5BY3Rpb25IAF'
    'IecGFyZW50YWxDb250cm9sc0NsZWFyUGluQWN0aW9uEoIBCiNwYXJlbnRhbENvbnRyb2xzQ2xl'
    'YXJQaW5BZG1pbkFjdGlvbhhuIAEoCzIuLkNhclNlcnZlci5QYXJlbnRhbENvbnRyb2xzQ2xlYX'
    'JQaW5BZG1pbkFjdGlvbkgAUiNwYXJlbnRhbENvbnRyb2xzQ2xlYXJQaW5BZG1pbkFjdGlvbhJb'
    'ChZwYXJlbnRhbENvbnRyb2xzQWN0aW9uGG8gASgLMiEuQ2FyU2VydmVyLlBhcmVudGFsQ29udH'
    'JvbHNBY3Rpb25IAFIWcGFyZW50YWxDb250cm9sc0FjdGlvbhKFAQokcGFyZW50YWxDb250cm9s'
    'c0VuYWJsZVNldHRpbmdzQWN0aW9uGHAgASgLMi8uQ2FyU2VydmVyLlBhcmVudGFsQ29udHJvbH'
    'NFbmFibGVTZXR0aW5nc0FjdGlvbkgAUiRwYXJlbnRhbENvbnRyb2xzRW5hYmxlU2V0dGluZ3NB'
    'Y3Rpb24SggEKI3BhcmVudGFsQ29udHJvbHNTZXRTcGVlZExpbWl0QWN0aW9uGHEgASgLMi4uQ2'
    'FyU2VydmVyLlBhcmVudGFsQ29udHJvbHNTZXRTcGVlZExpbWl0QWN0aW9uSABSI3BhcmVudGFs'
    'Q29udHJvbHNTZXRTcGVlZExpbWl0QWN0aW9uElIKE2NhbmNlbFNvaFRlc3RBY3Rpb24YciABKA'
    'syHi5DYXJTZXJ2ZXIuQ2FuY2VsU29oVGVzdEFjdGlvbkgAUhNjYW5jZWxTb2hUZXN0QWN0aW9u'
    'ElIKE3N0b3BMaWdodFNob3dBY3Rpb24YdCABKAsyHi5DYXJTZXJ2ZXIuU3RvcExpZ2h0U2hvd0'
    'FjdGlvbkgAUhNzdG9wTGlnaHRTaG93QWN0aW9uElUKFHN0YXJ0TGlnaHRTaG93QWN0aW9uGHUg'
    'ASgLMh8uQ2FyU2VydmVyLlN0YXJ0TGlnaHRTaG93QWN0aW9uSABSFHN0YXJ0TGlnaHRTaG93QW'
    'N0aW9uEmEKGHNldFN1c3BlbnNpb25MZXZlbEFjdGlvbhh2IAEoCzIjLkNhclNlcnZlci5TZXRT'
    'dXNwZW5zaW9uTGV2ZWxBY3Rpb25IAFIYc2V0U3VzcGVuc2lvbkxldmVsQWN0aW9uQhQKEnZlaG'
    'ljbGVfYWN0aW9uX21zZ0oECAsQDEoECDwQPUoECEwQTQ==');

@$core.Deprecated('Use getVehicleDataDescriptor instead')
const GetVehicleData$json = {
  '1': 'GetVehicleData',
  '2': [
    {
      '1': 'getChargeState',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.CarServer.GetChargeState',
      '10': 'getChargeState'
    },
    {
      '1': 'getClimateState',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.CarServer.GetClimateState',
      '10': 'getClimateState'
    },
    {
      '1': 'getDriveState',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.CarServer.GetDriveState',
      '10': 'getDriveState'
    },
    {
      '1': 'getLocationState',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.CarServer.GetLocationState',
      '10': 'getLocationState'
    },
    {
      '1': 'getClosuresState',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.CarServer.GetClosuresState',
      '10': 'getClosuresState'
    },
    {
      '1': 'getChargeScheduleState',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.CarServer.GetChargeScheduleState',
      '10': 'getChargeScheduleState'
    },
    {
      '1': 'getPreconditioningScheduleState',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.CarServer.GetPreconditioningScheduleState',
      '10': 'getPreconditioningScheduleState'
    },
    {
      '1': 'getTirePressureState',
      '3': 14,
      '4': 1,
      '5': 11,
      '6': '.CarServer.GetTirePressureState',
      '10': 'getTirePressureState'
    },
    {
      '1': 'getMediaState',
      '3': 15,
      '4': 1,
      '5': 11,
      '6': '.CarServer.GetMediaState',
      '10': 'getMediaState'
    },
    {
      '1': 'getMediaDetailState',
      '3': 16,
      '4': 1,
      '5': 11,
      '6': '.CarServer.GetMediaDetailState',
      '10': 'getMediaDetailState'
    },
    {
      '1': 'getSoftwareUpdateState',
      '3': 17,
      '4': 1,
      '5': 11,
      '6': '.CarServer.GetSoftwareUpdateState',
      '10': 'getSoftwareUpdateState'
    },
    {
      '1': 'getParentalControlsState',
      '3': 19,
      '4': 1,
      '5': 11,
      '6': '.CarServer.GetParentalControlsState',
      '10': 'getParentalControlsState'
    },
  ],
  '9': [
    {'1': 5, '2': 6},
    {'1': 6, '2': 7},
    {'1': 12, '2': 13},
    {'1': 13, '2': 14},
  ],
};

/// Descriptor for `GetVehicleData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getVehicleDataDescriptor = $convert.base64Decode(
    'Cg5HZXRWZWhpY2xlRGF0YRJBCg5nZXRDaGFyZ2VTdGF0ZRgCIAEoCzIZLkNhclNlcnZlci5HZX'
    'RDaGFyZ2VTdGF0ZVIOZ2V0Q2hhcmdlU3RhdGUSRAoPZ2V0Q2xpbWF0ZVN0YXRlGAMgASgLMhou'
    'Q2FyU2VydmVyLkdldENsaW1hdGVTdGF0ZVIPZ2V0Q2xpbWF0ZVN0YXRlEj4KDWdldERyaXZlU3'
    'RhdGUYBCABKAsyGC5DYXJTZXJ2ZXIuR2V0RHJpdmVTdGF0ZVINZ2V0RHJpdmVTdGF0ZRJHChBn'
    'ZXRMb2NhdGlvblN0YXRlGAcgASgLMhsuQ2FyU2VydmVyLkdldExvY2F0aW9uU3RhdGVSEGdldE'
    'xvY2F0aW9uU3RhdGUSRwoQZ2V0Q2xvc3VyZXNTdGF0ZRgIIAEoCzIbLkNhclNlcnZlci5HZXRD'
    'bG9zdXJlc1N0YXRlUhBnZXRDbG9zdXJlc1N0YXRlElkKFmdldENoYXJnZVNjaGVkdWxlU3RhdG'
    'UYCiABKAsyIS5DYXJTZXJ2ZXIuR2V0Q2hhcmdlU2NoZWR1bGVTdGF0ZVIWZ2V0Q2hhcmdlU2No'
    'ZWR1bGVTdGF0ZRJ0Ch9nZXRQcmVjb25kaXRpb25pbmdTY2hlZHVsZVN0YXRlGAsgASgLMiouQ2'
    'FyU2VydmVyLkdldFByZWNvbmRpdGlvbmluZ1NjaGVkdWxlU3RhdGVSH2dldFByZWNvbmRpdGlv'
    'bmluZ1NjaGVkdWxlU3RhdGUSUwoUZ2V0VGlyZVByZXNzdXJlU3RhdGUYDiABKAsyHy5DYXJTZX'
    'J2ZXIuR2V0VGlyZVByZXNzdXJlU3RhdGVSFGdldFRpcmVQcmVzc3VyZVN0YXRlEj4KDWdldE1l'
    'ZGlhU3RhdGUYDyABKAsyGC5DYXJTZXJ2ZXIuR2V0TWVkaWFTdGF0ZVINZ2V0TWVkaWFTdGF0ZR'
    'JQChNnZXRNZWRpYURldGFpbFN0YXRlGBAgASgLMh4uQ2FyU2VydmVyLkdldE1lZGlhRGV0YWls'
    'U3RhdGVSE2dldE1lZGlhRGV0YWlsU3RhdGUSWQoWZ2V0U29mdHdhcmVVcGRhdGVTdGF0ZRgRIA'
    'EoCzIhLkNhclNlcnZlci5HZXRTb2Z0d2FyZVVwZGF0ZVN0YXRlUhZnZXRTb2Z0d2FyZVVwZGF0'
    'ZVN0YXRlEl8KGGdldFBhcmVudGFsQ29udHJvbHNTdGF0ZRgTIAEoCzIjLkNhclNlcnZlci5HZX'
    'RQYXJlbnRhbENvbnRyb2xzU3RhdGVSGGdldFBhcmVudGFsQ29udHJvbHNTdGF0ZUoECAUQBkoE'
    'CAYQB0oECAwQDUoECA0QDg==');

@$core.Deprecated('Use getTirePressureStateDescriptor instead')
const GetTirePressureState$json = {
  '1': 'GetTirePressureState',
};

/// Descriptor for `GetTirePressureState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTirePressureStateDescriptor =
    $convert.base64Decode('ChRHZXRUaXJlUHJlc3N1cmVTdGF0ZQ==');

@$core.Deprecated('Use getMediaStateDescriptor instead')
const GetMediaState$json = {
  '1': 'GetMediaState',
};

/// Descriptor for `GetMediaState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMediaStateDescriptor =
    $convert.base64Decode('Cg1HZXRNZWRpYVN0YXRl');

@$core.Deprecated('Use getMediaDetailStateDescriptor instead')
const GetMediaDetailState$json = {
  '1': 'GetMediaDetailState',
};

/// Descriptor for `GetMediaDetailState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMediaDetailStateDescriptor =
    $convert.base64Decode('ChNHZXRNZWRpYURldGFpbFN0YXRl');

@$core.Deprecated('Use getSoftwareUpdateStateDescriptor instead')
const GetSoftwareUpdateState$json = {
  '1': 'GetSoftwareUpdateState',
};

/// Descriptor for `GetSoftwareUpdateState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSoftwareUpdateStateDescriptor =
    $convert.base64Decode('ChZHZXRTb2Z0d2FyZVVwZGF0ZVN0YXRl');

@$core.Deprecated('Use getChargeStateDescriptor instead')
const GetChargeState$json = {
  '1': 'GetChargeState',
};

/// Descriptor for `GetChargeState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChargeStateDescriptor =
    $convert.base64Decode('Cg5HZXRDaGFyZ2VTdGF0ZQ==');

@$core.Deprecated('Use getClimateStateDescriptor instead')
const GetClimateState$json = {
  '1': 'GetClimateState',
};

/// Descriptor for `GetClimateState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getClimateStateDescriptor =
    $convert.base64Decode('Cg9HZXRDbGltYXRlU3RhdGU=');

@$core.Deprecated('Use getDriveStateDescriptor instead')
const GetDriveState$json = {
  '1': 'GetDriveState',
};

/// Descriptor for `GetDriveState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDriveStateDescriptor =
    $convert.base64Decode('Cg1HZXREcml2ZVN0YXRl');

@$core.Deprecated('Use getLocationStateDescriptor instead')
const GetLocationState$json = {
  '1': 'GetLocationState',
};

/// Descriptor for `GetLocationState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLocationStateDescriptor =
    $convert.base64Decode('ChBHZXRMb2NhdGlvblN0YXRl');

@$core.Deprecated('Use getClosuresStateDescriptor instead')
const GetClosuresState$json = {
  '1': 'GetClosuresState',
};

/// Descriptor for `GetClosuresState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getClosuresStateDescriptor =
    $convert.base64Decode('ChBHZXRDbG9zdXJlc1N0YXRl');

@$core.Deprecated('Use getChargeScheduleStateDescriptor instead')
const GetChargeScheduleState$json = {
  '1': 'GetChargeScheduleState',
};

/// Descriptor for `GetChargeScheduleState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChargeScheduleStateDescriptor =
    $convert.base64Decode('ChZHZXRDaGFyZ2VTY2hlZHVsZVN0YXRl');

@$core.Deprecated('Use getPreconditioningScheduleStateDescriptor instead')
const GetPreconditioningScheduleState$json = {
  '1': 'GetPreconditioningScheduleState',
};

/// Descriptor for `GetPreconditioningScheduleState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPreconditioningScheduleStateDescriptor =
    $convert.base64Decode('Ch9HZXRQcmVjb25kaXRpb25pbmdTY2hlZHVsZVN0YXRl');

@$core.Deprecated('Use getParentalControlsStateDescriptor instead')
const GetParentalControlsState$json = {
  '1': 'GetParentalControlsState',
};

/// Descriptor for `GetParentalControlsState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getParentalControlsStateDescriptor =
    $convert.base64Decode('ChhHZXRQYXJlbnRhbENvbnRyb2xzU3RhdGU=');

@$core.Deprecated('Use eraseUserDataActionDescriptor instead')
const EraseUserDataAction$json = {
  '1': 'EraseUserDataAction',
  '2': [
    {'1': 'reason', '3': 1, '4': 1, '5': 9, '10': 'reason'},
  ],
};

/// Descriptor for `EraseUserDataAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eraseUserDataActionDescriptor =
    $convert.base64Decode(
        'ChNFcmFzZVVzZXJEYXRhQWN0aW9uEhYKBnJlYXNvbhgBIAEoCVIGcmVhc29u');

@$core.Deprecated('Use responseDescriptor instead')
const Response$json = {
  '1': 'Response',
  '2': [
    {
      '1': 'actionStatus',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.CarServer.ActionStatus',
      '10': 'actionStatus'
    },
    {
      '1': 'vehicleData',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.CarServer.VehicleData',
      '9': 0,
      '10': 'vehicleData'
    },
    {
      '1': 'getSessionInfoResponse',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.Signatures.SessionInfo',
      '9': 0,
      '10': 'getSessionInfoResponse'
    },
    {
      '1': 'getNearbyChargingSites',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.CarServer.NearbyChargingSites',
      '9': 0,
      '10': 'getNearbyChargingSites'
    },
    {
      '1': 'ping',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Ping',
      '9': 0,
      '10': 'ping'
    },
  ],
  '8': [
    {'1': 'response_msg'},
  ],
};

/// Descriptor for `Response`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responseDescriptor = $convert.base64Decode(
    'CghSZXNwb25zZRI7CgxhY3Rpb25TdGF0dXMYASABKAsyFy5DYXJTZXJ2ZXIuQWN0aW9uU3RhdH'
    'VzUgxhY3Rpb25TdGF0dXMSOgoLdmVoaWNsZURhdGEYAiABKAsyFi5DYXJTZXJ2ZXIuVmVoaWNs'
    'ZURhdGFIAFILdmVoaWNsZURhdGESUQoWZ2V0U2Vzc2lvbkluZm9SZXNwb25zZRgDIAEoCzIXLl'
    'NpZ25hdHVyZXMuU2Vzc2lvbkluZm9IAFIWZ2V0U2Vzc2lvbkluZm9SZXNwb25zZRJYChZnZXRO'
    'ZWFyYnlDaGFyZ2luZ1NpdGVzGAUgASgLMh4uQ2FyU2VydmVyLk5lYXJieUNoYXJnaW5nU2l0ZX'
    'NIAFIWZ2V0TmVhcmJ5Q2hhcmdpbmdTaXRlcxIlCgRwaW5nGAkgASgLMg8uQ2FyU2VydmVyLlBp'
    'bmdIAFIEcGluZ0IOCgxyZXNwb25zZV9tc2c=');

@$core.Deprecated('Use actionStatusDescriptor instead')
const ActionStatus$json = {
  '1': 'ActionStatus',
  '2': [
    {
      '1': 'result',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.CarServer.OperationStatus_E',
      '10': 'result'
    },
    {
      '1': 'result_reason',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.CarServer.ResultReason',
      '10': 'resultReason'
    },
  ],
};

/// Descriptor for `ActionStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List actionStatusDescriptor = $convert.base64Decode(
    'CgxBY3Rpb25TdGF0dXMSNAoGcmVzdWx0GAEgASgOMhwuQ2FyU2VydmVyLk9wZXJhdGlvblN0YX'
    'R1c19FUgZyZXN1bHQSPAoNcmVzdWx0X3JlYXNvbhgCIAEoCzIXLkNhclNlcnZlci5SZXN1bHRS'
    'ZWFzb25SDHJlc3VsdFJlYXNvbg==');

@$core.Deprecated('Use resultReasonDescriptor instead')
const ResultReason$json = {
  '1': 'ResultReason',
  '2': [
    {'1': 'plain_text', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'plainText'},
  ],
  '8': [
    {'1': 'reason'},
  ],
};

/// Descriptor for `ResultReason`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resultReasonDescriptor = $convert.base64Decode(
    'CgxSZXN1bHRSZWFzb24SHwoKcGxhaW5fdGV4dBgBIAEoCUgAUglwbGFpblRleHRCCAoGcmVhc2'
    '9u');

@$core.Deprecated('Use encryptedDataDescriptor instead')
const EncryptedData$json = {
  '1': 'EncryptedData',
  '2': [
    {'1': 'field_number', '3': 1, '4': 1, '5': 5, '10': 'fieldNumber'},
    {'1': 'ciphertext', '3': 2, '4': 1, '5': 12, '10': 'ciphertext'},
    {'1': 'tag', '3': 3, '4': 1, '5': 12, '10': 'tag'},
  ],
};

/// Descriptor for `EncryptedData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List encryptedDataDescriptor = $convert.base64Decode(
    'Cg1FbmNyeXB0ZWREYXRhEiEKDGZpZWxkX251bWJlchgBIAEoBVILZmllbGROdW1iZXISHgoKY2'
    'lwaGVydGV4dBgCIAEoDFIKY2lwaGVydGV4dBIQCgN0YWcYAyABKAxSA3RhZw==');

@$core.Deprecated('Use chargingSetLimitActionDescriptor instead')
const ChargingSetLimitAction$json = {
  '1': 'ChargingSetLimitAction',
  '2': [
    {'1': 'percent', '3': 1, '4': 1, '5': 5, '10': 'percent'},
  ],
};

/// Descriptor for `ChargingSetLimitAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chargingSetLimitActionDescriptor =
    $convert.base64Decode(
        'ChZDaGFyZ2luZ1NldExpbWl0QWN0aW9uEhgKB3BlcmNlbnQYASABKAVSB3BlcmNlbnQ=');

@$core.Deprecated('Use chargingStartStopActionDescriptor instead')
const ChargingStartStopAction$json = {
  '1': 'ChargingStartStopAction',
  '2': [
    {
      '1': 'unknown',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'unknown'
    },
    {
      '1': 'start',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'start'
    },
    {
      '1': 'start_standard',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'startStandard'
    },
    {
      '1': 'start_max_range',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'startMaxRange'
    },
    {
      '1': 'stop',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'stop'
    },
  ],
  '8': [
    {'1': 'charging_action'},
  ],
};

/// Descriptor for `ChargingStartStopAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chargingStartStopActionDescriptor = $convert.base64Decode(
    'ChdDaGFyZ2luZ1N0YXJ0U3RvcEFjdGlvbhIrCgd1bmtub3duGAEgASgLMg8uQ2FyU2VydmVyLl'
    'ZvaWRIAFIHdW5rbm93bhInCgVzdGFydBgCIAEoCzIPLkNhclNlcnZlci5Wb2lkSABSBXN0YXJ0'
    'EjgKDnN0YXJ0X3N0YW5kYXJkGAMgASgLMg8uQ2FyU2VydmVyLlZvaWRIAFINc3RhcnRTdGFuZG'
    'FyZBI5Cg9zdGFydF9tYXhfcmFuZ2UYBCABKAsyDy5DYXJTZXJ2ZXIuVm9pZEgAUg1zdGFydE1h'
    'eFJhbmdlEiUKBHN0b3AYBSABKAsyDy5DYXJTZXJ2ZXIuVm9pZEgAUgRzdG9wQhEKD2NoYXJnaW'
    '5nX2FjdGlvbg==');

@$core.Deprecated('Use drivingClearSpeedLimitPinActionDescriptor instead')
const DrivingClearSpeedLimitPinAction$json = {
  '1': 'DrivingClearSpeedLimitPinAction',
  '2': [
    {'1': 'pin', '3': 1, '4': 1, '5': 9, '10': 'pin'},
  ],
};

/// Descriptor for `DrivingClearSpeedLimitPinAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List drivingClearSpeedLimitPinActionDescriptor =
    $convert.base64Decode(
        'Ch9Ecml2aW5nQ2xlYXJTcGVlZExpbWl0UGluQWN0aW9uEhAKA3BpbhgBIAEoCVIDcGlu');

@$core.Deprecated('Use drivingSetSpeedLimitActionDescriptor instead')
const DrivingSetSpeedLimitAction$json = {
  '1': 'DrivingSetSpeedLimitAction',
  '2': [
    {'1': 'limit_mph', '3': 1, '4': 1, '5': 1, '10': 'limitMph'},
  ],
};

/// Descriptor for `DrivingSetSpeedLimitAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List drivingSetSpeedLimitActionDescriptor =
    $convert.base64Decode(
        'ChpEcml2aW5nU2V0U3BlZWRMaW1pdEFjdGlvbhIbCglsaW1pdF9tcGgYASABKAFSCGxpbWl0TX'
        'Bo');

@$core.Deprecated('Use drivingSpeedLimitActionDescriptor instead')
const DrivingSpeedLimitAction$json = {
  '1': 'DrivingSpeedLimitAction',
  '2': [
    {'1': 'activate', '3': 1, '4': 1, '5': 8, '10': 'activate'},
    {'1': 'pin', '3': 2, '4': 1, '5': 9, '10': 'pin'},
  ],
};

/// Descriptor for `DrivingSpeedLimitAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List drivingSpeedLimitActionDescriptor =
    $convert.base64Decode(
        'ChdEcml2aW5nU3BlZWRMaW1pdEFjdGlvbhIaCghhY3RpdmF0ZRgBIAEoCFIIYWN0aXZhdGUSEA'
        'oDcGluGAIgASgJUgNwaW4=');

@$core.Deprecated('Use hvacAutoActionDescriptor instead')
const HvacAutoAction$json = {
  '1': 'HvacAutoAction',
  '2': [
    {'1': 'power_on', '3': 1, '4': 1, '5': 8, '10': 'powerOn'},
    {'1': 'manual_override', '3': 2, '4': 1, '5': 8, '10': 'manualOverride'},
  ],
};

/// Descriptor for `HvacAutoAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List hvacAutoActionDescriptor = $convert.base64Decode(
    'Cg5IdmFjQXV0b0FjdGlvbhIZCghwb3dlcl9vbhgBIAEoCFIHcG93ZXJPbhInCg9tYW51YWxfb3'
    'ZlcnJpZGUYAiABKAhSDm1hbnVhbE92ZXJyaWRl');

@$core.Deprecated('Use hvacSeatHeaterActionsDescriptor instead')
const HvacSeatHeaterActions$json = {
  '1': 'HvacSeatHeaterActions',
  '2': [
    {
      '1': 'hvacSeatHeaterAction',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.CarServer.HvacSeatHeaterActions.HvacSeatHeaterAction',
      '10': 'hvacSeatHeaterAction'
    },
  ],
  '3': [HvacSeatHeaterActions_HvacSeatHeaterAction$json],
};

@$core.Deprecated('Use hvacSeatHeaterActionsDescriptor instead')
const HvacSeatHeaterActions_HvacSeatHeaterAction$json = {
  '1': 'HvacSeatHeaterAction',
  '2': [
    {
      '1': 'SEAT_HEATER_UNKNOWN',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'SEATHEATERUNKNOWN'
    },
    {
      '1': 'SEAT_HEATER_OFF',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'SEATHEATEROFF'
    },
    {
      '1': 'SEAT_HEATER_LOW',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'SEATHEATERLOW'
    },
    {
      '1': 'SEAT_HEATER_MED',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'SEATHEATERMED'
    },
    {
      '1': 'SEAT_HEATER_HIGH',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'SEATHEATERHIGH'
    },
    {
      '1': 'CAR_SEAT_UNKNOWN',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 1,
      '10': 'CARSEATUNKNOWN'
    },
    {
      '1': 'CAR_SEAT_FRONT_LEFT',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 1,
      '10': 'CARSEATFRONTLEFT'
    },
    {
      '1': 'CAR_SEAT_FRONT_RIGHT',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 1,
      '10': 'CARSEATFRONTRIGHT'
    },
    {
      '1': 'CAR_SEAT_REAR_LEFT',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 1,
      '10': 'CARSEATREARLEFT'
    },
    {
      '1': 'CAR_SEAT_REAR_LEFT_BACK',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 1,
      '10': 'CARSEATREARLEFTBACK'
    },
    {
      '1': 'CAR_SEAT_REAR_CENTER',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 1,
      '10': 'CARSEATREARCENTER'
    },
    {
      '1': 'CAR_SEAT_REAR_RIGHT',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 1,
      '10': 'CARSEATREARRIGHT'
    },
    {
      '1': 'CAR_SEAT_REAR_RIGHT_BACK',
      '3': 13,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 1,
      '10': 'CARSEATREARRIGHTBACK'
    },
    {
      '1': 'CAR_SEAT_THIRD_ROW_LEFT',
      '3': 14,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 1,
      '10': 'CARSEATTHIRDROWLEFT'
    },
    {
      '1': 'CAR_SEAT_THIRD_ROW_RIGHT',
      '3': 15,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 1,
      '10': 'CARSEATTHIRDROWRIGHT'
    },
  ],
  '8': [
    {'1': 'seat_heater_level'},
    {'1': 'seat_position'},
  ],
};

/// Descriptor for `HvacSeatHeaterActions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List hvacSeatHeaterActionsDescriptor = $convert.base64Decode(
    'ChVIdmFjU2VhdEhlYXRlckFjdGlvbnMSaQoUaHZhY1NlYXRIZWF0ZXJBY3Rpb24YASADKAsyNS'
    '5DYXJTZXJ2ZXIuSHZhY1NlYXRIZWF0ZXJBY3Rpb25zLkh2YWNTZWF0SGVhdGVyQWN0aW9uUhRo'
    'dmFjU2VhdEhlYXRlckFjdGlvbhqeCAoUSHZhY1NlYXRIZWF0ZXJBY3Rpb24SQQoTU0VBVF9IRU'
    'FURVJfVU5LTk9XThgBIAEoCzIPLkNhclNlcnZlci5Wb2lkSABSEVNFQVRIRUFURVJVTktOT1dO'
    'EjkKD1NFQVRfSEVBVEVSX09GRhgCIAEoCzIPLkNhclNlcnZlci5Wb2lkSABSDVNFQVRIRUFURV'
    'JPRkYSOQoPU0VBVF9IRUFURVJfTE9XGAMgASgLMg8uQ2FyU2VydmVyLlZvaWRIAFINU0VBVEhF'
    'QVRFUkxPVxI5Cg9TRUFUX0hFQVRFUl9NRUQYBCABKAsyDy5DYXJTZXJ2ZXIuVm9pZEgAUg1TRU'
    'FUSEVBVEVSTUVEEjsKEFNFQVRfSEVBVEVSX0hJR0gYBSABKAsyDy5DYXJTZXJ2ZXIuVm9pZEgA'
    'Ug5TRUFUSEVBVEVSSElHSBI7ChBDQVJfU0VBVF9VTktOT1dOGAYgASgLMg8uQ2FyU2VydmVyLl'
    'ZvaWRIAVIOQ0FSU0VBVFVOS05PV04SQAoTQ0FSX1NFQVRfRlJPTlRfTEVGVBgHIAEoCzIPLkNh'
    'clNlcnZlci5Wb2lkSAFSEENBUlNFQVRGUk9OVExFRlQSQgoUQ0FSX1NFQVRfRlJPTlRfUklHSF'
    'QYCCABKAsyDy5DYXJTZXJ2ZXIuVm9pZEgBUhFDQVJTRUFURlJPTlRSSUdIVBI+ChJDQVJfU0VB'
    'VF9SRUFSX0xFRlQYCSABKAsyDy5DYXJTZXJ2ZXIuVm9pZEgBUg9DQVJTRUFUUkVBUkxFRlQSRw'
    'oXQ0FSX1NFQVRfUkVBUl9MRUZUX0JBQ0sYCiABKAsyDy5DYXJTZXJ2ZXIuVm9pZEgBUhNDQVJT'
    'RUFUUkVBUkxFRlRCQUNLEkIKFENBUl9TRUFUX1JFQVJfQ0VOVEVSGAsgASgLMg8uQ2FyU2Vydm'
    'VyLlZvaWRIAVIRQ0FSU0VBVFJFQVJDRU5URVISQAoTQ0FSX1NFQVRfUkVBUl9SSUdIVBgMIAEo'
    'CzIPLkNhclNlcnZlci5Wb2lkSAFSEENBUlNFQVRSRUFSUklHSFQSSQoYQ0FSX1NFQVRfUkVBUl'
    '9SSUdIVF9CQUNLGA0gASgLMg8uQ2FyU2VydmVyLlZvaWRIAVIUQ0FSU0VBVFJFQVJSSUdIVEJB'
    'Q0sSRwoXQ0FSX1NFQVRfVEhJUkRfUk9XX0xFRlQYDiABKAsyDy5DYXJTZXJ2ZXIuVm9pZEgBUh'
    'NDQVJTRUFUVEhJUkRST1dMRUZUEkkKGENBUl9TRUFUX1RISVJEX1JPV19SSUdIVBgPIAEoCzIP'
    'LkNhclNlcnZlci5Wb2lkSAFSFENBUlNFQVRUSElSRFJPV1JJR0hUQhMKEXNlYXRfaGVhdGVyX2'
    'xldmVsQg8KDXNlYXRfcG9zaXRpb24=');

@$core.Deprecated('Use hvacSeatCoolerActionsDescriptor instead')
const HvacSeatCoolerActions$json = {
  '1': 'HvacSeatCoolerActions',
  '2': [
    {
      '1': 'hvacSeatCoolerAction',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.CarServer.HvacSeatCoolerActions.HvacSeatCoolerAction',
      '10': 'hvacSeatCoolerAction'
    },
  ],
  '3': [HvacSeatCoolerActions_HvacSeatCoolerAction$json],
  '4': [
    HvacSeatCoolerActions_HvacSeatCoolerLevel_E$json,
    HvacSeatCoolerActions_HvacSeatCoolerPosition_E$json
  ],
};

@$core.Deprecated('Use hvacSeatCoolerActionsDescriptor instead')
const HvacSeatCoolerActions_HvacSeatCoolerAction$json = {
  '1': 'HvacSeatCoolerAction',
  '2': [
    {
      '1': 'seat_cooler_level',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.CarServer.HvacSeatCoolerActions.HvacSeatCoolerLevel_E',
      '10': 'seatCoolerLevel'
    },
    {
      '1': 'seat_position',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.CarServer.HvacSeatCoolerActions.HvacSeatCoolerPosition_E',
      '10': 'seatPosition'
    },
  ],
};

@$core.Deprecated('Use hvacSeatCoolerActionsDescriptor instead')
const HvacSeatCoolerActions_HvacSeatCoolerLevel_E$json = {
  '1': 'HvacSeatCoolerLevel_E',
  '2': [
    {'1': 'HvacSeatCoolerLevel_Unknown', '2': 0},
    {'1': 'HvacSeatCoolerLevel_Off', '2': 1},
    {'1': 'HvacSeatCoolerLevel_Low', '2': 2},
    {'1': 'HvacSeatCoolerLevel_Med', '2': 3},
    {'1': 'HvacSeatCoolerLevel_High', '2': 4},
  ],
};

@$core.Deprecated('Use hvacSeatCoolerActionsDescriptor instead')
const HvacSeatCoolerActions_HvacSeatCoolerPosition_E$json = {
  '1': 'HvacSeatCoolerPosition_E',
  '2': [
    {'1': 'HvacSeatCoolerPosition_Unknown', '2': 0},
    {'1': 'HvacSeatCoolerPosition_FrontLeft', '2': 1},
    {'1': 'HvacSeatCoolerPosition_FrontRight', '2': 2},
  ],
};

/// Descriptor for `HvacSeatCoolerActions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List hvacSeatCoolerActionsDescriptor = $convert.base64Decode(
    'ChVIdmFjU2VhdENvb2xlckFjdGlvbnMSaQoUaHZhY1NlYXRDb29sZXJBY3Rpb24YASADKAsyNS'
    '5DYXJTZXJ2ZXIuSHZhY1NlYXRDb29sZXJBY3Rpb25zLkh2YWNTZWF0Q29vbGVyQWN0aW9uUhRo'
    'dmFjU2VhdENvb2xlckFjdGlvbhraAQoUSHZhY1NlYXRDb29sZXJBY3Rpb24SYgoRc2VhdF9jb2'
    '9sZXJfbGV2ZWwYASABKA4yNi5DYXJTZXJ2ZXIuSHZhY1NlYXRDb29sZXJBY3Rpb25zLkh2YWNT'
    'ZWF0Q29vbGVyTGV2ZWxfRVIPc2VhdENvb2xlckxldmVsEl4KDXNlYXRfcG9zaXRpb24YAiABKA'
    '4yOS5DYXJTZXJ2ZXIuSHZhY1NlYXRDb29sZXJBY3Rpb25zLkh2YWNTZWF0Q29vbGVyUG9zaXRp'
    'b25fRVIMc2VhdFBvc2l0aW9uIq0BChVIdmFjU2VhdENvb2xlckxldmVsX0USHwobSHZhY1NlYX'
    'RDb29sZXJMZXZlbF9Vbmtub3duEAASGwoXSHZhY1NlYXRDb29sZXJMZXZlbF9PZmYQARIbChdI'
    'dmFjU2VhdENvb2xlckxldmVsX0xvdxACEhsKF0h2YWNTZWF0Q29vbGVyTGV2ZWxfTWVkEAMSHA'
    'oYSHZhY1NlYXRDb29sZXJMZXZlbF9IaWdoEAQiiwEKGEh2YWNTZWF0Q29vbGVyUG9zaXRpb25f'
    'RRIiCh5IdmFjU2VhdENvb2xlclBvc2l0aW9uX1Vua25vd24QABIkCiBIdmFjU2VhdENvb2xlcl'
    'Bvc2l0aW9uX0Zyb250TGVmdBABEiUKIUh2YWNTZWF0Q29vbGVyUG9zaXRpb25fRnJvbnRSaWdo'
    'dBAC');

@$core.Deprecated('Use hvacSetPreconditioningMaxActionDescriptor instead')
const HvacSetPreconditioningMaxAction$json = {
  '1': 'HvacSetPreconditioningMaxAction',
  '2': [
    {'1': 'on', '3': 1, '4': 1, '5': 8, '10': 'on'},
    {'1': 'manual_override', '3': 2, '4': 1, '5': 8, '10': 'manualOverride'},
    {
      '1': 'manual_override_mode',
      '3': 3,
      '4': 3,
      '5': 14,
      '6': '.CarServer.HvacSetPreconditioningMaxAction.ManualOverrideMode_E',
      '10': 'manualOverrideMode'
    },
  ],
  '4': [HvacSetPreconditioningMaxAction_ManualOverrideMode_E$json],
};

@$core.Deprecated('Use hvacSetPreconditioningMaxActionDescriptor instead')
const HvacSetPreconditioningMaxAction_ManualOverrideMode_E$json = {
  '1': 'ManualOverrideMode_E',
  '2': [
    {'1': 'DogMode', '2': 0},
    {'1': 'Soc', '2': 1},
    {'1': 'Doors', '2': 2},
  ],
};

/// Descriptor for `HvacSetPreconditioningMaxAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List hvacSetPreconditioningMaxActionDescriptor = $convert.base64Decode(
    'Ch9IdmFjU2V0UHJlY29uZGl0aW9uaW5nTWF4QWN0aW9uEg4KAm9uGAEgASgIUgJvbhInCg9tYW'
    '51YWxfb3ZlcnJpZGUYAiABKAhSDm1hbnVhbE92ZXJyaWRlEnEKFG1hbnVhbF9vdmVycmlkZV9t'
    'b2RlGAMgAygOMj8uQ2FyU2VydmVyLkh2YWNTZXRQcmVjb25kaXRpb25pbmdNYXhBY3Rpb24uTW'
    'FudWFsT3ZlcnJpZGVNb2RlX0VSEm1hbnVhbE92ZXJyaWRlTW9kZSI3ChRNYW51YWxPdmVycmlk'
    'ZU1vZGVfRRILCgdEb2dNb2RlEAASBwoDU29jEAESCQoFRG9vcnMQAg==');

@$core.Deprecated('Use hvacSteeringWheelHeaterActionDescriptor instead')
const HvacSteeringWheelHeaterAction$json = {
  '1': 'HvacSteeringWheelHeaterAction',
  '2': [
    {'1': 'power_on', '3': 1, '4': 1, '5': 8, '10': 'powerOn'},
  ],
};

/// Descriptor for `HvacSteeringWheelHeaterAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List hvacSteeringWheelHeaterActionDescriptor =
    $convert.base64Decode(
        'Ch1IdmFjU3RlZXJpbmdXaGVlbEhlYXRlckFjdGlvbhIZCghwb3dlcl9vbhgBIAEoCFIHcG93ZX'
        'JPbg==');

@$core.Deprecated('Use hvacTemperatureAdjustmentActionDescriptor instead')
const HvacTemperatureAdjustmentAction$json = {
  '1': 'HvacTemperatureAdjustmentAction',
  '2': [
    {'1': 'delta_celsius', '3': 1, '4': 1, '5': 2, '10': 'deltaCelsius'},
    {'1': 'delta_percent', '3': 2, '4': 1, '5': 17, '10': 'deltaPercent'},
    {'1': 'absolute_celsius', '3': 3, '4': 1, '5': 2, '10': 'absoluteCelsius'},
    {
      '1': 'level',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.CarServer.HvacTemperatureAdjustmentAction.Temperature',
      '10': 'level'
    },
    {
      '1': 'hvac_temperature_zone',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.CarServer.HvacTemperatureAdjustmentAction.HvacTemperatureZone',
      '10': 'hvacTemperatureZone'
    },
    {
      '1': 'driver_temp_celsius',
      '3': 6,
      '4': 1,
      '5': 2,
      '10': 'driverTempCelsius'
    },
    {
      '1': 'passenger_temp_celsius',
      '3': 7,
      '4': 1,
      '5': 2,
      '10': 'passengerTempCelsius'
    },
  ],
  '3': [
    HvacTemperatureAdjustmentAction_Temperature$json,
    HvacTemperatureAdjustmentAction_HvacTemperatureZone$json
  ],
};

@$core.Deprecated('Use hvacTemperatureAdjustmentActionDescriptor instead')
const HvacTemperatureAdjustmentAction_Temperature$json = {
  '1': 'Temperature',
  '2': [
    {
      '1': 'TEMP_UNKNOWN',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'TEMPUNKNOWN'
    },
    {
      '1': 'TEMP_MIN',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'TEMPMIN'
    },
    {
      '1': 'TEMP_MAX',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'TEMPMAX'
    },
  ],
  '8': [
    {'1': 'type'},
  ],
};

@$core.Deprecated('Use hvacTemperatureAdjustmentActionDescriptor instead')
const HvacTemperatureAdjustmentAction_HvacTemperatureZone$json = {
  '1': 'HvacTemperatureZone',
  '2': [
    {
      '1': 'TEMP_ZONE_UNKNOWN',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'TEMPZONEUNKNOWN'
    },
    {
      '1': 'TEMP_ZONE_FRONT_LEFT',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'TEMPZONEFRONTLEFT'
    },
    {
      '1': 'TEMP_ZONE_FRONT_RIGHT',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'TEMPZONEFRONTRIGHT'
    },
    {
      '1': 'TEMP_ZONE_REAR',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'TEMPZONEREAR'
    },
  ],
  '8': [
    {'1': 'type'},
  ],
};

/// Descriptor for `HvacTemperatureAdjustmentAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List hvacTemperatureAdjustmentActionDescriptor = $convert.base64Decode(
    'Ch9IdmFjVGVtcGVyYXR1cmVBZGp1c3RtZW50QWN0aW9uEiMKDWRlbHRhX2NlbHNpdXMYASABKA'
    'JSDGRlbHRhQ2Vsc2l1cxIjCg1kZWx0YV9wZXJjZW50GAIgASgRUgxkZWx0YVBlcmNlbnQSKQoQ'
    'YWJzb2x1dGVfY2Vsc2l1cxgDIAEoAlIPYWJzb2x1dGVDZWxzaXVzEkwKBWxldmVsGAUgASgLMj'
    'YuQ2FyU2VydmVyLkh2YWNUZW1wZXJhdHVyZUFkanVzdG1lbnRBY3Rpb24uVGVtcGVyYXR1cmVS'
    'BWxldmVsEnIKFWh2YWNfdGVtcGVyYXR1cmVfem9uZRgEIAMoCzI+LkNhclNlcnZlci5IdmFjVG'
    'VtcGVyYXR1cmVBZGp1c3RtZW50QWN0aW9uLkh2YWNUZW1wZXJhdHVyZVpvbmVSE2h2YWNUZW1w'
    'ZXJhdHVyZVpvbmUSLgoTZHJpdmVyX3RlbXBfY2Vsc2l1cxgGIAEoAlIRZHJpdmVyVGVtcENlbH'
    'NpdXMSNAoWcGFzc2VuZ2VyX3RlbXBfY2Vsc2l1cxgHIAEoAlIUcGFzc2VuZ2VyVGVtcENlbHNp'
    'dXMapwEKC1RlbXBlcmF0dXJlEjQKDFRFTVBfVU5LTk9XThgBIAEoCzIPLkNhclNlcnZlci5Wb2'
    'lkSABSC1RFTVBVTktOT1dOEiwKCFRFTVBfTUlOGAIgASgLMg8uQ2FyU2VydmVyLlZvaWRIAFIH'
    'VEVNUE1JThIsCghURU1QX01BWBgDIAEoCzIPLkNhclNlcnZlci5Wb2lkSABSB1RFTVBNQVhCBg'
    'oEdHlwZRqfAgoTSHZhY1RlbXBlcmF0dXJlWm9uZRI9ChFURU1QX1pPTkVfVU5LTk9XThgBIAEo'
    'CzIPLkNhclNlcnZlci5Wb2lkSABSD1RFTVBaT05FVU5LTk9XThJCChRURU1QX1pPTkVfRlJPTl'
    'RfTEVGVBgCIAEoCzIPLkNhclNlcnZlci5Wb2lkSABSEVRFTVBaT05FRlJPTlRMRUZUEkQKFVRF'
    'TVBfWk9ORV9GUk9OVF9SSUdIVBgDIAEoCzIPLkNhclNlcnZlci5Wb2lkSABSElRFTVBaT05FRl'
    'JPTlRSSUdIVBI3Cg5URU1QX1pPTkVfUkVBUhgEIAEoCzIPLkNhclNlcnZlci5Wb2lkSABSDFRF'
    'TVBaT05FUkVBUkIGCgR0eXBl');

@$core.Deprecated('Use getNearbyChargingSitesDescriptor instead')
const GetNearbyChargingSites$json = {
  '1': 'GetNearbyChargingSites',
  '2': [
    {'1': 'include_meta_data', '3': 1, '4': 1, '5': 8, '10': 'includeMetaData'},
    {'1': 'radius', '3': 2, '4': 1, '5': 5, '10': 'radius'},
    {'1': 'count', '3': 3, '4': 1, '5': 5, '10': 'count'},
  ],
};

/// Descriptor for `GetNearbyChargingSites`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNearbyChargingSitesDescriptor = $convert.base64Decode(
    'ChZHZXROZWFyYnlDaGFyZ2luZ1NpdGVzEioKEWluY2x1ZGVfbWV0YV9kYXRhGAEgASgIUg9pbm'
    'NsdWRlTWV0YURhdGESFgoGcmFkaXVzGAIgASgFUgZyYWRpdXMSFAoFY291bnQYAyABKAVSBWNv'
    'dW50');

@$core.Deprecated('Use nearbyChargingSitesDescriptor instead')
const NearbyChargingSites$json = {
  '1': 'NearbyChargingSites',
  '2': [
    {
      '1': 'timestamp',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'timestamp'
    },
    {
      '1': 'superchargers',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.CarServer.Superchargers',
      '10': 'superchargers'
    },
    {
      '1': 'congestion_sync_time_utc_secs',
      '3': 4,
      '4': 1,
      '5': 3,
      '10': 'congestionSyncTimeUtcSecs'
    },
  ],
};

/// Descriptor for `NearbyChargingSites`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nearbyChargingSitesDescriptor = $convert.base64Decode(
    'ChNOZWFyYnlDaGFyZ2luZ1NpdGVzEjgKCXRpbWVzdGFtcBgBIAEoCzIaLmdvb2dsZS5wcm90b2'
    'J1Zi5UaW1lc3RhbXBSCXRpbWVzdGFtcBI+Cg1zdXBlcmNoYXJnZXJzGAMgAygLMhguQ2FyU2Vy'
    'dmVyLlN1cGVyY2hhcmdlcnNSDXN1cGVyY2hhcmdlcnMSQAodY29uZ2VzdGlvbl9zeW5jX3RpbW'
    'VfdXRjX3NlY3MYBCABKANSGWNvbmdlc3Rpb25TeW5jVGltZVV0Y1NlY3M=');

@$core.Deprecated('Use superchargersDescriptor instead')
const Superchargers$json = {
  '1': 'Superchargers',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'amenities', '3': 2, '4': 1, '5': 9, '10': 'amenities'},
    {'1': 'available_stalls', '3': 3, '4': 1, '5': 5, '10': 'availableStalls'},
    {'1': 'billing_info', '3': 4, '4': 1, '5': 9, '10': 'billingInfo'},
    {'1': 'billing_time', '3': 5, '4': 1, '5': 9, '10': 'billingTime'},
    {'1': 'city', '3': 6, '4': 1, '5': 9, '10': 'city'},
    {'1': 'country', '3': 7, '4': 1, '5': 9, '10': 'country'},
    {'1': 'distance_miles', '3': 8, '4': 1, '5': 2, '10': 'distanceMiles'},
    {'1': 'district', '3': 9, '4': 1, '5': 9, '10': 'district'},
    {
      '1': 'location',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.CarServer.LatLong',
      '10': 'location'
    },
    {'1': 'name', '3': 11, '4': 1, '5': 9, '10': 'name'},
    {'1': 'postal_code', '3': 12, '4': 1, '5': 9, '10': 'postalCode'},
    {'1': 'site_closed', '3': 13, '4': 1, '5': 8, '10': 'siteClosed'},
    {'1': 'state', '3': 14, '4': 1, '5': 9, '10': 'state'},
    {'1': 'street_address', '3': 15, '4': 1, '5': 9, '10': 'streetAddress'},
    {'1': 'total_stalls', '3': 16, '4': 1, '5': 5, '10': 'totalStalls'},
    {'1': 'within_range', '3': 17, '4': 1, '5': 8, '10': 'withinRange'},
    {'1': 'max_power_kw', '3': 18, '4': 1, '5': 5, '10': 'maxPowerKw'},
    {
      '1': 'out_of_order_stalls_number',
      '3': 19,
      '4': 1,
      '5': 5,
      '10': 'outOfOrderStallsNumber'
    },
    {
      '1': 'out_of_order_stalls_names',
      '3': 20,
      '4': 1,
      '5': 9,
      '10': 'outOfOrderStallsNames'
    },
  ],
};

/// Descriptor for `Superchargers`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List superchargersDescriptor = $convert.base64Decode(
    'Cg1TdXBlcmNoYXJnZXJzEg4KAmlkGAEgASgDUgJpZBIcCglhbWVuaXRpZXMYAiABKAlSCWFtZW'
    '5pdGllcxIpChBhdmFpbGFibGVfc3RhbGxzGAMgASgFUg9hdmFpbGFibGVTdGFsbHMSIQoMYmls'
    'bGluZ19pbmZvGAQgASgJUgtiaWxsaW5nSW5mbxIhCgxiaWxsaW5nX3RpbWUYBSABKAlSC2JpbG'
    'xpbmdUaW1lEhIKBGNpdHkYBiABKAlSBGNpdHkSGAoHY291bnRyeRgHIAEoCVIHY291bnRyeRIl'
    'Cg5kaXN0YW5jZV9taWxlcxgIIAEoAlINZGlzdGFuY2VNaWxlcxIaCghkaXN0cmljdBgJIAEoCV'
    'IIZGlzdHJpY3QSLgoIbG9jYXRpb24YCiABKAsyEi5DYXJTZXJ2ZXIuTGF0TG9uZ1IIbG9jYXRp'
    'b24SEgoEbmFtZRgLIAEoCVIEbmFtZRIfCgtwb3N0YWxfY29kZRgMIAEoCVIKcG9zdGFsQ29kZR'
    'IfCgtzaXRlX2Nsb3NlZBgNIAEoCFIKc2l0ZUNsb3NlZBIUCgVzdGF0ZRgOIAEoCVIFc3RhdGUS'
    'JQoOc3RyZWV0X2FkZHJlc3MYDyABKAlSDXN0cmVldEFkZHJlc3MSIQoMdG90YWxfc3RhbGxzGB'
    'AgASgFUgt0b3RhbFN0YWxscxIhCgx3aXRoaW5fcmFuZ2UYESABKAhSC3dpdGhpblJhbmdlEiAK'
    'DG1heF9wb3dlcl9rdxgSIAEoBVIKbWF4UG93ZXJLdxI6ChpvdXRfb2Zfb3JkZXJfc3RhbGxzX2'
    '51bWJlchgTIAEoBVIWb3V0T2ZPcmRlclN0YWxsc051bWJlchI4ChlvdXRfb2Zfb3JkZXJfc3Rh'
    'bGxzX25hbWVzGBQgASgJUhVvdXRPZk9yZGVyU3RhbGxzTmFtZXM=');

@$core.Deprecated('Use mediaPlayActionDescriptor instead')
const MediaPlayAction$json = {
  '1': 'MediaPlayAction',
};

/// Descriptor for `MediaPlayAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mediaPlayActionDescriptor =
    $convert.base64Decode('Cg9NZWRpYVBsYXlBY3Rpb24=');

@$core.Deprecated('Use mediaUpdateVolumeDescriptor instead')
const MediaUpdateVolume$json = {
  '1': 'MediaUpdateVolume',
  '2': [
    {'1': 'volume_delta', '3': 1, '4': 1, '5': 17, '9': 0, '10': 'volumeDelta'},
    {
      '1': 'volume_absolute_float',
      '3': 3,
      '4': 1,
      '5': 2,
      '9': 0,
      '10': 'volumeAbsoluteFloat'
    },
  ],
  '8': [
    {'1': 'media_volume'},
  ],
  '9': [
    {'1': 2, '2': 3},
  ],
};

/// Descriptor for `MediaUpdateVolume`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mediaUpdateVolumeDescriptor = $convert.base64Decode(
    'ChFNZWRpYVVwZGF0ZVZvbHVtZRIjCgx2b2x1bWVfZGVsdGEYASABKBFIAFILdm9sdW1lRGVsdG'
    'ESNAoVdm9sdW1lX2Fic29sdXRlX2Zsb2F0GAMgASgCSABSE3ZvbHVtZUFic29sdXRlRmxvYXRC'
    'DgoMbWVkaWFfdm9sdW1lSgQIAhAD');

@$core.Deprecated('Use mediaNextFavoriteDescriptor instead')
const MediaNextFavorite$json = {
  '1': 'MediaNextFavorite',
};

/// Descriptor for `MediaNextFavorite`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mediaNextFavoriteDescriptor =
    $convert.base64Decode('ChFNZWRpYU5leHRGYXZvcml0ZQ==');

@$core.Deprecated('Use mediaPreviousFavoriteDescriptor instead')
const MediaPreviousFavorite$json = {
  '1': 'MediaPreviousFavorite',
};

/// Descriptor for `MediaPreviousFavorite`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mediaPreviousFavoriteDescriptor =
    $convert.base64Decode('ChVNZWRpYVByZXZpb3VzRmF2b3JpdGU=');

@$core.Deprecated('Use mediaNextTrackDescriptor instead')
const MediaNextTrack$json = {
  '1': 'MediaNextTrack',
};

/// Descriptor for `MediaNextTrack`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mediaNextTrackDescriptor =
    $convert.base64Decode('Cg5NZWRpYU5leHRUcmFjaw==');

@$core.Deprecated('Use mediaPreviousTrackDescriptor instead')
const MediaPreviousTrack$json = {
  '1': 'MediaPreviousTrack',
};

/// Descriptor for `MediaPreviousTrack`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mediaPreviousTrackDescriptor =
    $convert.base64Decode('ChJNZWRpYVByZXZpb3VzVHJhY2s=');

@$core.Deprecated(
    'Use vehicleControlCancelSoftwareUpdateActionDescriptor instead')
const VehicleControlCancelSoftwareUpdateAction$json = {
  '1': 'VehicleControlCancelSoftwareUpdateAction',
};

/// Descriptor for `VehicleControlCancelSoftwareUpdateAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List vehicleControlCancelSoftwareUpdateActionDescriptor =
    $convert.base64Decode(
        'CihWZWhpY2xlQ29udHJvbENhbmNlbFNvZnR3YXJlVXBkYXRlQWN0aW9u');

@$core.Deprecated('Use vehicleControlFlashLightsActionDescriptor instead')
const VehicleControlFlashLightsAction$json = {
  '1': 'VehicleControlFlashLightsAction',
};

/// Descriptor for `VehicleControlFlashLightsAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List vehicleControlFlashLightsActionDescriptor =
    $convert.base64Decode('Ch9WZWhpY2xlQ29udHJvbEZsYXNoTGlnaHRzQWN0aW9u');

@$core.Deprecated('Use vehicleControlHonkHornActionDescriptor instead')
const VehicleControlHonkHornAction$json = {
  '1': 'VehicleControlHonkHornAction',
};

/// Descriptor for `VehicleControlHonkHornAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List vehicleControlHonkHornActionDescriptor =
    $convert.base64Decode('ChxWZWhpY2xlQ29udHJvbEhvbmtIb3JuQWN0aW9u');

@$core.Deprecated('Use vehicleControlResetValetPinActionDescriptor instead')
const VehicleControlResetValetPinAction$json = {
  '1': 'VehicleControlResetValetPinAction',
};

/// Descriptor for `VehicleControlResetValetPinAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List vehicleControlResetValetPinActionDescriptor =
    $convert.base64Decode('CiFWZWhpY2xlQ29udHJvbFJlc2V0VmFsZXRQaW5BY3Rpb24=');

@$core.Deprecated(
    'Use vehicleControlScheduleSoftwareUpdateActionDescriptor instead')
const VehicleControlScheduleSoftwareUpdateAction$json = {
  '1': 'VehicleControlScheduleSoftwareUpdateAction',
  '2': [
    {'1': 'offset_sec', '3': 1, '4': 1, '5': 5, '10': 'offsetSec'},
  ],
};

/// Descriptor for `VehicleControlScheduleSoftwareUpdateAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List
    vehicleControlScheduleSoftwareUpdateActionDescriptor =
    $convert.base64Decode(
        'CipWZWhpY2xlQ29udHJvbFNjaGVkdWxlU29mdHdhcmVVcGRhdGVBY3Rpb24SHQoKb2Zmc2V0X3'
        'NlYxgBIAEoBVIJb2Zmc2V0U2Vj');

@$core.Deprecated('Use vehicleControlSetSentryModeActionDescriptor instead')
const VehicleControlSetSentryModeAction$json = {
  '1': 'VehicleControlSetSentryModeAction',
  '2': [
    {'1': 'on', '3': 1, '4': 1, '5': 8, '10': 'on'},
  ],
};

/// Descriptor for `VehicleControlSetSentryModeAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List vehicleControlSetSentryModeActionDescriptor =
    $convert.base64Decode(
        'CiFWZWhpY2xlQ29udHJvbFNldFNlbnRyeU1vZGVBY3Rpb24SDgoCb24YASABKAhSAm9u');

@$core.Deprecated('Use vehicleControlSetValetModeActionDescriptor instead')
const VehicleControlSetValetModeAction$json = {
  '1': 'VehicleControlSetValetModeAction',
  '2': [
    {'1': 'on', '3': 1, '4': 1, '5': 8, '10': 'on'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `VehicleControlSetValetModeAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List vehicleControlSetValetModeActionDescriptor =
    $convert.base64Decode(
        'CiBWZWhpY2xlQ29udHJvbFNldFZhbGV0TW9kZUFjdGlvbhIOCgJvbhgBIAEoCFICb24SGgoIcG'
        'Fzc3dvcmQYAiABKAlSCHBhc3N3b3Jk');

@$core.Deprecated('Use vehicleControlSunroofOpenCloseActionDescriptor instead')
const VehicleControlSunroofOpenCloseAction$json = {
  '1': 'VehicleControlSunroofOpenCloseAction',
  '2': [
    {
      '1': 'absolute_level',
      '3': 1,
      '4': 1,
      '5': 5,
      '9': 0,
      '10': 'absoluteLevel'
    },
    {'1': 'delta_level', '3': 2, '4': 1, '5': 17, '9': 0, '10': 'deltaLevel'},
    {
      '1': 'vent',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 1,
      '10': 'vent'
    },
    {
      '1': 'close',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 1,
      '10': 'close'
    },
    {
      '1': 'open',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 1,
      '10': 'open'
    },
  ],
  '8': [
    {'1': 'sunroof_level'},
    {'1': 'action'},
  ],
};

/// Descriptor for `VehicleControlSunroofOpenCloseAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List vehicleControlSunroofOpenCloseActionDescriptor =
    $convert.base64Decode(
        'CiRWZWhpY2xlQ29udHJvbFN1bnJvb2ZPcGVuQ2xvc2VBY3Rpb24SJwoOYWJzb2x1dGVfbGV2ZW'
        'wYASABKAVIAFINYWJzb2x1dGVMZXZlbBIhCgtkZWx0YV9sZXZlbBgCIAEoEUgAUgpkZWx0YUxl'
        'dmVsEiUKBHZlbnQYAyABKAsyDy5DYXJTZXJ2ZXIuVm9pZEgBUgR2ZW50EicKBWNsb3NlGAQgAS'
        'gLMg8uQ2FyU2VydmVyLlZvaWRIAVIFY2xvc2USJQoEb3BlbhgFIAEoCzIPLkNhclNlcnZlci5W'
        'b2lkSAFSBG9wZW5CDwoNc3Vucm9vZl9sZXZlbEIICgZhY3Rpb24=');

@$core.Deprecated('Use vehicleControlTriggerHomelinkActionDescriptor instead')
const VehicleControlTriggerHomelinkAction$json = {
  '1': 'VehicleControlTriggerHomelinkAction',
  '2': [
    {
      '1': 'location',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.CarServer.LatLong',
      '10': 'location'
    },
    {'1': 'token', '3': 2, '4': 1, '5': 9, '10': 'token'},
  ],
};

/// Descriptor for `VehicleControlTriggerHomelinkAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List vehicleControlTriggerHomelinkActionDescriptor =
    $convert.base64Decode(
        'CiNWZWhpY2xlQ29udHJvbFRyaWdnZXJIb21lbGlua0FjdGlvbhIuCghsb2NhdGlvbhgBIAEoCz'
        'ISLkNhclNlcnZlci5MYXRMb25nUghsb2NhdGlvbhIUCgV0b2tlbhgCIAEoCVIFdG9rZW4=');

@$core.Deprecated('Use vehicleControlWindowActionDescriptor instead')
const VehicleControlWindowAction$json = {
  '1': 'VehicleControlWindowAction',
  '2': [
    {
      '1': 'unknown',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'unknown'
    },
    {
      '1': 'vent',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'vent'
    },
    {
      '1': 'close',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'close'
    },
  ],
  '8': [
    {'1': 'action'},
  ],
  '9': [
    {'1': 1, '2': 2},
  ],
};

/// Descriptor for `VehicleControlWindowAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List vehicleControlWindowActionDescriptor = $convert.base64Decode(
    'ChpWZWhpY2xlQ29udHJvbFdpbmRvd0FjdGlvbhIrCgd1bmtub3duGAIgASgLMg8uQ2FyU2Vydm'
    'VyLlZvaWRIAFIHdW5rbm93bhIlCgR2ZW50GAMgASgLMg8uQ2FyU2VydmVyLlZvaWRIAFIEdmVu'
    'dBInCgVjbG9zZRgEIAEoCzIPLkNhclNlcnZlci5Wb2lkSABSBWNsb3NlQggKBmFjdGlvbkoECA'
    'EQAg==');

@$core.Deprecated('Use hvacBioweaponModeActionDescriptor instead')
const HvacBioweaponModeAction$json = {
  '1': 'HvacBioweaponModeAction',
  '2': [
    {'1': 'on', '3': 1, '4': 1, '5': 8, '10': 'on'},
    {'1': 'manual_override', '3': 2, '4': 1, '5': 8, '10': 'manualOverride'},
  ],
};

/// Descriptor for `HvacBioweaponModeAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List hvacBioweaponModeActionDescriptor =
    $convert.base64Decode(
        'ChdIdmFjQmlvd2VhcG9uTW9kZUFjdGlvbhIOCgJvbhgBIAEoCFICb24SJwoPbWFudWFsX292ZX'
        'JyaWRlGAIgASgIUg5tYW51YWxPdmVycmlkZQ==');

@$core.Deprecated('Use autoSeatClimateActionDescriptor instead')
const AutoSeatClimateAction$json = {
  '1': 'AutoSeatClimateAction',
  '2': [
    {
      '1': 'carseat',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.CarServer.AutoSeatClimateAction.CarSeat',
      '10': 'carseat'
    },
  ],
  '3': [AutoSeatClimateAction_CarSeat$json],
  '4': [AutoSeatClimateAction_AutoSeatPosition_E$json],
};

@$core.Deprecated('Use autoSeatClimateActionDescriptor instead')
const AutoSeatClimateAction_CarSeat$json = {
  '1': 'CarSeat',
  '2': [
    {'1': 'on', '3': 1, '4': 1, '5': 8, '10': 'on'},
    {
      '1': 'seat_position',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.CarServer.AutoSeatClimateAction.AutoSeatPosition_E',
      '10': 'seatPosition'
    },
  ],
};

@$core.Deprecated('Use autoSeatClimateActionDescriptor instead')
const AutoSeatClimateAction_AutoSeatPosition_E$json = {
  '1': 'AutoSeatPosition_E',
  '2': [
    {'1': 'AutoSeatPosition_Unknown', '2': 0},
    {'1': 'AutoSeatPosition_FrontLeft', '2': 1},
    {'1': 'AutoSeatPosition_FrontRight', '2': 2},
  ],
};

/// Descriptor for `AutoSeatClimateAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List autoSeatClimateActionDescriptor = $convert.base64Decode(
    'ChVBdXRvU2VhdENsaW1hdGVBY3Rpb24SQgoHY2Fyc2VhdBgBIAMoCzIoLkNhclNlcnZlci5BdX'
    'RvU2VhdENsaW1hdGVBY3Rpb24uQ2FyU2VhdFIHY2Fyc2VhdBpzCgdDYXJTZWF0Eg4KAm9uGAEg'
    'ASgIUgJvbhJYCg1zZWF0X3Bvc2l0aW9uGAIgASgOMjMuQ2FyU2VydmVyLkF1dG9TZWF0Q2xpbW'
    'F0ZUFjdGlvbi5BdXRvU2VhdFBvc2l0aW9uX0VSDHNlYXRQb3NpdGlvbiJzChJBdXRvU2VhdFBv'
    'c2l0aW9uX0USHAoYQXV0b1NlYXRQb3NpdGlvbl9Vbmtub3duEAASHgoaQXV0b1NlYXRQb3NpdG'
    'lvbl9Gcm9udExlZnQQARIfChtBdXRvU2VhdFBvc2l0aW9uX0Zyb250UmlnaHQQAg==');

@$core.Deprecated('Use pingDescriptor instead')
const Ping$json = {
  '1': 'Ping',
  '2': [
    {'1': 'ping_id', '3': 1, '4': 1, '5': 5, '10': 'pingId'},
    {
      '1': 'local_timestamp',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'localTimestamp'
    },
    {
      '1': 'last_remote_timestamp',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'lastRemoteTimestamp'
    },
  ],
};

/// Descriptor for `Ping`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pingDescriptor = $convert.base64Decode(
    'CgRQaW5nEhcKB3BpbmdfaWQYASABKAVSBnBpbmdJZBJDCg9sb2NhbF90aW1lc3RhbXAYAiABKA'
    'syGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUg5sb2NhbFRpbWVzdGFtcBJOChVsYXN0X3Jl'
    'bW90ZV90aW1lc3RhbXAYAyABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUhNsYXN0Um'
    'Vtb3RlVGltZXN0YW1w');

@$core.Deprecated('Use scheduledChargingActionDescriptor instead')
const ScheduledChargingAction$json = {
  '1': 'ScheduledChargingAction',
  '2': [
    {'1': 'enabled', '3': 1, '4': 1, '5': 8, '10': 'enabled'},
    {'1': 'charging_time', '3': 2, '4': 1, '5': 5, '10': 'chargingTime'},
  ],
};

/// Descriptor for `ScheduledChargingAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List scheduledChargingActionDescriptor =
    $convert.base64Decode(
        'ChdTY2hlZHVsZWRDaGFyZ2luZ0FjdGlvbhIYCgdlbmFibGVkGAEgASgIUgdlbmFibGVkEiMKDW'
        'NoYXJnaW5nX3RpbWUYAiABKAVSDGNoYXJnaW5nVGltZQ==');

@$core.Deprecated('Use scheduledDepartureActionDescriptor instead')
const ScheduledDepartureAction$json = {
  '1': 'ScheduledDepartureAction',
  '2': [
    {'1': 'enabled', '3': 1, '4': 1, '5': 8, '10': 'enabled'},
    {'1': 'departure_time', '3': 2, '4': 1, '5': 5, '10': 'departureTime'},
    {
      '1': 'preconditioning_times',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.CarServer.PreconditioningTimes',
      '10': 'preconditioningTimes'
    },
    {
      '1': 'off_peak_charging_times',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.CarServer.OffPeakChargingTimes',
      '10': 'offPeakChargingTimes'
    },
    {
      '1': 'off_peak_hours_end_time',
      '3': 5,
      '4': 1,
      '5': 5,
      '10': 'offPeakHoursEndTime'
    },
  ],
};

/// Descriptor for `ScheduledDepartureAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List scheduledDepartureActionDescriptor = $convert.base64Decode(
    'ChhTY2hlZHVsZWREZXBhcnR1cmVBY3Rpb24SGAoHZW5hYmxlZBgBIAEoCFIHZW5hYmxlZBIlCg'
    '5kZXBhcnR1cmVfdGltZRgCIAEoBVINZGVwYXJ0dXJlVGltZRJUChVwcmVjb25kaXRpb25pbmdf'
    'dGltZXMYAyABKAsyHy5DYXJTZXJ2ZXIuUHJlY29uZGl0aW9uaW5nVGltZXNSFHByZWNvbmRpdG'
    'lvbmluZ1RpbWVzElYKF29mZl9wZWFrX2NoYXJnaW5nX3RpbWVzGAQgASgLMh8uQ2FyU2VydmVy'
    'Lk9mZlBlYWtDaGFyZ2luZ1RpbWVzUhRvZmZQZWFrQ2hhcmdpbmdUaW1lcxI0ChdvZmZfcGVha1'
    '9ob3Vyc19lbmRfdGltZRgFIAEoBVITb2ZmUGVha0hvdXJzRW5kVGltZQ==');

@$core.Deprecated('Use hvacClimateKeeperActionDescriptor instead')
const HvacClimateKeeperAction$json = {
  '1': 'HvacClimateKeeperAction',
  '2': [
    {
      '1': 'ClimateKeeperAction',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.CarServer.HvacClimateKeeperAction.ClimateKeeperAction_E',
      '10': 'ClimateKeeperAction'
    },
    {'1': 'manual_override', '3': 2, '4': 1, '5': 8, '10': 'manualOverride'},
  ],
  '4': [HvacClimateKeeperAction_ClimateKeeperAction_E$json],
};

@$core.Deprecated('Use hvacClimateKeeperActionDescriptor instead')
const HvacClimateKeeperAction_ClimateKeeperAction_E$json = {
  '1': 'ClimateKeeperAction_E',
  '2': [
    {'1': 'ClimateKeeperAction_Off', '2': 0},
    {'1': 'ClimateKeeperAction_On', '2': 1},
    {'1': 'ClimateKeeperAction_Dog', '2': 2},
    {'1': 'ClimateKeeperAction_Camp', '2': 3},
  ],
};

/// Descriptor for `HvacClimateKeeperAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List hvacClimateKeeperActionDescriptor = $convert.base64Decode(
    'ChdIdmFjQ2xpbWF0ZUtlZXBlckFjdGlvbhJqChNDbGltYXRlS2VlcGVyQWN0aW9uGAEgASgOMj'
    'guQ2FyU2VydmVyLkh2YWNDbGltYXRlS2VlcGVyQWN0aW9uLkNsaW1hdGVLZWVwZXJBY3Rpb25f'
    'RVITQ2xpbWF0ZUtlZXBlckFjdGlvbhInCg9tYW51YWxfb3ZlcnJpZGUYAiABKAhSDm1hbnVhbE'
    '92ZXJyaWRlIosBChVDbGltYXRlS2VlcGVyQWN0aW9uX0USGwoXQ2xpbWF0ZUtlZXBlckFjdGlv'
    'bl9PZmYQABIaChZDbGltYXRlS2VlcGVyQWN0aW9uX09uEAESGwoXQ2xpbWF0ZUtlZXBlckFjdG'
    'lvbl9Eb2cQAhIcChhDbGltYXRlS2VlcGVyQWN0aW9uX0NhbXAQAw==');

@$core.Deprecated('Use hvacRecirculationActionDescriptor instead')
const HvacRecirculationAction$json = {
  '1': 'HvacRecirculationAction',
  '2': [
    {'1': 'on', '3': 1, '4': 1, '5': 8, '10': 'on'},
  ],
};

/// Descriptor for `HvacRecirculationAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List hvacRecirculationActionDescriptor = $convert
    .base64Decode('ChdIdmFjUmVjaXJjdWxhdGlvbkFjdGlvbhIOCgJvbhgBIAEoCFICb24=');

@$core.Deprecated('Use setChargingAmpsActionDescriptor instead')
const SetChargingAmpsAction$json = {
  '1': 'SetChargingAmpsAction',
  '2': [
    {'1': 'charging_amps', '3': 1, '4': 1, '5': 5, '10': 'chargingAmps'},
  ],
};

/// Descriptor for `SetChargingAmpsAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setChargingAmpsActionDescriptor = $convert.base64Decode(
    'ChVTZXRDaGFyZ2luZ0FtcHNBY3Rpb24SIwoNY2hhcmdpbmdfYW1wcxgBIAEoBVIMY2hhcmdpbm'
    'dBbXBz');

@$core.Deprecated('Use removeChargeScheduleActionDescriptor instead')
const RemoveChargeScheduleAction$json = {
  '1': 'RemoveChargeScheduleAction',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 4, '10': 'id'},
  ],
};

/// Descriptor for `RemoveChargeScheduleAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeChargeScheduleActionDescriptor =
    $convert.base64Decode(
        'ChpSZW1vdmVDaGFyZ2VTY2hlZHVsZUFjdGlvbhIOCgJpZBgBIAEoBFICaWQ=');

@$core.Deprecated('Use batchRemoveChargeSchedulesActionDescriptor instead')
const BatchRemoveChargeSchedulesAction$json = {
  '1': 'BatchRemoveChargeSchedulesAction',
  '2': [
    {'1': 'home', '3': 1, '4': 1, '5': 8, '10': 'home'},
    {'1': 'work', '3': 2, '4': 1, '5': 8, '10': 'work'},
    {'1': 'other', '3': 3, '4': 1, '5': 8, '10': 'other'},
  ],
};

/// Descriptor for `BatchRemoveChargeSchedulesAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List batchRemoveChargeSchedulesActionDescriptor =
    $convert.base64Decode(
        'CiBCYXRjaFJlbW92ZUNoYXJnZVNjaGVkdWxlc0FjdGlvbhISCgRob21lGAEgASgIUgRob21lEh'
        'IKBHdvcmsYAiABKAhSBHdvcmsSFAoFb3RoZXIYAyABKAhSBW90aGVy');

@$core
    .Deprecated('Use batchRemovePreconditionSchedulesActionDescriptor instead')
const BatchRemovePreconditionSchedulesAction$json = {
  '1': 'BatchRemovePreconditionSchedulesAction',
  '2': [
    {'1': 'home', '3': 1, '4': 1, '5': 8, '10': 'home'},
    {'1': 'work', '3': 2, '4': 1, '5': 8, '10': 'work'},
    {'1': 'other', '3': 3, '4': 1, '5': 8, '10': 'other'},
  ],
};

/// Descriptor for `BatchRemovePreconditionSchedulesAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List batchRemovePreconditionSchedulesActionDescriptor =
    $convert.base64Decode(
        'CiZCYXRjaFJlbW92ZVByZWNvbmRpdGlvblNjaGVkdWxlc0FjdGlvbhISCgRob21lGAEgASgIUg'
        'Rob21lEhIKBHdvcmsYAiABKAhSBHdvcmsSFAoFb3RoZXIYAyABKAhSBW90aGVy');

@$core.Deprecated('Use removePreconditionScheduleActionDescriptor instead')
const RemovePreconditionScheduleAction$json = {
  '1': 'RemovePreconditionScheduleAction',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 4, '10': 'id'},
  ],
};

/// Descriptor for `RemovePreconditionScheduleAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removePreconditionScheduleActionDescriptor =
    $convert.base64Decode(
        'CiBSZW1vdmVQcmVjb25kaXRpb25TY2hlZHVsZUFjdGlvbhIOCgJpZBgBIAEoBFICaWQ=');

@$core.Deprecated('Use setCabinOverheatProtectionActionDescriptor instead')
const SetCabinOverheatProtectionAction$json = {
  '1': 'SetCabinOverheatProtectionAction',
  '2': [
    {'1': 'on', '3': 1, '4': 1, '5': 8, '10': 'on'},
    {'1': 'fan_only', '3': 2, '4': 1, '5': 8, '10': 'fanOnly'},
  ],
};

/// Descriptor for `SetCabinOverheatProtectionAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setCabinOverheatProtectionActionDescriptor =
    $convert.base64Decode(
        'CiBTZXRDYWJpbk92ZXJoZWF0UHJvdGVjdGlvbkFjdGlvbhIOCgJvbhgBIAEoCFICb24SGQoIZm'
        'FuX29ubHkYAiABKAhSB2Zhbk9ubHk=');

@$core.Deprecated('Use setVehicleNameActionDescriptor instead')
const SetVehicleNameAction$json = {
  '1': 'SetVehicleNameAction',
  '2': [
    {'1': 'vehicleName', '3': 1, '4': 1, '5': 9, '10': 'vehicleName'},
  ],
};

/// Descriptor for `SetVehicleNameAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setVehicleNameActionDescriptor = $convert.base64Decode(
    'ChRTZXRWZWhpY2xlTmFtZUFjdGlvbhIgCgt2ZWhpY2xlTmFtZRgBIAEoCVILdmVoaWNsZU5hbW'
    'U=');

@$core.Deprecated('Use chargePortDoorCloseDescriptor instead')
const ChargePortDoorClose$json = {
  '1': 'ChargePortDoorClose',
};

/// Descriptor for `ChargePortDoorClose`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chargePortDoorCloseDescriptor =
    $convert.base64Decode('ChNDaGFyZ2VQb3J0RG9vckNsb3Nl');

@$core.Deprecated('Use chargePortDoorOpenDescriptor instead')
const ChargePortDoorOpen$json = {
  '1': 'ChargePortDoorOpen',
};

/// Descriptor for `ChargePortDoorOpen`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chargePortDoorOpenDescriptor =
    $convert.base64Decode('ChJDaGFyZ2VQb3J0RG9vck9wZW4=');

@$core.Deprecated('Use boomboxActionDescriptor instead')
const BoomboxAction$json = {
  '1': 'BoomboxAction',
  '2': [
    {'1': 'sound', '3': 1, '4': 1, '5': 13, '10': 'sound'},
  ],
};

/// Descriptor for `BoomboxAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List boomboxActionDescriptor = $convert
    .base64Decode('Cg1Cb29tYm94QWN0aW9uEhQKBXNvdW5kGAEgASgNUgVzb3VuZA==');

@$core.Deprecated('Use setCopTempActionDescriptor instead')
const SetCopTempAction$json = {
  '1': 'SetCopTempAction',
  '2': [
    {
      '1': 'copActivationTemp',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.CarServer.ClimateState.CopActivationTemp',
      '10': 'copActivationTemp'
    },
  ],
};

/// Descriptor for `SetCopTempAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setCopTempActionDescriptor = $convert.base64Decode(
    'ChBTZXRDb3BUZW1wQWN0aW9uElcKEWNvcEFjdGl2YXRpb25UZW1wGAEgASgOMikuQ2FyU2Vydm'
    'VyLkNsaW1hdGVTdGF0ZS5Db3BBY3RpdmF0aW9uVGVtcFIRY29wQWN0aXZhdGlvblRlbXA=');

@$core.Deprecated('Use vehicleControlSetPinToDriveActionDescriptor instead')
const VehicleControlSetPinToDriveAction$json = {
  '1': 'VehicleControlSetPinToDriveAction',
  '2': [
    {'1': 'on', '3': 1, '4': 1, '5': 8, '10': 'on'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `VehicleControlSetPinToDriveAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List vehicleControlSetPinToDriveActionDescriptor =
    $convert.base64Decode(
        'CiFWZWhpY2xlQ29udHJvbFNldFBpblRvRHJpdmVBY3Rpb24SDgoCb24YASABKAhSAm9uEhoKCH'
        'Bhc3N3b3JkGAIgASgJUghwYXNzd29yZA==');

@$core.Deprecated('Use vehicleControlResetPinToDriveActionDescriptor instead')
const VehicleControlResetPinToDriveAction$json = {
  '1': 'VehicleControlResetPinToDriveAction',
};

/// Descriptor for `VehicleControlResetPinToDriveAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List vehicleControlResetPinToDriveActionDescriptor =
    $convert
        .base64Decode('CiNWZWhpY2xlQ29udHJvbFJlc2V0UGluVG9Ecml2ZUFjdGlvbg==');

@$core.Deprecated('Use remoteStartDriveDescriptor instead')
const RemoteStartDrive$json = {
  '1': 'RemoteStartDrive',
};

/// Descriptor for `RemoteStartDrive`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteStartDriveDescriptor =
    $convert.base64Decode('ChBSZW1vdGVTdGFydERyaXZl');

@$core.Deprecated('Use createStreamSessionDescriptor instead')
const CreateStreamSession$json = {
  '1': 'CreateStreamSession',
  '2': [
    {'1': 'session_id', '3': 1, '4': 1, '5': 9, '10': 'sessionId'},
  ],
};

/// Descriptor for `CreateStreamSession`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createStreamSessionDescriptor = $convert.base64Decode(
    'ChNDcmVhdGVTdHJlYW1TZXNzaW9uEh0KCnNlc3Npb25faWQYASABKAlSCXNlc3Npb25JZA==');

@$core.Deprecated('Use streamMessageDescriptor instead')
const StreamMessage$json = {
  '1': 'StreamMessage',
  '2': [
    {'1': 'session_id', '3': 1, '4': 1, '5': 9, '10': 'sessionId'},
    {'1': 'data', '3': 2, '4': 1, '5': 12, '10': 'data'},
  ],
};

/// Descriptor for `StreamMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamMessageDescriptor = $convert.base64Decode(
    'Cg1TdHJlYW1NZXNzYWdlEh0KCnNlc3Npb25faWQYASABKAlSCXNlc3Npb25JZBISCgRkYXRhGA'
    'IgASgMUgRkYXRh');

@$core.Deprecated('Use navigationRequestDescriptor instead')
const NavigationRequest$json = {
  '1': 'NavigationRequest',
  '2': [
    {'1': 'destination', '3': 1, '4': 1, '5': 9, '10': 'destination'},
    {'1': 'order', '3': 2, '4': 1, '5': 5, '10': 'order'},
  ],
};

/// Descriptor for `NavigationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List navigationRequestDescriptor = $convert.base64Decode(
    'ChFOYXZpZ2F0aW9uUmVxdWVzdBIgCgtkZXN0aW5hdGlvbhgBIAEoCVILZGVzdGluYXRpb24SFA'
    'oFb3JkZXIYAiABKAVSBW9yZGVy');

@$core.Deprecated('Use navigationSuperchargerRequestDescriptor instead')
const NavigationSuperchargerRequest$json = {
  '1': 'NavigationSuperchargerRequest',
  '2': [
    {'1': 'order', '3': 1, '4': 1, '5': 5, '10': 'order'},
  ],
};

/// Descriptor for `NavigationSuperchargerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List navigationSuperchargerRequestDescriptor =
    $convert.base64Decode(
        'Ch1OYXZpZ2F0aW9uU3VwZXJjaGFyZ2VyUmVxdWVzdBIUCgVvcmRlchgBIAEoBVIFb3JkZXI=');

@$core.Deprecated('Use uiSetUpcomingCalendarEntriesDescriptor instead')
const UiSetUpcomingCalendarEntries$json = {
  '1': 'UiSetUpcomingCalendarEntries',
  '2': [
    {'1': 'calendar_data', '3': 1, '4': 1, '5': 9, '10': 'calendarData'},
  ],
};

/// Descriptor for `UiSetUpcomingCalendarEntries`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uiSetUpcomingCalendarEntriesDescriptor =
    $convert.base64Decode(
        'ChxVaVNldFVwY29taW5nQ2FsZW5kYXJFbnRyaWVzEiMKDWNhbGVuZGFyX2RhdGEYASABKAlSDG'
        'NhbGVuZGFyRGF0YQ==');

@$core.Deprecated('Use vehicleDataSubscriptionDescriptor instead')
const VehicleDataSubscription$json = {
  '1': 'VehicleDataSubscription',
  '2': [
    {
      '1': 'pii_key_request',
      '3': 13,
      '4': 1,
      '5': 11,
      '6': '.CarServer.VehicleDataSubscription.PiiKeyRequest',
      '10': 'piiKeyRequest'
    },
    {
      '1': 'subscription_duration_s',
      '3': 3,
      '4': 1,
      '5': 5,
      '10': 'subscriptionDurationS'
    },
    {
      '1': 'subscription_ping_s',
      '3': 12,
      '4': 1,
      '5': 5,
      '10': 'subscriptionPingS'
    },
    {
      '1': 'gui_settings_max_update_rate_ms',
      '3': 4,
      '4': 1,
      '5': 5,
      '10': 'guiSettingsMaxUpdateRateMs'
    },
    {
      '1': 'charge_state_max_update_rate_ms',
      '3': 5,
      '4': 1,
      '5': 5,
      '10': 'chargeStateMaxUpdateRateMs'
    },
    {
      '1': 'climate_state_max_update_rate_ms',
      '3': 6,
      '4': 1,
      '5': 5,
      '10': 'climateStateMaxUpdateRateMs'
    },
    {
      '1': 'drive_state_max_update_rate_ms',
      '3': 7,
      '4': 1,
      '5': 5,
      '10': 'driveStateMaxUpdateRateMs'
    },
    {
      '1': 'vehicle_state_max_update_rate_ms',
      '3': 8,
      '4': 1,
      '5': 5,
      '10': 'vehicleStateMaxUpdateRateMs'
    },
    {
      '1': 'vehicle_config_max_update_rate_ms',
      '3': 9,
      '4': 1,
      '5': 5,
      '10': 'vehicleConfigMaxUpdateRateMs'
    },
    {
      '1': 'location_state_max_update_rate_ms',
      '3': 10,
      '4': 1,
      '5': 5,
      '10': 'locationStateMaxUpdateRateMs'
    },
    {
      '1': 'closures_state_max_update_rate_ms',
      '3': 11,
      '4': 1,
      '5': 5,
      '10': 'closuresStateMaxUpdateRateMs'
    },
    {
      '1': 'parked_accessory_state_max_update_rate_ms',
      '3': 14,
      '4': 1,
      '5': 5,
      '10': 'parkedAccessoryStateMaxUpdateRateMs'
    },
    {
      '1': 'charge_schedule_state_max_update_rate_ms',
      '3': 15,
      '4': 1,
      '5': 5,
      '10': 'chargeScheduleStateMaxUpdateRateMs'
    },
    {
      '1': 'preconditioning_schedule_state_max_update_rate_ms',
      '3': 16,
      '4': 1,
      '5': 5,
      '10': 'preconditioningScheduleStateMaxUpdateRateMs'
    },
    {
      '1': 'alert_state_max_update_rate_ms',
      '3': 17,
      '4': 1,
      '5': 5,
      '10': 'alertStateMaxUpdateRateMs'
    },
    {
      '1': 'suspension_state_max_update_rate_ms',
      '3': 18,
      '4': 1,
      '5': 5,
      '10': 'suspensionStateMaxUpdateRateMs'
    },
  ],
  '3': [VehicleDataSubscription_PiiKeyRequest$json],
};

@$core.Deprecated('Use vehicleDataSubscriptionDescriptor instead')
const VehicleDataSubscription_PiiKeyRequest$json = {
  '1': 'PiiKeyRequest',
  '2': [
    {
      '1': 'subscriber_public_key',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'subscriberPublicKey'
    },
  ],
};

/// Descriptor for `VehicleDataSubscription`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List vehicleDataSubscriptionDescriptor = $convert.base64Decode(
    'ChdWZWhpY2xlRGF0YVN1YnNjcmlwdGlvbhJYCg9waWlfa2V5X3JlcXVlc3QYDSABKAsyMC5DYX'
    'JTZXJ2ZXIuVmVoaWNsZURhdGFTdWJzY3JpcHRpb24uUGlpS2V5UmVxdWVzdFINcGlpS2V5UmVx'
    'dWVzdBI2ChdzdWJzY3JpcHRpb25fZHVyYXRpb25fcxgDIAEoBVIVc3Vic2NyaXB0aW9uRHVyYX'
    'Rpb25TEi4KE3N1YnNjcmlwdGlvbl9waW5nX3MYDCABKAVSEXN1YnNjcmlwdGlvblBpbmdTEkMK'
    'H2d1aV9zZXR0aW5nc19tYXhfdXBkYXRlX3JhdGVfbXMYBCABKAVSGmd1aVNldHRpbmdzTWF4VX'
    'BkYXRlUmF0ZU1zEkMKH2NoYXJnZV9zdGF0ZV9tYXhfdXBkYXRlX3JhdGVfbXMYBSABKAVSGmNo'
    'YXJnZVN0YXRlTWF4VXBkYXRlUmF0ZU1zEkUKIGNsaW1hdGVfc3RhdGVfbWF4X3VwZGF0ZV9yYX'
    'RlX21zGAYgASgFUhtjbGltYXRlU3RhdGVNYXhVcGRhdGVSYXRlTXMSQQoeZHJpdmVfc3RhdGVf'
    'bWF4X3VwZGF0ZV9yYXRlX21zGAcgASgFUhlkcml2ZVN0YXRlTWF4VXBkYXRlUmF0ZU1zEkUKIH'
    'ZlaGljbGVfc3RhdGVfbWF4X3VwZGF0ZV9yYXRlX21zGAggASgFUht2ZWhpY2xlU3RhdGVNYXhV'
    'cGRhdGVSYXRlTXMSRwohdmVoaWNsZV9jb25maWdfbWF4X3VwZGF0ZV9yYXRlX21zGAkgASgFUh'
    'x2ZWhpY2xlQ29uZmlnTWF4VXBkYXRlUmF0ZU1zEkcKIWxvY2F0aW9uX3N0YXRlX21heF91cGRh'
    'dGVfcmF0ZV9tcxgKIAEoBVIcbG9jYXRpb25TdGF0ZU1heFVwZGF0ZVJhdGVNcxJHCiFjbG9zdX'
    'Jlc19zdGF0ZV9tYXhfdXBkYXRlX3JhdGVfbXMYCyABKAVSHGNsb3N1cmVzU3RhdGVNYXhVcGRh'
    'dGVSYXRlTXMSVgopcGFya2VkX2FjY2Vzc29yeV9zdGF0ZV9tYXhfdXBkYXRlX3JhdGVfbXMYDi'
    'ABKAVSI3BhcmtlZEFjY2Vzc29yeVN0YXRlTWF4VXBkYXRlUmF0ZU1zElQKKGNoYXJnZV9zY2hl'
    'ZHVsZV9zdGF0ZV9tYXhfdXBkYXRlX3JhdGVfbXMYDyABKAVSImNoYXJnZVNjaGVkdWxlU3RhdG'
    'VNYXhVcGRhdGVSYXRlTXMSZgoxcHJlY29uZGl0aW9uaW5nX3NjaGVkdWxlX3N0YXRlX21heF91'
    'cGRhdGVfcmF0ZV9tcxgQIAEoBVIrcHJlY29uZGl0aW9uaW5nU2NoZWR1bGVTdGF0ZU1heFVwZG'
    'F0ZVJhdGVNcxJBCh5hbGVydF9zdGF0ZV9tYXhfdXBkYXRlX3JhdGVfbXMYESABKAVSGWFsZXJ0'
    'U3RhdGVNYXhVcGRhdGVSYXRlTXMSSwojc3VzcGVuc2lvbl9zdGF0ZV9tYXhfdXBkYXRlX3JhdG'
    'VfbXMYEiABKAVSHnN1c3BlbnNpb25TdGF0ZU1heFVwZGF0ZVJhdGVNcxpDCg1QaWlLZXlSZXF1'
    'ZXN0EjIKFXN1YnNjcmliZXJfcHVibGljX2tleRgBIAEoCVITc3Vic2NyaWJlclB1YmxpY0tleQ'
    '==');

@$core.Deprecated('Use vehicleDataAckDescriptor instead')
const VehicleDataAck$json = {
  '1': 'VehicleDataAck',
  '2': [
    {
      '1': 'charge_state_timestamp',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'chargeStateTimestamp'
    },
    {
      '1': 'climate_state_timestamp',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'climateStateTimestamp'
    },
    {
      '1': 'closures_state_timestamp',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'closuresStateTimestamp'
    },
    {
      '1': 'drive_state_timestamp',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'driveStateTimestamp'
    },
    {
      '1': 'gui_settings_timestamp',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'guiSettingsTimestamp'
    },
    {
      '1': 'location_state_timestamp',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'locationStateTimestamp'
    },
    {
      '1': 'vehicle_config_timestamp',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'vehicleConfigTimestamp'
    },
    {
      '1': 'vehicle_state_timestamp',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'vehicleStateTimestamp'
    },
    {
      '1': 'parked_accessory_state_timestamp',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'parkedAccessoryStateTimestamp'
    },
    {
      '1': 'charge_schedule_state_timestamp',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'chargeScheduleStateTimestamp'
    },
    {
      '1': 'preconditioning_schedule_state_timestamp',
      '3': 13,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'preconditioningScheduleStateTimestamp'
    },
    {
      '1': 'alert_state_timestamp',
      '3': 14,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'alertStateTimestamp'
    },
    {
      '1': 'suspension_state_timestamp',
      '3': 15,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'suspensionStateTimestamp'
    },
    {
      '1': 'decryption_error_field',
      '3': 10,
      '4': 3,
      '5': 5,
      '8': {'2': true},
      '10': 'decryptionErrorField',
    },
  ],
};

/// Descriptor for `VehicleDataAck`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List vehicleDataAckDescriptor = $convert.base64Decode(
    'Cg5WZWhpY2xlRGF0YUFjaxJQChZjaGFyZ2Vfc3RhdGVfdGltZXN0YW1wGAIgASgLMhouZ29vZ2'
    'xlLnByb3RvYnVmLlRpbWVzdGFtcFIUY2hhcmdlU3RhdGVUaW1lc3RhbXASUgoXY2xpbWF0ZV9z'
    'dGF0ZV90aW1lc3RhbXAYAyABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUhVjbGltYX'
    'RlU3RhdGVUaW1lc3RhbXASVAoYY2xvc3VyZXNfc3RhdGVfdGltZXN0YW1wGAQgASgLMhouZ29v'
    'Z2xlLnByb3RvYnVmLlRpbWVzdGFtcFIWY2xvc3VyZXNTdGF0ZVRpbWVzdGFtcBJOChVkcml2ZV'
    '9zdGF0ZV90aW1lc3RhbXAYBSABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUhNkcml2'
    'ZVN0YXRlVGltZXN0YW1wElAKFmd1aV9zZXR0aW5nc190aW1lc3RhbXAYBiABKAsyGi5nb29nbG'
    'UucHJvdG9idWYuVGltZXN0YW1wUhRndWlTZXR0aW5nc1RpbWVzdGFtcBJUChhsb2NhdGlvbl9z'
    'dGF0ZV90aW1lc3RhbXAYByABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUhZsb2NhdG'
    'lvblN0YXRlVGltZXN0YW1wElQKGHZlaGljbGVfY29uZmlnX3RpbWVzdGFtcBgIIAEoCzIaLmdv'
    'b2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSFnZlaGljbGVDb25maWdUaW1lc3RhbXASUgoXdmVoaW'
    'NsZV9zdGF0ZV90aW1lc3RhbXAYCSABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUhV2'
    'ZWhpY2xlU3RhdGVUaW1lc3RhbXASYwogcGFya2VkX2FjY2Vzc29yeV9zdGF0ZV90aW1lc3RhbX'
    'AYCyABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUh1wYXJrZWRBY2Nlc3NvcnlTdGF0'
    'ZVRpbWVzdGFtcBJhCh9jaGFyZ2Vfc2NoZWR1bGVfc3RhdGVfdGltZXN0YW1wGAwgASgLMhouZ2'
    '9vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIcY2hhcmdlU2NoZWR1bGVTdGF0ZVRpbWVzdGFtcBJz'
    'CihwcmVjb25kaXRpb25pbmdfc2NoZWR1bGVfc3RhdGVfdGltZXN0YW1wGA0gASgLMhouZ29vZ2'
    'xlLnByb3RvYnVmLlRpbWVzdGFtcFIlcHJlY29uZGl0aW9uaW5nU2NoZWR1bGVTdGF0ZVRpbWVz'
    'dGFtcBJOChVhbGVydF9zdGF0ZV90aW1lc3RhbXAYDiABKAsyGi5nb29nbGUucHJvdG9idWYuVG'
    'ltZXN0YW1wUhNhbGVydFN0YXRlVGltZXN0YW1wElgKGnN1c3BlbnNpb25fc3RhdGVfdGltZXN0'
    'YW1wGA8gASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIYc3VzcGVuc2lvblN0YXRlVG'
    'ltZXN0YW1wEjgKFmRlY3J5cHRpb25fZXJyb3JfZmllbGQYCiADKAVCAhABUhRkZWNyeXB0aW9u'
    'RXJyb3JGaWVsZA==');

@$core.Deprecated('Use vitalsSubscriptionDescriptor instead')
const VitalsSubscription$json = {
  '1': 'VitalsSubscription',
  '2': [
    {'1': 'session_id', '3': 1, '4': 1, '5': 5, '10': 'sessionId'},
  ],
};

/// Descriptor for `VitalsSubscription`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List vitalsSubscriptionDescriptor =
    $convert.base64Decode(
        'ChJWaXRhbHNTdWJzY3JpcHRpb24SHQoKc2Vzc2lvbl9pZBgBIAEoBVIJc2Vzc2lvbklk');

@$core.Deprecated('Use vitalsAckDescriptor instead')
const VitalsAck$json = {
  '1': 'VitalsAck',
};

/// Descriptor for `VitalsAck`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List vitalsAckDescriptor =
    $convert.base64Decode('CglWaXRhbHNBY2s=');

@$core.Deprecated('Use dashcamSaveClipActionDescriptor instead')
const DashcamSaveClipAction$json = {
  '1': 'DashcamSaveClipAction',
};

/// Descriptor for `DashcamSaveClipAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dashcamSaveClipActionDescriptor =
    $convert.base64Decode('ChVEYXNoY2FtU2F2ZUNsaXBBY3Rpb24=');

@$core.Deprecated('Use piiKeyRequestDescriptor instead')
const PiiKeyRequest$json = {
  '1': 'PiiKeyRequest',
  '2': [
    {
      '1': 'subscriber_public_key',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'subscriberPublicKey'
    },
    {
      '1': 'pii_key_expiration',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'piiKeyExpiration'
    },
  ],
};

/// Descriptor for `PiiKeyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List piiKeyRequestDescriptor = $convert.base64Decode(
    'Cg1QaWlLZXlSZXF1ZXN0EjIKFXN1YnNjcmliZXJfcHVibGljX2tleRgCIAEoCVITc3Vic2NyaW'
    'JlclB1YmxpY0tleRJIChJwaWlfa2V5X2V4cGlyYXRpb24YBCABKAsyGi5nb29nbGUucHJvdG9i'
    'dWYuVGltZXN0YW1wUhBwaWlLZXlFeHBpcmF0aW9u');

@$core.Deprecated('Use pseudonymSyncRequestDescriptor instead')
const PseudonymSyncRequest$json = {
  '1': 'PseudonymSyncRequest',
  '2': [
    {
      '1': 'last_known_pseudonym_hashed',
      '3': 1,
      '4': 1,
      '5': 12,
      '10': 'lastKnownPseudonymHashed'
    },
  ],
};

/// Descriptor for `PseudonymSyncRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pseudonymSyncRequestDescriptor = $convert.base64Decode(
    'ChRQc2V1ZG9ueW1TeW5jUmVxdWVzdBI9ChtsYXN0X2tub3duX3BzZXVkb255bV9oYXNoZWQYAS'
    'ABKAxSGGxhc3RLbm93blBzZXVkb255bUhhc2hlZA==');

@$core.Deprecated('Use navigationGpsRequestDescriptor instead')
const NavigationGpsRequest$json = {
  '1': 'NavigationGpsRequest',
  '2': [
    {'1': 'lat', '3': 1, '4': 1, '5': 1, '10': 'lat'},
    {'1': 'lon', '3': 2, '4': 1, '5': 1, '10': 'lon'},
    {
      '1': 'order',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.CarServer.NavigationGpsRequest.RemoteNavTripOrder',
      '10': 'order'
    },
  ],
  '4': [NavigationGpsRequest_RemoteNavTripOrder$json],
};

@$core.Deprecated('Use navigationGpsRequestDescriptor instead')
const NavigationGpsRequest_RemoteNavTripOrder$json = {
  '1': 'RemoteNavTripOrder',
  '2': [
    {'1': 'REMOTE_NAV_TRIP_ORDER_UNKNOWN', '2': 0},
    {'1': 'REMOTE_NAV_TRIP_ORDER_REPLACE', '2': 1},
    {'1': 'REMOTE_NAV_TRIP_ORDER_PREPEND', '2': 2},
    {'1': 'REMOTE_NAV_TRIP_ORDER_APPEND', '2': 3},
  ],
};

/// Descriptor for `NavigationGpsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List navigationGpsRequestDescriptor = $convert.base64Decode(
    'ChROYXZpZ2F0aW9uR3BzUmVxdWVzdBIQCgNsYXQYASABKAFSA2xhdBIQCgNsb24YAiABKAFSA2'
    'xvbhJICgVvcmRlchgDIAEoDjIyLkNhclNlcnZlci5OYXZpZ2F0aW9uR3BzUmVxdWVzdC5SZW1v'
    'dGVOYXZUcmlwT3JkZXJSBW9yZGVyIp8BChJSZW1vdGVOYXZUcmlwT3JkZXISIQodUkVNT1RFX0'
    '5BVl9UUklQX09SREVSX1VOS05PV04QABIhCh1SRU1PVEVfTkFWX1RSSVBfT1JERVJfUkVQTEFD'
    'RRABEiEKHVJFTU9URV9OQVZfVFJJUF9PUkRFUl9QUkVQRU5EEAISIAocUkVNT1RFX05BVl9UUk'
    'lQX09SREVSX0FQUEVORBAD');

@$core.Deprecated('Use setRateTariffRequestDescriptor instead')
const SetRateTariffRequest$json = {
  '1': 'SetRateTariffRequest',
};

/// Descriptor for `SetRateTariffRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setRateTariffRequestDescriptor =
    $convert.base64Decode('ChRTZXRSYXRlVGFyaWZmUmVxdWVzdA==');

@$core.Deprecated('Use getRateTariffRequestDescriptor instead')
const GetRateTariffRequest$json = {
  '1': 'GetRateTariffRequest',
};

/// Descriptor for `GetRateTariffRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRateTariffRequestDescriptor =
    $convert.base64Decode('ChRHZXRSYXRlVGFyaWZmUmVxdWVzdA==');

@$core.Deprecated('Use videoRequestActionDescriptor instead')
const VideoRequestAction$json = {
  '1': 'VideoRequestAction',
  '2': [
    {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
  ],
};

/// Descriptor for `VideoRequestAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List videoRequestActionDescriptor = $convert
    .base64Decode('ChJWaWRlb1JlcXVlc3RBY3Rpb24SEAoDdXJsGAEgASgJUgN1cmw=');

@$core.Deprecated('Use takeDrivenoteActionDescriptor instead')
const TakeDrivenoteAction$json = {
  '1': 'TakeDrivenoteAction',
  '2': [
    {'1': 'note', '3': 1, '4': 1, '5': 9, '10': 'note'},
  ],
};

/// Descriptor for `TakeDrivenoteAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List takeDrivenoteActionDescriptor = $convert
    .base64Decode('ChNUYWtlRHJpdmVub3RlQWN0aW9uEhIKBG5vdGUYASABKAlSBG5vdGU=');

@$core.Deprecated('Use bluetoothClassicPairingRequestDescriptor instead')
const BluetoothClassicPairingRequest$json = {
  '1': 'BluetoothClassicPairingRequest',
  '2': [
    {'1': 'utf8_name', '3': 1, '4': 1, '5': 9, '10': 'utf8Name'},
    {'1': 'mac_address', '3': 2, '4': 1, '5': 12, '10': 'macAddress'},
  ],
};

/// Descriptor for `BluetoothClassicPairingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bluetoothClassicPairingRequestDescriptor =
    $convert.base64Decode(
        'Ch5CbHVldG9vdGhDbGFzc2ljUGFpcmluZ1JlcXVlc3QSGwoJdXRmOF9uYW1lGAEgASgJUgh1dG'
        'Y4TmFtZRIfCgttYWNfYWRkcmVzcxgCIAEoDFIKbWFjQWRkcmVzcw==');

@$core.Deprecated('Use addManagedChargingSiteRequestDescriptor instead')
const AddManagedChargingSiteRequest$json = {
  '1': 'AddManagedChargingSiteRequest',
};

/// Descriptor for `AddManagedChargingSiteRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addManagedChargingSiteRequestDescriptor =
    $convert.base64Decode('Ch1BZGRNYW5hZ2VkQ2hhcmdpbmdTaXRlUmVxdWVzdA==');

@$core.Deprecated('Use removeManagedChargingSiteRequestDescriptor instead')
const RemoveManagedChargingSiteRequest$json = {
  '1': 'RemoveManagedChargingSiteRequest',
  '2': [
    {'1': 'public_key', '3': 1, '4': 1, '5': 9, '10': 'publicKey'},
  ],
};

/// Descriptor for `RemoveManagedChargingSiteRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeManagedChargingSiteRequestDescriptor =
    $convert.base64Decode(
        'CiBSZW1vdmVNYW5hZ2VkQ2hhcmdpbmdTaXRlUmVxdWVzdBIdCgpwdWJsaWNfa2V5GAEgASgJUg'
        'lwdWJsaWNLZXk=');

@$core.Deprecated('Use navigationRouteActionDescriptor instead')
const NavigationRouteAction$json = {
  '1': 'NavigationRouteAction',
};

/// Descriptor for `NavigationRouteAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List navigationRouteActionDescriptor =
    $convert.base64Decode('ChVOYXZpZ2F0aW9uUm91dGVBY3Rpb24=');

@$core.Deprecated('Use autoStwHeatActionDescriptor instead')
const AutoStwHeatAction$json = {
  '1': 'AutoStwHeatAction',
  '2': [
    {'1': 'on', '3': 1, '4': 1, '5': 8, '10': 'on'},
  ],
};

/// Descriptor for `AutoStwHeatAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List autoStwHeatActionDescriptor =
    $convert.base64Decode('ChFBdXRvU3R3SGVhdEFjdGlvbhIOCgJvbhgBIAEoCFICb24=');

@$core.Deprecated('Use stwHeatLevelActionDescriptor instead')
const StwHeatLevelAction$json = {
  '1': 'StwHeatLevelAction',
  '2': [
    {
      '1': 'stw_heat_level',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.CarServer.StwHeatLevel',
      '10': 'stwHeatLevel'
    },
  ],
};

/// Descriptor for `StwHeatLevelAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stwHeatLevelActionDescriptor = $convert.base64Decode(
    'ChJTdHdIZWF0TGV2ZWxBY3Rpb24SPQoOc3R3X2hlYXRfbGV2ZWwYASABKA4yFy5DYXJTZXJ2ZX'
    'IuU3R3SGVhdExldmVsUgxzdHdIZWF0TGV2ZWw=');

@$core.Deprecated('Use getManagedChargingSitesRequestDescriptor instead')
const GetManagedChargingSitesRequest$json = {
  '1': 'GetManagedChargingSitesRequest',
};

/// Descriptor for `GetManagedChargingSitesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getManagedChargingSitesRequestDescriptor =
    $convert.base64Decode('Ch5HZXRNYW5hZ2VkQ2hhcmdpbmdTaXRlc1JlcXVlc3Q=');

@$core.Deprecated('Use updateChargeOnSolarFeatureRequestDescriptor instead')
const UpdateChargeOnSolarFeatureRequest$json = {
  '1': 'UpdateChargeOnSolarFeatureRequest',
  '2': [
    {
      '1': 'charge_on_solar',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.CarServer.ChargeOnSolarFeature',
      '10': 'chargeOnSolar'
    },
  ],
};

/// Descriptor for `UpdateChargeOnSolarFeatureRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateChargeOnSolarFeatureRequestDescriptor =
    $convert.base64Decode(
        'CiFVcGRhdGVDaGFyZ2VPblNvbGFyRmVhdHVyZVJlcXVlc3QSRwoPY2hhcmdlX29uX3NvbGFyGA'
        'EgASgLMh8uQ2FyU2VydmVyLkNoYXJnZU9uU29sYXJGZWF0dXJlUg1jaGFyZ2VPblNvbGFy');

@$core.Deprecated('Use getChargeOnSolarFeatureRequestDescriptor instead')
const GetChargeOnSolarFeatureRequest$json = {
  '1': 'GetChargeOnSolarFeatureRequest',
};

/// Descriptor for `GetChargeOnSolarFeatureRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChargeOnSolarFeatureRequestDescriptor =
    $convert.base64Decode('Ch5HZXRDaGFyZ2VPblNvbGFyRmVhdHVyZVJlcXVlc3Q=');

@$core.Deprecated('Use chargeOnSolarFeatureDescriptor instead')
const ChargeOnSolarFeature$json = {
  '1': 'ChargeOnSolarFeature',
  '2': [
    {'1': 'enabled', '3': 1, '4': 1, '5': 8, '10': 'enabled'},
    {
      '1': 'lower_charge_limit',
      '3': 2,
      '4': 1,
      '5': 2,
      '10': 'lowerChargeLimit'
    },
    {
      '1': 'upper_charge_limit',
      '3': 3,
      '4': 1,
      '5': 2,
      '10': 'upperChargeLimit'
    },
  ],
};

/// Descriptor for `ChargeOnSolarFeature`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chargeOnSolarFeatureDescriptor = $convert.base64Decode(
    'ChRDaGFyZ2VPblNvbGFyRmVhdHVyZRIYCgdlbmFibGVkGAEgASgIUgdlbmFibGVkEiwKEmxvd2'
    'VyX2NoYXJnZV9saW1pdBgCIAEoAlIQbG93ZXJDaGFyZ2VMaW1pdBIsChJ1cHBlcl9jaGFyZ2Vf'
    'bGltaXQYAyABKAJSEHVwcGVyQ2hhcmdlTGltaXQ=');

@$core.Deprecated('Use drivingClearSpeedLimitPinAdminActionDescriptor instead')
const DrivingClearSpeedLimitPinAdminAction$json = {
  '1': 'DrivingClearSpeedLimitPinAdminAction',
};

/// Descriptor for `DrivingClearSpeedLimitPinAdminAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List drivingClearSpeedLimitPinAdminActionDescriptor =
    $convert
        .base64Decode('CiREcml2aW5nQ2xlYXJTcGVlZExpbWl0UGluQWRtaW5BY3Rpb24=');

@$core.Deprecated('Use setOutletsOnOffActionDescriptor instead')
const SetOutletsOnOffAction$json = {
  '1': 'SetOutletsOnOffAction',
  '2': [
    {
      '1': 'outlet_request',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.CarServer.SetOutletsOnOffAction.OutletRequest',
      '10': 'outletRequest'
    },
  ],
  '4': [SetOutletsOnOffAction_OutletRequest$json],
};

@$core.Deprecated('Use setOutletsOnOffActionDescriptor instead')
const SetOutletsOnOffAction_OutletRequest$json = {
  '1': 'OutletRequest',
  '2': [
    {'1': 'OUTLET_REQUEST_UNKNOWN', '2': 0},
    {'1': 'OUTLET_REQUEST_OFF', '2': 1},
    {'1': 'OUTLET_REQUEST_CABIN_AND_BED', '2': 2},
    {'1': 'OUTLET_REQUEST_CABIN', '2': 3},
  ],
};

/// Descriptor for `SetOutletsOnOffAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setOutletsOnOffActionDescriptor = $convert.base64Decode(
    'ChVTZXRPdXRsZXRzT25PZmZBY3Rpb24SVQoOb3V0bGV0X3JlcXVlc3QYASABKA4yLi5DYXJTZX'
    'J2ZXIuU2V0T3V0bGV0c09uT2ZmQWN0aW9uLk91dGxldFJlcXVlc3RSDW91dGxldFJlcXVlc3Qi'
    'fwoNT3V0bGV0UmVxdWVzdBIaChZPVVRMRVRfUkVRVUVTVF9VTktOT1dOEAASFgoST1VUTEVUX1'
    'JFUVVFU1RfT0ZGEAESIAocT1VUTEVUX1JFUVVFU1RfQ0FCSU5fQU5EX0JFRBACEhgKFE9VVExF'
    'VF9SRVFVRVNUX0NBQklOEAM=');

@$core.Deprecated('Use setOutletTimerActionDescriptor instead')
const SetOutletTimerAction$json = {
  '1': 'SetOutletTimerAction',
  '2': [
    {'1': 'num_minutes', '3': 1, '4': 1, '5': 5, '10': 'numMinutes'},
  ],
};

/// Descriptor for `SetOutletTimerAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setOutletTimerActionDescriptor = $convert.base64Decode(
    'ChRTZXRPdXRsZXRUaW1lckFjdGlvbhIfCgtudW1fbWludXRlcxgBIAEoBVIKbnVtTWludXRlcw'
    '==');

@$core.Deprecated('Use setOutletSocLimitActionDescriptor instead')
const SetOutletSocLimitAction$json = {
  '1': 'SetOutletSocLimitAction',
  '2': [
    {'1': 'percent', '3': 1, '4': 1, '5': 5, '10': 'percent'},
  ],
};

/// Descriptor for `SetOutletSocLimitAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setOutletSocLimitActionDescriptor =
    $convert.base64Decode(
        'ChdTZXRPdXRsZXRTb2NMaW1pdEFjdGlvbhIYCgdwZXJjZW50GAEgASgFUgdwZXJjZW50');

@$core.Deprecated('Use setPowerFeedOnOffActionDescriptor instead')
const SetPowerFeedOnOffAction$json = {
  '1': 'SetPowerFeedOnOffAction',
  '2': [
    {
      '1': 'power_feed_request',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.CarServer.SetPowerFeedOnOffAction.PowerFeedRequest',
      '10': 'powerFeedRequest'
    },
  ],
  '4': [SetPowerFeedOnOffAction_PowerFeedRequest$json],
};

@$core.Deprecated('Use setPowerFeedOnOffActionDescriptor instead')
const SetPowerFeedOnOffAction_PowerFeedRequest$json = {
  '1': 'PowerFeedRequest',
  '2': [
    {'1': 'POWER_FEED_REQUEST_UNKNOWN', '2': 0},
    {'1': 'POWER_FEED_REQUEST_OFF', '2': 1},
    {'1': 'POWER_FEED_REQUEST_FEED_1', '2': 2},
    {'1': 'POWER_FEED_REQUEST_FEED_2', '2': 3},
    {'1': 'POWER_FEED_REQUEST_FEED_1_AND_FEED_2', '2': 4},
  ],
};

/// Descriptor for `SetPowerFeedOnOffAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setPowerFeedOnOffActionDescriptor = $convert.base64Decode(
    'ChdTZXRQb3dlckZlZWRPbk9mZkFjdGlvbhJhChJwb3dlcl9mZWVkX3JlcXVlc3QYASABKA4yMy'
    '5DYXJTZXJ2ZXIuU2V0UG93ZXJGZWVkT25PZmZBY3Rpb24uUG93ZXJGZWVkUmVxdWVzdFIQcG93'
    'ZXJGZWVkUmVxdWVzdCK2AQoQUG93ZXJGZWVkUmVxdWVzdBIeChpQT1dFUl9GRUVEX1JFUVVFU1'
    'RfVU5LTk9XThAAEhoKFlBPV0VSX0ZFRURfUkVRVUVTVF9PRkYQARIdChlQT1dFUl9GRUVEX1JF'
    'UVVFU1RfRkVFRF8xEAISHQoZUE9XRVJfRkVFRF9SRVFVRVNUX0ZFRURfMhADEigKJFBPV0VSX0'
    'ZFRURfUkVRVUVTVF9GRUVEXzFfQU5EX0ZFRURfMhAE');

@$core.Deprecated('Use setPowerFeedTimerActionDescriptor instead')
const SetPowerFeedTimerAction$json = {
  '1': 'SetPowerFeedTimerAction',
  '2': [
    {'1': 'num_minutes', '3': 1, '4': 1, '5': 5, '10': 'numMinutes'},
  ],
};

/// Descriptor for `SetPowerFeedTimerAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setPowerFeedTimerActionDescriptor =
    $convert.base64Decode(
        'ChdTZXRQb3dlckZlZWRUaW1lckFjdGlvbhIfCgtudW1fbWludXRlcxgBIAEoBVIKbnVtTWludX'
        'Rlcw==');

@$core.Deprecated('Use setPowerFeedSocLimitActionDescriptor instead')
const SetPowerFeedSocLimitAction$json = {
  '1': 'SetPowerFeedSocLimitAction',
  '2': [
    {'1': 'percent', '3': 1, '4': 1, '5': 5, '10': 'percent'},
  ],
};

/// Descriptor for `SetPowerFeedSocLimitAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setPowerFeedSocLimitActionDescriptor =
    $convert.base64Decode(
        'ChpTZXRQb3dlckZlZWRTb2NMaW1pdEFjdGlvbhIYCgdwZXJjZW50GAEgASgFUgdwZXJjZW50');

@$core.Deprecated('Use setTrailerLightTestStartStopActionDescriptor instead')
const SetTrailerLightTestStartStopAction$json = {
  '1': 'SetTrailerLightTestStartStopAction',
  '2': [
    {'1': 'start_stop', '3': 1, '4': 1, '5': 8, '10': 'startStop'},
  ],
};

/// Descriptor for `SetTrailerLightTestStartStopAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setTrailerLightTestStartStopActionDescriptor =
    $convert.base64Decode(
        'CiJTZXRUcmFpbGVyTGlnaHRUZXN0U3RhcnRTdG9wQWN0aW9uEh0KCnN0YXJ0X3N0b3AYASABKA'
        'hSCXN0YXJ0U3RvcA==');

@$core.Deprecated('Use setTruckBedLightAutoStateActionDescriptor instead')
const SetTruckBedLightAutoStateAction$json = {
  '1': 'SetTruckBedLightAutoStateAction',
  '2': [
    {'1': 'power_state', '3': 1, '4': 1, '5': 8, '10': 'powerState'},
  ],
};

/// Descriptor for `SetTruckBedLightAutoStateAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setTruckBedLightAutoStateActionDescriptor =
    $convert.base64Decode(
        'Ch9TZXRUcnVja0JlZExpZ2h0QXV0b1N0YXRlQWN0aW9uEh8KC3Bvd2VyX3N0YXRlGAEgASgIUg'
        'pwb3dlclN0YXRl');

@$core.Deprecated('Use setTruckBedLightBrightnessActionDescriptor instead')
const SetTruckBedLightBrightnessAction$json = {
  '1': 'SetTruckBedLightBrightnessAction',
  '2': [
    {'1': 'brightness', '3': 1, '4': 1, '5': 13, '10': 'brightness'},
  ],
};

/// Descriptor for `SetTruckBedLightBrightnessAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setTruckBedLightBrightnessActionDescriptor =
    $convert.base64Decode(
        'CiBTZXRUcnVja0JlZExpZ2h0QnJpZ2h0bmVzc0FjdGlvbhIeCgpicmlnaHRuZXNzGAEgASgNUg'
        'picmlnaHRuZXNz');

@$core.Deprecated(
    'Use vehicleControlResetPinToDriveAdminActionDescriptor instead')
const VehicleControlResetPinToDriveAdminAction$json = {
  '1': 'VehicleControlResetPinToDriveAdminAction',
};

/// Descriptor for `VehicleControlResetPinToDriveAdminAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List vehicleControlResetPinToDriveAdminActionDescriptor =
    $convert.base64Decode(
        'CihWZWhpY2xlQ29udHJvbFJlc2V0UGluVG9Ecml2ZUFkbWluQWN0aW9u');

@$core.Deprecated('Use navigationWaypointsRequestDescriptor instead')
const NavigationWaypointsRequest$json = {
  '1': 'NavigationWaypointsRequest',
  '2': [
    {'1': 'waypoints', '3': 1, '4': 1, '5': 9, '10': 'waypoints'},
    {
      '1': 'trip_plan_options',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.CarServer.NavigationWaypointsRequest.TripPlanOptions',
      '10': 'tripPlanOptions'
    },
  ],
  '3': [NavigationWaypointsRequest_TripPlanOptions$json],
};

@$core.Deprecated('Use navigationWaypointsRequestDescriptor instead')
const NavigationWaypointsRequest_TripPlanOptions$json = {
  '1': 'TripPlanOptions',
  '2': [
    {
      '1': 'destination_start_soe',
      '3': 1,
      '4': 1,
      '5': 5,
      '10': 'destinationStartSoe'
    },
    {
      '1': 'destination_arrival_soe',
      '3': 2,
      '4': 1,
      '5': 5,
      '10': 'destinationArrivalSoe'
    },
  ],
};

/// Descriptor for `NavigationWaypointsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List navigationWaypointsRequestDescriptor = $convert.base64Decode(
    'ChpOYXZpZ2F0aW9uV2F5cG9pbnRzUmVxdWVzdBIcCgl3YXlwb2ludHMYASABKAlSCXdheXBvaW'
    '50cxJhChF0cmlwX3BsYW5fb3B0aW9ucxgCIAEoCzI1LkNhclNlcnZlci5OYXZpZ2F0aW9uV2F5'
    'cG9pbnRzUmVxdWVzdC5UcmlwUGxhbk9wdGlvbnNSD3RyaXBQbGFuT3B0aW9ucxp9Cg9UcmlwUG'
    'xhbk9wdGlvbnMSMgoVZGVzdGluYXRpb25fc3RhcnRfc29lGAEgASgFUhNkZXN0aW5hdGlvblN0'
    'YXJ0U29lEjYKF2Rlc3RpbmF0aW9uX2Fycml2YWxfc29lGAIgASgFUhVkZXN0aW5hdGlvbkFycm'
    'l2YWxTb2U=');

@$core.Deprecated('Use setPowershareFeatureActionDescriptor instead')
const SetPowershareFeatureAction$json = {
  '1': 'SetPowershareFeatureAction',
  '2': [
    {
      '1': 'powershare_feature_request',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.CarServer.SetPowershareFeatureAction.PowershareFeatureRequest',
      '10': 'powershareFeatureRequest'
    },
  ],
  '4': [SetPowershareFeatureAction_PowershareFeatureRequest$json],
};

@$core.Deprecated('Use setPowershareFeatureActionDescriptor instead')
const SetPowershareFeatureAction_PowershareFeatureRequest$json = {
  '1': 'PowershareFeatureRequest',
  '2': [
    {'1': 'POWERSHARE_FEATURE_REQUEST_UNKNOWN', '2': 0},
    {'1': 'POWERSHARE_FEATURE_REQUEST_OFF', '2': 1},
    {'1': 'POWERSHARE_FEATURE_REQUEST_ON', '2': 2},
  ],
};

/// Descriptor for `SetPowershareFeatureAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setPowershareFeatureActionDescriptor = $convert.base64Decode(
    'ChpTZXRQb3dlcnNoYXJlRmVhdHVyZUFjdGlvbhJ8Chpwb3dlcnNoYXJlX2ZlYXR1cmVfcmVxdW'
    'VzdBgBIAEoDjI+LkNhclNlcnZlci5TZXRQb3dlcnNoYXJlRmVhdHVyZUFjdGlvbi5Qb3dlcnNo'
    'YXJlRmVhdHVyZVJlcXVlc3RSGHBvd2Vyc2hhcmVGZWF0dXJlUmVxdWVzdCKJAQoYUG93ZXJzaG'
    'FyZUZlYXR1cmVSZXF1ZXN0EiYKIlBPV0VSU0hBUkVfRkVBVFVSRV9SRVFVRVNUX1VOS05PV04Q'
    'ABIiCh5QT1dFUlNIQVJFX0ZFQVRVUkVfUkVRVUVTVF9PRkYQARIhCh1QT1dFUlNIQVJFX0ZFQV'
    'RVUkVfUkVRVUVTVF9PThAC');

@$core.Deprecated('Use setPowershareDischargeLimitActionDescriptor instead')
const SetPowershareDischargeLimitAction$json = {
  '1': 'SetPowershareDischargeLimitAction',
  '2': [
    {
      '1': 'powershare_discharge_limit',
      '3': 1,
      '4': 1,
      '5': 5,
      '10': 'powershareDischargeLimit'
    },
  ],
};

/// Descriptor for `SetPowershareDischargeLimitAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setPowershareDischargeLimitActionDescriptor =
    $convert.base64Decode(
        'CiFTZXRQb3dlcnNoYXJlRGlzY2hhcmdlTGltaXRBY3Rpb24SPAoacG93ZXJzaGFyZV9kaXNjaG'
        'FyZ2VfbGltaXQYASABKAVSGHBvd2Vyc2hhcmVEaXNjaGFyZ2VMaW1pdA==');

@$core.Deprecated('Use setPowershareRequestActionDescriptor instead')
const SetPowershareRequestAction$json = {
  '1': 'SetPowershareRequestAction',
  '2': [
    {
      '1': 'powershare_request',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.CarServer.SetPowershareRequestAction.PowershareRequest',
      '10': 'powershareRequest'
    },
  ],
  '4': [SetPowershareRequestAction_PowershareRequest$json],
};

@$core.Deprecated('Use setPowershareRequestActionDescriptor instead')
const SetPowershareRequestAction_PowershareRequest$json = {
  '1': 'PowershareRequest',
  '2': [
    {'1': 'POWERSHARE_REQUEST_UNKNOWN', '2': 0},
    {'1': 'POWERSHARE_REQUEST_OFF', '2': 1},
    {'1': 'POWERSHARE_REQUEST_ON', '2': 2},
  ],
};

/// Descriptor for `SetPowershareRequestAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setPowershareRequestActionDescriptor = $convert.base64Decode(
    'ChpTZXRQb3dlcnNoYXJlUmVxdWVzdEFjdGlvbhJmChJwb3dlcnNoYXJlX3JlcXVlc3QYASABKA'
    '4yNy5DYXJTZXJ2ZXIuU2V0UG93ZXJzaGFyZVJlcXVlc3RBY3Rpb24uUG93ZXJzaGFyZVJlcXVl'
    'c3RSEXBvd2Vyc2hhcmVSZXF1ZXN0ImoKEVBvd2Vyc2hhcmVSZXF1ZXN0Eh4KGlBPV0VSU0hBUk'
    'VfUkVRVUVTVF9VTktOT1dOEAASGgoWUE9XRVJTSEFSRV9SRVFVRVNUX09GRhABEhkKFVBPV0VS'
    'U0hBUkVfUkVRVUVTVF9PThAC');

@$core.Deprecated('Use setTentModeRequestActionDescriptor instead')
const SetTentModeRequestAction$json = {
  '1': 'SetTentModeRequestAction',
  '2': [
    {'1': 'on', '3': 1, '4': 1, '5': 8, '10': 'on'},
  ],
};

/// Descriptor for `SetTentModeRequestAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setTentModeRequestActionDescriptor = $convert
    .base64Decode('ChhTZXRUZW50TW9kZVJlcXVlc3RBY3Rpb24SDgoCb24YASABKAhSAm9u');

@$core.Deprecated('Use setZoneLightRequestActionDescriptor instead')
const SetZoneLightRequestAction$json = {
  '1': 'SetZoneLightRequestAction',
  '2': [
    {
      '1': 'zone_light_request',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.CarServer.SetZoneLightRequestAction.ZoneLightRequest',
      '10': 'zoneLightRequest'
    },
  ],
  '4': [SetZoneLightRequestAction_ZoneLightRequest$json],
};

@$core.Deprecated('Use setZoneLightRequestActionDescriptor instead')
const SetZoneLightRequestAction_ZoneLightRequest$json = {
  '1': 'ZoneLightRequest',
  '2': [
    {'1': 'ZONE_LIGHT_REQUEST_OFF', '2': 0},
    {'1': 'ZONE_LIGHT_REQUEST_LOW', '2': 1},
    {'1': 'ZONE_LIGHT_REQUEST_MED', '2': 2},
    {'1': 'ZONE_LIGHT_REQUEST_HIGH', '2': 3},
  ],
};

/// Descriptor for `SetZoneLightRequestAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setZoneLightRequestActionDescriptor = $convert.base64Decode(
    'ChlTZXRab25lTGlnaHRSZXF1ZXN0QWN0aW9uEmMKEnpvbmVfbGlnaHRfcmVxdWVzdBgBIAEoDj'
    'I1LkNhclNlcnZlci5TZXRab25lTGlnaHRSZXF1ZXN0QWN0aW9uLlpvbmVMaWdodFJlcXVlc3RS'
    'EHpvbmVMaWdodFJlcXVlc3QigwEKEFpvbmVMaWdodFJlcXVlc3QSGgoWWk9ORV9MSUdIVF9SRV'
    'FVRVNUX09GRhAAEhoKFlpPTkVfTElHSFRfUkVRVUVTVF9MT1cQARIaChZaT05FX0xJR0hUX1JF'
    'UVVFU1RfTUVEEAISGwoXWk9ORV9MSUdIVF9SRVFVRVNUX0hJR0gQAw==');

@$core.Deprecated('Use setLightbarBrightnessActionDescriptor instead')
const SetLightbarBrightnessAction$json = {
  '1': 'SetLightbarBrightnessAction',
  '2': [
    {
      '1': 'brightness_request',
      '3': 1,
      '4': 1,
      '5': 13,
      '10': 'brightnessRequest'
    },
  ],
};

/// Descriptor for `SetLightbarBrightnessAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setLightbarBrightnessActionDescriptor =
    $convert.base64Decode(
        'ChtTZXRMaWdodGJhckJyaWdodG5lc3NBY3Rpb24SLQoSYnJpZ2h0bmVzc19yZXF1ZXN0GAEgAS'
        'gNUhFicmlnaHRuZXNzUmVxdWVzdA==');

@$core.Deprecated('Use setLightbarMiddleActionDescriptor instead')
const SetLightbarMiddleAction$json = {
  '1': 'SetLightbarMiddleAction',
  '2': [
    {
      '1': 'middle_light_request',
      '3': 1,
      '4': 1,
      '5': 8,
      '10': 'middleLightRequest'
    },
  ],
};

/// Descriptor for `SetLightbarMiddleAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setLightbarMiddleActionDescriptor =
    $convert.base64Decode(
        'ChdTZXRMaWdodGJhck1pZGRsZUFjdGlvbhIwChRtaWRkbGVfbGlnaHRfcmVxdWVzdBgBIAEoCF'
        'ISbWlkZGxlTGlnaHRSZXF1ZXN0');

@$core.Deprecated('Use setLightbarDitchActionDescriptor instead')
const SetLightbarDitchAction$json = {
  '1': 'SetLightbarDitchAction',
  '2': [
    {
      '1': 'ditch_lights_request',
      '3': 1,
      '4': 1,
      '5': 8,
      '10': 'ditchLightsRequest'
    },
  ],
};

/// Descriptor for `SetLightbarDitchAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setLightbarDitchActionDescriptor =
    $convert.base64Decode(
        'ChZTZXRMaWdodGJhckRpdGNoQWN0aW9uEjAKFGRpdGNoX2xpZ2h0c19yZXF1ZXN0GAEgASgIUh'
        'JkaXRjaExpZ2h0c1JlcXVlc3Q=');

@$core.Deprecated('Use getMessagesActionDescriptor instead')
const GetMessagesAction$json = {
  '1': 'GetMessagesAction',
};

/// Descriptor for `GetMessagesAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMessagesActionDescriptor =
    $convert.base64Decode('ChFHZXRNZXNzYWdlc0FjdGlvbg==');

@$core.Deprecated('Use teslaAuthResponseActionDescriptor instead')
const TeslaAuthResponseAction$json = {
  '1': 'TeslaAuthResponseAction',
  '2': [
    {'1': 'client_id', '3': 1, '4': 1, '5': 9, '10': 'clientId'},
    {'1': 'scope', '3': 2, '4': 1, '5': 9, '10': 'scope'},
    {'1': 'access_token', '3': 3, '4': 1, '5': 9, '10': 'accessToken'},
    {'1': 'refresh_token', '3': 4, '4': 1, '5': 9, '10': 'refreshToken'},
    {'1': 'expiry_timestamp', '3': 5, '4': 1, '5': 3, '10': 'expiryTimestamp'},
    {'1': 'error', '3': 6, '4': 1, '5': 9, '10': 'error'},
    {'1': 'scoped_token', '3': 7, '4': 1, '5': 9, '10': 'scopedToken'},
  ],
};

/// Descriptor for `TeslaAuthResponseAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List teslaAuthResponseActionDescriptor = $convert.base64Decode(
    'ChdUZXNsYUF1dGhSZXNwb25zZUFjdGlvbhIbCgljbGllbnRfaWQYASABKAlSCGNsaWVudElkEh'
    'QKBXNjb3BlGAIgASgJUgVzY29wZRIhCgxhY2Nlc3NfdG9rZW4YAyABKAlSC2FjY2Vzc1Rva2Vu'
    'EiMKDXJlZnJlc2hfdG9rZW4YBCABKAlSDHJlZnJlc2hUb2tlbhIpChBleHBpcnlfdGltZXN0YW'
    '1wGAUgASgDUg9leHBpcnlUaW1lc3RhbXASFAoFZXJyb3IYBiABKAlSBWVycm9yEiEKDHNjb3Bl'
    'ZF90b2tlbhgHIAEoCVILc2NvcGVkVG9rZW4=');

@$core.Deprecated('Use navigationGpsDestinationRequestDescriptor instead')
const NavigationGpsDestinationRequest$json = {
  '1': 'NavigationGpsDestinationRequest',
  '2': [
    {'1': 'lat', '3': 1, '4': 1, '5': 1, '10': 'lat'},
    {'1': 'lon', '3': 2, '4': 1, '5': 1, '10': 'lon'},
    {'1': 'destination', '3': 3, '4': 1, '5': 9, '10': 'destination'},
    {
      '1': 'order',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.CarServer.NavigationGpsDestinationRequest.RemoteNavTripOrder',
      '10': 'order'
    },
  ],
  '4': [NavigationGpsDestinationRequest_RemoteNavTripOrder$json],
};

@$core.Deprecated('Use navigationGpsDestinationRequestDescriptor instead')
const NavigationGpsDestinationRequest_RemoteNavTripOrder$json = {
  '1': 'RemoteNavTripOrder',
  '2': [
    {'1': 'REMOTE_NAV_TRIP_ORDER_UNKNOWN', '2': 0},
    {'1': 'REMOTE_NAV_TRIP_ORDER_REPLACE', '2': 1},
    {'1': 'REMOTE_NAV_TRIP_ORDER_PREPEND', '2': 2},
    {'1': 'REMOTE_NAV_TRIP_ORDER_APPEND', '2': 3},
  ],
};

/// Descriptor for `NavigationGpsDestinationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List navigationGpsDestinationRequestDescriptor = $convert.base64Decode(
    'Ch9OYXZpZ2F0aW9uR3BzRGVzdGluYXRpb25SZXF1ZXN0EhAKA2xhdBgBIAEoAVIDbGF0EhAKA2'
    'xvbhgCIAEoAVIDbG9uEiAKC2Rlc3RpbmF0aW9uGAMgASgJUgtkZXN0aW5hdGlvbhJTCgVvcmRl'
    'chgEIAEoDjI9LkNhclNlcnZlci5OYXZpZ2F0aW9uR3BzRGVzdGluYXRpb25SZXF1ZXN0LlJlbW'
    '90ZU5hdlRyaXBPcmRlclIFb3JkZXIinwEKElJlbW90ZU5hdlRyaXBPcmRlchIhCh1SRU1PVEVf'
    'TkFWX1RSSVBfT1JERVJfVU5LTk9XThAAEiEKHVJFTU9URV9OQVZfVFJJUF9PUkRFUl9SRVBMQU'
    'NFEAESIQodUkVNT1RFX05BVl9UUklQX09SREVSX1BSRVBFTkQQAhIgChxSRU1PVEVfTkFWX1RS'
    'SVBfT1JERVJfQVBQRU5EEAM=');

@$core.Deprecated('Use parentalControlsClearPinActionDescriptor instead')
const ParentalControlsClearPinAction$json = {
  '1': 'ParentalControlsClearPinAction',
  '2': [
    {'1': 'pin', '3': 1, '4': 1, '5': 9, '10': 'pin'},
  ],
};

/// Descriptor for `ParentalControlsClearPinAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List parentalControlsClearPinActionDescriptor =
    $convert.base64Decode(
        'Ch5QYXJlbnRhbENvbnRyb2xzQ2xlYXJQaW5BY3Rpb24SEAoDcGluGAEgASgJUgNwaW4=');

@$core.Deprecated('Use parentalControlsClearPinAdminActionDescriptor instead')
const ParentalControlsClearPinAdminAction$json = {
  '1': 'ParentalControlsClearPinAdminAction',
};

/// Descriptor for `ParentalControlsClearPinAdminAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List parentalControlsClearPinAdminActionDescriptor =
    $convert
        .base64Decode('CiNQYXJlbnRhbENvbnRyb2xzQ2xlYXJQaW5BZG1pbkFjdGlvbg==');

@$core.Deprecated('Use parentalControlsActionDescriptor instead')
const ParentalControlsAction$json = {
  '1': 'ParentalControlsAction',
  '2': [
    {'1': 'activate', '3': 1, '4': 1, '5': 8, '10': 'activate'},
    {'1': 'pin', '3': 2, '4': 1, '5': 9, '10': 'pin'},
  ],
};

/// Descriptor for `ParentalControlsAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List parentalControlsActionDescriptor =
    $convert.base64Decode(
        'ChZQYXJlbnRhbENvbnRyb2xzQWN0aW9uEhoKCGFjdGl2YXRlGAEgASgIUghhY3RpdmF0ZRIQCg'
        'NwaW4YAiABKAlSA3Bpbg==');

@$core.Deprecated('Use parentalControlsEnableSettingsActionDescriptor instead')
const ParentalControlsEnableSettingsAction$json = {
  '1': 'ParentalControlsEnableSettingsAction',
  '2': [
    {
      '1': 'setting',
      '3': 1,
      '4': 1,
      '5': 14,
      '6':
          '.CarServer.ParentalControlsEnableSettingsAction.ParentalControlsSetting',
      '10': 'setting'
    },
    {'1': 'enable', '3': 2, '4': 1, '5': 8, '10': 'enable'},
  ],
  '4': [ParentalControlsEnableSettingsAction_ParentalControlsSetting$json],
};

@$core.Deprecated('Use parentalControlsEnableSettingsActionDescriptor instead')
const ParentalControlsEnableSettingsAction_ParentalControlsSetting$json = {
  '1': 'ParentalControlsSetting',
  '2': [
    {'1': 'PARENTAL_CONTROLS_SETTING_UNKNOWN', '2': 0},
    {'1': 'PARENTAL_CONTROLS_SETTING_SPEED_LIMIT', '2': 1},
    {'1': 'PARENTAL_CONTROLS_SETTING_ACCELERATION', '2': 2},
    {'1': 'PARENTAL_CONTROLS_SETTING_SAFETY_FEATURES', '2': 3},
    {'1': 'PARENTAL_CONTROLS_SETTING_CURFEW', '2': 4},
  ],
};

/// Descriptor for `ParentalControlsEnableSettingsAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List parentalControlsEnableSettingsActionDescriptor = $convert.base64Decode(
    'CiRQYXJlbnRhbENvbnRyb2xzRW5hYmxlU2V0dGluZ3NBY3Rpb24SYQoHc2V0dGluZxgBIAEoDj'
    'JHLkNhclNlcnZlci5QYXJlbnRhbENvbnRyb2xzRW5hYmxlU2V0dGluZ3NBY3Rpb24uUGFyZW50'
    'YWxDb250cm9sc1NldHRpbmdSB3NldHRpbmcSFgoGZW5hYmxlGAIgASgIUgZlbmFibGUi7AEKF1'
    'BhcmVudGFsQ29udHJvbHNTZXR0aW5nEiUKIVBBUkVOVEFMX0NPTlRST0xTX1NFVFRJTkdfVU5L'
    'Tk9XThAAEikKJVBBUkVOVEFMX0NPTlRST0xTX1NFVFRJTkdfU1BFRURfTElNSVQQARIqCiZQQV'
    'JFTlRBTF9DT05UUk9MU19TRVRUSU5HX0FDQ0VMRVJBVElPThACEi0KKVBBUkVOVEFMX0NPTlRS'
    'T0xTX1NFVFRJTkdfU0FGRVRZX0ZFQVRVUkVTEAMSJAogUEFSRU5UQUxfQ09OVFJPTFNfU0VUVE'
    'lOR19DVVJGRVcQBA==');

@$core.Deprecated('Use parentalControlsSetSpeedLimitActionDescriptor instead')
const ParentalControlsSetSpeedLimitAction$json = {
  '1': 'ParentalControlsSetSpeedLimitAction',
  '2': [
    {'1': 'limit_mph', '3': 1, '4': 1, '5': 1, '10': 'limitMph'},
  ],
};

/// Descriptor for `ParentalControlsSetSpeedLimitAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List parentalControlsSetSpeedLimitActionDescriptor =
    $convert.base64Decode(
        'CiNQYXJlbnRhbENvbnRyb2xzU2V0U3BlZWRMaW1pdEFjdGlvbhIbCglsaW1pdF9tcGgYASABKA'
        'FSCGxpbWl0TXBo');

@$core.Deprecated('Use cancelSohTestActionDescriptor instead')
const CancelSohTestAction$json = {
  '1': 'CancelSohTestAction',
};

/// Descriptor for `CancelSohTestAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cancelSohTestActionDescriptor =
    $convert.base64Decode('ChNDYW5jZWxTb2hUZXN0QWN0aW9u');

@$core.Deprecated('Use stopLightShowActionDescriptor instead')
const StopLightShowAction$json = {
  '1': 'StopLightShowAction',
};

/// Descriptor for `StopLightShowAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stopLightShowActionDescriptor =
    $convert.base64Decode('ChNTdG9wTGlnaHRTaG93QWN0aW9u');

@$core.Deprecated('Use startLightShowActionDescriptor instead')
const StartLightShowAction$json = {
  '1': 'StartLightShowAction',
  '2': [
    {'1': 'show_index', '3': 1, '4': 1, '5': 5, '10': 'showIndex'},
    {'1': 'start_time', '3': 2, '4': 1, '5': 3, '10': 'startTime'},
    {'1': 'volume', '3': 3, '4': 1, '5': 2, '10': 'volume'},
    {'1': 'dance_moves', '3': 4, '4': 1, '5': 8, '10': 'danceMoves'},
  ],
};

/// Descriptor for `StartLightShowAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startLightShowActionDescriptor = $convert.base64Decode(
    'ChRTdGFydExpZ2h0U2hvd0FjdGlvbhIdCgpzaG93X2luZGV4GAEgASgFUglzaG93SW5kZXgSHQ'
    'oKc3RhcnRfdGltZRgCIAEoA1IJc3RhcnRUaW1lEhYKBnZvbHVtZRgDIAEoAlIGdm9sdW1lEh8K'
    'C2RhbmNlX21vdmVzGAQgASgIUgpkYW5jZU1vdmVz');

@$core.Deprecated('Use setSuspensionLevelActionDescriptor instead')
const SetSuspensionLevelAction$json = {
  '1': 'SetSuspensionLevelAction',
  '2': [
    {
      '1': 'suspension_level',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.CarServer.SetSuspensionLevelAction.SuspensionLevel',
      '10': 'suspensionLevel'
    },
  ],
  '4': [SetSuspensionLevelAction_SuspensionLevel$json],
};

@$core.Deprecated('Use setSuspensionLevelActionDescriptor instead')
const SetSuspensionLevelAction_SuspensionLevel$json = {
  '1': 'SuspensionLevel',
  '2': [
    {'1': 'SUSPENSION_LEVEL_INVALID', '2': 0},
    {'1': 'SUSPENSION_LEVEL_ENTRY', '2': 1},
    {'1': 'SUSPENSION_LEVEL_LOW', '2': 2},
    {'1': 'SUSPENSION_LEVEL_MEDIUM', '2': 3},
    {'1': 'SUSPENSION_LEVEL_HIGH', '2': 4},
    {'1': 'SUSPENSION_LEVEL_VERY_HIGH', '2': 5},
    {'1': 'SUSPENSION_LEVEL_EXTRACT', '2': 6},
  ],
};

/// Descriptor for `SetSuspensionLevelAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setSuspensionLevelActionDescriptor = $convert.base64Decode(
    'ChhTZXRTdXNwZW5zaW9uTGV2ZWxBY3Rpb24SXgoQc3VzcGVuc2lvbl9sZXZlbBgBIAEoDjIzLk'
    'NhclNlcnZlci5TZXRTdXNwZW5zaW9uTGV2ZWxBY3Rpb24uU3VzcGVuc2lvbkxldmVsUg9zdXNw'
    'ZW5zaW9uTGV2ZWwi2wEKD1N1c3BlbnNpb25MZXZlbBIcChhTVVNQRU5TSU9OX0xFVkVMX0lOVk'
    'FMSUQQABIaChZTVVNQRU5TSU9OX0xFVkVMX0VOVFJZEAESGAoUU1VTUEVOU0lPTl9MRVZFTF9M'
    'T1cQAhIbChdTVVNQRU5TSU9OX0xFVkVMX01FRElVTRADEhkKFVNVU1BFTlNJT05fTEVWRUxfSE'
    'lHSBAEEh4KGlNVU1BFTlNJT05fTEVWRUxfVkVSWV9ISUdIEAUSHAoYU1VTUEVOU0lPTl9MRVZF'
    'TF9FWFRSQUNUEAY=');

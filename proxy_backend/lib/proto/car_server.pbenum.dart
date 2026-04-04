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

import 'package:protobuf/protobuf.dart' as $pb;

class OperationStatus_E extends $pb.ProtobufEnum {
  static const OperationStatus_E OPERATIONSTATUS_OK =
      OperationStatus_E._(0, _omitEnumNames ? '' : 'OPERATIONSTATUS_OK');
  static const OperationStatus_E OPERATIONSTATUS_ERROR =
      OperationStatus_E._(1, _omitEnumNames ? '' : 'OPERATIONSTATUS_ERROR');

  static const $core.List<OperationStatus_E> values = <OperationStatus_E>[
    OPERATIONSTATUS_OK,
    OPERATIONSTATUS_ERROR,
  ];

  static final $core.List<OperationStatus_E?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static OperationStatus_E? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const OperationStatus_E._(super.value, super.name);
}

class HvacSeatCoolerActions_HvacSeatCoolerLevel_E extends $pb.ProtobufEnum {
  static const HvacSeatCoolerActions_HvacSeatCoolerLevel_E
      HvacSeatCoolerLevel_Unknown =
      HvacSeatCoolerActions_HvacSeatCoolerLevel_E._(
          0, _omitEnumNames ? '' : 'HvacSeatCoolerLevel_Unknown');
  static const HvacSeatCoolerActions_HvacSeatCoolerLevel_E
      HvacSeatCoolerLevel_Off = HvacSeatCoolerActions_HvacSeatCoolerLevel_E._(
          1, _omitEnumNames ? '' : 'HvacSeatCoolerLevel_Off');
  static const HvacSeatCoolerActions_HvacSeatCoolerLevel_E
      HvacSeatCoolerLevel_Low = HvacSeatCoolerActions_HvacSeatCoolerLevel_E._(
          2, _omitEnumNames ? '' : 'HvacSeatCoolerLevel_Low');
  static const HvacSeatCoolerActions_HvacSeatCoolerLevel_E
      HvacSeatCoolerLevel_Med = HvacSeatCoolerActions_HvacSeatCoolerLevel_E._(
          3, _omitEnumNames ? '' : 'HvacSeatCoolerLevel_Med');
  static const HvacSeatCoolerActions_HvacSeatCoolerLevel_E
      HvacSeatCoolerLevel_High = HvacSeatCoolerActions_HvacSeatCoolerLevel_E._(
          4, _omitEnumNames ? '' : 'HvacSeatCoolerLevel_High');

  static const $core.List<HvacSeatCoolerActions_HvacSeatCoolerLevel_E> values =
      <HvacSeatCoolerActions_HvacSeatCoolerLevel_E>[
    HvacSeatCoolerLevel_Unknown,
    HvacSeatCoolerLevel_Off,
    HvacSeatCoolerLevel_Low,
    HvacSeatCoolerLevel_Med,
    HvacSeatCoolerLevel_High,
  ];

  static final $core.List<HvacSeatCoolerActions_HvacSeatCoolerLevel_E?>
      _byValue = $pb.ProtobufEnum.$_initByValueList(values, 4);
  static HvacSeatCoolerActions_HvacSeatCoolerLevel_E? valueOf(
          $core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const HvacSeatCoolerActions_HvacSeatCoolerLevel_E._(super.value, super.name);
}

class HvacSeatCoolerActions_HvacSeatCoolerPosition_E extends $pb.ProtobufEnum {
  static const HvacSeatCoolerActions_HvacSeatCoolerPosition_E
      HvacSeatCoolerPosition_Unknown =
      HvacSeatCoolerActions_HvacSeatCoolerPosition_E._(
          0, _omitEnumNames ? '' : 'HvacSeatCoolerPosition_Unknown');
  static const HvacSeatCoolerActions_HvacSeatCoolerPosition_E
      HvacSeatCoolerPosition_FrontLeft =
      HvacSeatCoolerActions_HvacSeatCoolerPosition_E._(
          1, _omitEnumNames ? '' : 'HvacSeatCoolerPosition_FrontLeft');
  static const HvacSeatCoolerActions_HvacSeatCoolerPosition_E
      HvacSeatCoolerPosition_FrontRight =
      HvacSeatCoolerActions_HvacSeatCoolerPosition_E._(
          2, _omitEnumNames ? '' : 'HvacSeatCoolerPosition_FrontRight');

  static const $core.List<HvacSeatCoolerActions_HvacSeatCoolerPosition_E>
      values = <HvacSeatCoolerActions_HvacSeatCoolerPosition_E>[
    HvacSeatCoolerPosition_Unknown,
    HvacSeatCoolerPosition_FrontLeft,
    HvacSeatCoolerPosition_FrontRight,
  ];

  static final $core.List<HvacSeatCoolerActions_HvacSeatCoolerPosition_E?>
      _byValue = $pb.ProtobufEnum.$_initByValueList(values, 2);
  static HvacSeatCoolerActions_HvacSeatCoolerPosition_E? valueOf(
          $core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const HvacSeatCoolerActions_HvacSeatCoolerPosition_E._(
      super.value, super.name);
}

class HvacSetPreconditioningMaxAction_ManualOverrideMode_E
    extends $pb.ProtobufEnum {
  static const HvacSetPreconditioningMaxAction_ManualOverrideMode_E DogMode =
      HvacSetPreconditioningMaxAction_ManualOverrideMode_E._(
          0, _omitEnumNames ? '' : 'DogMode');
  static const HvacSetPreconditioningMaxAction_ManualOverrideMode_E Soc =
      HvacSetPreconditioningMaxAction_ManualOverrideMode_E._(
          1, _omitEnumNames ? '' : 'Soc');
  static const HvacSetPreconditioningMaxAction_ManualOverrideMode_E Doors =
      HvacSetPreconditioningMaxAction_ManualOverrideMode_E._(
          2, _omitEnumNames ? '' : 'Doors');

  static const $core.List<HvacSetPreconditioningMaxAction_ManualOverrideMode_E>
      values = <HvacSetPreconditioningMaxAction_ManualOverrideMode_E>[
    DogMode,
    Soc,
    Doors,
  ];

  static final $core.List<HvacSetPreconditioningMaxAction_ManualOverrideMode_E?>
      _byValue = $pb.ProtobufEnum.$_initByValueList(values, 2);
  static HvacSetPreconditioningMaxAction_ManualOverrideMode_E? valueOf(
          $core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const HvacSetPreconditioningMaxAction_ManualOverrideMode_E._(
      super.value, super.name);
}

class AutoSeatClimateAction_AutoSeatPosition_E extends $pb.ProtobufEnum {
  static const AutoSeatClimateAction_AutoSeatPosition_E
      AutoSeatPosition_Unknown = AutoSeatClimateAction_AutoSeatPosition_E._(
          0, _omitEnumNames ? '' : 'AutoSeatPosition_Unknown');
  static const AutoSeatClimateAction_AutoSeatPosition_E
      AutoSeatPosition_FrontLeft = AutoSeatClimateAction_AutoSeatPosition_E._(
          1, _omitEnumNames ? '' : 'AutoSeatPosition_FrontLeft');
  static const AutoSeatClimateAction_AutoSeatPosition_E
      AutoSeatPosition_FrontRight = AutoSeatClimateAction_AutoSeatPosition_E._(
          2, _omitEnumNames ? '' : 'AutoSeatPosition_FrontRight');

  static const $core.List<AutoSeatClimateAction_AutoSeatPosition_E> values =
      <AutoSeatClimateAction_AutoSeatPosition_E>[
    AutoSeatPosition_Unknown,
    AutoSeatPosition_FrontLeft,
    AutoSeatPosition_FrontRight,
  ];

  static final $core.List<AutoSeatClimateAction_AutoSeatPosition_E?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static AutoSeatClimateAction_AutoSeatPosition_E? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const AutoSeatClimateAction_AutoSeatPosition_E._(super.value, super.name);
}

class HvacClimateKeeperAction_ClimateKeeperAction_E extends $pb.ProtobufEnum {
  static const HvacClimateKeeperAction_ClimateKeeperAction_E
      ClimateKeeperAction_Off = HvacClimateKeeperAction_ClimateKeeperAction_E._(
          0, _omitEnumNames ? '' : 'ClimateKeeperAction_Off');
  static const HvacClimateKeeperAction_ClimateKeeperAction_E
      ClimateKeeperAction_On = HvacClimateKeeperAction_ClimateKeeperAction_E._(
          1, _omitEnumNames ? '' : 'ClimateKeeperAction_On');
  static const HvacClimateKeeperAction_ClimateKeeperAction_E
      ClimateKeeperAction_Dog = HvacClimateKeeperAction_ClimateKeeperAction_E._(
          2, _omitEnumNames ? '' : 'ClimateKeeperAction_Dog');
  static const HvacClimateKeeperAction_ClimateKeeperAction_E
      ClimateKeeperAction_Camp =
      HvacClimateKeeperAction_ClimateKeeperAction_E._(
          3, _omitEnumNames ? '' : 'ClimateKeeperAction_Camp');

  static const $core.List<HvacClimateKeeperAction_ClimateKeeperAction_E>
      values = <HvacClimateKeeperAction_ClimateKeeperAction_E>[
    ClimateKeeperAction_Off,
    ClimateKeeperAction_On,
    ClimateKeeperAction_Dog,
    ClimateKeeperAction_Camp,
  ];

  static final $core.List<HvacClimateKeeperAction_ClimateKeeperAction_E?>
      _byValue = $pb.ProtobufEnum.$_initByValueList(values, 3);
  static HvacClimateKeeperAction_ClimateKeeperAction_E? valueOf(
          $core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const HvacClimateKeeperAction_ClimateKeeperAction_E._(
      super.value, super.name);
}

class NavigationGpsRequest_RemoteNavTripOrder extends $pb.ProtobufEnum {
  static const NavigationGpsRequest_RemoteNavTripOrder
      REMOTE_NAV_TRIP_ORDER_UNKNOWN = NavigationGpsRequest_RemoteNavTripOrder._(
          0, _omitEnumNames ? '' : 'REMOTE_NAV_TRIP_ORDER_UNKNOWN');
  static const NavigationGpsRequest_RemoteNavTripOrder
      REMOTE_NAV_TRIP_ORDER_REPLACE = NavigationGpsRequest_RemoteNavTripOrder._(
          1, _omitEnumNames ? '' : 'REMOTE_NAV_TRIP_ORDER_REPLACE');
  static const NavigationGpsRequest_RemoteNavTripOrder
      REMOTE_NAV_TRIP_ORDER_PREPEND = NavigationGpsRequest_RemoteNavTripOrder._(
          2, _omitEnumNames ? '' : 'REMOTE_NAV_TRIP_ORDER_PREPEND');
  static const NavigationGpsRequest_RemoteNavTripOrder
      REMOTE_NAV_TRIP_ORDER_APPEND = NavigationGpsRequest_RemoteNavTripOrder._(
          3, _omitEnumNames ? '' : 'REMOTE_NAV_TRIP_ORDER_APPEND');

  static const $core.List<NavigationGpsRequest_RemoteNavTripOrder> values =
      <NavigationGpsRequest_RemoteNavTripOrder>[
    REMOTE_NAV_TRIP_ORDER_UNKNOWN,
    REMOTE_NAV_TRIP_ORDER_REPLACE,
    REMOTE_NAV_TRIP_ORDER_PREPEND,
    REMOTE_NAV_TRIP_ORDER_APPEND,
  ];

  static final $core.List<NavigationGpsRequest_RemoteNavTripOrder?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static NavigationGpsRequest_RemoteNavTripOrder? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const NavigationGpsRequest_RemoteNavTripOrder._(super.value, super.name);
}

class SetOutletsOnOffAction_OutletRequest extends $pb.ProtobufEnum {
  static const SetOutletsOnOffAction_OutletRequest OUTLET_REQUEST_UNKNOWN =
      SetOutletsOnOffAction_OutletRequest._(
          0, _omitEnumNames ? '' : 'OUTLET_REQUEST_UNKNOWN');
  static const SetOutletsOnOffAction_OutletRequest OUTLET_REQUEST_OFF =
      SetOutletsOnOffAction_OutletRequest._(
          1, _omitEnumNames ? '' : 'OUTLET_REQUEST_OFF');
  static const SetOutletsOnOffAction_OutletRequest
      OUTLET_REQUEST_CABIN_AND_BED = SetOutletsOnOffAction_OutletRequest._(
          2, _omitEnumNames ? '' : 'OUTLET_REQUEST_CABIN_AND_BED');
  static const SetOutletsOnOffAction_OutletRequest OUTLET_REQUEST_CABIN =
      SetOutletsOnOffAction_OutletRequest._(
          3, _omitEnumNames ? '' : 'OUTLET_REQUEST_CABIN');

  static const $core.List<SetOutletsOnOffAction_OutletRequest> values =
      <SetOutletsOnOffAction_OutletRequest>[
    OUTLET_REQUEST_UNKNOWN,
    OUTLET_REQUEST_OFF,
    OUTLET_REQUEST_CABIN_AND_BED,
    OUTLET_REQUEST_CABIN,
  ];

  static final $core.List<SetOutletsOnOffAction_OutletRequest?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static SetOutletsOnOffAction_OutletRequest? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SetOutletsOnOffAction_OutletRequest._(super.value, super.name);
}

class SetPowerFeedOnOffAction_PowerFeedRequest extends $pb.ProtobufEnum {
  static const SetPowerFeedOnOffAction_PowerFeedRequest
      POWER_FEED_REQUEST_UNKNOWN = SetPowerFeedOnOffAction_PowerFeedRequest._(
          0, _omitEnumNames ? '' : 'POWER_FEED_REQUEST_UNKNOWN');
  static const SetPowerFeedOnOffAction_PowerFeedRequest POWER_FEED_REQUEST_OFF =
      SetPowerFeedOnOffAction_PowerFeedRequest._(
          1, _omitEnumNames ? '' : 'POWER_FEED_REQUEST_OFF');
  static const SetPowerFeedOnOffAction_PowerFeedRequest
      POWER_FEED_REQUEST_FEED_1 = SetPowerFeedOnOffAction_PowerFeedRequest._(
          2, _omitEnumNames ? '' : 'POWER_FEED_REQUEST_FEED_1');
  static const SetPowerFeedOnOffAction_PowerFeedRequest
      POWER_FEED_REQUEST_FEED_2 = SetPowerFeedOnOffAction_PowerFeedRequest._(
          3, _omitEnumNames ? '' : 'POWER_FEED_REQUEST_FEED_2');
  static const SetPowerFeedOnOffAction_PowerFeedRequest
      POWER_FEED_REQUEST_FEED_1_AND_FEED_2 =
      SetPowerFeedOnOffAction_PowerFeedRequest._(
          4, _omitEnumNames ? '' : 'POWER_FEED_REQUEST_FEED_1_AND_FEED_2');

  static const $core.List<SetPowerFeedOnOffAction_PowerFeedRequest> values =
      <SetPowerFeedOnOffAction_PowerFeedRequest>[
    POWER_FEED_REQUEST_UNKNOWN,
    POWER_FEED_REQUEST_OFF,
    POWER_FEED_REQUEST_FEED_1,
    POWER_FEED_REQUEST_FEED_2,
    POWER_FEED_REQUEST_FEED_1_AND_FEED_2,
  ];

  static final $core.List<SetPowerFeedOnOffAction_PowerFeedRequest?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static SetPowerFeedOnOffAction_PowerFeedRequest? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SetPowerFeedOnOffAction_PowerFeedRequest._(super.value, super.name);
}

class SetPowershareFeatureAction_PowershareFeatureRequest
    extends $pb.ProtobufEnum {
  static const SetPowershareFeatureAction_PowershareFeatureRequest
      POWERSHARE_FEATURE_REQUEST_UNKNOWN =
      SetPowershareFeatureAction_PowershareFeatureRequest._(
          0, _omitEnumNames ? '' : 'POWERSHARE_FEATURE_REQUEST_UNKNOWN');
  static const SetPowershareFeatureAction_PowershareFeatureRequest
      POWERSHARE_FEATURE_REQUEST_OFF =
      SetPowershareFeatureAction_PowershareFeatureRequest._(
          1, _omitEnumNames ? '' : 'POWERSHARE_FEATURE_REQUEST_OFF');
  static const SetPowershareFeatureAction_PowershareFeatureRequest
      POWERSHARE_FEATURE_REQUEST_ON =
      SetPowershareFeatureAction_PowershareFeatureRequest._(
          2, _omitEnumNames ? '' : 'POWERSHARE_FEATURE_REQUEST_ON');

  static const $core.List<SetPowershareFeatureAction_PowershareFeatureRequest>
      values = <SetPowershareFeatureAction_PowershareFeatureRequest>[
    POWERSHARE_FEATURE_REQUEST_UNKNOWN,
    POWERSHARE_FEATURE_REQUEST_OFF,
    POWERSHARE_FEATURE_REQUEST_ON,
  ];

  static final $core.List<SetPowershareFeatureAction_PowershareFeatureRequest?>
      _byValue = $pb.ProtobufEnum.$_initByValueList(values, 2);
  static SetPowershareFeatureAction_PowershareFeatureRequest? valueOf(
          $core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SetPowershareFeatureAction_PowershareFeatureRequest._(
      super.value, super.name);
}

class SetPowershareRequestAction_PowershareRequest extends $pb.ProtobufEnum {
  static const SetPowershareRequestAction_PowershareRequest
      POWERSHARE_REQUEST_UNKNOWN =
      SetPowershareRequestAction_PowershareRequest._(
          0, _omitEnumNames ? '' : 'POWERSHARE_REQUEST_UNKNOWN');
  static const SetPowershareRequestAction_PowershareRequest
      POWERSHARE_REQUEST_OFF = SetPowershareRequestAction_PowershareRequest._(
          1, _omitEnumNames ? '' : 'POWERSHARE_REQUEST_OFF');
  static const SetPowershareRequestAction_PowershareRequest
      POWERSHARE_REQUEST_ON = SetPowershareRequestAction_PowershareRequest._(
          2, _omitEnumNames ? '' : 'POWERSHARE_REQUEST_ON');

  static const $core.List<SetPowershareRequestAction_PowershareRequest> values =
      <SetPowershareRequestAction_PowershareRequest>[
    POWERSHARE_REQUEST_UNKNOWN,
    POWERSHARE_REQUEST_OFF,
    POWERSHARE_REQUEST_ON,
  ];

  static final $core.List<SetPowershareRequestAction_PowershareRequest?>
      _byValue = $pb.ProtobufEnum.$_initByValueList(values, 2);
  static SetPowershareRequestAction_PowershareRequest? valueOf(
          $core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SetPowershareRequestAction_PowershareRequest._(super.value, super.name);
}

class SetZoneLightRequestAction_ZoneLightRequest extends $pb.ProtobufEnum {
  static const SetZoneLightRequestAction_ZoneLightRequest
      ZONE_LIGHT_REQUEST_OFF = SetZoneLightRequestAction_ZoneLightRequest._(
          0, _omitEnumNames ? '' : 'ZONE_LIGHT_REQUEST_OFF');
  static const SetZoneLightRequestAction_ZoneLightRequest
      ZONE_LIGHT_REQUEST_LOW = SetZoneLightRequestAction_ZoneLightRequest._(
          1, _omitEnumNames ? '' : 'ZONE_LIGHT_REQUEST_LOW');
  static const SetZoneLightRequestAction_ZoneLightRequest
      ZONE_LIGHT_REQUEST_MED = SetZoneLightRequestAction_ZoneLightRequest._(
          2, _omitEnumNames ? '' : 'ZONE_LIGHT_REQUEST_MED');
  static const SetZoneLightRequestAction_ZoneLightRequest
      ZONE_LIGHT_REQUEST_HIGH = SetZoneLightRequestAction_ZoneLightRequest._(
          3, _omitEnumNames ? '' : 'ZONE_LIGHT_REQUEST_HIGH');

  static const $core.List<SetZoneLightRequestAction_ZoneLightRequest> values =
      <SetZoneLightRequestAction_ZoneLightRequest>[
    ZONE_LIGHT_REQUEST_OFF,
    ZONE_LIGHT_REQUEST_LOW,
    ZONE_LIGHT_REQUEST_MED,
    ZONE_LIGHT_REQUEST_HIGH,
  ];

  static final $core.List<SetZoneLightRequestAction_ZoneLightRequest?>
      _byValue = $pb.ProtobufEnum.$_initByValueList(values, 3);
  static SetZoneLightRequestAction_ZoneLightRequest? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SetZoneLightRequestAction_ZoneLightRequest._(super.value, super.name);
}

class NavigationGpsDestinationRequest_RemoteNavTripOrder
    extends $pb.ProtobufEnum {
  static const NavigationGpsDestinationRequest_RemoteNavTripOrder
      REMOTE_NAV_TRIP_ORDER_UNKNOWN =
      NavigationGpsDestinationRequest_RemoteNavTripOrder._(
          0, _omitEnumNames ? '' : 'REMOTE_NAV_TRIP_ORDER_UNKNOWN');
  static const NavigationGpsDestinationRequest_RemoteNavTripOrder
      REMOTE_NAV_TRIP_ORDER_REPLACE =
      NavigationGpsDestinationRequest_RemoteNavTripOrder._(
          1, _omitEnumNames ? '' : 'REMOTE_NAV_TRIP_ORDER_REPLACE');
  static const NavigationGpsDestinationRequest_RemoteNavTripOrder
      REMOTE_NAV_TRIP_ORDER_PREPEND =
      NavigationGpsDestinationRequest_RemoteNavTripOrder._(
          2, _omitEnumNames ? '' : 'REMOTE_NAV_TRIP_ORDER_PREPEND');
  static const NavigationGpsDestinationRequest_RemoteNavTripOrder
      REMOTE_NAV_TRIP_ORDER_APPEND =
      NavigationGpsDestinationRequest_RemoteNavTripOrder._(
          3, _omitEnumNames ? '' : 'REMOTE_NAV_TRIP_ORDER_APPEND');

  static const $core.List<NavigationGpsDestinationRequest_RemoteNavTripOrder>
      values = <NavigationGpsDestinationRequest_RemoteNavTripOrder>[
    REMOTE_NAV_TRIP_ORDER_UNKNOWN,
    REMOTE_NAV_TRIP_ORDER_REPLACE,
    REMOTE_NAV_TRIP_ORDER_PREPEND,
    REMOTE_NAV_TRIP_ORDER_APPEND,
  ];

  static final $core.List<NavigationGpsDestinationRequest_RemoteNavTripOrder?>
      _byValue = $pb.ProtobufEnum.$_initByValueList(values, 3);
  static NavigationGpsDestinationRequest_RemoteNavTripOrder? valueOf(
          $core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const NavigationGpsDestinationRequest_RemoteNavTripOrder._(
      super.value, super.name);
}

class ParentalControlsEnableSettingsAction_ParentalControlsSetting
    extends $pb.ProtobufEnum {
  static const ParentalControlsEnableSettingsAction_ParentalControlsSetting
      PARENTAL_CONTROLS_SETTING_UNKNOWN =
      ParentalControlsEnableSettingsAction_ParentalControlsSetting._(
          0, _omitEnumNames ? '' : 'PARENTAL_CONTROLS_SETTING_UNKNOWN');
  static const ParentalControlsEnableSettingsAction_ParentalControlsSetting
      PARENTAL_CONTROLS_SETTING_SPEED_LIMIT =
      ParentalControlsEnableSettingsAction_ParentalControlsSetting._(
          1, _omitEnumNames ? '' : 'PARENTAL_CONTROLS_SETTING_SPEED_LIMIT');
  static const ParentalControlsEnableSettingsAction_ParentalControlsSetting
      PARENTAL_CONTROLS_SETTING_ACCELERATION =
      ParentalControlsEnableSettingsAction_ParentalControlsSetting._(
          2, _omitEnumNames ? '' : 'PARENTAL_CONTROLS_SETTING_ACCELERATION');
  static const ParentalControlsEnableSettingsAction_ParentalControlsSetting
      PARENTAL_CONTROLS_SETTING_SAFETY_FEATURES =
      ParentalControlsEnableSettingsAction_ParentalControlsSetting._(
          3, _omitEnumNames ? '' : 'PARENTAL_CONTROLS_SETTING_SAFETY_FEATURES');
  static const ParentalControlsEnableSettingsAction_ParentalControlsSetting
      PARENTAL_CONTROLS_SETTING_CURFEW =
      ParentalControlsEnableSettingsAction_ParentalControlsSetting._(
          4, _omitEnumNames ? '' : 'PARENTAL_CONTROLS_SETTING_CURFEW');

  static const $core
      .List<ParentalControlsEnableSettingsAction_ParentalControlsSetting>
      values = <ParentalControlsEnableSettingsAction_ParentalControlsSetting>[
    PARENTAL_CONTROLS_SETTING_UNKNOWN,
    PARENTAL_CONTROLS_SETTING_SPEED_LIMIT,
    PARENTAL_CONTROLS_SETTING_ACCELERATION,
    PARENTAL_CONTROLS_SETTING_SAFETY_FEATURES,
    PARENTAL_CONTROLS_SETTING_CURFEW,
  ];

  static final $core
      .List<ParentalControlsEnableSettingsAction_ParentalControlsSetting?>
      _byValue = $pb.ProtobufEnum.$_initByValueList(values, 4);
  static ParentalControlsEnableSettingsAction_ParentalControlsSetting? valueOf(
          $core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ParentalControlsEnableSettingsAction_ParentalControlsSetting._(
      super.value, super.name);
}

class SetSuspensionLevelAction_SuspensionLevel extends $pb.ProtobufEnum {
  static const SetSuspensionLevelAction_SuspensionLevel
      SUSPENSION_LEVEL_INVALID = SetSuspensionLevelAction_SuspensionLevel._(
          0, _omitEnumNames ? '' : 'SUSPENSION_LEVEL_INVALID');
  static const SetSuspensionLevelAction_SuspensionLevel SUSPENSION_LEVEL_ENTRY =
      SetSuspensionLevelAction_SuspensionLevel._(
          1, _omitEnumNames ? '' : 'SUSPENSION_LEVEL_ENTRY');
  static const SetSuspensionLevelAction_SuspensionLevel SUSPENSION_LEVEL_LOW =
      SetSuspensionLevelAction_SuspensionLevel._(
          2, _omitEnumNames ? '' : 'SUSPENSION_LEVEL_LOW');
  static const SetSuspensionLevelAction_SuspensionLevel
      SUSPENSION_LEVEL_MEDIUM = SetSuspensionLevelAction_SuspensionLevel._(
          3, _omitEnumNames ? '' : 'SUSPENSION_LEVEL_MEDIUM');
  static const SetSuspensionLevelAction_SuspensionLevel SUSPENSION_LEVEL_HIGH =
      SetSuspensionLevelAction_SuspensionLevel._(
          4, _omitEnumNames ? '' : 'SUSPENSION_LEVEL_HIGH');
  static const SetSuspensionLevelAction_SuspensionLevel
      SUSPENSION_LEVEL_VERY_HIGH = SetSuspensionLevelAction_SuspensionLevel._(
          5, _omitEnumNames ? '' : 'SUSPENSION_LEVEL_VERY_HIGH');
  static const SetSuspensionLevelAction_SuspensionLevel
      SUSPENSION_LEVEL_EXTRACT = SetSuspensionLevelAction_SuspensionLevel._(
          6, _omitEnumNames ? '' : 'SUSPENSION_LEVEL_EXTRACT');

  static const $core.List<SetSuspensionLevelAction_SuspensionLevel> values =
      <SetSuspensionLevelAction_SuspensionLevel>[
    SUSPENSION_LEVEL_INVALID,
    SUSPENSION_LEVEL_ENTRY,
    SUSPENSION_LEVEL_LOW,
    SUSPENSION_LEVEL_MEDIUM,
    SUSPENSION_LEVEL_HIGH,
    SUSPENSION_LEVEL_VERY_HIGH,
    SUSPENSION_LEVEL_EXTRACT,
  ];

  static final $core.List<SetSuspensionLevelAction_SuspensionLevel?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 6);
  static SetSuspensionLevelAction_SuspensionLevel? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SetSuspensionLevelAction_SuspensionLevel._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

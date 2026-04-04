// This is a generated file - do not edit.
//
// Generated from vehicle.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class MediaSourceType extends $pb.ProtobufEnum {
  /// Standard sources
  static const MediaSourceType MediaSourceType_None =
      MediaSourceType._(0, _omitEnumNames ? '' : 'MediaSourceType_None');
  static const MediaSourceType MediaSourceType_AM =
      MediaSourceType._(1, _omitEnumNames ? '' : 'MediaSourceType_AM');
  static const MediaSourceType MediaSourceType_FM =
      MediaSourceType._(2, _omitEnumNames ? '' : 'MediaSourceType_FM');
  static const MediaSourceType MediaSourceType_XM =
      MediaSourceType._(3, _omitEnumNames ? '' : 'MediaSourceType_XM');
  static const MediaSourceType MediaSourceType_Slacker =
      MediaSourceType._(5, _omitEnumNames ? '' : 'MediaSourceType_Slacker');
  static const MediaSourceType MediaSourceType_LocalFiles =
      MediaSourceType._(6, _omitEnumNames ? '' : 'MediaSourceType_LocalFiles');
  static const MediaSourceType MediaSourceType_iPod =
      MediaSourceType._(7, _omitEnumNames ? '' : 'MediaSourceType_iPod');
  static const MediaSourceType MediaSourceType_Bluetooth =
      MediaSourceType._(8, _omitEnumNames ? '' : 'MediaSourceType_Bluetooth');
  static const MediaSourceType MediaSourceType_AuxIn =
      MediaSourceType._(9, _omitEnumNames ? '' : 'MediaSourceType_AuxIn');
  static const MediaSourceType MediaSourceType_DAB =
      MediaSourceType._(10, _omitEnumNames ? '' : 'MediaSourceType_DAB');
  static const MediaSourceType MediaSourceType_Rdio =
      MediaSourceType._(11, _omitEnumNames ? '' : 'MediaSourceType_Rdio');
  static const MediaSourceType MediaSourceType_Spotify =
      MediaSourceType._(12, _omitEnumNames ? '' : 'MediaSourceType_Spotify');
  static const MediaSourceType MediaSourceType_USRadio =
      MediaSourceType._(13, _omitEnumNames ? '' : 'MediaSourceType_USRadio');
  static const MediaSourceType MediaSourceType_EURadio =
      MediaSourceType._(14, _omitEnumNames ? '' : 'MediaSourceType_EURadio');
  static const MediaSourceType MediaSourceType_MediaFile =
      MediaSourceType._(16, _omitEnumNames ? '' : 'MediaSourceType_MediaFile');

  /// Server-side sources
  static const MediaSourceType MediaSourceType_TuneIn =
      MediaSourceType._(17, _omitEnumNames ? '' : 'MediaSourceType_TuneIn');
  static const MediaSourceType MediaSourceType_Stingray =
      MediaSourceType._(18, _omitEnumNames ? '' : 'MediaSourceType_Stingray');
  static const MediaSourceType MediaSourceType_SiriusXM =
      MediaSourceType._(19, _omitEnumNames ? '' : 'MediaSourceType_SiriusXM');
  static const MediaSourceType MediaSourceType_Tidal =
      MediaSourceType._(20, _omitEnumNames ? '' : 'MediaSourceType_Tidal');
  static const MediaSourceType MediaSourceType_QQMusic =
      MediaSourceType._(21, _omitEnumNames ? '' : 'MediaSourceType_QQMusic');
  static const MediaSourceType MediaSourceType_QQMusic2 =
      MediaSourceType._(22, _omitEnumNames ? '' : 'MediaSourceType_QQMusic2');
  static const MediaSourceType MediaSourceType_Ximalaya =
      MediaSourceType._(23, _omitEnumNames ? '' : 'MediaSourceType_Ximalaya');
  static const MediaSourceType MediaSourceType_OnlineRadio = MediaSourceType._(
      24, _omitEnumNames ? '' : 'MediaSourceType_OnlineRadio');
  static const MediaSourceType MediaSourceType_OnlineRadio2 = MediaSourceType._(
      25, _omitEnumNames ? '' : 'MediaSourceType_OnlineRadio2');
  static const MediaSourceType MediaSourceType_NetEaseMusic = MediaSourceType._(
      26, _omitEnumNames ? '' : 'MediaSourceType_NetEaseMusic');

  /// Entertainment sources
  static const MediaSourceType MediaSourceType_Browser =
      MediaSourceType._(28, _omitEnumNames ? '' : 'MediaSourceType_Browser');
  static const MediaSourceType MediaSourceType_Theater =
      MediaSourceType._(29, _omitEnumNames ? '' : 'MediaSourceType_Theater');
  static const MediaSourceType MediaSourceType_Game =
      MediaSourceType._(30, _omitEnumNames ? '' : 'MediaSourceType_Game');
  static const MediaSourceType MediaSourceType_Tutorial =
      MediaSourceType._(31, _omitEnumNames ? '' : 'MediaSourceType_Tutorial');
  static const MediaSourceType MediaSourceType_Toybox =
      MediaSourceType._(32, _omitEnumNames ? '' : 'MediaSourceType_Toybox');
  static const MediaSourceType MediaSourceType_RecentsFavorites =
      MediaSourceType._(
          33, _omitEnumNames ? '' : 'MediaSourceType_RecentsFavorites');
  static const MediaSourceType MediaSourceType_HomeApps =
      MediaSourceType._(34, _omitEnumNames ? '' : 'MediaSourceType_HomeApps');
  static const MediaSourceType MediaSourceType_Search =
      MediaSourceType._(35, _omitEnumNames ? '' : 'MediaSourceType_Search');

  static const $core.List<MediaSourceType> values = <MediaSourceType>[
    MediaSourceType_None,
    MediaSourceType_AM,
    MediaSourceType_FM,
    MediaSourceType_XM,
    MediaSourceType_Slacker,
    MediaSourceType_LocalFiles,
    MediaSourceType_iPod,
    MediaSourceType_Bluetooth,
    MediaSourceType_AuxIn,
    MediaSourceType_DAB,
    MediaSourceType_Rdio,
    MediaSourceType_Spotify,
    MediaSourceType_USRadio,
    MediaSourceType_EURadio,
    MediaSourceType_MediaFile,
    MediaSourceType_TuneIn,
    MediaSourceType_Stingray,
    MediaSourceType_SiriusXM,
    MediaSourceType_Tidal,
    MediaSourceType_QQMusic,
    MediaSourceType_QQMusic2,
    MediaSourceType_Ximalaya,
    MediaSourceType_OnlineRadio,
    MediaSourceType_OnlineRadio2,
    MediaSourceType_NetEaseMusic,
    MediaSourceType_Browser,
    MediaSourceType_Theater,
    MediaSourceType_Game,
    MediaSourceType_Tutorial,
    MediaSourceType_Toybox,
    MediaSourceType_RecentsFavorites,
    MediaSourceType_HomeApps,
    MediaSourceType_Search,
  ];

  static final $core.List<MediaSourceType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 35);
  static MediaSourceType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const MediaSourceType._(super.value, super.name);
}

class ChargeState_ScheduledChargingMode extends $pb.ProtobufEnum {
  static const ChargeState_ScheduledChargingMode ScheduledChargingModeOff =
      ChargeState_ScheduledChargingMode._(
          0, _omitEnumNames ? '' : 'ScheduledChargingModeOff');
  static const ChargeState_ScheduledChargingMode ScheduledChargingModeStartAt =
      ChargeState_ScheduledChargingMode._(
          1, _omitEnumNames ? '' : 'ScheduledChargingModeStartAt');
  static const ChargeState_ScheduledChargingMode ScheduledChargingModeDepartBy =
      ChargeState_ScheduledChargingMode._(
          2, _omitEnumNames ? '' : 'ScheduledChargingModeDepartBy');

  static const $core.List<ChargeState_ScheduledChargingMode> values =
      <ChargeState_ScheduledChargingMode>[
    ScheduledChargingModeOff,
    ScheduledChargingModeStartAt,
    ScheduledChargingModeDepartBy,
  ];

  static final $core.List<ChargeState_ScheduledChargingMode?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static ChargeState_ScheduledChargingMode? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ChargeState_ScheduledChargingMode._(super.value, super.name);
}

class ChargeState_ChargePortColor_E extends $pb.ProtobufEnum {
  static const ChargeState_ChargePortColor_E ChargePortColorOff =
      ChargeState_ChargePortColor_E._(
          0, _omitEnumNames ? '' : 'ChargePortColorOff');
  static const ChargeState_ChargePortColor_E ChargePortColorRed =
      ChargeState_ChargePortColor_E._(
          1, _omitEnumNames ? '' : 'ChargePortColorRed');
  static const ChargeState_ChargePortColor_E ChargePortColorGreen =
      ChargeState_ChargePortColor_E._(
          2, _omitEnumNames ? '' : 'ChargePortColorGreen');
  static const ChargeState_ChargePortColor_E ChargePortColorBlue =
      ChargeState_ChargePortColor_E._(
          3, _omitEnumNames ? '' : 'ChargePortColorBlue');
  static const ChargeState_ChargePortColor_E ChargePortColorWhite =
      ChargeState_ChargePortColor_E._(
          4, _omitEnumNames ? '' : 'ChargePortColorWhite');
  static const ChargeState_ChargePortColor_E ChargePortColorFlashingGreen =
      ChargeState_ChargePortColor_E._(
          5, _omitEnumNames ? '' : 'ChargePortColorFlashingGreen');
  static const ChargeState_ChargePortColor_E ChargePortColorFlashingAmber =
      ChargeState_ChargePortColor_E._(
          6, _omitEnumNames ? '' : 'ChargePortColorFlashingAmber');
  static const ChargeState_ChargePortColor_E ChargePortColorAmber =
      ChargeState_ChargePortColor_E._(
          7, _omitEnumNames ? '' : 'ChargePortColorAmber');
  static const ChargeState_ChargePortColor_E ChargePortColorRave =
      ChargeState_ChargePortColor_E._(
          8, _omitEnumNames ? '' : 'ChargePortColorRave');
  static const ChargeState_ChargePortColor_E ChargePortColorDebug =
      ChargeState_ChargePortColor_E._(
          9, _omitEnumNames ? '' : 'ChargePortColorDebug');
  static const ChargeState_ChargePortColor_E ChargePortColorFlashingBlue =
      ChargeState_ChargePortColor_E._(
          10, _omitEnumNames ? '' : 'ChargePortColorFlashingBlue');

  static const $core.List<ChargeState_ChargePortColor_E> values =
      <ChargeState_ChargePortColor_E>[
    ChargePortColorOff,
    ChargePortColorRed,
    ChargePortColorGreen,
    ChargePortColorBlue,
    ChargePortColorWhite,
    ChargePortColorFlashingGreen,
    ChargePortColorFlashingAmber,
    ChargePortColorAmber,
    ChargePortColorRave,
    ChargePortColorDebug,
    ChargePortColorFlashingBlue,
  ];

  static final $core.List<ChargeState_ChargePortColor_E?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 10);
  static ChargeState_ChargePortColor_E? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ChargeState_ChargePortColor_E._(super.value, super.name);
}

class ChargeState_ChargeLimitReason extends $pb.ProtobufEnum {
  static const ChargeState_ChargeLimitReason ChargeLimitReasonUnknown =
      ChargeState_ChargeLimitReason._(
          0, _omitEnumNames ? '' : 'ChargeLimitReasonUnknown');
  static const ChargeState_ChargeLimitReason ChargeLimitReasonNone =
      ChargeState_ChargeLimitReason._(
          1, _omitEnumNames ? '' : 'ChargeLimitReasonNone');
  static const ChargeState_ChargeLimitReason ChargeLimitReasonEvse =
      ChargeState_ChargeLimitReason._(
          2, _omitEnumNames ? '' : 'ChargeLimitReasonEvse');
  static const ChargeState_ChargeLimitReason ChargeLimitReasonBattTempLow =
      ChargeState_ChargeLimitReason._(
          3, _omitEnumNames ? '' : 'ChargeLimitReasonBattTempLow');
  static const ChargeState_ChargeLimitReason ChargeLimitReasonHighSoc =
      ChargeState_ChargeLimitReason._(
          4, _omitEnumNames ? '' : 'ChargeLimitReasonHighSoc');
  static const ChargeState_ChargeLimitReason ChargeLimitReasonCabin =
      ChargeState_ChargeLimitReason._(
          5, _omitEnumNames ? '' : 'ChargeLimitReasonCabin');

  static const $core.List<ChargeState_ChargeLimitReason> values =
      <ChargeState_ChargeLimitReason>[
    ChargeLimitReasonUnknown,
    ChargeLimitReasonNone,
    ChargeLimitReasonEvse,
    ChargeLimitReasonBattTempLow,
    ChargeLimitReasonHighSoc,
    ChargeLimitReasonCabin,
  ];

  static final $core.List<ChargeState_ChargeLimitReason?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static ChargeState_ChargeLimitReason? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ChargeState_ChargeLimitReason._(super.value, super.name);
}

class ChargeState_OutletState extends $pb.ProtobufEnum {
  static const ChargeState_OutletState OutletStateOff =
      ChargeState_OutletState._(0, _omitEnumNames ? '' : 'OutletStateOff');
  static const ChargeState_OutletState OutletStateCabinAndBed =
      ChargeState_OutletState._(
          1, _omitEnumNames ? '' : 'OutletStateCabinAndBed');
  static const ChargeState_OutletState OutletStateCabin =
      ChargeState_OutletState._(2, _omitEnumNames ? '' : 'OutletStateCabin');

  static const $core.List<ChargeState_OutletState> values =
      <ChargeState_OutletState>[
    OutletStateOff,
    OutletStateCabinAndBed,
    OutletStateCabin,
  ];

  static final $core.List<ChargeState_OutletState?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static ChargeState_OutletState? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ChargeState_OutletState._(super.value, super.name);
}

class ChargeState_PowerFeedState extends $pb.ProtobufEnum {
  static const ChargeState_PowerFeedState PowerFeedStateOff =
      ChargeState_PowerFeedState._(
          0, _omitEnumNames ? '' : 'PowerFeedStateOff');
  static const ChargeState_PowerFeedState PowerFeedStateCabinAndBed =
      ChargeState_PowerFeedState._(
          1, _omitEnumNames ? '' : 'PowerFeedStateCabinAndBed');
  static const ChargeState_PowerFeedState PowerFeedStateCabin =
      ChargeState_PowerFeedState._(
          2, _omitEnumNames ? '' : 'PowerFeedStateCabin');

  static const $core.List<ChargeState_PowerFeedState> values =
      <ChargeState_PowerFeedState>[
    PowerFeedStateOff,
    PowerFeedStateCabinAndBed,
    PowerFeedStateCabin,
  ];

  static final $core.List<ChargeState_PowerFeedState?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static ChargeState_PowerFeedState? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ChargeState_PowerFeedState._(super.value, super.name);
}

class ChargeState_PowershareStatus extends $pb.ProtobufEnum {
  static const ChargeState_PowershareStatus PowershareStatusInactive =
      ChargeState_PowershareStatus._(
          0, _omitEnumNames ? '' : 'PowershareStatusInactive');
  static const ChargeState_PowershareStatus PowershareStatusInit =
      ChargeState_PowershareStatus._(
          1, _omitEnumNames ? '' : 'PowershareStatusInit');
  static const ChargeState_PowershareStatus PowershareStatusActive =
      ChargeState_PowershareStatus._(
          2, _omitEnumNames ? '' : 'PowershareStatusActive');
  static const ChargeState_PowershareStatus PowershareStatusStopped =
      ChargeState_PowershareStatus._(
          3, _omitEnumNames ? '' : 'PowershareStatusStopped');
  static const ChargeState_PowershareStatus PowershareStatusHandshaking =
      ChargeState_PowershareStatus._(
          4, _omitEnumNames ? '' : 'PowershareStatusHandshaking');
  static const ChargeState_PowershareStatus
      PowershareStatusActiveReconnectingSoon = ChargeState_PowershareStatus._(
          5, _omitEnumNames ? '' : 'PowershareStatusActiveReconnectingSoon');

  static const $core.List<ChargeState_PowershareStatus> values =
      <ChargeState_PowershareStatus>[
    PowershareStatusInactive,
    PowershareStatusInit,
    PowershareStatusActive,
    PowershareStatusStopped,
    PowershareStatusHandshaking,
    PowershareStatusActiveReconnectingSoon,
  ];

  static final $core.List<ChargeState_PowershareStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static ChargeState_PowershareStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ChargeState_PowershareStatus._(super.value, super.name);
}

class ChargeState_PowershareType extends $pb.ProtobufEnum {
  static const ChargeState_PowershareType PowershareTypeNone =
      ChargeState_PowershareType._(
          0, _omitEnumNames ? '' : 'PowershareTypeNone');
  static const ChargeState_PowershareType PowershareTypeLoad =
      ChargeState_PowershareType._(
          1, _omitEnumNames ? '' : 'PowershareTypeLoad');
  static const ChargeState_PowershareType PowershareTypeHome =
      ChargeState_PowershareType._(
          2, _omitEnumNames ? '' : 'PowershareTypeHome');

  static const $core.List<ChargeState_PowershareType> values =
      <ChargeState_PowershareType>[
    PowershareTypeNone,
    PowershareTypeLoad,
    PowershareTypeHome,
  ];

  static final $core.List<ChargeState_PowershareType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static ChargeState_PowershareType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ChargeState_PowershareType._(super.value, super.name);
}

class ChargeState_PowershareStopReason extends $pb.ProtobufEnum {
  static const ChargeState_PowershareStopReason PowershareStopReasonNone =
      ChargeState_PowershareStopReason._(
          0, _omitEnumNames ? '' : 'PowershareStopReasonNone');
  static const ChargeState_PowershareStopReason PowershareStopReasonSOCTooLow =
      ChargeState_PowershareStopReason._(
          1, _omitEnumNames ? '' : 'PowershareStopReasonSOCTooLow');
  static const ChargeState_PowershareStopReason PowershareStopReasonRetry =
      ChargeState_PowershareStopReason._(
          2, _omitEnumNames ? '' : 'PowershareStopReasonRetry');
  static const ChargeState_PowershareStopReason PowershareStopReasonFault =
      ChargeState_PowershareStopReason._(
          3, _omitEnumNames ? '' : 'PowershareStopReasonFault');
  static const ChargeState_PowershareStopReason PowershareStopReasonUser =
      ChargeState_PowershareStopReason._(
          4, _omitEnumNames ? '' : 'PowershareStopReasonUser');
  static const ChargeState_PowershareStopReason
      PowershareStopReasonReconnecting = ChargeState_PowershareStopReason._(
          5, _omitEnumNames ? '' : 'PowershareStopReasonReconnecting');
  static const ChargeState_PowershareStopReason
      PowershareStopReasonAuthentication = ChargeState_PowershareStopReason._(
          6, _omitEnumNames ? '' : 'PowershareStopReasonAuthentication');

  static const $core.List<ChargeState_PowershareStopReason> values =
      <ChargeState_PowershareStopReason>[
    PowershareStopReasonNone,
    PowershareStopReasonSOCTooLow,
    PowershareStopReasonRetry,
    PowershareStopReasonFault,
    PowershareStopReasonUser,
    PowershareStopReasonReconnecting,
    PowershareStopReasonAuthentication,
  ];

  static final $core.List<ChargeState_PowershareStopReason?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 6);
  static ChargeState_PowershareStopReason? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ChargeState_PowershareStopReason._(super.value, super.name);
}

class ClimateState_HvacAutoRequest extends $pb.ProtobufEnum {
  static const ClimateState_HvacAutoRequest HvacAutoRequestOn =
      ClimateState_HvacAutoRequest._(
          0, _omitEnumNames ? '' : 'HvacAutoRequestOn');
  static const ClimateState_HvacAutoRequest HvacAutoRequestOverride =
      ClimateState_HvacAutoRequest._(
          1, _omitEnumNames ? '' : 'HvacAutoRequestOverride');

  static const $core.List<ClimateState_HvacAutoRequest> values =
      <ClimateState_HvacAutoRequest>[
    HvacAutoRequestOn,
    HvacAutoRequestOverride,
  ];

  static final $core.List<ClimateState_HvacAutoRequest?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static ClimateState_HvacAutoRequest? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ClimateState_HvacAutoRequest._(super.value, super.name);
}

class ClimateState_CabinOverheatProtection_E extends $pb.ProtobufEnum {
  static const ClimateState_CabinOverheatProtection_E
      CabinOverheatProtectionOff = ClimateState_CabinOverheatProtection_E._(
          0, _omitEnumNames ? '' : 'CabinOverheatProtectionOff');
  static const ClimateState_CabinOverheatProtection_E
      CabinOverheatProtectionOn = ClimateState_CabinOverheatProtection_E._(
          1, _omitEnumNames ? '' : 'CabinOverheatProtectionOn');
  static const ClimateState_CabinOverheatProtection_E
      CabinOverheatProtectionFanOnly = ClimateState_CabinOverheatProtection_E._(
          2, _omitEnumNames ? '' : 'CabinOverheatProtectionFanOnly');

  static const $core.List<ClimateState_CabinOverheatProtection_E> values =
      <ClimateState_CabinOverheatProtection_E>[
    CabinOverheatProtectionOff,
    CabinOverheatProtectionOn,
    CabinOverheatProtectionFanOnly,
  ];

  static final $core.List<ClimateState_CabinOverheatProtection_E?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static ClimateState_CabinOverheatProtection_E? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ClimateState_CabinOverheatProtection_E._(super.value, super.name);
}

class ClimateState_SeatHeaterLevel_E extends $pb.ProtobufEnum {
  static const ClimateState_SeatHeaterLevel_E SeatHeaterLevelOff =
      ClimateState_SeatHeaterLevel_E._(
          0, _omitEnumNames ? '' : 'SeatHeaterLevelOff');
  static const ClimateState_SeatHeaterLevel_E SeatHeaterLevelLow =
      ClimateState_SeatHeaterLevel_E._(
          1, _omitEnumNames ? '' : 'SeatHeaterLevelLow');
  static const ClimateState_SeatHeaterLevel_E SeatHeaterLevelMed =
      ClimateState_SeatHeaterLevel_E._(
          2, _omitEnumNames ? '' : 'SeatHeaterLevelMed');
  static const ClimateState_SeatHeaterLevel_E SeatHeaterLevelHigh =
      ClimateState_SeatHeaterLevel_E._(
          3, _omitEnumNames ? '' : 'SeatHeaterLevelHigh');

  static const $core.List<ClimateState_SeatHeaterLevel_E> values =
      <ClimateState_SeatHeaterLevel_E>[
    SeatHeaterLevelOff,
    SeatHeaterLevelLow,
    SeatHeaterLevelMed,
    SeatHeaterLevelHigh,
  ];

  static final $core.List<ClimateState_SeatHeaterLevel_E?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static ClimateState_SeatHeaterLevel_E? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ClimateState_SeatHeaterLevel_E._(super.value, super.name);
}

class ClimateState_SeatCoolingLevel_E extends $pb.ProtobufEnum {
  static const ClimateState_SeatCoolingLevel_E SeatCoolingLevelOff =
      ClimateState_SeatCoolingLevel_E._(
          0, _omitEnumNames ? '' : 'SeatCoolingLevelOff');
  static const ClimateState_SeatCoolingLevel_E SeatCoolingLevelLow =
      ClimateState_SeatCoolingLevel_E._(
          1, _omitEnumNames ? '' : 'SeatCoolingLevelLow');
  static const ClimateState_SeatCoolingLevel_E SeatCoolingLevelMed =
      ClimateState_SeatCoolingLevel_E._(
          2, _omitEnumNames ? '' : 'SeatCoolingLevelMed');
  static const ClimateState_SeatCoolingLevel_E SeatCoolingLevelHigh =
      ClimateState_SeatCoolingLevel_E._(
          3, _omitEnumNames ? '' : 'SeatCoolingLevelHigh');

  static const $core.List<ClimateState_SeatCoolingLevel_E> values =
      <ClimateState_SeatCoolingLevel_E>[
    SeatCoolingLevelOff,
    SeatCoolingLevelLow,
    SeatCoolingLevelMed,
    SeatCoolingLevelHigh,
  ];

  static final $core.List<ClimateState_SeatCoolingLevel_E?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static ClimateState_SeatCoolingLevel_E? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ClimateState_SeatCoolingLevel_E._(super.value, super.name);
}

class ClimateState_CopActivationTemp extends $pb.ProtobufEnum {
  static const ClimateState_CopActivationTemp CopActivationTempUnspecified =
      ClimateState_CopActivationTemp._(
          0, _omitEnumNames ? '' : 'CopActivationTempUnspecified');
  static const ClimateState_CopActivationTemp CopActivationTempLow =
      ClimateState_CopActivationTemp._(
          1, _omitEnumNames ? '' : 'CopActivationTempLow');
  static const ClimateState_CopActivationTemp CopActivationTempMedium =
      ClimateState_CopActivationTemp._(
          2, _omitEnumNames ? '' : 'CopActivationTempMedium');
  static const ClimateState_CopActivationTemp CopActivationTempHigh =
      ClimateState_CopActivationTemp._(
          3, _omitEnumNames ? '' : 'CopActivationTempHigh');

  static const $core.List<ClimateState_CopActivationTemp> values =
      <ClimateState_CopActivationTemp>[
    CopActivationTempUnspecified,
    CopActivationTempLow,
    CopActivationTempMedium,
    CopActivationTempHigh,
  ];

  static final $core.List<ClimateState_CopActivationTemp?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static ClimateState_CopActivationTemp? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ClimateState_CopActivationTemp._(super.value, super.name);
}

class ClimateState_COPNotRunningReason extends $pb.ProtobufEnum {
  static const ClimateState_COPNotRunningReason COPNotRunningReasonNoReason =
      ClimateState_COPNotRunningReason._(
          0, _omitEnumNames ? '' : 'COPNotRunningReasonNoReason');
  static const ClimateState_COPNotRunningReason
      COPNotRunningReasonUserInteraction = ClimateState_COPNotRunningReason._(
          1, _omitEnumNames ? '' : 'COPNotRunningReasonUserInteraction');
  static const ClimateState_COPNotRunningReason
      COPNotRunningReasonEnergyConsumptionReached =
      ClimateState_COPNotRunningReason._(2,
          _omitEnumNames ? '' : 'COPNotRunningReasonEnergyConsumptionReached');
  static const ClimateState_COPNotRunningReason COPNotRunningReasonTimeout =
      ClimateState_COPNotRunningReason._(
          3, _omitEnumNames ? '' : 'COPNotRunningReasonTimeout');
  static const ClimateState_COPNotRunningReason
      COPNotRunningReasonLowSolarLoad = ClimateState_COPNotRunningReason._(
          4, _omitEnumNames ? '' : 'COPNotRunningReasonLowSolarLoad');
  static const ClimateState_COPNotRunningReason COPNotRunningReasonFault =
      ClimateState_COPNotRunningReason._(
          5, _omitEnumNames ? '' : 'COPNotRunningReasonFault');
  static const ClimateState_COPNotRunningReason
      COPNotRunningReasonCabinBelowThreshold =
      ClimateState_COPNotRunningReason._(
          6, _omitEnumNames ? '' : 'COPNotRunningReasonCabinBelowThreshold');

  static const $core.List<ClimateState_COPNotRunningReason> values =
      <ClimateState_COPNotRunningReason>[
    COPNotRunningReasonNoReason,
    COPNotRunningReasonUserInteraction,
    COPNotRunningReasonEnergyConsumptionReached,
    COPNotRunningReasonTimeout,
    COPNotRunningReasonLowSolarLoad,
    COPNotRunningReasonFault,
    COPNotRunningReasonCabinBelowThreshold,
  ];

  static final $core.List<ClimateState_COPNotRunningReason?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 6);
  static ClimateState_COPNotRunningReason? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ClimateState_COPNotRunningReason._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

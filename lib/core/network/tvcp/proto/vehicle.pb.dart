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

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/timestamp.pb.dart'
    as $0;

import 'common.pb.dart' as $1;
import 'managed_charging.pbenum.dart' as $3;
import 'vcsec.pbenum.dart' as $2;
import 'vehicle.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'vehicle.pbenum.dart';

class VehicleData extends $pb.GeneratedMessage {
  factory VehicleData({
    ChargeState? chargeState,
    ClimateState? climateState,
    DriveState? driveState,
    LocationState? locationState,
    ClosuresState? closuresState,
    ChargeScheduleState? chargeScheduleState,
    PreconditioningScheduleState? preconditioningScheduleState,
    TirePressureState? tirePressureState,
    MediaState? mediaState,
    MediaDetailState? mediaDetailState,
    SoftwareUpdateState? softwareUpdateState,
    ParentalControlsState? parentalControlsState,
  }) {
    final result = create();
    if (chargeState != null) result.chargeState = chargeState;
    if (climateState != null) result.climateState = climateState;
    if (driveState != null) result.driveState = driveState;
    if (locationState != null) result.locationState = locationState;
    if (closuresState != null) result.closuresState = closuresState;
    if (chargeScheduleState != null)
      result.chargeScheduleState = chargeScheduleState;
    if (preconditioningScheduleState != null)
      result.preconditioningScheduleState = preconditioningScheduleState;
    if (tirePressureState != null) result.tirePressureState = tirePressureState;
    if (mediaState != null) result.mediaState = mediaState;
    if (mediaDetailState != null) result.mediaDetailState = mediaDetailState;
    if (softwareUpdateState != null)
      result.softwareUpdateState = softwareUpdateState;
    if (parentalControlsState != null)
      result.parentalControlsState = parentalControlsState;
    return result;
  }

  VehicleData._();

  factory VehicleData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VehicleData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VehicleData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOM<ChargeState>(3, _omitFieldNames ? '' : 'chargeState',
        subBuilder: ChargeState.create)
    ..aOM<ClimateState>(4, _omitFieldNames ? '' : 'climateState',
        subBuilder: ClimateState.create)
    ..aOM<DriveState>(5, _omitFieldNames ? '' : 'driveState',
        subBuilder: DriveState.create)
    ..aOM<LocationState>(8, _omitFieldNames ? '' : 'locationState',
        subBuilder: LocationState.create)
    ..aOM<ClosuresState>(9, _omitFieldNames ? '' : 'closuresState',
        subBuilder: ClosuresState.create)
    ..aOM<ChargeScheduleState>(15, _omitFieldNames ? '' : 'chargeScheduleState',
        subBuilder: ChargeScheduleState.create)
    ..aOM<PreconditioningScheduleState>(
        16, _omitFieldNames ? '' : 'preconditioningScheduleState',
        subBuilder: PreconditioningScheduleState.create)
    ..aOM<TirePressureState>(19, _omitFieldNames ? '' : 'tirePressureState',
        subBuilder: TirePressureState.create)
    ..aOM<MediaState>(20, _omitFieldNames ? '' : 'mediaState',
        subBuilder: MediaState.create)
    ..aOM<MediaDetailState>(21, _omitFieldNames ? '' : 'mediaDetailState',
        subBuilder: MediaDetailState.create)
    ..aOM<SoftwareUpdateState>(23, _omitFieldNames ? '' : 'softwareUpdateState',
        subBuilder: SoftwareUpdateState.create)
    ..aOM<ParentalControlsState>(
        24, _omitFieldNames ? '' : 'parentalControlsState',
        subBuilder: ParentalControlsState.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VehicleData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VehicleData copyWith(void Function(VehicleData) updates) =>
      super.copyWith((message) => updates(message as VehicleData))
          as VehicleData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VehicleData create() => VehicleData._();
  @$core.override
  VehicleData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VehicleData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VehicleData>(create);
  static VehicleData? _defaultInstance;

  @$pb.TagNumber(3)
  ChargeState get chargeState => $_getN(0);
  @$pb.TagNumber(3)
  set chargeState(ChargeState value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasChargeState() => $_has(0);
  @$pb.TagNumber(3)
  void clearChargeState() => $_clearField(3);
  @$pb.TagNumber(3)
  ChargeState ensureChargeState() => $_ensure(0);

  @$pb.TagNumber(4)
  ClimateState get climateState => $_getN(1);
  @$pb.TagNumber(4)
  set climateState(ClimateState value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasClimateState() => $_has(1);
  @$pb.TagNumber(4)
  void clearClimateState() => $_clearField(4);
  @$pb.TagNumber(4)
  ClimateState ensureClimateState() => $_ensure(1);

  @$pb.TagNumber(5)
  DriveState get driveState => $_getN(2);
  @$pb.TagNumber(5)
  set driveState(DriveState value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasDriveState() => $_has(2);
  @$pb.TagNumber(5)
  void clearDriveState() => $_clearField(5);
  @$pb.TagNumber(5)
  DriveState ensureDriveState() => $_ensure(2);

  @$pb.TagNumber(8)
  LocationState get locationState => $_getN(3);
  @$pb.TagNumber(8)
  set locationState(LocationState value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasLocationState() => $_has(3);
  @$pb.TagNumber(8)
  void clearLocationState() => $_clearField(8);
  @$pb.TagNumber(8)
  LocationState ensureLocationState() => $_ensure(3);

  @$pb.TagNumber(9)
  ClosuresState get closuresState => $_getN(4);
  @$pb.TagNumber(9)
  set closuresState(ClosuresState value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasClosuresState() => $_has(4);
  @$pb.TagNumber(9)
  void clearClosuresState() => $_clearField(9);
  @$pb.TagNumber(9)
  ClosuresState ensureClosuresState() => $_ensure(4);

  @$pb.TagNumber(15)
  ChargeScheduleState get chargeScheduleState => $_getN(5);
  @$pb.TagNumber(15)
  set chargeScheduleState(ChargeScheduleState value) => $_setField(15, value);
  @$pb.TagNumber(15)
  $core.bool hasChargeScheduleState() => $_has(5);
  @$pb.TagNumber(15)
  void clearChargeScheduleState() => $_clearField(15);
  @$pb.TagNumber(15)
  ChargeScheduleState ensureChargeScheduleState() => $_ensure(5);

  @$pb.TagNumber(16)
  PreconditioningScheduleState get preconditioningScheduleState => $_getN(6);
  @$pb.TagNumber(16)
  set preconditioningScheduleState(PreconditioningScheduleState value) =>
      $_setField(16, value);
  @$pb.TagNumber(16)
  $core.bool hasPreconditioningScheduleState() => $_has(6);
  @$pb.TagNumber(16)
  void clearPreconditioningScheduleState() => $_clearField(16);
  @$pb.TagNumber(16)
  PreconditioningScheduleState ensurePreconditioningScheduleState() =>
      $_ensure(6);

  @$pb.TagNumber(19)
  TirePressureState get tirePressureState => $_getN(7);
  @$pb.TagNumber(19)
  set tirePressureState(TirePressureState value) => $_setField(19, value);
  @$pb.TagNumber(19)
  $core.bool hasTirePressureState() => $_has(7);
  @$pb.TagNumber(19)
  void clearTirePressureState() => $_clearField(19);
  @$pb.TagNumber(19)
  TirePressureState ensureTirePressureState() => $_ensure(7);

  @$pb.TagNumber(20)
  MediaState get mediaState => $_getN(8);
  @$pb.TagNumber(20)
  set mediaState(MediaState value) => $_setField(20, value);
  @$pb.TagNumber(20)
  $core.bool hasMediaState() => $_has(8);
  @$pb.TagNumber(20)
  void clearMediaState() => $_clearField(20);
  @$pb.TagNumber(20)
  MediaState ensureMediaState() => $_ensure(8);

  @$pb.TagNumber(21)
  MediaDetailState get mediaDetailState => $_getN(9);
  @$pb.TagNumber(21)
  set mediaDetailState(MediaDetailState value) => $_setField(21, value);
  @$pb.TagNumber(21)
  $core.bool hasMediaDetailState() => $_has(9);
  @$pb.TagNumber(21)
  void clearMediaDetailState() => $_clearField(21);
  @$pb.TagNumber(21)
  MediaDetailState ensureMediaDetailState() => $_ensure(9);

  @$pb.TagNumber(23)
  SoftwareUpdateState get softwareUpdateState => $_getN(10);
  @$pb.TagNumber(23)
  set softwareUpdateState(SoftwareUpdateState value) => $_setField(23, value);
  @$pb.TagNumber(23)
  $core.bool hasSoftwareUpdateState() => $_has(10);
  @$pb.TagNumber(23)
  void clearSoftwareUpdateState() => $_clearField(23);
  @$pb.TagNumber(23)
  SoftwareUpdateState ensureSoftwareUpdateState() => $_ensure(10);

  @$pb.TagNumber(24)
  ParentalControlsState get parentalControlsState => $_getN(11);
  @$pb.TagNumber(24)
  set parentalControlsState(ParentalControlsState value) =>
      $_setField(24, value);
  @$pb.TagNumber(24)
  $core.bool hasParentalControlsState() => $_has(11);
  @$pb.TagNumber(24)
  void clearParentalControlsState() => $_clearField(24);
  @$pb.TagNumber(24)
  ParentalControlsState ensureParentalControlsState() => $_ensure(11);
}

enum ClosuresState_SunRoofState_Type {
  unknown,
  calibrating,
  closed,
  open,
  moving,
  vent,
  notSet
}

class ClosuresState_SunRoofState extends $pb.GeneratedMessage {
  factory ClosuresState_SunRoofState({
    $1.Void? unknown,
    $1.Void? calibrating,
    $1.Void? closed,
    $1.Void? open,
    $1.Void? moving,
    $1.Void? vent,
  }) {
    final result = create();
    if (unknown != null) result.unknown = unknown;
    if (calibrating != null) result.calibrating = calibrating;
    if (closed != null) result.closed = closed;
    if (open != null) result.open = open;
    if (moving != null) result.moving = moving;
    if (vent != null) result.vent = vent;
    return result;
  }

  ClosuresState_SunRoofState._();

  factory ClosuresState_SunRoofState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ClosuresState_SunRoofState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ClosuresState_SunRoofState_Type>
      _ClosuresState_SunRoofState_TypeByTag = {
    1: ClosuresState_SunRoofState_Type.unknown,
    2: ClosuresState_SunRoofState_Type.calibrating,
    3: ClosuresState_SunRoofState_Type.closed,
    4: ClosuresState_SunRoofState_Type.open,
    5: ClosuresState_SunRoofState_Type.moving,
    6: ClosuresState_SunRoofState_Type.vent,
    0: ClosuresState_SunRoofState_Type.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClosuresState.SunRoofState',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5, 6])
    ..aOM<$1.Void>(1, _omitFieldNames ? '' : 'Unknown',
        protoName: 'Unknown', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(2, _omitFieldNames ? '' : 'Calibrating',
        protoName: 'Calibrating', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(3, _omitFieldNames ? '' : 'Closed',
        protoName: 'Closed', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(4, _omitFieldNames ? '' : 'Open',
        protoName: 'Open', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(5, _omitFieldNames ? '' : 'Moving',
        protoName: 'Moving', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(6, _omitFieldNames ? '' : 'Vent',
        protoName: 'Vent', subBuilder: $1.Void.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClosuresState_SunRoofState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClosuresState_SunRoofState copyWith(
          void Function(ClosuresState_SunRoofState) updates) =>
      super.copyWith(
              (message) => updates(message as ClosuresState_SunRoofState))
          as ClosuresState_SunRoofState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClosuresState_SunRoofState create() => ClosuresState_SunRoofState._();
  @$core.override
  ClosuresState_SunRoofState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ClosuresState_SunRoofState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClosuresState_SunRoofState>(create);
  static ClosuresState_SunRoofState? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  ClosuresState_SunRoofState_Type whichType() =>
      _ClosuresState_SunRoofState_TypeByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  void clearType() => $_clearField($_whichOneof(0));

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
  $1.Void get calibrating => $_getN(1);
  @$pb.TagNumber(2)
  set calibrating($1.Void value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasCalibrating() => $_has(1);
  @$pb.TagNumber(2)
  void clearCalibrating() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.Void ensureCalibrating() => $_ensure(1);

  @$pb.TagNumber(3)
  $1.Void get closed => $_getN(2);
  @$pb.TagNumber(3)
  set closed($1.Void value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasClosed() => $_has(2);
  @$pb.TagNumber(3)
  void clearClosed() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.Void ensureClosed() => $_ensure(2);

  @$pb.TagNumber(4)
  $1.Void get open => $_getN(3);
  @$pb.TagNumber(4)
  set open($1.Void value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasOpen() => $_has(3);
  @$pb.TagNumber(4)
  void clearOpen() => $_clearField(4);
  @$pb.TagNumber(4)
  $1.Void ensureOpen() => $_ensure(3);

  @$pb.TagNumber(5)
  $1.Void get moving => $_getN(4);
  @$pb.TagNumber(5)
  set moving($1.Void value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasMoving() => $_has(4);
  @$pb.TagNumber(5)
  void clearMoving() => $_clearField(5);
  @$pb.TagNumber(5)
  $1.Void ensureMoving() => $_ensure(4);

  @$pb.TagNumber(6)
  $1.Void get vent => $_getN(5);
  @$pb.TagNumber(6)
  set vent($1.Void value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasVent() => $_has(5);
  @$pb.TagNumber(6)
  void clearVent() => $_clearField(6);
  @$pb.TagNumber(6)
  $1.Void ensureVent() => $_ensure(5);
}

enum ClosuresState_DisplayState_Type {
  off,
  dim,
  accessory,
  on,
  driving,
  charging,
  lock,
  sentry,
  dog,
  entertainment,
  notSet
}

class ClosuresState_DisplayState extends $pb.GeneratedMessage {
  factory ClosuresState_DisplayState({
    $1.Void? off,
    $1.Void? dim,
    $1.Void? accessory,
    $1.Void? on,
    $1.Void? driving,
    $1.Void? charging,
    $1.Void? lock,
    $1.Void? sentry,
    $1.Void? dog,
    $1.Void? entertainment,
  }) {
    final result = create();
    if (off != null) result.off = off;
    if (dim != null) result.dim = dim;
    if (accessory != null) result.accessory = accessory;
    if (on != null) result.on = on;
    if (driving != null) result.driving = driving;
    if (charging != null) result.charging = charging;
    if (lock != null) result.lock = lock;
    if (sentry != null) result.sentry = sentry;
    if (dog != null) result.dog = dog;
    if (entertainment != null) result.entertainment = entertainment;
    return result;
  }

  ClosuresState_DisplayState._();

  factory ClosuresState_DisplayState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ClosuresState_DisplayState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ClosuresState_DisplayState_Type>
      _ClosuresState_DisplayState_TypeByTag = {
    1: ClosuresState_DisplayState_Type.off,
    2: ClosuresState_DisplayState_Type.dim,
    3: ClosuresState_DisplayState_Type.accessory,
    4: ClosuresState_DisplayState_Type.on,
    5: ClosuresState_DisplayState_Type.driving,
    6: ClosuresState_DisplayState_Type.charging,
    7: ClosuresState_DisplayState_Type.lock,
    8: ClosuresState_DisplayState_Type.sentry,
    9: ClosuresState_DisplayState_Type.dog,
    10: ClosuresState_DisplayState_Type.entertainment,
    0: ClosuresState_DisplayState_Type.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClosuresState.DisplayState',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
    ..aOM<$1.Void>(1, _omitFieldNames ? '' : 'Off',
        protoName: 'Off', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(2, _omitFieldNames ? '' : 'Dim',
        protoName: 'Dim', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(3, _omitFieldNames ? '' : 'Accessory',
        protoName: 'Accessory', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(4, _omitFieldNames ? '' : 'On',
        protoName: 'On', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(5, _omitFieldNames ? '' : 'Driving',
        protoName: 'Driving', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(6, _omitFieldNames ? '' : 'Charging',
        protoName: 'Charging', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(7, _omitFieldNames ? '' : 'Lock',
        protoName: 'Lock', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(8, _omitFieldNames ? '' : 'Sentry',
        protoName: 'Sentry', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(9, _omitFieldNames ? '' : 'Dog',
        protoName: 'Dog', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(10, _omitFieldNames ? '' : 'Entertainment',
        protoName: 'Entertainment', subBuilder: $1.Void.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClosuresState_DisplayState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClosuresState_DisplayState copyWith(
          void Function(ClosuresState_DisplayState) updates) =>
      super.copyWith(
              (message) => updates(message as ClosuresState_DisplayState))
          as ClosuresState_DisplayState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClosuresState_DisplayState create() => ClosuresState_DisplayState._();
  @$core.override
  ClosuresState_DisplayState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ClosuresState_DisplayState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClosuresState_DisplayState>(create);
  static ClosuresState_DisplayState? _defaultInstance;

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
  ClosuresState_DisplayState_Type whichType() =>
      _ClosuresState_DisplayState_TypeByTag[$_whichOneof(0)]!;
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
  void clearType() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $1.Void get off => $_getN(0);
  @$pb.TagNumber(1)
  set off($1.Void value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasOff() => $_has(0);
  @$pb.TagNumber(1)
  void clearOff() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.Void ensureOff() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.Void get dim => $_getN(1);
  @$pb.TagNumber(2)
  set dim($1.Void value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasDim() => $_has(1);
  @$pb.TagNumber(2)
  void clearDim() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.Void ensureDim() => $_ensure(1);

  @$pb.TagNumber(3)
  $1.Void get accessory => $_getN(2);
  @$pb.TagNumber(3)
  set accessory($1.Void value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasAccessory() => $_has(2);
  @$pb.TagNumber(3)
  void clearAccessory() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.Void ensureAccessory() => $_ensure(2);

  @$pb.TagNumber(4)
  $1.Void get on => $_getN(3);
  @$pb.TagNumber(4)
  set on($1.Void value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasOn() => $_has(3);
  @$pb.TagNumber(4)
  void clearOn() => $_clearField(4);
  @$pb.TagNumber(4)
  $1.Void ensureOn() => $_ensure(3);

  @$pb.TagNumber(5)
  $1.Void get driving => $_getN(4);
  @$pb.TagNumber(5)
  set driving($1.Void value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasDriving() => $_has(4);
  @$pb.TagNumber(5)
  void clearDriving() => $_clearField(5);
  @$pb.TagNumber(5)
  $1.Void ensureDriving() => $_ensure(4);

  @$pb.TagNumber(6)
  $1.Void get charging => $_getN(5);
  @$pb.TagNumber(6)
  set charging($1.Void value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasCharging() => $_has(5);
  @$pb.TagNumber(6)
  void clearCharging() => $_clearField(6);
  @$pb.TagNumber(6)
  $1.Void ensureCharging() => $_ensure(5);

  @$pb.TagNumber(7)
  $1.Void get lock => $_getN(6);
  @$pb.TagNumber(7)
  set lock($1.Void value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasLock() => $_has(6);
  @$pb.TagNumber(7)
  void clearLock() => $_clearField(7);
  @$pb.TagNumber(7)
  $1.Void ensureLock() => $_ensure(6);

  @$pb.TagNumber(8)
  $1.Void get sentry => $_getN(7);
  @$pb.TagNumber(8)
  set sentry($1.Void value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasSentry() => $_has(7);
  @$pb.TagNumber(8)
  void clearSentry() => $_clearField(8);
  @$pb.TagNumber(8)
  $1.Void ensureSentry() => $_ensure(7);

  @$pb.TagNumber(9)
  $1.Void get dog => $_getN(8);
  @$pb.TagNumber(9)
  set dog($1.Void value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasDog() => $_has(8);
  @$pb.TagNumber(9)
  void clearDog() => $_clearField(9);
  @$pb.TagNumber(9)
  $1.Void ensureDog() => $_ensure(8);

  @$pb.TagNumber(10)
  $1.Void get entertainment => $_getN(9);
  @$pb.TagNumber(10)
  set entertainment($1.Void value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasEntertainment() => $_has(9);
  @$pb.TagNumber(10)
  void clearEntertainment() => $_clearField(10);
  @$pb.TagNumber(10)
  $1.Void ensureEntertainment() => $_ensure(9);
}

enum ClosuresState_SentryModeState_Type {
  off,
  idle,
  armed,
  aware,
  panic,
  quiet,
  notSet
}

class ClosuresState_SentryModeState extends $pb.GeneratedMessage {
  factory ClosuresState_SentryModeState({
    $1.Void? off,
    $1.Void? idle,
    $1.Void? armed,
    $1.Void? aware,
    $1.Void? panic,
    $1.Void? quiet,
  }) {
    final result = create();
    if (off != null) result.off = off;
    if (idle != null) result.idle = idle;
    if (armed != null) result.armed = armed;
    if (aware != null) result.aware = aware;
    if (panic != null) result.panic = panic;
    if (quiet != null) result.quiet = quiet;
    return result;
  }

  ClosuresState_SentryModeState._();

  factory ClosuresState_SentryModeState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ClosuresState_SentryModeState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ClosuresState_SentryModeState_Type>
      _ClosuresState_SentryModeState_TypeByTag = {
    1: ClosuresState_SentryModeState_Type.off,
    2: ClosuresState_SentryModeState_Type.idle,
    3: ClosuresState_SentryModeState_Type.armed,
    4: ClosuresState_SentryModeState_Type.aware,
    5: ClosuresState_SentryModeState_Type.panic,
    6: ClosuresState_SentryModeState_Type.quiet,
    0: ClosuresState_SentryModeState_Type.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClosuresState.SentryModeState',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5, 6])
    ..aOM<$1.Void>(1, _omitFieldNames ? '' : 'Off',
        protoName: 'Off', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(2, _omitFieldNames ? '' : 'Idle',
        protoName: 'Idle', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(3, _omitFieldNames ? '' : 'Armed',
        protoName: 'Armed', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(4, _omitFieldNames ? '' : 'Aware',
        protoName: 'Aware', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(5, _omitFieldNames ? '' : 'Panic',
        protoName: 'Panic', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(6, _omitFieldNames ? '' : 'Quiet',
        protoName: 'Quiet', subBuilder: $1.Void.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClosuresState_SentryModeState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClosuresState_SentryModeState copyWith(
          void Function(ClosuresState_SentryModeState) updates) =>
      super.copyWith(
              (message) => updates(message as ClosuresState_SentryModeState))
          as ClosuresState_SentryModeState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClosuresState_SentryModeState create() =>
      ClosuresState_SentryModeState._();
  @$core.override
  ClosuresState_SentryModeState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ClosuresState_SentryModeState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClosuresState_SentryModeState>(create);
  static ClosuresState_SentryModeState? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  ClosuresState_SentryModeState_Type whichType() =>
      _ClosuresState_SentryModeState_TypeByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  void clearType() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $1.Void get off => $_getN(0);
  @$pb.TagNumber(1)
  set off($1.Void value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasOff() => $_has(0);
  @$pb.TagNumber(1)
  void clearOff() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.Void ensureOff() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.Void get idle => $_getN(1);
  @$pb.TagNumber(2)
  set idle($1.Void value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasIdle() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdle() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.Void ensureIdle() => $_ensure(1);

  @$pb.TagNumber(3)
  $1.Void get armed => $_getN(2);
  @$pb.TagNumber(3)
  set armed($1.Void value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasArmed() => $_has(2);
  @$pb.TagNumber(3)
  void clearArmed() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.Void ensureArmed() => $_ensure(2);

  @$pb.TagNumber(4)
  $1.Void get aware => $_getN(3);
  @$pb.TagNumber(4)
  set aware($1.Void value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasAware() => $_has(3);
  @$pb.TagNumber(4)
  void clearAware() => $_clearField(4);
  @$pb.TagNumber(4)
  $1.Void ensureAware() => $_ensure(3);

  @$pb.TagNumber(5)
  $1.Void get panic => $_getN(4);
  @$pb.TagNumber(5)
  set panic($1.Void value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasPanic() => $_has(4);
  @$pb.TagNumber(5)
  void clearPanic() => $_clearField(5);
  @$pb.TagNumber(5)
  $1.Void ensurePanic() => $_ensure(4);

  @$pb.TagNumber(6)
  $1.Void get quiet => $_getN(5);
  @$pb.TagNumber(6)
  set quiet($1.Void value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasQuiet() => $_has(5);
  @$pb.TagNumber(6)
  void clearQuiet() => $_clearField(6);
  @$pb.TagNumber(6)
  $1.Void ensureQuiet() => $_ensure(5);
}

enum ClosuresState_OptionalDoorOpenDriverFront { doorOpenDriverFront, notSet }

enum ClosuresState_OptionalDoorOpenDriverRear { doorOpenDriverRear, notSet }

enum ClosuresState_OptionalDoorOpenPassengerFront {
  doorOpenPassengerFront,
  notSet
}

enum ClosuresState_OptionalDoorOpenPassengerRear {
  doorOpenPassengerRear,
  notSet
}

enum ClosuresState_OptionalDoorOpenTrunkFront { doorOpenTrunkFront, notSet }

enum ClosuresState_OptionalDoorOpenTrunkRear { doorOpenTrunkRear, notSet }

enum ClosuresState_OptionalWindowOpenDriverFront {
  windowOpenDriverFront,
  notSet
}

enum ClosuresState_OptionalWindowOpenPassengerFront {
  windowOpenPassengerFront,
  notSet
}

enum ClosuresState_OptionalWindowOpenDriverRear { windowOpenDriverRear, notSet }

enum ClosuresState_OptionalWindowOpenPassengerRear {
  windowOpenPassengerRear,
  notSet
}

enum ClosuresState_OptionalSunRoofPercentOpen { sunRoofPercentOpen, notSet }

enum ClosuresState_OptionalLocked { locked, notSet }

enum ClosuresState_OptionalIsUserPresent { isUserPresent, notSet }

enum ClosuresState_OptionalRemoteStart { remoteStart, notSet }

enum ClosuresState_OptionalValetMode { valetMode, notSet }

enum ClosuresState_OptionalValetPinNeeded { valetPinNeeded, notSet }

enum ClosuresState_OptionalSentryModeAvailable { sentryModeAvailable, notSet }

enum ClosuresState_OptionalTonneauState { tonneauState, notSet }

enum ClosuresState_OptionalTonneauPercentOpen { tonneauPercentOpen, notSet }

enum ClosuresState_OptionalTonneauInMotion { tonneauInMotion, notSet }

class ClosuresState extends $pb.GeneratedMessage {
  factory ClosuresState({
    ClosuresState_SunRoofState? sunRoofState,
    ClosuresState_DisplayState? centerDisplayState,
    ClosuresState_SentryModeState? sentryModeState,
    SpeedLimitMode? speedLimitMode,
    $2.ClosureState_E? tonneauState,
    $core.int? tonneauPercentOpen,
    $core.bool? tonneauInMotion,
    $core.bool? doorOpenDriverFront,
    $core.bool? doorOpenDriverRear,
    $core.bool? doorOpenPassengerFront,
    $core.bool? doorOpenPassengerRear,
    $core.bool? doorOpenTrunkFront,
    $core.bool? doorOpenTrunkRear,
    $core.bool? windowOpenDriverFront,
    $core.bool? windowOpenPassengerFront,
    $core.bool? windowOpenDriverRear,
    $core.bool? windowOpenPassengerRear,
    $core.int? sunRoofPercentOpen,
    $core.bool? locked,
    $core.bool? isUserPresent,
    $core.bool? remoteStart,
    $core.bool? valetMode,
    $core.bool? valetPinNeeded,
    $core.bool? sentryModeAvailable,
    $0.Timestamp? timestamp,
  }) {
    final result = create();
    if (sunRoofState != null) result.sunRoofState = sunRoofState;
    if (centerDisplayState != null)
      result.centerDisplayState = centerDisplayState;
    if (sentryModeState != null) result.sentryModeState = sentryModeState;
    if (speedLimitMode != null) result.speedLimitMode = speedLimitMode;
    if (tonneauState != null) result.tonneauState = tonneauState;
    if (tonneauPercentOpen != null)
      result.tonneauPercentOpen = tonneauPercentOpen;
    if (tonneauInMotion != null) result.tonneauInMotion = tonneauInMotion;
    if (doorOpenDriverFront != null)
      result.doorOpenDriverFront = doorOpenDriverFront;
    if (doorOpenDriverRear != null)
      result.doorOpenDriverRear = doorOpenDriverRear;
    if (doorOpenPassengerFront != null)
      result.doorOpenPassengerFront = doorOpenPassengerFront;
    if (doorOpenPassengerRear != null)
      result.doorOpenPassengerRear = doorOpenPassengerRear;
    if (doorOpenTrunkFront != null)
      result.doorOpenTrunkFront = doorOpenTrunkFront;
    if (doorOpenTrunkRear != null) result.doorOpenTrunkRear = doorOpenTrunkRear;
    if (windowOpenDriverFront != null)
      result.windowOpenDriverFront = windowOpenDriverFront;
    if (windowOpenPassengerFront != null)
      result.windowOpenPassengerFront = windowOpenPassengerFront;
    if (windowOpenDriverRear != null)
      result.windowOpenDriverRear = windowOpenDriverRear;
    if (windowOpenPassengerRear != null)
      result.windowOpenPassengerRear = windowOpenPassengerRear;
    if (sunRoofPercentOpen != null)
      result.sunRoofPercentOpen = sunRoofPercentOpen;
    if (locked != null) result.locked = locked;
    if (isUserPresent != null) result.isUserPresent = isUserPresent;
    if (remoteStart != null) result.remoteStart = remoteStart;
    if (valetMode != null) result.valetMode = valetMode;
    if (valetPinNeeded != null) result.valetPinNeeded = valetPinNeeded;
    if (sentryModeAvailable != null)
      result.sentryModeAvailable = sentryModeAvailable;
    if (timestamp != null) result.timestamp = timestamp;
    return result;
  }

  ClosuresState._();

  factory ClosuresState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ClosuresState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ClosuresState_OptionalDoorOpenDriverFront>
      _ClosuresState_OptionalDoorOpenDriverFrontByTag = {
    101: ClosuresState_OptionalDoorOpenDriverFront.doorOpenDriverFront,
    0: ClosuresState_OptionalDoorOpenDriverFront.notSet
  };
  static const $core.Map<$core.int, ClosuresState_OptionalDoorOpenDriverRear>
      _ClosuresState_OptionalDoorOpenDriverRearByTag = {
    102: ClosuresState_OptionalDoorOpenDriverRear.doorOpenDriverRear,
    0: ClosuresState_OptionalDoorOpenDriverRear.notSet
  };
  static const $core
      .Map<$core.int, ClosuresState_OptionalDoorOpenPassengerFront>
      _ClosuresState_OptionalDoorOpenPassengerFrontByTag = {
    103: ClosuresState_OptionalDoorOpenPassengerFront.doorOpenPassengerFront,
    0: ClosuresState_OptionalDoorOpenPassengerFront.notSet
  };
  static const $core.Map<$core.int, ClosuresState_OptionalDoorOpenPassengerRear>
      _ClosuresState_OptionalDoorOpenPassengerRearByTag = {
    104: ClosuresState_OptionalDoorOpenPassengerRear.doorOpenPassengerRear,
    0: ClosuresState_OptionalDoorOpenPassengerRear.notSet
  };
  static const $core.Map<$core.int, ClosuresState_OptionalDoorOpenTrunkFront>
      _ClosuresState_OptionalDoorOpenTrunkFrontByTag = {
    105: ClosuresState_OptionalDoorOpenTrunkFront.doorOpenTrunkFront,
    0: ClosuresState_OptionalDoorOpenTrunkFront.notSet
  };
  static const $core.Map<$core.int, ClosuresState_OptionalDoorOpenTrunkRear>
      _ClosuresState_OptionalDoorOpenTrunkRearByTag = {
    106: ClosuresState_OptionalDoorOpenTrunkRear.doorOpenTrunkRear,
    0: ClosuresState_OptionalDoorOpenTrunkRear.notSet
  };
  static const $core.Map<$core.int, ClosuresState_OptionalWindowOpenDriverFront>
      _ClosuresState_OptionalWindowOpenDriverFrontByTag = {
    107: ClosuresState_OptionalWindowOpenDriverFront.windowOpenDriverFront,
    0: ClosuresState_OptionalWindowOpenDriverFront.notSet
  };
  static const $core
      .Map<$core.int, ClosuresState_OptionalWindowOpenPassengerFront>
      _ClosuresState_OptionalWindowOpenPassengerFrontByTag = {
    108:
        ClosuresState_OptionalWindowOpenPassengerFront.windowOpenPassengerFront,
    0: ClosuresState_OptionalWindowOpenPassengerFront.notSet
  };
  static const $core.Map<$core.int, ClosuresState_OptionalWindowOpenDriverRear>
      _ClosuresState_OptionalWindowOpenDriverRearByTag = {
    109: ClosuresState_OptionalWindowOpenDriverRear.windowOpenDriverRear,
    0: ClosuresState_OptionalWindowOpenDriverRear.notSet
  };
  static const $core
      .Map<$core.int, ClosuresState_OptionalWindowOpenPassengerRear>
      _ClosuresState_OptionalWindowOpenPassengerRearByTag = {
    110: ClosuresState_OptionalWindowOpenPassengerRear.windowOpenPassengerRear,
    0: ClosuresState_OptionalWindowOpenPassengerRear.notSet
  };
  static const $core.Map<$core.int, ClosuresState_OptionalSunRoofPercentOpen>
      _ClosuresState_OptionalSunRoofPercentOpenByTag = {
    112: ClosuresState_OptionalSunRoofPercentOpen.sunRoofPercentOpen,
    0: ClosuresState_OptionalSunRoofPercentOpen.notSet
  };
  static const $core.Map<$core.int, ClosuresState_OptionalLocked>
      _ClosuresState_OptionalLockedByTag = {
    113: ClosuresState_OptionalLocked.locked,
    0: ClosuresState_OptionalLocked.notSet
  };
  static const $core.Map<$core.int, ClosuresState_OptionalIsUserPresent>
      _ClosuresState_OptionalIsUserPresentByTag = {
    114: ClosuresState_OptionalIsUserPresent.isUserPresent,
    0: ClosuresState_OptionalIsUserPresent.notSet
  };
  static const $core.Map<$core.int, ClosuresState_OptionalRemoteStart>
      _ClosuresState_OptionalRemoteStartByTag = {
    116: ClosuresState_OptionalRemoteStart.remoteStart,
    0: ClosuresState_OptionalRemoteStart.notSet
  };
  static const $core.Map<$core.int, ClosuresState_OptionalValetMode>
      _ClosuresState_OptionalValetModeByTag = {
    117: ClosuresState_OptionalValetMode.valetMode,
    0: ClosuresState_OptionalValetMode.notSet
  };
  static const $core.Map<$core.int, ClosuresState_OptionalValetPinNeeded>
      _ClosuresState_OptionalValetPinNeededByTag = {
    118: ClosuresState_OptionalValetPinNeeded.valetPinNeeded,
    0: ClosuresState_OptionalValetPinNeeded.notSet
  };
  static const $core.Map<$core.int, ClosuresState_OptionalSentryModeAvailable>
      _ClosuresState_OptionalSentryModeAvailableByTag = {
    120: ClosuresState_OptionalSentryModeAvailable.sentryModeAvailable,
    0: ClosuresState_OptionalSentryModeAvailable.notSet
  };
  static const $core.Map<$core.int, ClosuresState_OptionalTonneauState>
      _ClosuresState_OptionalTonneauStateByTag = {
    23: ClosuresState_OptionalTonneauState.tonneauState,
    0: ClosuresState_OptionalTonneauState.notSet
  };
  static const $core.Map<$core.int, ClosuresState_OptionalTonneauPercentOpen>
      _ClosuresState_OptionalTonneauPercentOpenByTag = {
    24: ClosuresState_OptionalTonneauPercentOpen.tonneauPercentOpen,
    0: ClosuresState_OptionalTonneauPercentOpen.notSet
  };
  static const $core.Map<$core.int, ClosuresState_OptionalTonneauInMotion>
      _ClosuresState_OptionalTonneauInMotionByTag = {
    25: ClosuresState_OptionalTonneauInMotion.tonneauInMotion,
    0: ClosuresState_OptionalTonneauInMotion.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClosuresState',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..oo(0, [101])
    ..oo(1, [102])
    ..oo(2, [103])
    ..oo(3, [104])
    ..oo(4, [105])
    ..oo(5, [106])
    ..oo(6, [107])
    ..oo(7, [108])
    ..oo(8, [109])
    ..oo(9, [110])
    ..oo(10, [112])
    ..oo(11, [113])
    ..oo(12, [114])
    ..oo(13, [116])
    ..oo(14, [117])
    ..oo(15, [118])
    ..oo(16, [120])
    ..oo(17, [23])
    ..oo(18, [24])
    ..oo(19, [25])
    ..aOM<ClosuresState_SunRoofState>(11, _omitFieldNames ? '' : 'sunRoofState',
        subBuilder: ClosuresState_SunRoofState.create)
    ..aOM<ClosuresState_DisplayState>(
        15, _omitFieldNames ? '' : 'centerDisplayState',
        subBuilder: ClosuresState_DisplayState.create)
    ..aOM<ClosuresState_SentryModeState>(
        19, _omitFieldNames ? '' : 'sentryModeState',
        subBuilder: ClosuresState_SentryModeState.create)
    ..aOM<SpeedLimitMode>(22, _omitFieldNames ? '' : 'speedLimitMode',
        subBuilder: SpeedLimitMode.create)
    ..aE<$2.ClosureState_E>(23, _omitFieldNames ? '' : 'tonneauState',
        enumValues: $2.ClosureState_E.values)
    ..aI(24, _omitFieldNames ? '' : 'tonneauPercentOpen',
        fieldType: $pb.PbFieldType.OU3)
    ..aOB(25, _omitFieldNames ? '' : 'tonneauInMotion')
    ..aOB(101, _omitFieldNames ? '' : 'doorOpenDriverFront')
    ..aOB(102, _omitFieldNames ? '' : 'doorOpenDriverRear')
    ..aOB(103, _omitFieldNames ? '' : 'doorOpenPassengerFront')
    ..aOB(104, _omitFieldNames ? '' : 'doorOpenPassengerRear')
    ..aOB(105, _omitFieldNames ? '' : 'doorOpenTrunkFront')
    ..aOB(106, _omitFieldNames ? '' : 'doorOpenTrunkRear')
    ..aOB(107, _omitFieldNames ? '' : 'windowOpenDriverFront')
    ..aOB(108, _omitFieldNames ? '' : 'windowOpenPassengerFront')
    ..aOB(109, _omitFieldNames ? '' : 'windowOpenDriverRear')
    ..aOB(110, _omitFieldNames ? '' : 'windowOpenPassengerRear')
    ..aI(112, _omitFieldNames ? '' : 'sunRoofPercentOpen')
    ..aOB(113, _omitFieldNames ? '' : 'locked')
    ..aOB(114, _omitFieldNames ? '' : 'isUserPresent')
    ..aOB(116, _omitFieldNames ? '' : 'remoteStart')
    ..aOB(117, _omitFieldNames ? '' : 'valetMode')
    ..aOB(118, _omitFieldNames ? '' : 'valetPinNeeded')
    ..aOB(120, _omitFieldNames ? '' : 'sentryModeAvailable')
    ..aOM<$0.Timestamp>(2000, _omitFieldNames ? '' : 'timestamp',
        subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClosuresState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClosuresState copyWith(void Function(ClosuresState) updates) =>
      super.copyWith((message) => updates(message as ClosuresState))
          as ClosuresState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClosuresState create() => ClosuresState._();
  @$core.override
  ClosuresState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ClosuresState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClosuresState>(create);
  static ClosuresState? _defaultInstance;

  @$pb.TagNumber(101)
  ClosuresState_OptionalDoorOpenDriverFront
      whichOptionalDoorOpenDriverFront() =>
          _ClosuresState_OptionalDoorOpenDriverFrontByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(101)
  void clearOptionalDoorOpenDriverFront() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(102)
  ClosuresState_OptionalDoorOpenDriverRear whichOptionalDoorOpenDriverRear() =>
      _ClosuresState_OptionalDoorOpenDriverRearByTag[$_whichOneof(1)]!;
  @$pb.TagNumber(102)
  void clearOptionalDoorOpenDriverRear() => $_clearField($_whichOneof(1));

  @$pb.TagNumber(103)
  ClosuresState_OptionalDoorOpenPassengerFront
      whichOptionalDoorOpenPassengerFront() =>
          _ClosuresState_OptionalDoorOpenPassengerFrontByTag[$_whichOneof(2)]!;
  @$pb.TagNumber(103)
  void clearOptionalDoorOpenPassengerFront() => $_clearField($_whichOneof(2));

  @$pb.TagNumber(104)
  ClosuresState_OptionalDoorOpenPassengerRear
      whichOptionalDoorOpenPassengerRear() =>
          _ClosuresState_OptionalDoorOpenPassengerRearByTag[$_whichOneof(3)]!;
  @$pb.TagNumber(104)
  void clearOptionalDoorOpenPassengerRear() => $_clearField($_whichOneof(3));

  @$pb.TagNumber(105)
  ClosuresState_OptionalDoorOpenTrunkFront whichOptionalDoorOpenTrunkFront() =>
      _ClosuresState_OptionalDoorOpenTrunkFrontByTag[$_whichOneof(4)]!;
  @$pb.TagNumber(105)
  void clearOptionalDoorOpenTrunkFront() => $_clearField($_whichOneof(4));

  @$pb.TagNumber(106)
  ClosuresState_OptionalDoorOpenTrunkRear whichOptionalDoorOpenTrunkRear() =>
      _ClosuresState_OptionalDoorOpenTrunkRearByTag[$_whichOneof(5)]!;
  @$pb.TagNumber(106)
  void clearOptionalDoorOpenTrunkRear() => $_clearField($_whichOneof(5));

  @$pb.TagNumber(107)
  ClosuresState_OptionalWindowOpenDriverFront
      whichOptionalWindowOpenDriverFront() =>
          _ClosuresState_OptionalWindowOpenDriverFrontByTag[$_whichOneof(6)]!;
  @$pb.TagNumber(107)
  void clearOptionalWindowOpenDriverFront() => $_clearField($_whichOneof(6));

  @$pb.TagNumber(108)
  ClosuresState_OptionalWindowOpenPassengerFront
      whichOptionalWindowOpenPassengerFront() =>
          _ClosuresState_OptionalWindowOpenPassengerFrontByTag[
              $_whichOneof(7)]!;
  @$pb.TagNumber(108)
  void clearOptionalWindowOpenPassengerFront() => $_clearField($_whichOneof(7));

  @$pb.TagNumber(109)
  ClosuresState_OptionalWindowOpenDriverRear
      whichOptionalWindowOpenDriverRear() =>
          _ClosuresState_OptionalWindowOpenDriverRearByTag[$_whichOneof(8)]!;
  @$pb.TagNumber(109)
  void clearOptionalWindowOpenDriverRear() => $_clearField($_whichOneof(8));

  @$pb.TagNumber(110)
  ClosuresState_OptionalWindowOpenPassengerRear
      whichOptionalWindowOpenPassengerRear() =>
          _ClosuresState_OptionalWindowOpenPassengerRearByTag[$_whichOneof(9)]!;
  @$pb.TagNumber(110)
  void clearOptionalWindowOpenPassengerRear() => $_clearField($_whichOneof(9));

  @$pb.TagNumber(112)
  ClosuresState_OptionalSunRoofPercentOpen whichOptionalSunRoofPercentOpen() =>
      _ClosuresState_OptionalSunRoofPercentOpenByTag[$_whichOneof(10)]!;
  @$pb.TagNumber(112)
  void clearOptionalSunRoofPercentOpen() => $_clearField($_whichOneof(10));

  @$pb.TagNumber(113)
  ClosuresState_OptionalLocked whichOptionalLocked() =>
      _ClosuresState_OptionalLockedByTag[$_whichOneof(11)]!;
  @$pb.TagNumber(113)
  void clearOptionalLocked() => $_clearField($_whichOneof(11));

  @$pb.TagNumber(114)
  ClosuresState_OptionalIsUserPresent whichOptionalIsUserPresent() =>
      _ClosuresState_OptionalIsUserPresentByTag[$_whichOneof(12)]!;
  @$pb.TagNumber(114)
  void clearOptionalIsUserPresent() => $_clearField($_whichOneof(12));

  @$pb.TagNumber(116)
  ClosuresState_OptionalRemoteStart whichOptionalRemoteStart() =>
      _ClosuresState_OptionalRemoteStartByTag[$_whichOneof(13)]!;
  @$pb.TagNumber(116)
  void clearOptionalRemoteStart() => $_clearField($_whichOneof(13));

  @$pb.TagNumber(117)
  ClosuresState_OptionalValetMode whichOptionalValetMode() =>
      _ClosuresState_OptionalValetModeByTag[$_whichOneof(14)]!;
  @$pb.TagNumber(117)
  void clearOptionalValetMode() => $_clearField($_whichOneof(14));

  @$pb.TagNumber(118)
  ClosuresState_OptionalValetPinNeeded whichOptionalValetPinNeeded() =>
      _ClosuresState_OptionalValetPinNeededByTag[$_whichOneof(15)]!;
  @$pb.TagNumber(118)
  void clearOptionalValetPinNeeded() => $_clearField($_whichOneof(15));

  @$pb.TagNumber(120)
  ClosuresState_OptionalSentryModeAvailable
      whichOptionalSentryModeAvailable() =>
          _ClosuresState_OptionalSentryModeAvailableByTag[$_whichOneof(16)]!;
  @$pb.TagNumber(120)
  void clearOptionalSentryModeAvailable() => $_clearField($_whichOneof(16));

  @$pb.TagNumber(23)
  ClosuresState_OptionalTonneauState whichOptionalTonneauState() =>
      _ClosuresState_OptionalTonneauStateByTag[$_whichOneof(17)]!;
  @$pb.TagNumber(23)
  void clearOptionalTonneauState() => $_clearField($_whichOneof(17));

  @$pb.TagNumber(24)
  ClosuresState_OptionalTonneauPercentOpen whichOptionalTonneauPercentOpen() =>
      _ClosuresState_OptionalTonneauPercentOpenByTag[$_whichOneof(18)]!;
  @$pb.TagNumber(24)
  void clearOptionalTonneauPercentOpen() => $_clearField($_whichOneof(18));

  @$pb.TagNumber(25)
  ClosuresState_OptionalTonneauInMotion whichOptionalTonneauInMotion() =>
      _ClosuresState_OptionalTonneauInMotionByTag[$_whichOneof(19)]!;
  @$pb.TagNumber(25)
  void clearOptionalTonneauInMotion() => $_clearField($_whichOneof(19));

  @$pb.TagNumber(11)
  ClosuresState_SunRoofState get sunRoofState => $_getN(0);
  @$pb.TagNumber(11)
  set sunRoofState(ClosuresState_SunRoofState value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasSunRoofState() => $_has(0);
  @$pb.TagNumber(11)
  void clearSunRoofState() => $_clearField(11);
  @$pb.TagNumber(11)
  ClosuresState_SunRoofState ensureSunRoofState() => $_ensure(0);

  @$pb.TagNumber(15)
  ClosuresState_DisplayState get centerDisplayState => $_getN(1);
  @$pb.TagNumber(15)
  set centerDisplayState(ClosuresState_DisplayState value) =>
      $_setField(15, value);
  @$pb.TagNumber(15)
  $core.bool hasCenterDisplayState() => $_has(1);
  @$pb.TagNumber(15)
  void clearCenterDisplayState() => $_clearField(15);
  @$pb.TagNumber(15)
  ClosuresState_DisplayState ensureCenterDisplayState() => $_ensure(1);

  @$pb.TagNumber(19)
  ClosuresState_SentryModeState get sentryModeState => $_getN(2);
  @$pb.TagNumber(19)
  set sentryModeState(ClosuresState_SentryModeState value) =>
      $_setField(19, value);
  @$pb.TagNumber(19)
  $core.bool hasSentryModeState() => $_has(2);
  @$pb.TagNumber(19)
  void clearSentryModeState() => $_clearField(19);
  @$pb.TagNumber(19)
  ClosuresState_SentryModeState ensureSentryModeState() => $_ensure(2);

  @$pb.TagNumber(22)
  SpeedLimitMode get speedLimitMode => $_getN(3);
  @$pb.TagNumber(22)
  set speedLimitMode(SpeedLimitMode value) => $_setField(22, value);
  @$pb.TagNumber(22)
  $core.bool hasSpeedLimitMode() => $_has(3);
  @$pb.TagNumber(22)
  void clearSpeedLimitMode() => $_clearField(22);
  @$pb.TagNumber(22)
  SpeedLimitMode ensureSpeedLimitMode() => $_ensure(3);

  @$pb.TagNumber(23)
  $2.ClosureState_E get tonneauState => $_getN(4);
  @$pb.TagNumber(23)
  set tonneauState($2.ClosureState_E value) => $_setField(23, value);
  @$pb.TagNumber(23)
  $core.bool hasTonneauState() => $_has(4);
  @$pb.TagNumber(23)
  void clearTonneauState() => $_clearField(23);

  @$pb.TagNumber(24)
  $core.int get tonneauPercentOpen => $_getIZ(5);
  @$pb.TagNumber(24)
  set tonneauPercentOpen($core.int value) => $_setUnsignedInt32(5, value);
  @$pb.TagNumber(24)
  $core.bool hasTonneauPercentOpen() => $_has(5);
  @$pb.TagNumber(24)
  void clearTonneauPercentOpen() => $_clearField(24);

  @$pb.TagNumber(25)
  $core.bool get tonneauInMotion => $_getBF(6);
  @$pb.TagNumber(25)
  set tonneauInMotion($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(25)
  $core.bool hasTonneauInMotion() => $_has(6);
  @$pb.TagNumber(25)
  void clearTonneauInMotion() => $_clearField(25);

  @$pb.TagNumber(101)
  $core.bool get doorOpenDriverFront => $_getBF(7);
  @$pb.TagNumber(101)
  set doorOpenDriverFront($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(101)
  $core.bool hasDoorOpenDriverFront() => $_has(7);
  @$pb.TagNumber(101)
  void clearDoorOpenDriverFront() => $_clearField(101);

  @$pb.TagNumber(102)
  $core.bool get doorOpenDriverRear => $_getBF(8);
  @$pb.TagNumber(102)
  set doorOpenDriverRear($core.bool value) => $_setBool(8, value);
  @$pb.TagNumber(102)
  $core.bool hasDoorOpenDriverRear() => $_has(8);
  @$pb.TagNumber(102)
  void clearDoorOpenDriverRear() => $_clearField(102);

  @$pb.TagNumber(103)
  $core.bool get doorOpenPassengerFront => $_getBF(9);
  @$pb.TagNumber(103)
  set doorOpenPassengerFront($core.bool value) => $_setBool(9, value);
  @$pb.TagNumber(103)
  $core.bool hasDoorOpenPassengerFront() => $_has(9);
  @$pb.TagNumber(103)
  void clearDoorOpenPassengerFront() => $_clearField(103);

  @$pb.TagNumber(104)
  $core.bool get doorOpenPassengerRear => $_getBF(10);
  @$pb.TagNumber(104)
  set doorOpenPassengerRear($core.bool value) => $_setBool(10, value);
  @$pb.TagNumber(104)
  $core.bool hasDoorOpenPassengerRear() => $_has(10);
  @$pb.TagNumber(104)
  void clearDoorOpenPassengerRear() => $_clearField(104);

  @$pb.TagNumber(105)
  $core.bool get doorOpenTrunkFront => $_getBF(11);
  @$pb.TagNumber(105)
  set doorOpenTrunkFront($core.bool value) => $_setBool(11, value);
  @$pb.TagNumber(105)
  $core.bool hasDoorOpenTrunkFront() => $_has(11);
  @$pb.TagNumber(105)
  void clearDoorOpenTrunkFront() => $_clearField(105);

  @$pb.TagNumber(106)
  $core.bool get doorOpenTrunkRear => $_getBF(12);
  @$pb.TagNumber(106)
  set doorOpenTrunkRear($core.bool value) => $_setBool(12, value);
  @$pb.TagNumber(106)
  $core.bool hasDoorOpenTrunkRear() => $_has(12);
  @$pb.TagNumber(106)
  void clearDoorOpenTrunkRear() => $_clearField(106);

  @$pb.TagNumber(107)
  $core.bool get windowOpenDriverFront => $_getBF(13);
  @$pb.TagNumber(107)
  set windowOpenDriverFront($core.bool value) => $_setBool(13, value);
  @$pb.TagNumber(107)
  $core.bool hasWindowOpenDriverFront() => $_has(13);
  @$pb.TagNumber(107)
  void clearWindowOpenDriverFront() => $_clearField(107);

  @$pb.TagNumber(108)
  $core.bool get windowOpenPassengerFront => $_getBF(14);
  @$pb.TagNumber(108)
  set windowOpenPassengerFront($core.bool value) => $_setBool(14, value);
  @$pb.TagNumber(108)
  $core.bool hasWindowOpenPassengerFront() => $_has(14);
  @$pb.TagNumber(108)
  void clearWindowOpenPassengerFront() => $_clearField(108);

  @$pb.TagNumber(109)
  $core.bool get windowOpenDriverRear => $_getBF(15);
  @$pb.TagNumber(109)
  set windowOpenDriverRear($core.bool value) => $_setBool(15, value);
  @$pb.TagNumber(109)
  $core.bool hasWindowOpenDriverRear() => $_has(15);
  @$pb.TagNumber(109)
  void clearWindowOpenDriverRear() => $_clearField(109);

  @$pb.TagNumber(110)
  $core.bool get windowOpenPassengerRear => $_getBF(16);
  @$pb.TagNumber(110)
  set windowOpenPassengerRear($core.bool value) => $_setBool(16, value);
  @$pb.TagNumber(110)
  $core.bool hasWindowOpenPassengerRear() => $_has(16);
  @$pb.TagNumber(110)
  void clearWindowOpenPassengerRear() => $_clearField(110);

  @$pb.TagNumber(112)
  $core.int get sunRoofPercentOpen => $_getIZ(17);
  @$pb.TagNumber(112)
  set sunRoofPercentOpen($core.int value) => $_setSignedInt32(17, value);
  @$pb.TagNumber(112)
  $core.bool hasSunRoofPercentOpen() => $_has(17);
  @$pb.TagNumber(112)
  void clearSunRoofPercentOpen() => $_clearField(112);

  @$pb.TagNumber(113)
  $core.bool get locked => $_getBF(18);
  @$pb.TagNumber(113)
  set locked($core.bool value) => $_setBool(18, value);
  @$pb.TagNumber(113)
  $core.bool hasLocked() => $_has(18);
  @$pb.TagNumber(113)
  void clearLocked() => $_clearField(113);

  @$pb.TagNumber(114)
  $core.bool get isUserPresent => $_getBF(19);
  @$pb.TagNumber(114)
  set isUserPresent($core.bool value) => $_setBool(19, value);
  @$pb.TagNumber(114)
  $core.bool hasIsUserPresent() => $_has(19);
  @$pb.TagNumber(114)
  void clearIsUserPresent() => $_clearField(114);

  @$pb.TagNumber(116)
  $core.bool get remoteStart => $_getBF(20);
  @$pb.TagNumber(116)
  set remoteStart($core.bool value) => $_setBool(20, value);
  @$pb.TagNumber(116)
  $core.bool hasRemoteStart() => $_has(20);
  @$pb.TagNumber(116)
  void clearRemoteStart() => $_clearField(116);

  @$pb.TagNumber(117)
  $core.bool get valetMode => $_getBF(21);
  @$pb.TagNumber(117)
  set valetMode($core.bool value) => $_setBool(21, value);
  @$pb.TagNumber(117)
  $core.bool hasValetMode() => $_has(21);
  @$pb.TagNumber(117)
  void clearValetMode() => $_clearField(117);

  @$pb.TagNumber(118)
  $core.bool get valetPinNeeded => $_getBF(22);
  @$pb.TagNumber(118)
  set valetPinNeeded($core.bool value) => $_setBool(22, value);
  @$pb.TagNumber(118)
  $core.bool hasValetPinNeeded() => $_has(22);
  @$pb.TagNumber(118)
  void clearValetPinNeeded() => $_clearField(118);

  @$pb.TagNumber(120)
  $core.bool get sentryModeAvailable => $_getBF(23);
  @$pb.TagNumber(120)
  set sentryModeAvailable($core.bool value) => $_setBool(23, value);
  @$pb.TagNumber(120)
  $core.bool hasSentryModeAvailable() => $_has(23);
  @$pb.TagNumber(120)
  void clearSentryModeAvailable() => $_clearField(120);

  @$pb.TagNumber(2000)
  $0.Timestamp get timestamp => $_getN(24);
  @$pb.TagNumber(2000)
  set timestamp($0.Timestamp value) => $_setField(2000, value);
  @$pb.TagNumber(2000)
  $core.bool hasTimestamp() => $_has(24);
  @$pb.TagNumber(2000)
  void clearTimestamp() => $_clearField(2000);
  @$pb.TagNumber(2000)
  $0.Timestamp ensureTimestamp() => $_ensure(24);
}

enum ChargeScheduleState_OptionalChargeScheduleWindow {
  chargeScheduleWindow,
  notSet
}

enum ChargeScheduleState_OptionalChargeBuffer { chargeBuffer, notSet }

enum ChargeScheduleState_OptionalMaxNumChargeSchedules {
  maxNumChargeSchedules,
  notSet
}

enum ChargeScheduleState_OptionalNextSchedule { nextSchedule, notSet }

enum ChargeScheduleState_OptionalShowScheduleCompleteState {
  showScheduleCompleteState,
  notSet
}

class ChargeScheduleState extends $pb.GeneratedMessage {
  factory ChargeScheduleState({
    $core.Iterable<$1.ChargeSchedule>? chargeSchedules,
    $1.ChargeSchedule? chargeScheduleWindow,
    $core.int? chargeBuffer,
    $core.int? maxNumChargeSchedules,
    $core.bool? nextSchedule,
    $core.bool? showScheduleCompleteState,
    $0.Timestamp? timestamp,
  }) {
    final result = create();
    if (chargeSchedules != null) result.chargeSchedules.addAll(chargeSchedules);
    if (chargeScheduleWindow != null)
      result.chargeScheduleWindow = chargeScheduleWindow;
    if (chargeBuffer != null) result.chargeBuffer = chargeBuffer;
    if (maxNumChargeSchedules != null)
      result.maxNumChargeSchedules = maxNumChargeSchedules;
    if (nextSchedule != null) result.nextSchedule = nextSchedule;
    if (showScheduleCompleteState != null)
      result.showScheduleCompleteState = showScheduleCompleteState;
    if (timestamp != null) result.timestamp = timestamp;
    return result;
  }

  ChargeScheduleState._();

  factory ChargeScheduleState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChargeScheduleState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core
      .Map<$core.int, ChargeScheduleState_OptionalChargeScheduleWindow>
      _ChargeScheduleState_OptionalChargeScheduleWindowByTag = {
    2: ChargeScheduleState_OptionalChargeScheduleWindow.chargeScheduleWindow,
    0: ChargeScheduleState_OptionalChargeScheduleWindow.notSet
  };
  static const $core.Map<$core.int, ChargeScheduleState_OptionalChargeBuffer>
      _ChargeScheduleState_OptionalChargeBufferByTag = {
    3: ChargeScheduleState_OptionalChargeBuffer.chargeBuffer,
    0: ChargeScheduleState_OptionalChargeBuffer.notSet
  };
  static const $core
      .Map<$core.int, ChargeScheduleState_OptionalMaxNumChargeSchedules>
      _ChargeScheduleState_OptionalMaxNumChargeSchedulesByTag = {
    4: ChargeScheduleState_OptionalMaxNumChargeSchedules.maxNumChargeSchedules,
    0: ChargeScheduleState_OptionalMaxNumChargeSchedules.notSet
  };
  static const $core.Map<$core.int, ChargeScheduleState_OptionalNextSchedule>
      _ChargeScheduleState_OptionalNextScheduleByTag = {
    5: ChargeScheduleState_OptionalNextSchedule.nextSchedule,
    0: ChargeScheduleState_OptionalNextSchedule.notSet
  };
  static const $core
      .Map<$core.int, ChargeScheduleState_OptionalShowScheduleCompleteState>
      _ChargeScheduleState_OptionalShowScheduleCompleteStateByTag = {
    6: ChargeScheduleState_OptionalShowScheduleCompleteState
        .showScheduleCompleteState,
    0: ChargeScheduleState_OptionalShowScheduleCompleteState.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChargeScheduleState',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..oo(0, [2])
    ..oo(1, [3])
    ..oo(2, [4])
    ..oo(3, [5])
    ..oo(4, [6])
    ..pPM<$1.ChargeSchedule>(1, _omitFieldNames ? '' : 'chargeSchedules',
        subBuilder: $1.ChargeSchedule.create)
    ..aOM<$1.ChargeSchedule>(2, _omitFieldNames ? '' : 'chargeScheduleWindow',
        subBuilder: $1.ChargeSchedule.create)
    ..aI(3, _omitFieldNames ? '' : 'chargeBuffer')
    ..aI(4, _omitFieldNames ? '' : 'maxNumChargeSchedules',
        fieldType: $pb.PbFieldType.OU3)
    ..aOB(5, _omitFieldNames ? '' : 'nextSchedule')
    ..aOB(6, _omitFieldNames ? '' : 'showScheduleCompleteState')
    ..aOM<$0.Timestamp>(2000, _omitFieldNames ? '' : 'timestamp',
        subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChargeScheduleState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChargeScheduleState copyWith(void Function(ChargeScheduleState) updates) =>
      super.copyWith((message) => updates(message as ChargeScheduleState))
          as ChargeScheduleState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChargeScheduleState create() => ChargeScheduleState._();
  @$core.override
  ChargeScheduleState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChargeScheduleState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChargeScheduleState>(create);
  static ChargeScheduleState? _defaultInstance;

  @$pb.TagNumber(2)
  ChargeScheduleState_OptionalChargeScheduleWindow
      whichOptionalChargeScheduleWindow() =>
          _ChargeScheduleState_OptionalChargeScheduleWindowByTag[
              $_whichOneof(0)]!;
  @$pb.TagNumber(2)
  void clearOptionalChargeScheduleWindow() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(3)
  ChargeScheduleState_OptionalChargeBuffer whichOptionalChargeBuffer() =>
      _ChargeScheduleState_OptionalChargeBufferByTag[$_whichOneof(1)]!;
  @$pb.TagNumber(3)
  void clearOptionalChargeBuffer() => $_clearField($_whichOneof(1));

  @$pb.TagNumber(4)
  ChargeScheduleState_OptionalMaxNumChargeSchedules
      whichOptionalMaxNumChargeSchedules() =>
          _ChargeScheduleState_OptionalMaxNumChargeSchedulesByTag[
              $_whichOneof(2)]!;
  @$pb.TagNumber(4)
  void clearOptionalMaxNumChargeSchedules() => $_clearField($_whichOneof(2));

  @$pb.TagNumber(5)
  ChargeScheduleState_OptionalNextSchedule whichOptionalNextSchedule() =>
      _ChargeScheduleState_OptionalNextScheduleByTag[$_whichOneof(3)]!;
  @$pb.TagNumber(5)
  void clearOptionalNextSchedule() => $_clearField($_whichOneof(3));

  @$pb.TagNumber(6)
  ChargeScheduleState_OptionalShowScheduleCompleteState
      whichOptionalShowScheduleCompleteState() =>
          _ChargeScheduleState_OptionalShowScheduleCompleteStateByTag[
              $_whichOneof(4)]!;
  @$pb.TagNumber(6)
  void clearOptionalShowScheduleCompleteState() =>
      $_clearField($_whichOneof(4));

  @$pb.TagNumber(1)
  $pb.PbList<$1.ChargeSchedule> get chargeSchedules => $_getList(0);

  @$pb.TagNumber(2)
  $1.ChargeSchedule get chargeScheduleWindow => $_getN(1);
  @$pb.TagNumber(2)
  set chargeScheduleWindow($1.ChargeSchedule value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasChargeScheduleWindow() => $_has(1);
  @$pb.TagNumber(2)
  void clearChargeScheduleWindow() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.ChargeSchedule ensureChargeScheduleWindow() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get chargeBuffer => $_getIZ(2);
  @$pb.TagNumber(3)
  set chargeBuffer($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasChargeBuffer() => $_has(2);
  @$pb.TagNumber(3)
  void clearChargeBuffer() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get maxNumChargeSchedules => $_getIZ(3);
  @$pb.TagNumber(4)
  set maxNumChargeSchedules($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMaxNumChargeSchedules() => $_has(3);
  @$pb.TagNumber(4)
  void clearMaxNumChargeSchedules() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get nextSchedule => $_getBF(4);
  @$pb.TagNumber(5)
  set nextSchedule($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasNextSchedule() => $_has(4);
  @$pb.TagNumber(5)
  void clearNextSchedule() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get showScheduleCompleteState => $_getBF(5);
  @$pb.TagNumber(6)
  set showScheduleCompleteState($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasShowScheduleCompleteState() => $_has(5);
  @$pb.TagNumber(6)
  void clearShowScheduleCompleteState() => $_clearField(6);

  @$pb.TagNumber(2000)
  $0.Timestamp get timestamp => $_getN(6);
  @$pb.TagNumber(2000)
  set timestamp($0.Timestamp value) => $_setField(2000, value);
  @$pb.TagNumber(2000)
  $core.bool hasTimestamp() => $_has(6);
  @$pb.TagNumber(2000)
  void clearTimestamp() => $_clearField(2000);
  @$pb.TagNumber(2000)
  $0.Timestamp ensureTimestamp() => $_ensure(6);
}

enum PreconditioningScheduleState_OptionalPreconditioningScheduleWindow {
  preconditioningScheduleWindow,
  notSet
}

enum PreconditioningScheduleState_OptionalMaxNumPreconditionSchedules {
  maxNumPreconditionSchedules,
  notSet
}

enum PreconditioningScheduleState_OptionalNextSchedule { nextSchedule, notSet }

class PreconditioningScheduleState extends $pb.GeneratedMessage {
  factory PreconditioningScheduleState({
    $core.Iterable<$1.PreconditionSchedule>? preconditionSchedules,
    $1.PreconditionSchedule? preconditioningScheduleWindow,
    $core.int? maxNumPreconditionSchedules,
    $core.bool? nextSchedule,
    $0.Timestamp? timestamp,
  }) {
    final result = create();
    if (preconditionSchedules != null)
      result.preconditionSchedules.addAll(preconditionSchedules);
    if (preconditioningScheduleWindow != null)
      result.preconditioningScheduleWindow = preconditioningScheduleWindow;
    if (maxNumPreconditionSchedules != null)
      result.maxNumPreconditionSchedules = maxNumPreconditionSchedules;
    if (nextSchedule != null) result.nextSchedule = nextSchedule;
    if (timestamp != null) result.timestamp = timestamp;
    return result;
  }

  PreconditioningScheduleState._();

  factory PreconditioningScheduleState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PreconditioningScheduleState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int,
          PreconditioningScheduleState_OptionalPreconditioningScheduleWindow>
      _PreconditioningScheduleState_OptionalPreconditioningScheduleWindowByTag =
      {
    2: PreconditioningScheduleState_OptionalPreconditioningScheduleWindow
        .preconditioningScheduleWindow,
    0: PreconditioningScheduleState_OptionalPreconditioningScheduleWindow.notSet
  };
  static const $core.Map<$core.int,
          PreconditioningScheduleState_OptionalMaxNumPreconditionSchedules>
      _PreconditioningScheduleState_OptionalMaxNumPreconditionSchedulesByTag = {
    3: PreconditioningScheduleState_OptionalMaxNumPreconditionSchedules
        .maxNumPreconditionSchedules,
    0: PreconditioningScheduleState_OptionalMaxNumPreconditionSchedules.notSet
  };
  static const $core
      .Map<$core.int, PreconditioningScheduleState_OptionalNextSchedule>
      _PreconditioningScheduleState_OptionalNextScheduleByTag = {
    4: PreconditioningScheduleState_OptionalNextSchedule.nextSchedule,
    0: PreconditioningScheduleState_OptionalNextSchedule.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PreconditioningScheduleState',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..oo(0, [2])
    ..oo(1, [3])
    ..oo(2, [4])
    ..pPM<$1.PreconditionSchedule>(
        1, _omitFieldNames ? '' : 'preconditionSchedules',
        subBuilder: $1.PreconditionSchedule.create)
    ..aOM<$1.PreconditionSchedule>(
        2, _omitFieldNames ? '' : 'preconditioningScheduleWindow',
        subBuilder: $1.PreconditionSchedule.create)
    ..aI(3, _omitFieldNames ? '' : 'maxNumPreconditionSchedules',
        fieldType: $pb.PbFieldType.OU3)
    ..aOB(4, _omitFieldNames ? '' : 'nextSchedule')
    ..aOM<$0.Timestamp>(2000, _omitFieldNames ? '' : 'timestamp',
        subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PreconditioningScheduleState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PreconditioningScheduleState copyWith(
          void Function(PreconditioningScheduleState) updates) =>
      super.copyWith(
              (message) => updates(message as PreconditioningScheduleState))
          as PreconditioningScheduleState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PreconditioningScheduleState create() =>
      PreconditioningScheduleState._();
  @$core.override
  PreconditioningScheduleState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PreconditioningScheduleState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PreconditioningScheduleState>(create);
  static PreconditioningScheduleState? _defaultInstance;

  @$pb.TagNumber(2)
  PreconditioningScheduleState_OptionalPreconditioningScheduleWindow
      whichOptionalPreconditioningScheduleWindow() =>
          _PreconditioningScheduleState_OptionalPreconditioningScheduleWindowByTag[
              $_whichOneof(0)]!;
  @$pb.TagNumber(2)
  void clearOptionalPreconditioningScheduleWindow() =>
      $_clearField($_whichOneof(0));

  @$pb.TagNumber(3)
  PreconditioningScheduleState_OptionalMaxNumPreconditionSchedules
      whichOptionalMaxNumPreconditionSchedules() =>
          _PreconditioningScheduleState_OptionalMaxNumPreconditionSchedulesByTag[
              $_whichOneof(1)]!;
  @$pb.TagNumber(3)
  void clearOptionalMaxNumPreconditionSchedules() =>
      $_clearField($_whichOneof(1));

  @$pb.TagNumber(4)
  PreconditioningScheduleState_OptionalNextSchedule
      whichOptionalNextSchedule() =>
          _PreconditioningScheduleState_OptionalNextScheduleByTag[
              $_whichOneof(2)]!;
  @$pb.TagNumber(4)
  void clearOptionalNextSchedule() => $_clearField($_whichOneof(2));

  @$pb.TagNumber(1)
  $pb.PbList<$1.PreconditionSchedule> get preconditionSchedules => $_getList(0);

  @$pb.TagNumber(2)
  $1.PreconditionSchedule get preconditioningScheduleWindow => $_getN(1);
  @$pb.TagNumber(2)
  set preconditioningScheduleWindow($1.PreconditionSchedule value) =>
      $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPreconditioningScheduleWindow() => $_has(1);
  @$pb.TagNumber(2)
  void clearPreconditioningScheduleWindow() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.PreconditionSchedule ensurePreconditioningScheduleWindow() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get maxNumPreconditionSchedules => $_getIZ(2);
  @$pb.TagNumber(3)
  set maxNumPreconditionSchedules($core.int value) =>
      $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMaxNumPreconditionSchedules() => $_has(2);
  @$pb.TagNumber(3)
  void clearMaxNumPreconditionSchedules() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get nextSchedule => $_getBF(3);
  @$pb.TagNumber(4)
  set nextSchedule($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasNextSchedule() => $_has(3);
  @$pb.TagNumber(4)
  void clearNextSchedule() => $_clearField(4);

  @$pb.TagNumber(2000)
  $0.Timestamp get timestamp => $_getN(4);
  @$pb.TagNumber(2000)
  set timestamp($0.Timestamp value) => $_setField(2000, value);
  @$pb.TagNumber(2000)
  $core.bool hasTimestamp() => $_has(4);
  @$pb.TagNumber(2000)
  void clearTimestamp() => $_clearField(2000);
  @$pb.TagNumber(2000)
  $0.Timestamp ensureTimestamp() => $_ensure(4);
}

enum SpeedLimitMode_OptionalActive { active, notSet }

enum SpeedLimitMode_OptionalPinCodeSet { pinCodeSet, notSet }

enum SpeedLimitMode_OptionalMaxLimitMph { maxLimitMph, notSet }

enum SpeedLimitMode_OptionalMinLimitMph { minLimitMph, notSet }

enum SpeedLimitMode_OptionalCurrentLimitMph { currentLimitMph, notSet }

class SpeedLimitMode extends $pb.GeneratedMessage {
  factory SpeedLimitMode({
    $core.bool? active,
    $core.bool? pinCodeSet,
    $core.double? maxLimitMph,
    $core.double? minLimitMph,
    $core.double? currentLimitMph,
  }) {
    final result = create();
    if (active != null) result.active = active;
    if (pinCodeSet != null) result.pinCodeSet = pinCodeSet;
    if (maxLimitMph != null) result.maxLimitMph = maxLimitMph;
    if (minLimitMph != null) result.minLimitMph = minLimitMph;
    if (currentLimitMph != null) result.currentLimitMph = currentLimitMph;
    return result;
  }

  SpeedLimitMode._();

  factory SpeedLimitMode.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SpeedLimitMode.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, SpeedLimitMode_OptionalActive>
      _SpeedLimitMode_OptionalActiveByTag = {
    103: SpeedLimitMode_OptionalActive.active,
    0: SpeedLimitMode_OptionalActive.notSet
  };
  static const $core.Map<$core.int, SpeedLimitMode_OptionalPinCodeSet>
      _SpeedLimitMode_OptionalPinCodeSetByTag = {
    104: SpeedLimitMode_OptionalPinCodeSet.pinCodeSet,
    0: SpeedLimitMode_OptionalPinCodeSet.notSet
  };
  static const $core.Map<$core.int, SpeedLimitMode_OptionalMaxLimitMph>
      _SpeedLimitMode_OptionalMaxLimitMphByTag = {
    106: SpeedLimitMode_OptionalMaxLimitMph.maxLimitMph,
    0: SpeedLimitMode_OptionalMaxLimitMph.notSet
  };
  static const $core.Map<$core.int, SpeedLimitMode_OptionalMinLimitMph>
      _SpeedLimitMode_OptionalMinLimitMphByTag = {
    107: SpeedLimitMode_OptionalMinLimitMph.minLimitMph,
    0: SpeedLimitMode_OptionalMinLimitMph.notSet
  };
  static const $core.Map<$core.int, SpeedLimitMode_OptionalCurrentLimitMph>
      _SpeedLimitMode_OptionalCurrentLimitMphByTag = {
    108: SpeedLimitMode_OptionalCurrentLimitMph.currentLimitMph,
    0: SpeedLimitMode_OptionalCurrentLimitMph.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SpeedLimitMode',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..oo(0, [103])
    ..oo(1, [104])
    ..oo(2, [106])
    ..oo(3, [107])
    ..oo(4, [108])
    ..aOB(103, _omitFieldNames ? '' : 'active')
    ..aOB(104, _omitFieldNames ? '' : 'pinCodeSet')
    ..aD(106, _omitFieldNames ? '' : 'maxLimitMph',
        fieldType: $pb.PbFieldType.OF)
    ..aD(107, _omitFieldNames ? '' : 'minLimitMph',
        fieldType: $pb.PbFieldType.OF)
    ..aD(108, _omitFieldNames ? '' : 'currentLimitMph',
        fieldType: $pb.PbFieldType.OF)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SpeedLimitMode clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SpeedLimitMode copyWith(void Function(SpeedLimitMode) updates) =>
      super.copyWith((message) => updates(message as SpeedLimitMode))
          as SpeedLimitMode;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SpeedLimitMode create() => SpeedLimitMode._();
  @$core.override
  SpeedLimitMode createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SpeedLimitMode getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SpeedLimitMode>(create);
  static SpeedLimitMode? _defaultInstance;

  @$pb.TagNumber(103)
  SpeedLimitMode_OptionalActive whichOptionalActive() =>
      _SpeedLimitMode_OptionalActiveByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(103)
  void clearOptionalActive() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(104)
  SpeedLimitMode_OptionalPinCodeSet whichOptionalPinCodeSet() =>
      _SpeedLimitMode_OptionalPinCodeSetByTag[$_whichOneof(1)]!;
  @$pb.TagNumber(104)
  void clearOptionalPinCodeSet() => $_clearField($_whichOneof(1));

  @$pb.TagNumber(106)
  SpeedLimitMode_OptionalMaxLimitMph whichOptionalMaxLimitMph() =>
      _SpeedLimitMode_OptionalMaxLimitMphByTag[$_whichOneof(2)]!;
  @$pb.TagNumber(106)
  void clearOptionalMaxLimitMph() => $_clearField($_whichOneof(2));

  @$pb.TagNumber(107)
  SpeedLimitMode_OptionalMinLimitMph whichOptionalMinLimitMph() =>
      _SpeedLimitMode_OptionalMinLimitMphByTag[$_whichOneof(3)]!;
  @$pb.TagNumber(107)
  void clearOptionalMinLimitMph() => $_clearField($_whichOneof(3));

  @$pb.TagNumber(108)
  SpeedLimitMode_OptionalCurrentLimitMph whichOptionalCurrentLimitMph() =>
      _SpeedLimitMode_OptionalCurrentLimitMphByTag[$_whichOneof(4)]!;
  @$pb.TagNumber(108)
  void clearOptionalCurrentLimitMph() => $_clearField($_whichOneof(4));

  @$pb.TagNumber(103)
  $core.bool get active => $_getBF(0);
  @$pb.TagNumber(103)
  set active($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(103)
  $core.bool hasActive() => $_has(0);
  @$pb.TagNumber(103)
  void clearActive() => $_clearField(103);

  @$pb.TagNumber(104)
  $core.bool get pinCodeSet => $_getBF(1);
  @$pb.TagNumber(104)
  set pinCodeSet($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(104)
  $core.bool hasPinCodeSet() => $_has(1);
  @$pb.TagNumber(104)
  void clearPinCodeSet() => $_clearField(104);

  @$pb.TagNumber(106)
  $core.double get maxLimitMph => $_getN(2);
  @$pb.TagNumber(106)
  set maxLimitMph($core.double value) => $_setFloat(2, value);
  @$pb.TagNumber(106)
  $core.bool hasMaxLimitMph() => $_has(2);
  @$pb.TagNumber(106)
  void clearMaxLimitMph() => $_clearField(106);

  @$pb.TagNumber(107)
  $core.double get minLimitMph => $_getN(3);
  @$pb.TagNumber(107)
  set minLimitMph($core.double value) => $_setFloat(3, value);
  @$pb.TagNumber(107)
  $core.bool hasMinLimitMph() => $_has(3);
  @$pb.TagNumber(107)
  void clearMinLimitMph() => $_clearField(107);

  @$pb.TagNumber(108)
  $core.double get currentLimitMph => $_getN(4);
  @$pb.TagNumber(108)
  set currentLimitMph($core.double value) => $_setFloat(4, value);
  @$pb.TagNumber(108)
  $core.bool hasCurrentLimitMph() => $_has(4);
  @$pb.TagNumber(108)
  void clearCurrentLimitMph() => $_clearField(108);
}

enum ParentalControlsSettings_OptionalSpeedLimitEnabled {
  speedLimitEnabled,
  notSet
}

enum ParentalControlsSettings_OptionalMaxLimitMph { maxLimitMph, notSet }

enum ParentalControlsSettings_OptionalMinLimitMph { minLimitMph, notSet }

enum ParentalControlsSettings_OptionalCurrentLimitMph {
  currentLimitMph,
  notSet
}

enum ParentalControlsSettings_OptionalChillAccelerationEnabled {
  chillAccelerationEnabled,
  notSet
}

enum ParentalControlsSettings_OptionalRequireSafetySettingsEnabled {
  requireSafetySettingsEnabled,
  notSet
}

enum ParentalControlsSettings_OptionalCurfewEnabled { curfewEnabled, notSet }

enum ParentalControlsSettings_OptionalCurfewStartTime {
  curfewStartTime,
  notSet
}

enum ParentalControlsSettings_OptionalCurfewEndTime { curfewEndTime, notSet }

class ParentalControlsSettings extends $pb.GeneratedMessage {
  factory ParentalControlsSettings({
    $core.bool? speedLimitEnabled,
    $core.double? maxLimitMph,
    $core.double? minLimitMph,
    $core.double? currentLimitMph,
    $core.bool? chillAccelerationEnabled,
    $core.bool? requireSafetySettingsEnabled,
    $core.bool? curfewEnabled,
    $core.int? curfewStartTime,
    $core.int? curfewEndTime,
  }) {
    final result = create();
    if (speedLimitEnabled != null) result.speedLimitEnabled = speedLimitEnabled;
    if (maxLimitMph != null) result.maxLimitMph = maxLimitMph;
    if (minLimitMph != null) result.minLimitMph = minLimitMph;
    if (currentLimitMph != null) result.currentLimitMph = currentLimitMph;
    if (chillAccelerationEnabled != null)
      result.chillAccelerationEnabled = chillAccelerationEnabled;
    if (requireSafetySettingsEnabled != null)
      result.requireSafetySettingsEnabled = requireSafetySettingsEnabled;
    if (curfewEnabled != null) result.curfewEnabled = curfewEnabled;
    if (curfewStartTime != null) result.curfewStartTime = curfewStartTime;
    if (curfewEndTime != null) result.curfewEndTime = curfewEndTime;
    return result;
  }

  ParentalControlsSettings._();

  factory ParentalControlsSettings.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ParentalControlsSettings.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core
      .Map<$core.int, ParentalControlsSettings_OptionalSpeedLimitEnabled>
      _ParentalControlsSettings_OptionalSpeedLimitEnabledByTag = {
    1: ParentalControlsSettings_OptionalSpeedLimitEnabled.speedLimitEnabled,
    0: ParentalControlsSettings_OptionalSpeedLimitEnabled.notSet
  };
  static const $core
      .Map<$core.int, ParentalControlsSettings_OptionalMaxLimitMph>
      _ParentalControlsSettings_OptionalMaxLimitMphByTag = {
    2: ParentalControlsSettings_OptionalMaxLimitMph.maxLimitMph,
    0: ParentalControlsSettings_OptionalMaxLimitMph.notSet
  };
  static const $core
      .Map<$core.int, ParentalControlsSettings_OptionalMinLimitMph>
      _ParentalControlsSettings_OptionalMinLimitMphByTag = {
    3: ParentalControlsSettings_OptionalMinLimitMph.minLimitMph,
    0: ParentalControlsSettings_OptionalMinLimitMph.notSet
  };
  static const $core
      .Map<$core.int, ParentalControlsSettings_OptionalCurrentLimitMph>
      _ParentalControlsSettings_OptionalCurrentLimitMphByTag = {
    4: ParentalControlsSettings_OptionalCurrentLimitMph.currentLimitMph,
    0: ParentalControlsSettings_OptionalCurrentLimitMph.notSet
  };
  static const $core
      .Map<$core.int, ParentalControlsSettings_OptionalChillAccelerationEnabled>
      _ParentalControlsSettings_OptionalChillAccelerationEnabledByTag = {
    5: ParentalControlsSettings_OptionalChillAccelerationEnabled
        .chillAccelerationEnabled,
    0: ParentalControlsSettings_OptionalChillAccelerationEnabled.notSet
  };
  static const $core.Map<$core.int,
          ParentalControlsSettings_OptionalRequireSafetySettingsEnabled>
      _ParentalControlsSettings_OptionalRequireSafetySettingsEnabledByTag = {
    6: ParentalControlsSettings_OptionalRequireSafetySettingsEnabled
        .requireSafetySettingsEnabled,
    0: ParentalControlsSettings_OptionalRequireSafetySettingsEnabled.notSet
  };
  static const $core
      .Map<$core.int, ParentalControlsSettings_OptionalCurfewEnabled>
      _ParentalControlsSettings_OptionalCurfewEnabledByTag = {
    7: ParentalControlsSettings_OptionalCurfewEnabled.curfewEnabled,
    0: ParentalControlsSettings_OptionalCurfewEnabled.notSet
  };
  static const $core
      .Map<$core.int, ParentalControlsSettings_OptionalCurfewStartTime>
      _ParentalControlsSettings_OptionalCurfewStartTimeByTag = {
    8: ParentalControlsSettings_OptionalCurfewStartTime.curfewStartTime,
    0: ParentalControlsSettings_OptionalCurfewStartTime.notSet
  };
  static const $core
      .Map<$core.int, ParentalControlsSettings_OptionalCurfewEndTime>
      _ParentalControlsSettings_OptionalCurfewEndTimeByTag = {
    9: ParentalControlsSettings_OptionalCurfewEndTime.curfewEndTime,
    0: ParentalControlsSettings_OptionalCurfewEndTime.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ParentalControlsSettings',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..oo(0, [1])
    ..oo(1, [2])
    ..oo(2, [3])
    ..oo(3, [4])
    ..oo(4, [5])
    ..oo(5, [6])
    ..oo(6, [7])
    ..oo(7, [8])
    ..oo(8, [9])
    ..aOB(1, _omitFieldNames ? '' : 'speedLimitEnabled')
    ..aD(2, _omitFieldNames ? '' : 'maxLimitMph', fieldType: $pb.PbFieldType.OF)
    ..aD(3, _omitFieldNames ? '' : 'minLimitMph', fieldType: $pb.PbFieldType.OF)
    ..aD(4, _omitFieldNames ? '' : 'currentLimitMph',
        fieldType: $pb.PbFieldType.OF)
    ..aOB(5, _omitFieldNames ? '' : 'chillAccelerationEnabled')
    ..aOB(6, _omitFieldNames ? '' : 'requireSafetySettingsEnabled')
    ..aOB(7, _omitFieldNames ? '' : 'curfewEnabled')
    ..aI(8, _omitFieldNames ? '' : 'curfewStartTime')
    ..aI(9, _omitFieldNames ? '' : 'curfewEndTime')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ParentalControlsSettings clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ParentalControlsSettings copyWith(
          void Function(ParentalControlsSettings) updates) =>
      super.copyWith((message) => updates(message as ParentalControlsSettings))
          as ParentalControlsSettings;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ParentalControlsSettings create() => ParentalControlsSettings._();
  @$core.override
  ParentalControlsSettings createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ParentalControlsSettings getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParentalControlsSettings>(create);
  static ParentalControlsSettings? _defaultInstance;

  @$pb.TagNumber(1)
  ParentalControlsSettings_OptionalSpeedLimitEnabled
      whichOptionalSpeedLimitEnabled() =>
          _ParentalControlsSettings_OptionalSpeedLimitEnabledByTag[
              $_whichOneof(0)]!;
  @$pb.TagNumber(1)
  void clearOptionalSpeedLimitEnabled() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(2)
  ParentalControlsSettings_OptionalMaxLimitMph whichOptionalMaxLimitMph() =>
      _ParentalControlsSettings_OptionalMaxLimitMphByTag[$_whichOneof(1)]!;
  @$pb.TagNumber(2)
  void clearOptionalMaxLimitMph() => $_clearField($_whichOneof(1));

  @$pb.TagNumber(3)
  ParentalControlsSettings_OptionalMinLimitMph whichOptionalMinLimitMph() =>
      _ParentalControlsSettings_OptionalMinLimitMphByTag[$_whichOneof(2)]!;
  @$pb.TagNumber(3)
  void clearOptionalMinLimitMph() => $_clearField($_whichOneof(2));

  @$pb.TagNumber(4)
  ParentalControlsSettings_OptionalCurrentLimitMph
      whichOptionalCurrentLimitMph() =>
          _ParentalControlsSettings_OptionalCurrentLimitMphByTag[
              $_whichOneof(3)]!;
  @$pb.TagNumber(4)
  void clearOptionalCurrentLimitMph() => $_clearField($_whichOneof(3));

  @$pb.TagNumber(5)
  ParentalControlsSettings_OptionalChillAccelerationEnabled
      whichOptionalChillAccelerationEnabled() =>
          _ParentalControlsSettings_OptionalChillAccelerationEnabledByTag[
              $_whichOneof(4)]!;
  @$pb.TagNumber(5)
  void clearOptionalChillAccelerationEnabled() => $_clearField($_whichOneof(4));

  @$pb.TagNumber(6)
  ParentalControlsSettings_OptionalRequireSafetySettingsEnabled
      whichOptionalRequireSafetySettingsEnabled() =>
          _ParentalControlsSettings_OptionalRequireSafetySettingsEnabledByTag[
              $_whichOneof(5)]!;
  @$pb.TagNumber(6)
  void clearOptionalRequireSafetySettingsEnabled() =>
      $_clearField($_whichOneof(5));

  @$pb.TagNumber(7)
  ParentalControlsSettings_OptionalCurfewEnabled whichOptionalCurfewEnabled() =>
      _ParentalControlsSettings_OptionalCurfewEnabledByTag[$_whichOneof(6)]!;
  @$pb.TagNumber(7)
  void clearOptionalCurfewEnabled() => $_clearField($_whichOneof(6));

  @$pb.TagNumber(8)
  ParentalControlsSettings_OptionalCurfewStartTime
      whichOptionalCurfewStartTime() =>
          _ParentalControlsSettings_OptionalCurfewStartTimeByTag[
              $_whichOneof(7)]!;
  @$pb.TagNumber(8)
  void clearOptionalCurfewStartTime() => $_clearField($_whichOneof(7));

  @$pb.TagNumber(9)
  ParentalControlsSettings_OptionalCurfewEndTime whichOptionalCurfewEndTime() =>
      _ParentalControlsSettings_OptionalCurfewEndTimeByTag[$_whichOneof(8)]!;
  @$pb.TagNumber(9)
  void clearOptionalCurfewEndTime() => $_clearField($_whichOneof(8));

  @$pb.TagNumber(1)
  $core.bool get speedLimitEnabled => $_getBF(0);
  @$pb.TagNumber(1)
  set speedLimitEnabled($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSpeedLimitEnabled() => $_has(0);
  @$pb.TagNumber(1)
  void clearSpeedLimitEnabled() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get maxLimitMph => $_getN(1);
  @$pb.TagNumber(2)
  set maxLimitMph($core.double value) => $_setFloat(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMaxLimitMph() => $_has(1);
  @$pb.TagNumber(2)
  void clearMaxLimitMph() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get minLimitMph => $_getN(2);
  @$pb.TagNumber(3)
  set minLimitMph($core.double value) => $_setFloat(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMinLimitMph() => $_has(2);
  @$pb.TagNumber(3)
  void clearMinLimitMph() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get currentLimitMph => $_getN(3);
  @$pb.TagNumber(4)
  set currentLimitMph($core.double value) => $_setFloat(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCurrentLimitMph() => $_has(3);
  @$pb.TagNumber(4)
  void clearCurrentLimitMph() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get chillAccelerationEnabled => $_getBF(4);
  @$pb.TagNumber(5)
  set chillAccelerationEnabled($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasChillAccelerationEnabled() => $_has(4);
  @$pb.TagNumber(5)
  void clearChillAccelerationEnabled() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get requireSafetySettingsEnabled => $_getBF(5);
  @$pb.TagNumber(6)
  set requireSafetySettingsEnabled($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasRequireSafetySettingsEnabled() => $_has(5);
  @$pb.TagNumber(6)
  void clearRequireSafetySettingsEnabled() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.bool get curfewEnabled => $_getBF(6);
  @$pb.TagNumber(7)
  set curfewEnabled($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(7)
  $core.bool hasCurfewEnabled() => $_has(6);
  @$pb.TagNumber(7)
  void clearCurfewEnabled() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get curfewStartTime => $_getIZ(7);
  @$pb.TagNumber(8)
  set curfewStartTime($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasCurfewStartTime() => $_has(7);
  @$pb.TagNumber(8)
  void clearCurfewStartTime() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.int get curfewEndTime => $_getIZ(8);
  @$pb.TagNumber(9)
  set curfewEndTime($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasCurfewEndTime() => $_has(8);
  @$pb.TagNumber(9)
  void clearCurfewEndTime() => $_clearField(9);
}

enum ParentalControlsState_OptionalParentalControlsActive {
  parentalControlsActive,
  notSet
}

enum ParentalControlsState_OptionalParentalControlsPinSet {
  parentalControlsPinSet,
  notSet
}

class ParentalControlsState extends $pb.GeneratedMessage {
  factory ParentalControlsState({
    $0.Timestamp? timestamp,
    $core.bool? parentalControlsActive,
    $core.bool? parentalControlsPinSet,
    ParentalControlsSettings? parentalControlsSettings,
  }) {
    final result = create();
    if (timestamp != null) result.timestamp = timestamp;
    if (parentalControlsActive != null)
      result.parentalControlsActive = parentalControlsActive;
    if (parentalControlsPinSet != null)
      result.parentalControlsPinSet = parentalControlsPinSet;
    if (parentalControlsSettings != null)
      result.parentalControlsSettings = parentalControlsSettings;
    return result;
  }

  ParentalControlsState._();

  factory ParentalControlsState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ParentalControlsState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core
      .Map<$core.int, ParentalControlsState_OptionalParentalControlsActive>
      _ParentalControlsState_OptionalParentalControlsActiveByTag = {
    2: ParentalControlsState_OptionalParentalControlsActive
        .parentalControlsActive,
    0: ParentalControlsState_OptionalParentalControlsActive.notSet
  };
  static const $core
      .Map<$core.int, ParentalControlsState_OptionalParentalControlsPinSet>
      _ParentalControlsState_OptionalParentalControlsPinSetByTag = {
    3: ParentalControlsState_OptionalParentalControlsPinSet
        .parentalControlsPinSet,
    0: ParentalControlsState_OptionalParentalControlsPinSet.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ParentalControlsState',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..oo(0, [2])
    ..oo(1, [3])
    ..aOM<$0.Timestamp>(1, _omitFieldNames ? '' : 'timestamp',
        subBuilder: $0.Timestamp.create)
    ..aOB(2, _omitFieldNames ? '' : 'parentalControlsActive')
    ..aOB(3, _omitFieldNames ? '' : 'parentalControlsPinSet')
    ..aOM<ParentalControlsSettings>(
        4, _omitFieldNames ? '' : 'parentalControlsSettings',
        subBuilder: ParentalControlsSettings.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ParentalControlsState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ParentalControlsState copyWith(
          void Function(ParentalControlsState) updates) =>
      super.copyWith((message) => updates(message as ParentalControlsState))
          as ParentalControlsState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ParentalControlsState create() => ParentalControlsState._();
  @$core.override
  ParentalControlsState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ParentalControlsState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParentalControlsState>(create);
  static ParentalControlsState? _defaultInstance;

  @$pb.TagNumber(2)
  ParentalControlsState_OptionalParentalControlsActive
      whichOptionalParentalControlsActive() =>
          _ParentalControlsState_OptionalParentalControlsActiveByTag[
              $_whichOneof(0)]!;
  @$pb.TagNumber(2)
  void clearOptionalParentalControlsActive() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(3)
  ParentalControlsState_OptionalParentalControlsPinSet
      whichOptionalParentalControlsPinSet() =>
          _ParentalControlsState_OptionalParentalControlsPinSetByTag[
              $_whichOneof(1)]!;
  @$pb.TagNumber(3)
  void clearOptionalParentalControlsPinSet() => $_clearField($_whichOneof(1));

  @$pb.TagNumber(1)
  $0.Timestamp get timestamp => $_getN(0);
  @$pb.TagNumber(1)
  set timestamp($0.Timestamp value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTimestamp() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimestamp() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.Timestamp ensureTimestamp() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.bool get parentalControlsActive => $_getBF(1);
  @$pb.TagNumber(2)
  set parentalControlsActive($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasParentalControlsActive() => $_has(1);
  @$pb.TagNumber(2)
  void clearParentalControlsActive() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get parentalControlsPinSet => $_getBF(2);
  @$pb.TagNumber(3)
  set parentalControlsPinSet($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasParentalControlsPinSet() => $_has(2);
  @$pb.TagNumber(3)
  void clearParentalControlsPinSet() => $_clearField(3);

  @$pb.TagNumber(4)
  ParentalControlsSettings get parentalControlsSettings => $_getN(3);
  @$pb.TagNumber(4)
  set parentalControlsSettings(ParentalControlsSettings value) =>
      $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasParentalControlsSettings() => $_has(3);
  @$pb.TagNumber(4)
  void clearParentalControlsSettings() => $_clearField(4);
  @$pb.TagNumber(4)
  ParentalControlsSettings ensureParentalControlsSettings() => $_ensure(3);
}

enum SoftwareUpdateState_SoftwareUpdateStatus_Type {
  unknown,
  installing,
  scheduled,
  available,
  downloadingWifiWait,
  downloading,
  notSet
}

class SoftwareUpdateState_SoftwareUpdateStatus extends $pb.GeneratedMessage {
  factory SoftwareUpdateState_SoftwareUpdateStatus({
    $1.Void? unknown,
    $1.Void? installing,
    $1.Void? scheduled,
    $1.Void? available,
    $1.Void? downloadingWifiWait,
    $1.Void? downloading,
  }) {
    final result = create();
    if (unknown != null) result.unknown = unknown;
    if (installing != null) result.installing = installing;
    if (scheduled != null) result.scheduled = scheduled;
    if (available != null) result.available = available;
    if (downloadingWifiWait != null)
      result.downloadingWifiWait = downloadingWifiWait;
    if (downloading != null) result.downloading = downloading;
    return result;
  }

  SoftwareUpdateState_SoftwareUpdateStatus._();

  factory SoftwareUpdateState_SoftwareUpdateStatus.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SoftwareUpdateState_SoftwareUpdateStatus.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core
      .Map<$core.int, SoftwareUpdateState_SoftwareUpdateStatus_Type>
      _SoftwareUpdateState_SoftwareUpdateStatus_TypeByTag = {
    1: SoftwareUpdateState_SoftwareUpdateStatus_Type.unknown,
    2: SoftwareUpdateState_SoftwareUpdateStatus_Type.installing,
    3: SoftwareUpdateState_SoftwareUpdateStatus_Type.scheduled,
    4: SoftwareUpdateState_SoftwareUpdateStatus_Type.available,
    5: SoftwareUpdateState_SoftwareUpdateStatus_Type.downloadingWifiWait,
    6: SoftwareUpdateState_SoftwareUpdateStatus_Type.downloading,
    0: SoftwareUpdateState_SoftwareUpdateStatus_Type.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SoftwareUpdateState.SoftwareUpdateStatus',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5, 6])
    ..aOM<$1.Void>(1, _omitFieldNames ? '' : 'Unknown',
        protoName: 'Unknown', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(2, _omitFieldNames ? '' : 'Installing',
        protoName: 'Installing', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(3, _omitFieldNames ? '' : 'Scheduled',
        protoName: 'Scheduled', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(4, _omitFieldNames ? '' : 'Available',
        protoName: 'Available', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(5, _omitFieldNames ? '' : 'DownloadingWifiWait',
        protoName: 'DownloadingWifiWait', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(6, _omitFieldNames ? '' : 'Downloading',
        protoName: 'Downloading', subBuilder: $1.Void.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SoftwareUpdateState_SoftwareUpdateStatus clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SoftwareUpdateState_SoftwareUpdateStatus copyWith(
          void Function(SoftwareUpdateState_SoftwareUpdateStatus) updates) =>
      super.copyWith((message) =>
              updates(message as SoftwareUpdateState_SoftwareUpdateStatus))
          as SoftwareUpdateState_SoftwareUpdateStatus;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SoftwareUpdateState_SoftwareUpdateStatus create() =>
      SoftwareUpdateState_SoftwareUpdateStatus._();
  @$core.override
  SoftwareUpdateState_SoftwareUpdateStatus createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SoftwareUpdateState_SoftwareUpdateStatus getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          SoftwareUpdateState_SoftwareUpdateStatus>(create);
  static SoftwareUpdateState_SoftwareUpdateStatus? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  SoftwareUpdateState_SoftwareUpdateStatus_Type whichType() =>
      _SoftwareUpdateState_SoftwareUpdateStatus_TypeByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  void clearType() => $_clearField($_whichOneof(0));

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
  $1.Void get installing => $_getN(1);
  @$pb.TagNumber(2)
  set installing($1.Void value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasInstalling() => $_has(1);
  @$pb.TagNumber(2)
  void clearInstalling() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.Void ensureInstalling() => $_ensure(1);

  @$pb.TagNumber(3)
  $1.Void get scheduled => $_getN(2);
  @$pb.TagNumber(3)
  set scheduled($1.Void value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasScheduled() => $_has(2);
  @$pb.TagNumber(3)
  void clearScheduled() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.Void ensureScheduled() => $_ensure(2);

  @$pb.TagNumber(4)
  $1.Void get available => $_getN(3);
  @$pb.TagNumber(4)
  set available($1.Void value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasAvailable() => $_has(3);
  @$pb.TagNumber(4)
  void clearAvailable() => $_clearField(4);
  @$pb.TagNumber(4)
  $1.Void ensureAvailable() => $_ensure(3);

  @$pb.TagNumber(5)
  $1.Void get downloadingWifiWait => $_getN(4);
  @$pb.TagNumber(5)
  set downloadingWifiWait($1.Void value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasDownloadingWifiWait() => $_has(4);
  @$pb.TagNumber(5)
  void clearDownloadingWifiWait() => $_clearField(5);
  @$pb.TagNumber(5)
  $1.Void ensureDownloadingWifiWait() => $_ensure(4);

  @$pb.TagNumber(6)
  $1.Void get downloading => $_getN(5);
  @$pb.TagNumber(6)
  set downloading($1.Void value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasDownloading() => $_has(5);
  @$pb.TagNumber(6)
  void clearDownloading() => $_clearField(6);
  @$pb.TagNumber(6)
  $1.Void ensureDownloading() => $_ensure(5);
}

enum SoftwareUpdateState_OptionalScheduledTimeMs { scheduledTimeMs, notSet }

enum SoftwareUpdateState_OptionalWarningTimeRemainingMs {
  warningTimeRemainingMs,
  notSet
}

enum SoftwareUpdateState_OptionalExpectedDurationSec {
  expectedDurationSec,
  notSet
}

enum SoftwareUpdateState_OptionalDownloadPerc { downloadPerc, notSet }

enum SoftwareUpdateState_OptionalInstallPerc { installPerc, notSet }

enum SoftwareUpdateState_OptionalVersion { version, notSet }

class SoftwareUpdateState extends $pb.GeneratedMessage {
  factory SoftwareUpdateState({
    SoftwareUpdateState_SoftwareUpdateStatus? status,
    $fixnum.Int64? scheduledTimeMs,
    $fixnum.Int64? warningTimeRemainingMs,
    $core.int? expectedDurationSec,
    $core.int? downloadPerc,
    $core.int? installPerc,
    $core.String? version,
    $0.Timestamp? timestamp,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (scheduledTimeMs != null) result.scheduledTimeMs = scheduledTimeMs;
    if (warningTimeRemainingMs != null)
      result.warningTimeRemainingMs = warningTimeRemainingMs;
    if (expectedDurationSec != null)
      result.expectedDurationSec = expectedDurationSec;
    if (downloadPerc != null) result.downloadPerc = downloadPerc;
    if (installPerc != null) result.installPerc = installPerc;
    if (version != null) result.version = version;
    if (timestamp != null) result.timestamp = timestamp;
    return result;
  }

  SoftwareUpdateState._();

  factory SoftwareUpdateState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SoftwareUpdateState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, SoftwareUpdateState_OptionalScheduledTimeMs>
      _SoftwareUpdateState_OptionalScheduledTimeMsByTag = {
    102: SoftwareUpdateState_OptionalScheduledTimeMs.scheduledTimeMs,
    0: SoftwareUpdateState_OptionalScheduledTimeMs.notSet
  };
  static const $core
      .Map<$core.int, SoftwareUpdateState_OptionalWarningTimeRemainingMs>
      _SoftwareUpdateState_OptionalWarningTimeRemainingMsByTag = {
    103: SoftwareUpdateState_OptionalWarningTimeRemainingMs
        .warningTimeRemainingMs,
    0: SoftwareUpdateState_OptionalWarningTimeRemainingMs.notSet
  };
  static const $core
      .Map<$core.int, SoftwareUpdateState_OptionalExpectedDurationSec>
      _SoftwareUpdateState_OptionalExpectedDurationSecByTag = {
    104: SoftwareUpdateState_OptionalExpectedDurationSec.expectedDurationSec,
    0: SoftwareUpdateState_OptionalExpectedDurationSec.notSet
  };
  static const $core.Map<$core.int, SoftwareUpdateState_OptionalDownloadPerc>
      _SoftwareUpdateState_OptionalDownloadPercByTag = {
    105: SoftwareUpdateState_OptionalDownloadPerc.downloadPerc,
    0: SoftwareUpdateState_OptionalDownloadPerc.notSet
  };
  static const $core.Map<$core.int, SoftwareUpdateState_OptionalInstallPerc>
      _SoftwareUpdateState_OptionalInstallPercByTag = {
    106: SoftwareUpdateState_OptionalInstallPerc.installPerc,
    0: SoftwareUpdateState_OptionalInstallPerc.notSet
  };
  static const $core.Map<$core.int, SoftwareUpdateState_OptionalVersion>
      _SoftwareUpdateState_OptionalVersionByTag = {
    107: SoftwareUpdateState_OptionalVersion.version,
    0: SoftwareUpdateState_OptionalVersion.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SoftwareUpdateState',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..oo(0, [102])
    ..oo(1, [103])
    ..oo(2, [104])
    ..oo(3, [105])
    ..oo(4, [106])
    ..oo(5, [107])
    ..aOM<SoftwareUpdateState_SoftwareUpdateStatus>(
        1, _omitFieldNames ? '' : 'status',
        subBuilder: SoftwareUpdateState_SoftwareUpdateStatus.create)
    ..a<$fixnum.Int64>(
        102, _omitFieldNames ? '' : 'scheduledTimeMs', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(103, _omitFieldNames ? '' : 'warningTimeRemainingMs',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(104, _omitFieldNames ? '' : 'expectedDurationSec',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(105, _omitFieldNames ? '' : 'downloadPerc',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(106, _omitFieldNames ? '' : 'installPerc',
        fieldType: $pb.PbFieldType.OU3)
    ..aOS(107, _omitFieldNames ? '' : 'version')
    ..aOM<$0.Timestamp>(108, _omitFieldNames ? '' : 'timestamp',
        subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SoftwareUpdateState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SoftwareUpdateState copyWith(void Function(SoftwareUpdateState) updates) =>
      super.copyWith((message) => updates(message as SoftwareUpdateState))
          as SoftwareUpdateState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SoftwareUpdateState create() => SoftwareUpdateState._();
  @$core.override
  SoftwareUpdateState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SoftwareUpdateState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SoftwareUpdateState>(create);
  static SoftwareUpdateState? _defaultInstance;

  @$pb.TagNumber(102)
  SoftwareUpdateState_OptionalScheduledTimeMs whichOptionalScheduledTimeMs() =>
      _SoftwareUpdateState_OptionalScheduledTimeMsByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(102)
  void clearOptionalScheduledTimeMs() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(103)
  SoftwareUpdateState_OptionalWarningTimeRemainingMs
      whichOptionalWarningTimeRemainingMs() =>
          _SoftwareUpdateState_OptionalWarningTimeRemainingMsByTag[
              $_whichOneof(1)]!;
  @$pb.TagNumber(103)
  void clearOptionalWarningTimeRemainingMs() => $_clearField($_whichOneof(1));

  @$pb.TagNumber(104)
  SoftwareUpdateState_OptionalExpectedDurationSec
      whichOptionalExpectedDurationSec() =>
          _SoftwareUpdateState_OptionalExpectedDurationSecByTag[
              $_whichOneof(2)]!;
  @$pb.TagNumber(104)
  void clearOptionalExpectedDurationSec() => $_clearField($_whichOneof(2));

  @$pb.TagNumber(105)
  SoftwareUpdateState_OptionalDownloadPerc whichOptionalDownloadPerc() =>
      _SoftwareUpdateState_OptionalDownloadPercByTag[$_whichOneof(3)]!;
  @$pb.TagNumber(105)
  void clearOptionalDownloadPerc() => $_clearField($_whichOneof(3));

  @$pb.TagNumber(106)
  SoftwareUpdateState_OptionalInstallPerc whichOptionalInstallPerc() =>
      _SoftwareUpdateState_OptionalInstallPercByTag[$_whichOneof(4)]!;
  @$pb.TagNumber(106)
  void clearOptionalInstallPerc() => $_clearField($_whichOneof(4));

  @$pb.TagNumber(107)
  SoftwareUpdateState_OptionalVersion whichOptionalVersion() =>
      _SoftwareUpdateState_OptionalVersionByTag[$_whichOneof(5)]!;
  @$pb.TagNumber(107)
  void clearOptionalVersion() => $_clearField($_whichOneof(5));

  @$pb.TagNumber(1)
  SoftwareUpdateState_SoftwareUpdateStatus get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(SoftwareUpdateState_SoftwareUpdateStatus value) =>
      $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);
  @$pb.TagNumber(1)
  SoftwareUpdateState_SoftwareUpdateStatus ensureStatus() => $_ensure(0);

  @$pb.TagNumber(102)
  $fixnum.Int64 get scheduledTimeMs => $_getI64(1);
  @$pb.TagNumber(102)
  set scheduledTimeMs($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(102)
  $core.bool hasScheduledTimeMs() => $_has(1);
  @$pb.TagNumber(102)
  void clearScheduledTimeMs() => $_clearField(102);

  @$pb.TagNumber(103)
  $fixnum.Int64 get warningTimeRemainingMs => $_getI64(2);
  @$pb.TagNumber(103)
  set warningTimeRemainingMs($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(103)
  $core.bool hasWarningTimeRemainingMs() => $_has(2);
  @$pb.TagNumber(103)
  void clearWarningTimeRemainingMs() => $_clearField(103);

  @$pb.TagNumber(104)
  $core.int get expectedDurationSec => $_getIZ(3);
  @$pb.TagNumber(104)
  set expectedDurationSec($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(104)
  $core.bool hasExpectedDurationSec() => $_has(3);
  @$pb.TagNumber(104)
  void clearExpectedDurationSec() => $_clearField(104);

  @$pb.TagNumber(105)
  $core.int get downloadPerc => $_getIZ(4);
  @$pb.TagNumber(105)
  set downloadPerc($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(105)
  $core.bool hasDownloadPerc() => $_has(4);
  @$pb.TagNumber(105)
  void clearDownloadPerc() => $_clearField(105);

  @$pb.TagNumber(106)
  $core.int get installPerc => $_getIZ(5);
  @$pb.TagNumber(106)
  set installPerc($core.int value) => $_setUnsignedInt32(5, value);
  @$pb.TagNumber(106)
  $core.bool hasInstallPerc() => $_has(5);
  @$pb.TagNumber(106)
  void clearInstallPerc() => $_clearField(106);

  @$pb.TagNumber(107)
  $core.String get version => $_getSZ(6);
  @$pb.TagNumber(107)
  set version($core.String value) => $_setString(6, value);
  @$pb.TagNumber(107)
  $core.bool hasVersion() => $_has(6);
  @$pb.TagNumber(107)
  void clearVersion() => $_clearField(107);

  @$pb.TagNumber(108)
  $0.Timestamp get timestamp => $_getN(7);
  @$pb.TagNumber(108)
  set timestamp($0.Timestamp value) => $_setField(108, value);
  @$pb.TagNumber(108)
  $core.bool hasTimestamp() => $_has(7);
  @$pb.TagNumber(108)
  void clearTimestamp() => $_clearField(108);
  @$pb.TagNumber(108)
  $0.Timestamp ensureTimestamp() => $_ensure(7);
}

enum DriveState_OptionalSpeed { speed, notSet }

enum DriveState_OptionalPower { power, notSet }

enum DriveState_OptionalOdometerInHundredthsOfAMile {
  odometerInHundredthsOfAMile,
  notSet
}

enum DriveState_OptionalSpeedFloat { speedFloat, notSet }

enum DriveState_OptionalActiveRouteDestination {
  activeRouteDestination,
  notSet
}

enum DriveState_OptionalActiveRouteMinutesToArrival {
  activeRouteMinutesToArrival,
  notSet
}

enum DriveState_OptionalActiveRouteMilesToArrival {
  activeRouteMilesToArrival,
  notSet
}

enum DriveState_OptionalActiveRouteTrafficMinutesDelay {
  activeRouteTrafficMinutesDelay,
  notSet
}

enum DriveState_OptionalActiveRouteEnergyAtArrival {
  activeRouteEnergyAtArrival,
  notSet
}

enum DriveState_OptionalLastRouteUpdate { lastRouteUpdate, notSet }

class DriveState extends $pb.GeneratedMessage {
  factory DriveState({
    ShiftState? shiftState,
    $0.Timestamp? timestamp,
    $core.String? activeRouteDestination,
    $core.double? activeRouteMinutesToArrival,
    $core.double? activeRouteMilesToArrival,
    $core.double? activeRouteTrafficMinutesDelay,
    $core.double? activeRouteEnergyAtArrival,
    $1.LatLong? activeRouteCoordinates,
    $core.int? lastRouteUpdate,
    $0.Timestamp? lastTrafficUpdate,
    $core.int? speed,
    $core.int? power,
    $core.int? odometerInHundredthsOfAMile,
    $core.double? speedFloat,
  }) {
    final result = create();
    if (shiftState != null) result.shiftState = shiftState;
    if (timestamp != null) result.timestamp = timestamp;
    if (activeRouteDestination != null)
      result.activeRouteDestination = activeRouteDestination;
    if (activeRouteMinutesToArrival != null)
      result.activeRouteMinutesToArrival = activeRouteMinutesToArrival;
    if (activeRouteMilesToArrival != null)
      result.activeRouteMilesToArrival = activeRouteMilesToArrival;
    if (activeRouteTrafficMinutesDelay != null)
      result.activeRouteTrafficMinutesDelay = activeRouteTrafficMinutesDelay;
    if (activeRouteEnergyAtArrival != null)
      result.activeRouteEnergyAtArrival = activeRouteEnergyAtArrival;
    if (activeRouteCoordinates != null)
      result.activeRouteCoordinates = activeRouteCoordinates;
    if (lastRouteUpdate != null) result.lastRouteUpdate = lastRouteUpdate;
    if (lastTrafficUpdate != null) result.lastTrafficUpdate = lastTrafficUpdate;
    if (speed != null) result.speed = speed;
    if (power != null) result.power = power;
    if (odometerInHundredthsOfAMile != null)
      result.odometerInHundredthsOfAMile = odometerInHundredthsOfAMile;
    if (speedFloat != null) result.speedFloat = speedFloat;
    return result;
  }

  DriveState._();

  factory DriveState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DriveState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, DriveState_OptionalSpeed>
      _DriveState_OptionalSpeedByTag = {
    102: DriveState_OptionalSpeed.speed,
    0: DriveState_OptionalSpeed.notSet
  };
  static const $core.Map<$core.int, DriveState_OptionalPower>
      _DriveState_OptionalPowerByTag = {
    103: DriveState_OptionalPower.power,
    0: DriveState_OptionalPower.notSet
  };
  static const $core
      .Map<$core.int, DriveState_OptionalOdometerInHundredthsOfAMile>
      _DriveState_OptionalOdometerInHundredthsOfAMileByTag = {
    105: DriveState_OptionalOdometerInHundredthsOfAMile
        .odometerInHundredthsOfAMile,
    0: DriveState_OptionalOdometerInHundredthsOfAMile.notSet
  };
  static const $core.Map<$core.int, DriveState_OptionalSpeedFloat>
      _DriveState_OptionalSpeedFloatByTag = {
    106: DriveState_OptionalSpeedFloat.speedFloat,
    0: DriveState_OptionalSpeedFloat.notSet
  };
  static const $core.Map<$core.int, DriveState_OptionalActiveRouteDestination>
      _DriveState_OptionalActiveRouteDestinationByTag = {
    7: DriveState_OptionalActiveRouteDestination.activeRouteDestination,
    0: DriveState_OptionalActiveRouteDestination.notSet
  };
  static const $core
      .Map<$core.int, DriveState_OptionalActiveRouteMinutesToArrival>
      _DriveState_OptionalActiveRouteMinutesToArrivalByTag = {
    8: DriveState_OptionalActiveRouteMinutesToArrival
        .activeRouteMinutesToArrival,
    0: DriveState_OptionalActiveRouteMinutesToArrival.notSet
  };
  static const $core
      .Map<$core.int, DriveState_OptionalActiveRouteMilesToArrival>
      _DriveState_OptionalActiveRouteMilesToArrivalByTag = {
    9: DriveState_OptionalActiveRouteMilesToArrival.activeRouteMilesToArrival,
    0: DriveState_OptionalActiveRouteMilesToArrival.notSet
  };
  static const $core
      .Map<$core.int, DriveState_OptionalActiveRouteTrafficMinutesDelay>
      _DriveState_OptionalActiveRouteTrafficMinutesDelayByTag = {
    10: DriveState_OptionalActiveRouteTrafficMinutesDelay
        .activeRouteTrafficMinutesDelay,
    0: DriveState_OptionalActiveRouteTrafficMinutesDelay.notSet
  };
  static const $core
      .Map<$core.int, DriveState_OptionalActiveRouteEnergyAtArrival>
      _DriveState_OptionalActiveRouteEnergyAtArrivalByTag = {
    11: DriveState_OptionalActiveRouteEnergyAtArrival
        .activeRouteEnergyAtArrival,
    0: DriveState_OptionalActiveRouteEnergyAtArrival.notSet
  };
  static const $core.Map<$core.int, DriveState_OptionalLastRouteUpdate>
      _DriveState_OptionalLastRouteUpdateByTag = {
    14: DriveState_OptionalLastRouteUpdate.lastRouteUpdate,
    0: DriveState_OptionalLastRouteUpdate.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DriveState',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..oo(0, [102])
    ..oo(1, [103])
    ..oo(2, [105])
    ..oo(3, [106])
    ..oo(4, [7])
    ..oo(5, [8])
    ..oo(6, [9])
    ..oo(7, [10])
    ..oo(8, [11])
    ..oo(9, [14])
    ..aOM<ShiftState>(1, _omitFieldNames ? '' : 'shiftState',
        subBuilder: ShiftState.create)
    ..aOM<$0.Timestamp>(4, _omitFieldNames ? '' : 'timestamp',
        subBuilder: $0.Timestamp.create)
    ..aOS(7, _omitFieldNames ? '' : 'activeRouteDestination')
    ..aD(8, _omitFieldNames ? '' : 'activeRouteMinutesToArrival',
        fieldType: $pb.PbFieldType.OF)
    ..aD(9, _omitFieldNames ? '' : 'activeRouteMilesToArrival',
        fieldType: $pb.PbFieldType.OF)
    ..aD(10, _omitFieldNames ? '' : 'activeRouteTrafficMinutesDelay',
        fieldType: $pb.PbFieldType.OF)
    ..aD(11, _omitFieldNames ? '' : 'activeRouteEnergyAtArrival',
        fieldType: $pb.PbFieldType.OF)
    ..aOM<$1.LatLong>(12, _omitFieldNames ? '' : 'activeRouteCoordinates',
        subBuilder: $1.LatLong.create)
    ..aI(14, _omitFieldNames ? '' : 'lastRouteUpdate',
        fieldType: $pb.PbFieldType.OU3)
    ..aOM<$0.Timestamp>(15, _omitFieldNames ? '' : 'lastTrafficUpdate',
        subBuilder: $0.Timestamp.create)
    ..aI(102, _omitFieldNames ? '' : 'speed', fieldType: $pb.PbFieldType.OU3)
    ..aI(103, _omitFieldNames ? '' : 'power')
    ..aI(105, _omitFieldNames ? '' : 'odometerInHundredthsOfAMile')
    ..aD(106, _omitFieldNames ? '' : 'speedFloat',
        fieldType: $pb.PbFieldType.OF)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DriveState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DriveState copyWith(void Function(DriveState) updates) =>
      super.copyWith((message) => updates(message as DriveState)) as DriveState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DriveState create() => DriveState._();
  @$core.override
  DriveState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DriveState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DriveState>(create);
  static DriveState? _defaultInstance;

  @$pb.TagNumber(102)
  DriveState_OptionalSpeed whichOptionalSpeed() =>
      _DriveState_OptionalSpeedByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(102)
  void clearOptionalSpeed() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(103)
  DriveState_OptionalPower whichOptionalPower() =>
      _DriveState_OptionalPowerByTag[$_whichOneof(1)]!;
  @$pb.TagNumber(103)
  void clearOptionalPower() => $_clearField($_whichOneof(1));

  @$pb.TagNumber(105)
  DriveState_OptionalOdometerInHundredthsOfAMile
      whichOptionalOdometerInHundredthsOfAMile() =>
          _DriveState_OptionalOdometerInHundredthsOfAMileByTag[
              $_whichOneof(2)]!;
  @$pb.TagNumber(105)
  void clearOptionalOdometerInHundredthsOfAMile() =>
      $_clearField($_whichOneof(2));

  @$pb.TagNumber(106)
  DriveState_OptionalSpeedFloat whichOptionalSpeedFloat() =>
      _DriveState_OptionalSpeedFloatByTag[$_whichOneof(3)]!;
  @$pb.TagNumber(106)
  void clearOptionalSpeedFloat() => $_clearField($_whichOneof(3));

  @$pb.TagNumber(7)
  DriveState_OptionalActiveRouteDestination
      whichOptionalActiveRouteDestination() =>
          _DriveState_OptionalActiveRouteDestinationByTag[$_whichOneof(4)]!;
  @$pb.TagNumber(7)
  void clearOptionalActiveRouteDestination() => $_clearField($_whichOneof(4));

  @$pb.TagNumber(8)
  DriveState_OptionalActiveRouteMinutesToArrival
      whichOptionalActiveRouteMinutesToArrival() =>
          _DriveState_OptionalActiveRouteMinutesToArrivalByTag[
              $_whichOneof(5)]!;
  @$pb.TagNumber(8)
  void clearOptionalActiveRouteMinutesToArrival() =>
      $_clearField($_whichOneof(5));

  @$pb.TagNumber(9)
  DriveState_OptionalActiveRouteMilesToArrival
      whichOptionalActiveRouteMilesToArrival() =>
          _DriveState_OptionalActiveRouteMilesToArrivalByTag[$_whichOneof(6)]!;
  @$pb.TagNumber(9)
  void clearOptionalActiveRouteMilesToArrival() =>
      $_clearField($_whichOneof(6));

  @$pb.TagNumber(10)
  DriveState_OptionalActiveRouteTrafficMinutesDelay
      whichOptionalActiveRouteTrafficMinutesDelay() =>
          _DriveState_OptionalActiveRouteTrafficMinutesDelayByTag[
              $_whichOneof(7)]!;
  @$pb.TagNumber(10)
  void clearOptionalActiveRouteTrafficMinutesDelay() =>
      $_clearField($_whichOneof(7));

  @$pb.TagNumber(11)
  DriveState_OptionalActiveRouteEnergyAtArrival
      whichOptionalActiveRouteEnergyAtArrival() =>
          _DriveState_OptionalActiveRouteEnergyAtArrivalByTag[$_whichOneof(8)]!;
  @$pb.TagNumber(11)
  void clearOptionalActiveRouteEnergyAtArrival() =>
      $_clearField($_whichOneof(8));

  @$pb.TagNumber(14)
  DriveState_OptionalLastRouteUpdate whichOptionalLastRouteUpdate() =>
      _DriveState_OptionalLastRouteUpdateByTag[$_whichOneof(9)]!;
  @$pb.TagNumber(14)
  void clearOptionalLastRouteUpdate() => $_clearField($_whichOneof(9));

  @$pb.TagNumber(1)
  ShiftState get shiftState => $_getN(0);
  @$pb.TagNumber(1)
  set shiftState(ShiftState value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasShiftState() => $_has(0);
  @$pb.TagNumber(1)
  void clearShiftState() => $_clearField(1);
  @$pb.TagNumber(1)
  ShiftState ensureShiftState() => $_ensure(0);

  @$pb.TagNumber(4)
  $0.Timestamp get timestamp => $_getN(1);
  @$pb.TagNumber(4)
  set timestamp($0.Timestamp value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasTimestamp() => $_has(1);
  @$pb.TagNumber(4)
  void clearTimestamp() => $_clearField(4);
  @$pb.TagNumber(4)
  $0.Timestamp ensureTimestamp() => $_ensure(1);

  @$pb.TagNumber(7)
  $core.String get activeRouteDestination => $_getSZ(2);
  @$pb.TagNumber(7)
  set activeRouteDestination($core.String value) => $_setString(2, value);
  @$pb.TagNumber(7)
  $core.bool hasActiveRouteDestination() => $_has(2);
  @$pb.TagNumber(7)
  void clearActiveRouteDestination() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.double get activeRouteMinutesToArrival => $_getN(3);
  @$pb.TagNumber(8)
  set activeRouteMinutesToArrival($core.double value) => $_setFloat(3, value);
  @$pb.TagNumber(8)
  $core.bool hasActiveRouteMinutesToArrival() => $_has(3);
  @$pb.TagNumber(8)
  void clearActiveRouteMinutesToArrival() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.double get activeRouteMilesToArrival => $_getN(4);
  @$pb.TagNumber(9)
  set activeRouteMilesToArrival($core.double value) => $_setFloat(4, value);
  @$pb.TagNumber(9)
  $core.bool hasActiveRouteMilesToArrival() => $_has(4);
  @$pb.TagNumber(9)
  void clearActiveRouteMilesToArrival() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.double get activeRouteTrafficMinutesDelay => $_getN(5);
  @$pb.TagNumber(10)
  set activeRouteTrafficMinutesDelay($core.double value) =>
      $_setFloat(5, value);
  @$pb.TagNumber(10)
  $core.bool hasActiveRouteTrafficMinutesDelay() => $_has(5);
  @$pb.TagNumber(10)
  void clearActiveRouteTrafficMinutesDelay() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.double get activeRouteEnergyAtArrival => $_getN(6);
  @$pb.TagNumber(11)
  set activeRouteEnergyAtArrival($core.double value) => $_setFloat(6, value);
  @$pb.TagNumber(11)
  $core.bool hasActiveRouteEnergyAtArrival() => $_has(6);
  @$pb.TagNumber(11)
  void clearActiveRouteEnergyAtArrival() => $_clearField(11);

  @$pb.TagNumber(12)
  $1.LatLong get activeRouteCoordinates => $_getN(7);
  @$pb.TagNumber(12)
  set activeRouteCoordinates($1.LatLong value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasActiveRouteCoordinates() => $_has(7);
  @$pb.TagNumber(12)
  void clearActiveRouteCoordinates() => $_clearField(12);
  @$pb.TagNumber(12)
  $1.LatLong ensureActiveRouteCoordinates() => $_ensure(7);

  @$pb.TagNumber(14)
  $core.int get lastRouteUpdate => $_getIZ(8);
  @$pb.TagNumber(14)
  set lastRouteUpdate($core.int value) => $_setUnsignedInt32(8, value);
  @$pb.TagNumber(14)
  $core.bool hasLastRouteUpdate() => $_has(8);
  @$pb.TagNumber(14)
  void clearLastRouteUpdate() => $_clearField(14);

  @$pb.TagNumber(15)
  $0.Timestamp get lastTrafficUpdate => $_getN(9);
  @$pb.TagNumber(15)
  set lastTrafficUpdate($0.Timestamp value) => $_setField(15, value);
  @$pb.TagNumber(15)
  $core.bool hasLastTrafficUpdate() => $_has(9);
  @$pb.TagNumber(15)
  void clearLastTrafficUpdate() => $_clearField(15);
  @$pb.TagNumber(15)
  $0.Timestamp ensureLastTrafficUpdate() => $_ensure(9);

  @$pb.TagNumber(102)
  $core.int get speed => $_getIZ(10);
  @$pb.TagNumber(102)
  set speed($core.int value) => $_setUnsignedInt32(10, value);
  @$pb.TagNumber(102)
  $core.bool hasSpeed() => $_has(10);
  @$pb.TagNumber(102)
  void clearSpeed() => $_clearField(102);

  @$pb.TagNumber(103)
  $core.int get power => $_getIZ(11);
  @$pb.TagNumber(103)
  set power($core.int value) => $_setSignedInt32(11, value);
  @$pb.TagNumber(103)
  $core.bool hasPower() => $_has(11);
  @$pb.TagNumber(103)
  void clearPower() => $_clearField(103);

  @$pb.TagNumber(105)
  $core.int get odometerInHundredthsOfAMile => $_getIZ(12);
  @$pb.TagNumber(105)
  set odometerInHundredthsOfAMile($core.int value) =>
      $_setSignedInt32(12, value);
  @$pb.TagNumber(105)
  $core.bool hasOdometerInHundredthsOfAMile() => $_has(12);
  @$pb.TagNumber(105)
  void clearOdometerInHundredthsOfAMile() => $_clearField(105);

  @$pb.TagNumber(106)
  $core.double get speedFloat => $_getN(13);
  @$pb.TagNumber(106)
  set speedFloat($core.double value) => $_setFloat(13, value);
  @$pb.TagNumber(106)
  $core.bool hasSpeedFloat() => $_has(13);
  @$pb.TagNumber(106)
  void clearSpeedFloat() => $_clearField(106);
}

enum ChargeState_CableType_Type { sNA, iEC, sAE, gBAC, gBDC, notSet }

class ChargeState_CableType extends $pb.GeneratedMessage {
  factory ChargeState_CableType({
    $1.Void? sNA,
    $1.Void? iEC,
    $1.Void? sAE,
    $1.Void? gBAC,
    $1.Void? gBDC,
  }) {
    final result = create();
    if (sNA != null) result.sNA = sNA;
    if (iEC != null) result.iEC = iEC;
    if (sAE != null) result.sAE = sAE;
    if (gBAC != null) result.gBAC = gBAC;
    if (gBDC != null) result.gBDC = gBDC;
    return result;
  }

  ChargeState_CableType._();

  factory ChargeState_CableType.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChargeState_CableType.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ChargeState_CableType_Type>
      _ChargeState_CableType_TypeByTag = {
    1: ChargeState_CableType_Type.sNA,
    2: ChargeState_CableType_Type.iEC,
    3: ChargeState_CableType_Type.sAE,
    4: ChargeState_CableType_Type.gBAC,
    5: ChargeState_CableType_Type.gBDC,
    0: ChargeState_CableType_Type.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChargeState.CableType',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5])
    ..aOM<$1.Void>(1, _omitFieldNames ? '' : 'SNA',
        protoName: 'SNA', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(2, _omitFieldNames ? '' : 'IEC',
        protoName: 'IEC', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(3, _omitFieldNames ? '' : 'SAE',
        protoName: 'SAE', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(4, _omitFieldNames ? '' : 'GBAC',
        protoName: 'GB_AC', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(5, _omitFieldNames ? '' : 'GBDC',
        protoName: 'GB_DC', subBuilder: $1.Void.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChargeState_CableType clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChargeState_CableType copyWith(
          void Function(ChargeState_CableType) updates) =>
      super.copyWith((message) => updates(message as ChargeState_CableType))
          as ChargeState_CableType;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChargeState_CableType create() => ChargeState_CableType._();
  @$core.override
  ChargeState_CableType createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChargeState_CableType getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChargeState_CableType>(create);
  static ChargeState_CableType? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  ChargeState_CableType_Type whichType() =>
      _ChargeState_CableType_TypeByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  void clearType() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $1.Void get sNA => $_getN(0);
  @$pb.TagNumber(1)
  set sNA($1.Void value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSNA() => $_has(0);
  @$pb.TagNumber(1)
  void clearSNA() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.Void ensureSNA() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.Void get iEC => $_getN(1);
  @$pb.TagNumber(2)
  set iEC($1.Void value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasIEC() => $_has(1);
  @$pb.TagNumber(2)
  void clearIEC() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.Void ensureIEC() => $_ensure(1);

  @$pb.TagNumber(3)
  $1.Void get sAE => $_getN(2);
  @$pb.TagNumber(3)
  set sAE($1.Void value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasSAE() => $_has(2);
  @$pb.TagNumber(3)
  void clearSAE() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.Void ensureSAE() => $_ensure(2);

  @$pb.TagNumber(4)
  $1.Void get gBAC => $_getN(3);
  @$pb.TagNumber(4)
  set gBAC($1.Void value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasGBAC() => $_has(3);
  @$pb.TagNumber(4)
  void clearGBAC() => $_clearField(4);
  @$pb.TagNumber(4)
  $1.Void ensureGBAC() => $_ensure(3);

  @$pb.TagNumber(5)
  $1.Void get gBDC => $_getN(4);
  @$pb.TagNumber(5)
  set gBDC($1.Void value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasGBDC() => $_has(4);
  @$pb.TagNumber(5)
  void clearGBDC() => $_clearField(5);
  @$pb.TagNumber(5)
  $1.Void ensureGBDC() => $_ensure(4);
}

enum ChargeState_ChargerType_Type {
  sNA,
  supercharger,
  chademo,
  gb,
  aCSingleWireCAN,
  combo,
  mCSingleWireCAN,
  other,
  tesla,
  notSet
}

class ChargeState_ChargerType extends $pb.GeneratedMessage {
  factory ChargeState_ChargerType({
    $1.Void? sNA,
    $1.Void? supercharger,
    $1.Void? chademo,
    $1.Void? gb,
    $1.Void? aCSingleWireCAN,
    $1.Void? combo,
    $1.Void? mCSingleWireCAN,
    $1.Void? other,
    $1.Void? tesla,
  }) {
    final result = create();
    if (sNA != null) result.sNA = sNA;
    if (supercharger != null) result.supercharger = supercharger;
    if (chademo != null) result.chademo = chademo;
    if (gb != null) result.gb = gb;
    if (aCSingleWireCAN != null) result.aCSingleWireCAN = aCSingleWireCAN;
    if (combo != null) result.combo = combo;
    if (mCSingleWireCAN != null) result.mCSingleWireCAN = mCSingleWireCAN;
    if (other != null) result.other = other;
    if (tesla != null) result.tesla = tesla;
    return result;
  }

  ChargeState_ChargerType._();

  factory ChargeState_ChargerType.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChargeState_ChargerType.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ChargeState_ChargerType_Type>
      _ChargeState_ChargerType_TypeByTag = {
    1: ChargeState_ChargerType_Type.sNA,
    2: ChargeState_ChargerType_Type.supercharger,
    3: ChargeState_ChargerType_Type.chademo,
    4: ChargeState_ChargerType_Type.gb,
    5: ChargeState_ChargerType_Type.aCSingleWireCAN,
    6: ChargeState_ChargerType_Type.combo,
    7: ChargeState_ChargerType_Type.mCSingleWireCAN,
    8: ChargeState_ChargerType_Type.other,
    9: ChargeState_ChargerType_Type.tesla,
    0: ChargeState_ChargerType_Type.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChargeState.ChargerType',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5, 6, 7, 8, 9])
    ..aOM<$1.Void>(1, _omitFieldNames ? '' : 'SNA',
        protoName: 'SNA', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(2, _omitFieldNames ? '' : 'Supercharger',
        protoName: 'Supercharger', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(3, _omitFieldNames ? '' : 'Chademo',
        protoName: 'Chademo', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(4, _omitFieldNames ? '' : 'Gb',
        protoName: 'Gb', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(5, _omitFieldNames ? '' : 'ACSingleWireCAN',
        protoName: 'ACSingleWireCAN', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(6, _omitFieldNames ? '' : 'Combo',
        protoName: 'Combo', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(7, _omitFieldNames ? '' : 'MCSingleWireCAN',
        protoName: 'MCSingleWireCAN', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(8, _omitFieldNames ? '' : 'Other',
        protoName: 'Other', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(9, _omitFieldNames ? '' : 'Tesla',
        protoName: 'Tesla', subBuilder: $1.Void.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChargeState_ChargerType clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChargeState_ChargerType copyWith(
          void Function(ChargeState_ChargerType) updates) =>
      super.copyWith((message) => updates(message as ChargeState_ChargerType))
          as ChargeState_ChargerType;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChargeState_ChargerType create() => ChargeState_ChargerType._();
  @$core.override
  ChargeState_ChargerType createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChargeState_ChargerType getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChargeState_ChargerType>(create);
  static ChargeState_ChargerType? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  ChargeState_ChargerType_Type whichType() =>
      _ChargeState_ChargerType_TypeByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  void clearType() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $1.Void get sNA => $_getN(0);
  @$pb.TagNumber(1)
  set sNA($1.Void value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSNA() => $_has(0);
  @$pb.TagNumber(1)
  void clearSNA() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.Void ensureSNA() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.Void get supercharger => $_getN(1);
  @$pb.TagNumber(2)
  set supercharger($1.Void value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasSupercharger() => $_has(1);
  @$pb.TagNumber(2)
  void clearSupercharger() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.Void ensureSupercharger() => $_ensure(1);

  @$pb.TagNumber(3)
  $1.Void get chademo => $_getN(2);
  @$pb.TagNumber(3)
  set chademo($1.Void value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasChademo() => $_has(2);
  @$pb.TagNumber(3)
  void clearChademo() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.Void ensureChademo() => $_ensure(2);

  @$pb.TagNumber(4)
  $1.Void get gb => $_getN(3);
  @$pb.TagNumber(4)
  set gb($1.Void value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasGb() => $_has(3);
  @$pb.TagNumber(4)
  void clearGb() => $_clearField(4);
  @$pb.TagNumber(4)
  $1.Void ensureGb() => $_ensure(3);

  @$pb.TagNumber(5)
  $1.Void get aCSingleWireCAN => $_getN(4);
  @$pb.TagNumber(5)
  set aCSingleWireCAN($1.Void value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasACSingleWireCAN() => $_has(4);
  @$pb.TagNumber(5)
  void clearACSingleWireCAN() => $_clearField(5);
  @$pb.TagNumber(5)
  $1.Void ensureACSingleWireCAN() => $_ensure(4);

  @$pb.TagNumber(6)
  $1.Void get combo => $_getN(5);
  @$pb.TagNumber(6)
  set combo($1.Void value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasCombo() => $_has(5);
  @$pb.TagNumber(6)
  void clearCombo() => $_clearField(6);
  @$pb.TagNumber(6)
  $1.Void ensureCombo() => $_ensure(5);

  @$pb.TagNumber(7)
  $1.Void get mCSingleWireCAN => $_getN(6);
  @$pb.TagNumber(7)
  set mCSingleWireCAN($1.Void value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasMCSingleWireCAN() => $_has(6);
  @$pb.TagNumber(7)
  void clearMCSingleWireCAN() => $_clearField(7);
  @$pb.TagNumber(7)
  $1.Void ensureMCSingleWireCAN() => $_ensure(6);

  @$pb.TagNumber(8)
  $1.Void get other => $_getN(7);
  @$pb.TagNumber(8)
  set other($1.Void value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasOther() => $_has(7);
  @$pb.TagNumber(8)
  void clearOther() => $_clearField(8);
  @$pb.TagNumber(8)
  $1.Void ensureOther() => $_ensure(7);

  @$pb.TagNumber(9)
  $1.Void get tesla => $_getN(8);
  @$pb.TagNumber(9)
  set tesla($1.Void value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasTesla() => $_has(8);
  @$pb.TagNumber(9)
  void clearTesla() => $_clearField(9);
  @$pb.TagNumber(9)
  $1.Void ensureTesla() => $_ensure(8);
}

enum ChargeState_ChargingState_Type {
  unknown,
  disconnected,
  noPower,
  starting,
  charging,
  complete,
  stopped,
  calibrating,
  notSet
}

class ChargeState_ChargingState extends $pb.GeneratedMessage {
  factory ChargeState_ChargingState({
    $1.Void? unknown,
    $1.Void? disconnected,
    $1.Void? noPower,
    $1.Void? starting,
    $1.Void? charging,
    $1.Void? complete,
    $1.Void? stopped,
    $1.Void? calibrating,
  }) {
    final result = create();
    if (unknown != null) result.unknown = unknown;
    if (disconnected != null) result.disconnected = disconnected;
    if (noPower != null) result.noPower = noPower;
    if (starting != null) result.starting = starting;
    if (charging != null) result.charging = charging;
    if (complete != null) result.complete = complete;
    if (stopped != null) result.stopped = stopped;
    if (calibrating != null) result.calibrating = calibrating;
    return result;
  }

  ChargeState_ChargingState._();

  factory ChargeState_ChargingState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChargeState_ChargingState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ChargeState_ChargingState_Type>
      _ChargeState_ChargingState_TypeByTag = {
    1: ChargeState_ChargingState_Type.unknown,
    2: ChargeState_ChargingState_Type.disconnected,
    3: ChargeState_ChargingState_Type.noPower,
    4: ChargeState_ChargingState_Type.starting,
    5: ChargeState_ChargingState_Type.charging,
    6: ChargeState_ChargingState_Type.complete,
    7: ChargeState_ChargingState_Type.stopped,
    8: ChargeState_ChargingState_Type.calibrating,
    0: ChargeState_ChargingState_Type.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChargeState.ChargingState',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5, 6, 7, 8])
    ..aOM<$1.Void>(1, _omitFieldNames ? '' : 'Unknown',
        protoName: 'Unknown', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(2, _omitFieldNames ? '' : 'Disconnected',
        protoName: 'Disconnected', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(3, _omitFieldNames ? '' : 'NoPower',
        protoName: 'NoPower', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(4, _omitFieldNames ? '' : 'Starting',
        protoName: 'Starting', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(5, _omitFieldNames ? '' : 'Charging',
        protoName: 'Charging', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(6, _omitFieldNames ? '' : 'Complete',
        protoName: 'Complete', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(7, _omitFieldNames ? '' : 'Stopped',
        protoName: 'Stopped', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(8, _omitFieldNames ? '' : 'Calibrating',
        protoName: 'Calibrating', subBuilder: $1.Void.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChargeState_ChargingState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChargeState_ChargingState copyWith(
          void Function(ChargeState_ChargingState) updates) =>
      super.copyWith((message) => updates(message as ChargeState_ChargingState))
          as ChargeState_ChargingState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChargeState_ChargingState create() => ChargeState_ChargingState._();
  @$core.override
  ChargeState_ChargingState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChargeState_ChargingState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChargeState_ChargingState>(create);
  static ChargeState_ChargingState? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  ChargeState_ChargingState_Type whichType() =>
      _ChargeState_ChargingState_TypeByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  void clearType() => $_clearField($_whichOneof(0));

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
  $1.Void get disconnected => $_getN(1);
  @$pb.TagNumber(2)
  set disconnected($1.Void value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasDisconnected() => $_has(1);
  @$pb.TagNumber(2)
  void clearDisconnected() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.Void ensureDisconnected() => $_ensure(1);

  @$pb.TagNumber(3)
  $1.Void get noPower => $_getN(2);
  @$pb.TagNumber(3)
  set noPower($1.Void value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasNoPower() => $_has(2);
  @$pb.TagNumber(3)
  void clearNoPower() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.Void ensureNoPower() => $_ensure(2);

  @$pb.TagNumber(4)
  $1.Void get starting => $_getN(3);
  @$pb.TagNumber(4)
  set starting($1.Void value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasStarting() => $_has(3);
  @$pb.TagNumber(4)
  void clearStarting() => $_clearField(4);
  @$pb.TagNumber(4)
  $1.Void ensureStarting() => $_ensure(3);

  @$pb.TagNumber(5)
  $1.Void get charging => $_getN(4);
  @$pb.TagNumber(5)
  set charging($1.Void value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasCharging() => $_has(4);
  @$pb.TagNumber(5)
  void clearCharging() => $_clearField(5);
  @$pb.TagNumber(5)
  $1.Void ensureCharging() => $_ensure(4);

  @$pb.TagNumber(6)
  $1.Void get complete => $_getN(5);
  @$pb.TagNumber(6)
  set complete($1.Void value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasComplete() => $_has(5);
  @$pb.TagNumber(6)
  void clearComplete() => $_clearField(6);
  @$pb.TagNumber(6)
  $1.Void ensureComplete() => $_ensure(5);

  @$pb.TagNumber(7)
  $1.Void get stopped => $_getN(6);
  @$pb.TagNumber(7)
  set stopped($1.Void value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasStopped() => $_has(6);
  @$pb.TagNumber(7)
  void clearStopped() => $_clearField(7);
  @$pb.TagNumber(7)
  $1.Void ensureStopped() => $_ensure(6);

  @$pb.TagNumber(8)
  $1.Void get calibrating => $_getN(7);
  @$pb.TagNumber(8)
  set calibrating($1.Void value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasCalibrating() => $_has(7);
  @$pb.TagNumber(8)
  void clearCalibrating() => $_clearField(8);
  @$pb.TagNumber(8)
  $1.Void ensureCalibrating() => $_ensure(7);
}

enum ChargeState_ChargerBrand_Type { tesla, sNA, notSet }

class ChargeState_ChargerBrand extends $pb.GeneratedMessage {
  factory ChargeState_ChargerBrand({
    $1.Void? tesla,
    $1.Void? sNA,
  }) {
    final result = create();
    if (tesla != null) result.tesla = tesla;
    if (sNA != null) result.sNA = sNA;
    return result;
  }

  ChargeState_ChargerBrand._();

  factory ChargeState_ChargerBrand.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChargeState_ChargerBrand.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ChargeState_ChargerBrand_Type>
      _ChargeState_ChargerBrand_TypeByTag = {
    1: ChargeState_ChargerBrand_Type.tesla,
    2: ChargeState_ChargerBrand_Type.sNA,
    0: ChargeState_ChargerBrand_Type.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChargeState.ChargerBrand',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<$1.Void>(1, _omitFieldNames ? '' : 'Tesla',
        protoName: 'Tesla', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(2, _omitFieldNames ? '' : 'SNA',
        protoName: 'SNA', subBuilder: $1.Void.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChargeState_ChargerBrand clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChargeState_ChargerBrand copyWith(
          void Function(ChargeState_ChargerBrand) updates) =>
      super.copyWith((message) => updates(message as ChargeState_ChargerBrand))
          as ChargeState_ChargerBrand;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChargeState_ChargerBrand create() => ChargeState_ChargerBrand._();
  @$core.override
  ChargeState_ChargerBrand createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChargeState_ChargerBrand getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChargeState_ChargerBrand>(create);
  static ChargeState_ChargerBrand? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  ChargeState_ChargerBrand_Type whichType() =>
      _ChargeState_ChargerBrand_TypeByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  void clearType() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $1.Void get tesla => $_getN(0);
  @$pb.TagNumber(1)
  set tesla($1.Void value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTesla() => $_has(0);
  @$pb.TagNumber(1)
  void clearTesla() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.Void ensureTesla() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.Void get sNA => $_getN(1);
  @$pb.TagNumber(2)
  set sNA($1.Void value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasSNA() => $_has(1);
  @$pb.TagNumber(2)
  void clearSNA() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.Void ensureSNA() => $_ensure(1);
}

enum ChargeState_OptionalChargeLimitSoc { chargeLimitSoc, notSet }

enum ChargeState_OptionalChargeLimitSocStd { chargeLimitSocStd, notSet }

enum ChargeState_OptionalChargeLimitSocMin { chargeLimitSocMin, notSet }

enum ChargeState_OptionalChargeLimitSocMax { chargeLimitSocMax, notSet }

enum ChargeState_OptionalMaxRangeChargeCounter { maxRangeChargeCounter, notSet }

enum ChargeState_OptionalFastChargerPresent { fastChargerPresent, notSet }

enum ChargeState_OptionalBatteryRange { batteryRange, notSet }

enum ChargeState_OptionalEstBatteryRange { estBatteryRange, notSet }

enum ChargeState_OptionalIdealBatteryRange { idealBatteryRange, notSet }

enum ChargeState_OptionalBatteryLevel { batteryLevel, notSet }

enum ChargeState_OptionalUsableBatteryLevel { usableBatteryLevel, notSet }

enum ChargeState_OptionalChargeEnergyAdded { chargeEnergyAdded, notSet }

enum ChargeState_OptionalChargeMilesAddedRated { chargeMilesAddedRated, notSet }

enum ChargeState_OptionalChargeMilesAddedIdeal { chargeMilesAddedIdeal, notSet }

enum ChargeState_OptionalChargerVoltage { chargerVoltage, notSet }

enum ChargeState_OptionalChargerPilotCurrent { chargerPilotCurrent, notSet }

enum ChargeState_OptionalChargerActualCurrent { chargerActualCurrent, notSet }

enum ChargeState_OptionalChargerPower { chargerPower, notSet }

enum ChargeState_OptionalMinutesToFullCharge { minutesToFullCharge, notSet }

enum ChargeState_OptionalMinutesToChargeLimit { minutesToChargeLimit, notSet }

enum ChargeState_OptionalTripCharging { tripCharging, notSet }

enum ChargeState_OptionalChargeRateMph { chargeRateMph, notSet }

enum ChargeState_OptionalChargePortDoorOpen { chargePortDoorOpen, notSet }

enum ChargeState_OptionalScheduledChargingStartTime {
  scheduledChargingStartTime,
  notSet
}

enum ChargeState_OptionalScheduledChargingPending {
  scheduledChargingPending,
  notSet
}

enum ChargeState_OptionalUserChargeEnableRequest {
  userChargeEnableRequest,
  notSet
}

enum ChargeState_OptionalChargeEnableRequest { chargeEnableRequest, notSet }

enum ChargeState_OptionalChargerPhases { chargerPhases, notSet }

enum ChargeState_OptionalChargePortColdWeatherMode {
  chargePortColdWeatherMode,
  notSet
}

enum ChargeState_OptionalChargeCurrentRequest { chargeCurrentRequest, notSet }

enum ChargeState_OptionalChargeCurrentRequestMax {
  chargeCurrentRequestMax,
  notSet
}

enum ChargeState_OptionalManagedChargingActive { managedChargingActive, notSet }

enum ChargeState_OptionalManagedChargingUserCanceled {
  managedChargingUserCanceled,
  notSet
}

enum ChargeState_OptionalManagedChargingStartTime {
  managedChargingStartTime,
  notSet
}

enum ChargeState_OptionalOffPeakHoursEndTime { offPeakHoursEndTime, notSet }

enum ChargeState_OptionalScheduledChargingMode { scheduledChargingMode, notSet }

enum ChargeState_OptionalChargingAmps { chargingAmps, notSet }

enum ChargeState_OptionalScheduledChargingStartTimeMinutes {
  scheduledChargingStartTimeMinutes,
  notSet
}

enum ChargeState_OptionalScheduledDepartureTimeMinutes {
  scheduledDepartureTimeMinutes,
  notSet
}

enum ChargeState_OptionalPreconditioningEnabled {
  preconditioningEnabled,
  notSet
}

enum ChargeState_OptionalScheduledChargingStartTimeApp {
  scheduledChargingStartTimeApp,
  notSet
}

enum ChargeState_OptionalSuperchargerSessionTripPlanner {
  superchargerSessionTripPlanner,
  notSet
}

enum ChargeState_OptionalChargePortColor { chargePortColor, notSet }

enum ChargeState_OptionalChargeRateMphFloat { chargeRateMphFloat, notSet }

enum ChargeState_OptionalChargeLimitReason { chargeLimitReason, notSet }

enum ChargeState_OptionalChargeCableUnlatched { chargeCableUnlatched, notSet }

enum ChargeState_OptionalOutletState { outletState, notSet }

enum ChargeState_OptionalPowerFeedState { powerFeedState, notSet }

enum ChargeState_OptionOutletSocLimit { outletSocLimit, notSet }

enum ChargeState_OptionPowerFeedSocLimit { powerFeedSocLimit, notSet }

enum ChargeState_OptionOutletTimeRemaining { outletTimeRemaining, notSet }

enum ChargeState_OptionPowerFeedTimeRemaining { powerFeedTimeRemaining, notSet }

enum ChargeState_OptionalPowershareFeatureAllowed {
  powershareFeatureAllowed,
  notSet
}

enum ChargeState_OptionalPowershareFeatureEnabled {
  powershareFeatureEnabled,
  notSet
}

enum ChargeState_OptionalPowershareRequest { powershareRequest, notSet }

enum ChargeState_OptionalPowershareType { powershareType, notSet }

enum ChargeState_OptionalPowershareStatus { powershareStatus, notSet }

enum ChargeState_OptionalPowershareStopReason { powershareStopReason, notSet }

enum ChargeState_OptionalPowershareInstantaneousLoadKw {
  powershareInstantaneousLoadKw,
  notSet
}

enum ChargeState_OptionalPowershareVehicleEnergyLeftHr {
  powershareVehicleEnergyLeftHr,
  notSet
}

enum ChargeState_OptionalPowershareSocLimit { powershareSocLimit, notSet }

enum ChargeState_OptionalOneTimeSocLimit { oneTimeSocLimit, notSet }

enum ChargeState_OptionalHomeLocation { homeLocation, notSet }

enum ChargeState_OptionalWorkLocation { workLocation, notSet }

enum ChargeState_OptionalOutletMaxTimerMinutes { outletMaxTimerMinutes, notSet }

class ChargeState extends $pb.GeneratedMessage {
  factory ChargeState({
    ChargeState_ChargingState? chargingState,
    ChargeState_ChargerType? fastChargerType,
    ChargeState_ChargerBrand? fastChargerBrand,
    ChargeState_CableType? connChargeCable,
    $0.Timestamp? scheduledDepartureTime,
    $1.ChargePortLatchState? chargePortLatch,
    $0.Timestamp? timestamp,
    $1.PreconditioningTimes? preconditioningTimes,
    $1.OffPeakChargingTimes? offPeakChargingTimes,
    $core.int? chargeLimitSoc,
    $core.int? chargeLimitSocStd,
    $core.int? chargeLimitSocMin,
    $core.int? chargeLimitSocMax,
    $core.int? maxRangeChargeCounter,
    $core.bool? fastChargerPresent,
    $core.double? batteryRange,
    $core.double? estBatteryRange,
    $core.double? idealBatteryRange,
    $core.int? batteryLevel,
    $core.int? usableBatteryLevel,
    $core.double? chargeEnergyAdded,
    $core.double? chargeMilesAddedRated,
    $core.double? chargeMilesAddedIdeal,
    $core.int? chargerVoltage,
    $core.int? chargerPilotCurrent,
    $core.int? chargerActualCurrent,
    $core.int? chargerPower,
    $core.int? minutesToFullCharge,
    $core.bool? tripCharging,
    $core.int? chargeRateMph,
    $core.bool? chargePortDoorOpen,
    $fixnum.Int64? scheduledChargingStartTime,
    $core.bool? scheduledChargingPending,
    $core.bool? userChargeEnableRequest,
    $core.bool? chargeEnableRequest,
    $core.int? chargerPhases,
    $core.bool? chargePortColdWeatherMode,
    $core.int? chargeCurrentRequest,
    $core.int? chargeCurrentRequestMax,
    $core.bool? managedChargingActive,
    $core.bool? managedChargingUserCanceled,
    $fixnum.Int64? managedChargingStartTime,
    $core.int? minutesToChargeLimit,
    $core.int? offPeakHoursEndTime,
    ChargeState_ScheduledChargingMode? scheduledChargingMode,
    $core.int? chargingAmps,
    $core.int? scheduledChargingStartTimeMinutes,
    $core.int? scheduledDepartureTimeMinutes,
    $core.bool? preconditioningEnabled,
    $core.int? scheduledChargingStartTimeApp,
    $core.bool? superchargerSessionTripPlanner,
    ChargeState_ChargePortColor_E? chargePortColor,
    $core.double? chargeRateMphFloat,
    ChargeState_ChargeLimitReason? chargeLimitReason,
    ManagedChargingState? managedChargingState,
    $core.bool? chargeCableUnlatched,
    ChargeState_OutletState? outletState,
    ChargeState_PowerFeedState? powerFeedState,
    $core.int? outletSocLimit,
    $core.int? powerFeedSocLimit,
    $fixnum.Int64? outletTimeRemaining,
    $fixnum.Int64? powerFeedTimeRemaining,
    $core.bool? powershareFeatureAllowed,
    $core.bool? powershareFeatureEnabled,
    $core.bool? powershareRequest,
    ChargeState_PowershareType? powershareType,
    ChargeState_PowershareStatus? powershareStatus,
    ChargeState_PowershareStopReason? powershareStopReason,
    $core.double? powershareInstantaneousLoadKw,
    $core.int? powershareVehicleEnergyLeftHr,
    $core.int? powershareSocLimit,
    $core.int? oneTimeSocLimit,
    $1.LatLong? homeLocation,
    $1.LatLong? workLocation,
    $core.int? outletMaxTimerMinutes,
  }) {
    final result = create();
    if (chargingState != null) result.chargingState = chargingState;
    if (fastChargerType != null) result.fastChargerType = fastChargerType;
    if (fastChargerBrand != null) result.fastChargerBrand = fastChargerBrand;
    if (connChargeCable != null) result.connChargeCable = connChargeCable;
    if (scheduledDepartureTime != null)
      result.scheduledDepartureTime = scheduledDepartureTime;
    if (chargePortLatch != null) result.chargePortLatch = chargePortLatch;
    if (timestamp != null) result.timestamp = timestamp;
    if (preconditioningTimes != null)
      result.preconditioningTimes = preconditioningTimes;
    if (offPeakChargingTimes != null)
      result.offPeakChargingTimes = offPeakChargingTimes;
    if (chargeLimitSoc != null) result.chargeLimitSoc = chargeLimitSoc;
    if (chargeLimitSocStd != null) result.chargeLimitSocStd = chargeLimitSocStd;
    if (chargeLimitSocMin != null) result.chargeLimitSocMin = chargeLimitSocMin;
    if (chargeLimitSocMax != null) result.chargeLimitSocMax = chargeLimitSocMax;
    if (maxRangeChargeCounter != null)
      result.maxRangeChargeCounter = maxRangeChargeCounter;
    if (fastChargerPresent != null)
      result.fastChargerPresent = fastChargerPresent;
    if (batteryRange != null) result.batteryRange = batteryRange;
    if (estBatteryRange != null) result.estBatteryRange = estBatteryRange;
    if (idealBatteryRange != null) result.idealBatteryRange = idealBatteryRange;
    if (batteryLevel != null) result.batteryLevel = batteryLevel;
    if (usableBatteryLevel != null)
      result.usableBatteryLevel = usableBatteryLevel;
    if (chargeEnergyAdded != null) result.chargeEnergyAdded = chargeEnergyAdded;
    if (chargeMilesAddedRated != null)
      result.chargeMilesAddedRated = chargeMilesAddedRated;
    if (chargeMilesAddedIdeal != null)
      result.chargeMilesAddedIdeal = chargeMilesAddedIdeal;
    if (chargerVoltage != null) result.chargerVoltage = chargerVoltage;
    if (chargerPilotCurrent != null)
      result.chargerPilotCurrent = chargerPilotCurrent;
    if (chargerActualCurrent != null)
      result.chargerActualCurrent = chargerActualCurrent;
    if (chargerPower != null) result.chargerPower = chargerPower;
    if (minutesToFullCharge != null)
      result.minutesToFullCharge = minutesToFullCharge;
    if (tripCharging != null) result.tripCharging = tripCharging;
    if (chargeRateMph != null) result.chargeRateMph = chargeRateMph;
    if (chargePortDoorOpen != null)
      result.chargePortDoorOpen = chargePortDoorOpen;
    if (scheduledChargingStartTime != null)
      result.scheduledChargingStartTime = scheduledChargingStartTime;
    if (scheduledChargingPending != null)
      result.scheduledChargingPending = scheduledChargingPending;
    if (userChargeEnableRequest != null)
      result.userChargeEnableRequest = userChargeEnableRequest;
    if (chargeEnableRequest != null)
      result.chargeEnableRequest = chargeEnableRequest;
    if (chargerPhases != null) result.chargerPhases = chargerPhases;
    if (chargePortColdWeatherMode != null)
      result.chargePortColdWeatherMode = chargePortColdWeatherMode;
    if (chargeCurrentRequest != null)
      result.chargeCurrentRequest = chargeCurrentRequest;
    if (chargeCurrentRequestMax != null)
      result.chargeCurrentRequestMax = chargeCurrentRequestMax;
    if (managedChargingActive != null)
      result.managedChargingActive = managedChargingActive;
    if (managedChargingUserCanceled != null)
      result.managedChargingUserCanceled = managedChargingUserCanceled;
    if (managedChargingStartTime != null)
      result.managedChargingStartTime = managedChargingStartTime;
    if (minutesToChargeLimit != null)
      result.minutesToChargeLimit = minutesToChargeLimit;
    if (offPeakHoursEndTime != null)
      result.offPeakHoursEndTime = offPeakHoursEndTime;
    if (scheduledChargingMode != null)
      result.scheduledChargingMode = scheduledChargingMode;
    if (chargingAmps != null) result.chargingAmps = chargingAmps;
    if (scheduledChargingStartTimeMinutes != null)
      result.scheduledChargingStartTimeMinutes =
          scheduledChargingStartTimeMinutes;
    if (scheduledDepartureTimeMinutes != null)
      result.scheduledDepartureTimeMinutes = scheduledDepartureTimeMinutes;
    if (preconditioningEnabled != null)
      result.preconditioningEnabled = preconditioningEnabled;
    if (scheduledChargingStartTimeApp != null)
      result.scheduledChargingStartTimeApp = scheduledChargingStartTimeApp;
    if (superchargerSessionTripPlanner != null)
      result.superchargerSessionTripPlanner = superchargerSessionTripPlanner;
    if (chargePortColor != null) result.chargePortColor = chargePortColor;
    if (chargeRateMphFloat != null)
      result.chargeRateMphFloat = chargeRateMphFloat;
    if (chargeLimitReason != null) result.chargeLimitReason = chargeLimitReason;
    if (managedChargingState != null)
      result.managedChargingState = managedChargingState;
    if (chargeCableUnlatched != null)
      result.chargeCableUnlatched = chargeCableUnlatched;
    if (outletState != null) result.outletState = outletState;
    if (powerFeedState != null) result.powerFeedState = powerFeedState;
    if (outletSocLimit != null) result.outletSocLimit = outletSocLimit;
    if (powerFeedSocLimit != null) result.powerFeedSocLimit = powerFeedSocLimit;
    if (outletTimeRemaining != null)
      result.outletTimeRemaining = outletTimeRemaining;
    if (powerFeedTimeRemaining != null)
      result.powerFeedTimeRemaining = powerFeedTimeRemaining;
    if (powershareFeatureAllowed != null)
      result.powershareFeatureAllowed = powershareFeatureAllowed;
    if (powershareFeatureEnabled != null)
      result.powershareFeatureEnabled = powershareFeatureEnabled;
    if (powershareRequest != null) result.powershareRequest = powershareRequest;
    if (powershareType != null) result.powershareType = powershareType;
    if (powershareStatus != null) result.powershareStatus = powershareStatus;
    if (powershareStopReason != null)
      result.powershareStopReason = powershareStopReason;
    if (powershareInstantaneousLoadKw != null)
      result.powershareInstantaneousLoadKw = powershareInstantaneousLoadKw;
    if (powershareVehicleEnergyLeftHr != null)
      result.powershareVehicleEnergyLeftHr = powershareVehicleEnergyLeftHr;
    if (powershareSocLimit != null)
      result.powershareSocLimit = powershareSocLimit;
    if (oneTimeSocLimit != null) result.oneTimeSocLimit = oneTimeSocLimit;
    if (homeLocation != null) result.homeLocation = homeLocation;
    if (workLocation != null) result.workLocation = workLocation;
    if (outletMaxTimerMinutes != null)
      result.outletMaxTimerMinutes = outletMaxTimerMinutes;
    return result;
  }

  ChargeState._();

  factory ChargeState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChargeState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ChargeState_OptionalChargeLimitSoc>
      _ChargeState_OptionalChargeLimitSocByTag = {
    104: ChargeState_OptionalChargeLimitSoc.chargeLimitSoc,
    0: ChargeState_OptionalChargeLimitSoc.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalChargeLimitSocStd>
      _ChargeState_OptionalChargeLimitSocStdByTag = {
    105: ChargeState_OptionalChargeLimitSocStd.chargeLimitSocStd,
    0: ChargeState_OptionalChargeLimitSocStd.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalChargeLimitSocMin>
      _ChargeState_OptionalChargeLimitSocMinByTag = {
    106: ChargeState_OptionalChargeLimitSocMin.chargeLimitSocMin,
    0: ChargeState_OptionalChargeLimitSocMin.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalChargeLimitSocMax>
      _ChargeState_OptionalChargeLimitSocMaxByTag = {
    107: ChargeState_OptionalChargeLimitSocMax.chargeLimitSocMax,
    0: ChargeState_OptionalChargeLimitSocMax.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalMaxRangeChargeCounter>
      _ChargeState_OptionalMaxRangeChargeCounterByTag = {
    109: ChargeState_OptionalMaxRangeChargeCounter.maxRangeChargeCounter,
    0: ChargeState_OptionalMaxRangeChargeCounter.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalFastChargerPresent>
      _ChargeState_OptionalFastChargerPresentByTag = {
    110: ChargeState_OptionalFastChargerPresent.fastChargerPresent,
    0: ChargeState_OptionalFastChargerPresent.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalBatteryRange>
      _ChargeState_OptionalBatteryRangeByTag = {
    111: ChargeState_OptionalBatteryRange.batteryRange,
    0: ChargeState_OptionalBatteryRange.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalEstBatteryRange>
      _ChargeState_OptionalEstBatteryRangeByTag = {
    112: ChargeState_OptionalEstBatteryRange.estBatteryRange,
    0: ChargeState_OptionalEstBatteryRange.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalIdealBatteryRange>
      _ChargeState_OptionalIdealBatteryRangeByTag = {
    113: ChargeState_OptionalIdealBatteryRange.idealBatteryRange,
    0: ChargeState_OptionalIdealBatteryRange.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalBatteryLevel>
      _ChargeState_OptionalBatteryLevelByTag = {
    114: ChargeState_OptionalBatteryLevel.batteryLevel,
    0: ChargeState_OptionalBatteryLevel.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalUsableBatteryLevel>
      _ChargeState_OptionalUsableBatteryLevelByTag = {
    115: ChargeState_OptionalUsableBatteryLevel.usableBatteryLevel,
    0: ChargeState_OptionalUsableBatteryLevel.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalChargeEnergyAdded>
      _ChargeState_OptionalChargeEnergyAddedByTag = {
    116: ChargeState_OptionalChargeEnergyAdded.chargeEnergyAdded,
    0: ChargeState_OptionalChargeEnergyAdded.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalChargeMilesAddedRated>
      _ChargeState_OptionalChargeMilesAddedRatedByTag = {
    117: ChargeState_OptionalChargeMilesAddedRated.chargeMilesAddedRated,
    0: ChargeState_OptionalChargeMilesAddedRated.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalChargeMilesAddedIdeal>
      _ChargeState_OptionalChargeMilesAddedIdealByTag = {
    118: ChargeState_OptionalChargeMilesAddedIdeal.chargeMilesAddedIdeal,
    0: ChargeState_OptionalChargeMilesAddedIdeal.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalChargerVoltage>
      _ChargeState_OptionalChargerVoltageByTag = {
    119: ChargeState_OptionalChargerVoltage.chargerVoltage,
    0: ChargeState_OptionalChargerVoltage.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalChargerPilotCurrent>
      _ChargeState_OptionalChargerPilotCurrentByTag = {
    120: ChargeState_OptionalChargerPilotCurrent.chargerPilotCurrent,
    0: ChargeState_OptionalChargerPilotCurrent.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalChargerActualCurrent>
      _ChargeState_OptionalChargerActualCurrentByTag = {
    121: ChargeState_OptionalChargerActualCurrent.chargerActualCurrent,
    0: ChargeState_OptionalChargerActualCurrent.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalChargerPower>
      _ChargeState_OptionalChargerPowerByTag = {
    122: ChargeState_OptionalChargerPower.chargerPower,
    0: ChargeState_OptionalChargerPower.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalMinutesToFullCharge>
      _ChargeState_OptionalMinutesToFullChargeByTag = {
    123: ChargeState_OptionalMinutesToFullCharge.minutesToFullCharge,
    0: ChargeState_OptionalMinutesToFullCharge.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalMinutesToChargeLimit>
      _ChargeState_OptionalMinutesToChargeLimitByTag = {
    142: ChargeState_OptionalMinutesToChargeLimit.minutesToChargeLimit,
    0: ChargeState_OptionalMinutesToChargeLimit.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalTripCharging>
      _ChargeState_OptionalTripChargingByTag = {
    125: ChargeState_OptionalTripCharging.tripCharging,
    0: ChargeState_OptionalTripCharging.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalChargeRateMph>
      _ChargeState_OptionalChargeRateMphByTag = {
    126: ChargeState_OptionalChargeRateMph.chargeRateMph,
    0: ChargeState_OptionalChargeRateMph.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalChargePortDoorOpen>
      _ChargeState_OptionalChargePortDoorOpenByTag = {
    127: ChargeState_OptionalChargePortDoorOpen.chargePortDoorOpen,
    0: ChargeState_OptionalChargePortDoorOpen.notSet
  };
  static const $core
      .Map<$core.int, ChargeState_OptionalScheduledChargingStartTime>
      _ChargeState_OptionalScheduledChargingStartTimeByTag = {
    129: ChargeState_OptionalScheduledChargingStartTime
        .scheduledChargingStartTime,
    0: ChargeState_OptionalScheduledChargingStartTime.notSet
  };
  static const $core
      .Map<$core.int, ChargeState_OptionalScheduledChargingPending>
      _ChargeState_OptionalScheduledChargingPendingByTag = {
    130: ChargeState_OptionalScheduledChargingPending.scheduledChargingPending,
    0: ChargeState_OptionalScheduledChargingPending.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalUserChargeEnableRequest>
      _ChargeState_OptionalUserChargeEnableRequestByTag = {
    132: ChargeState_OptionalUserChargeEnableRequest.userChargeEnableRequest,
    0: ChargeState_OptionalUserChargeEnableRequest.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalChargeEnableRequest>
      _ChargeState_OptionalChargeEnableRequestByTag = {
    133: ChargeState_OptionalChargeEnableRequest.chargeEnableRequest,
    0: ChargeState_OptionalChargeEnableRequest.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalChargerPhases>
      _ChargeState_OptionalChargerPhasesByTag = {
    134: ChargeState_OptionalChargerPhases.chargerPhases,
    0: ChargeState_OptionalChargerPhases.notSet
  };
  static const $core
      .Map<$core.int, ChargeState_OptionalChargePortColdWeatherMode>
      _ChargeState_OptionalChargePortColdWeatherModeByTag = {
    136:
        ChargeState_OptionalChargePortColdWeatherMode.chargePortColdWeatherMode,
    0: ChargeState_OptionalChargePortColdWeatherMode.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalChargeCurrentRequest>
      _ChargeState_OptionalChargeCurrentRequestByTag = {
    137: ChargeState_OptionalChargeCurrentRequest.chargeCurrentRequest,
    0: ChargeState_OptionalChargeCurrentRequest.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalChargeCurrentRequestMax>
      _ChargeState_OptionalChargeCurrentRequestMaxByTag = {
    138: ChargeState_OptionalChargeCurrentRequestMax.chargeCurrentRequestMax,
    0: ChargeState_OptionalChargeCurrentRequestMax.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalManagedChargingActive>
      _ChargeState_OptionalManagedChargingActiveByTag = {
    139: ChargeState_OptionalManagedChargingActive.managedChargingActive,
    0: ChargeState_OptionalManagedChargingActive.notSet
  };
  static const $core
      .Map<$core.int, ChargeState_OptionalManagedChargingUserCanceled>
      _ChargeState_OptionalManagedChargingUserCanceledByTag = {
    140: ChargeState_OptionalManagedChargingUserCanceled
        .managedChargingUserCanceled,
    0: ChargeState_OptionalManagedChargingUserCanceled.notSet
  };
  static const $core
      .Map<$core.int, ChargeState_OptionalManagedChargingStartTime>
      _ChargeState_OptionalManagedChargingStartTimeByTag = {
    141: ChargeState_OptionalManagedChargingStartTime.managedChargingStartTime,
    0: ChargeState_OptionalManagedChargingStartTime.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalOffPeakHoursEndTime>
      _ChargeState_OptionalOffPeakHoursEndTimeByTag = {
    147: ChargeState_OptionalOffPeakHoursEndTime.offPeakHoursEndTime,
    0: ChargeState_OptionalOffPeakHoursEndTime.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalScheduledChargingMode>
      _ChargeState_OptionalScheduledChargingModeByTag = {
    148: ChargeState_OptionalScheduledChargingMode.scheduledChargingMode,
    0: ChargeState_OptionalScheduledChargingMode.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalChargingAmps>
      _ChargeState_OptionalChargingAmpsByTag = {
    149: ChargeState_OptionalChargingAmps.chargingAmps,
    0: ChargeState_OptionalChargingAmps.notSet
  };
  static const $core
      .Map<$core.int, ChargeState_OptionalScheduledChargingStartTimeMinutes>
      _ChargeState_OptionalScheduledChargingStartTimeMinutesByTag = {
    150: ChargeState_OptionalScheduledChargingStartTimeMinutes
        .scheduledChargingStartTimeMinutes,
    0: ChargeState_OptionalScheduledChargingStartTimeMinutes.notSet
  };
  static const $core
      .Map<$core.int, ChargeState_OptionalScheduledDepartureTimeMinutes>
      _ChargeState_OptionalScheduledDepartureTimeMinutesByTag = {
    151: ChargeState_OptionalScheduledDepartureTimeMinutes
        .scheduledDepartureTimeMinutes,
    0: ChargeState_OptionalScheduledDepartureTimeMinutes.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalPreconditioningEnabled>
      _ChargeState_OptionalPreconditioningEnabledByTag = {
    152: ChargeState_OptionalPreconditioningEnabled.preconditioningEnabled,
    0: ChargeState_OptionalPreconditioningEnabled.notSet
  };
  static const $core
      .Map<$core.int, ChargeState_OptionalScheduledChargingStartTimeApp>
      _ChargeState_OptionalScheduledChargingStartTimeAppByTag = {
    153: ChargeState_OptionalScheduledChargingStartTimeApp
        .scheduledChargingStartTimeApp,
    0: ChargeState_OptionalScheduledChargingStartTimeApp.notSet
  };
  static const $core
      .Map<$core.int, ChargeState_OptionalSuperchargerSessionTripPlanner>
      _ChargeState_OptionalSuperchargerSessionTripPlannerByTag = {
    154: ChargeState_OptionalSuperchargerSessionTripPlanner
        .superchargerSessionTripPlanner,
    0: ChargeState_OptionalSuperchargerSessionTripPlanner.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalChargePortColor>
      _ChargeState_OptionalChargePortColorByTag = {
    155: ChargeState_OptionalChargePortColor.chargePortColor,
    0: ChargeState_OptionalChargePortColor.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalChargeRateMphFloat>
      _ChargeState_OptionalChargeRateMphFloatByTag = {
    156: ChargeState_OptionalChargeRateMphFloat.chargeRateMphFloat,
    0: ChargeState_OptionalChargeRateMphFloat.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalChargeLimitReason>
      _ChargeState_OptionalChargeLimitReasonByTag = {
    157: ChargeState_OptionalChargeLimitReason.chargeLimitReason,
    0: ChargeState_OptionalChargeLimitReason.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalChargeCableUnlatched>
      _ChargeState_OptionalChargeCableUnlatchedByTag = {
    159: ChargeState_OptionalChargeCableUnlatched.chargeCableUnlatched,
    0: ChargeState_OptionalChargeCableUnlatched.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalOutletState>
      _ChargeState_OptionalOutletStateByTag = {
    160: ChargeState_OptionalOutletState.outletState,
    0: ChargeState_OptionalOutletState.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalPowerFeedState>
      _ChargeState_OptionalPowerFeedStateByTag = {
    161: ChargeState_OptionalPowerFeedState.powerFeedState,
    0: ChargeState_OptionalPowerFeedState.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionOutletSocLimit>
      _ChargeState_OptionOutletSocLimitByTag = {
    162: ChargeState_OptionOutletSocLimit.outletSocLimit,
    0: ChargeState_OptionOutletSocLimit.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionPowerFeedSocLimit>
      _ChargeState_OptionPowerFeedSocLimitByTag = {
    163: ChargeState_OptionPowerFeedSocLimit.powerFeedSocLimit,
    0: ChargeState_OptionPowerFeedSocLimit.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionOutletTimeRemaining>
      _ChargeState_OptionOutletTimeRemainingByTag = {
    164: ChargeState_OptionOutletTimeRemaining.outletTimeRemaining,
    0: ChargeState_OptionOutletTimeRemaining.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionPowerFeedTimeRemaining>
      _ChargeState_OptionPowerFeedTimeRemainingByTag = {
    165: ChargeState_OptionPowerFeedTimeRemaining.powerFeedTimeRemaining,
    0: ChargeState_OptionPowerFeedTimeRemaining.notSet
  };
  static const $core
      .Map<$core.int, ChargeState_OptionalPowershareFeatureAllowed>
      _ChargeState_OptionalPowershareFeatureAllowedByTag = {
    166: ChargeState_OptionalPowershareFeatureAllowed.powershareFeatureAllowed,
    0: ChargeState_OptionalPowershareFeatureAllowed.notSet
  };
  static const $core
      .Map<$core.int, ChargeState_OptionalPowershareFeatureEnabled>
      _ChargeState_OptionalPowershareFeatureEnabledByTag = {
    167: ChargeState_OptionalPowershareFeatureEnabled.powershareFeatureEnabled,
    0: ChargeState_OptionalPowershareFeatureEnabled.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalPowershareRequest>
      _ChargeState_OptionalPowershareRequestByTag = {
    168: ChargeState_OptionalPowershareRequest.powershareRequest,
    0: ChargeState_OptionalPowershareRequest.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalPowershareType>
      _ChargeState_OptionalPowershareTypeByTag = {
    169: ChargeState_OptionalPowershareType.powershareType,
    0: ChargeState_OptionalPowershareType.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalPowershareStatus>
      _ChargeState_OptionalPowershareStatusByTag = {
    170: ChargeState_OptionalPowershareStatus.powershareStatus,
    0: ChargeState_OptionalPowershareStatus.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalPowershareStopReason>
      _ChargeState_OptionalPowershareStopReasonByTag = {
    171: ChargeState_OptionalPowershareStopReason.powershareStopReason,
    0: ChargeState_OptionalPowershareStopReason.notSet
  };
  static const $core
      .Map<$core.int, ChargeState_OptionalPowershareInstantaneousLoadKw>
      _ChargeState_OptionalPowershareInstantaneousLoadKwByTag = {
    172: ChargeState_OptionalPowershareInstantaneousLoadKw
        .powershareInstantaneousLoadKw,
    0: ChargeState_OptionalPowershareInstantaneousLoadKw.notSet
  };
  static const $core
      .Map<$core.int, ChargeState_OptionalPowershareVehicleEnergyLeftHr>
      _ChargeState_OptionalPowershareVehicleEnergyLeftHrByTag = {
    173: ChargeState_OptionalPowershareVehicleEnergyLeftHr
        .powershareVehicleEnergyLeftHr,
    0: ChargeState_OptionalPowershareVehicleEnergyLeftHr.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalPowershareSocLimit>
      _ChargeState_OptionalPowershareSocLimitByTag = {
    174: ChargeState_OptionalPowershareSocLimit.powershareSocLimit,
    0: ChargeState_OptionalPowershareSocLimit.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalOneTimeSocLimit>
      _ChargeState_OptionalOneTimeSocLimitByTag = {
    175: ChargeState_OptionalOneTimeSocLimit.oneTimeSocLimit,
    0: ChargeState_OptionalOneTimeSocLimit.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalHomeLocation>
      _ChargeState_OptionalHomeLocationByTag = {
    176: ChargeState_OptionalHomeLocation.homeLocation,
    0: ChargeState_OptionalHomeLocation.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalWorkLocation>
      _ChargeState_OptionalWorkLocationByTag = {
    177: ChargeState_OptionalWorkLocation.workLocation,
    0: ChargeState_OptionalWorkLocation.notSet
  };
  static const $core.Map<$core.int, ChargeState_OptionalOutletMaxTimerMinutes>
      _ChargeState_OptionalOutletMaxTimerMinutesByTag = {
    178: ChargeState_OptionalOutletMaxTimerMinutes.outletMaxTimerMinutes,
    0: ChargeState_OptionalOutletMaxTimerMinutes.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChargeState',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..oo(0, [104])
    ..oo(1, [105])
    ..oo(2, [106])
    ..oo(3, [107])
    ..oo(4, [109])
    ..oo(5, [110])
    ..oo(6, [111])
    ..oo(7, [112])
    ..oo(8, [113])
    ..oo(9, [114])
    ..oo(10, [115])
    ..oo(11, [116])
    ..oo(12, [117])
    ..oo(13, [118])
    ..oo(14, [119])
    ..oo(15, [120])
    ..oo(16, [121])
    ..oo(17, [122])
    ..oo(18, [123])
    ..oo(19, [142])
    ..oo(20, [125])
    ..oo(21, [126])
    ..oo(22, [127])
    ..oo(23, [129])
    ..oo(24, [130])
    ..oo(25, [132])
    ..oo(26, [133])
    ..oo(27, [134])
    ..oo(28, [136])
    ..oo(29, [137])
    ..oo(30, [138])
    ..oo(31, [139])
    ..oo(32, [140])
    ..oo(33, [141])
    ..oo(34, [147])
    ..oo(35, [148])
    ..oo(36, [149])
    ..oo(37, [150])
    ..oo(38, [151])
    ..oo(39, [152])
    ..oo(40, [153])
    ..oo(41, [154])
    ..oo(42, [155])
    ..oo(43, [156])
    ..oo(44, [157])
    ..oo(45, [159])
    ..oo(46, [160])
    ..oo(47, [161])
    ..oo(48, [162])
    ..oo(49, [163])
    ..oo(50, [164])
    ..oo(51, [165])
    ..oo(52, [166])
    ..oo(53, [167])
    ..oo(54, [168])
    ..oo(55, [169])
    ..oo(56, [170])
    ..oo(57, [171])
    ..oo(58, [172])
    ..oo(59, [173])
    ..oo(60, [174])
    ..oo(61, [175])
    ..oo(62, [176])
    ..oo(63, [177])
    ..oo(64, [178])
    ..aOM<ChargeState_ChargingState>(1, _omitFieldNames ? '' : 'chargingState',
        subBuilder: ChargeState_ChargingState.create)
    ..aOM<ChargeState_ChargerType>(2, _omitFieldNames ? '' : 'fastChargerType',
        subBuilder: ChargeState_ChargerType.create)
    ..aOM<ChargeState_ChargerBrand>(
        3, _omitFieldNames ? '' : 'fastChargerBrand',
        subBuilder: ChargeState_ChargerBrand.create)
    ..aOM<ChargeState_CableType>(28, _omitFieldNames ? '' : 'connChargeCable',
        subBuilder: ChargeState_CableType.create)
    ..aOM<$0.Timestamp>(31, _omitFieldNames ? '' : 'scheduledDepartureTime',
        subBuilder: $0.Timestamp.create)
    ..aOM<$1.ChargePortLatchState>(35, _omitFieldNames ? '' : 'chargePortLatch',
        subBuilder: $1.ChargePortLatchState.create)
    ..aOM<$0.Timestamp>(44, _omitFieldNames ? '' : 'timestamp',
        subBuilder: $0.Timestamp.create)
    ..aOM<$1.PreconditioningTimes>(
        45, _omitFieldNames ? '' : 'preconditioningTimes',
        subBuilder: $1.PreconditioningTimes.create)
    ..aOM<$1.OffPeakChargingTimes>(
        46, _omitFieldNames ? '' : 'offPeakChargingTimes',
        subBuilder: $1.OffPeakChargingTimes.create)
    ..aI(104, _omitFieldNames ? '' : 'chargeLimitSoc')
    ..aI(105, _omitFieldNames ? '' : 'chargeLimitSocStd')
    ..aI(106, _omitFieldNames ? '' : 'chargeLimitSocMin')
    ..aI(107, _omitFieldNames ? '' : 'chargeLimitSocMax')
    ..aI(109, _omitFieldNames ? '' : 'maxRangeChargeCounter')
    ..aOB(110, _omitFieldNames ? '' : 'fastChargerPresent')
    ..aD(111, _omitFieldNames ? '' : 'batteryRange',
        fieldType: $pb.PbFieldType.OF)
    ..aD(112, _omitFieldNames ? '' : 'estBatteryRange',
        fieldType: $pb.PbFieldType.OF)
    ..aD(113, _omitFieldNames ? '' : 'idealBatteryRange',
        fieldType: $pb.PbFieldType.OF)
    ..aI(114, _omitFieldNames ? '' : 'batteryLevel')
    ..aI(115, _omitFieldNames ? '' : 'usableBatteryLevel')
    ..aD(116, _omitFieldNames ? '' : 'chargeEnergyAdded',
        fieldType: $pb.PbFieldType.OF)
    ..aD(117, _omitFieldNames ? '' : 'chargeMilesAddedRated',
        fieldType: $pb.PbFieldType.OF)
    ..aD(118, _omitFieldNames ? '' : 'chargeMilesAddedIdeal',
        fieldType: $pb.PbFieldType.OF)
    ..aI(119, _omitFieldNames ? '' : 'chargerVoltage')
    ..aI(120, _omitFieldNames ? '' : 'chargerPilotCurrent')
    ..aI(121, _omitFieldNames ? '' : 'chargerActualCurrent')
    ..aI(122, _omitFieldNames ? '' : 'chargerPower')
    ..aI(123, _omitFieldNames ? '' : 'minutesToFullCharge')
    ..aOB(125, _omitFieldNames ? '' : 'tripCharging')
    ..aI(126, _omitFieldNames ? '' : 'chargeRateMph')
    ..aOB(127, _omitFieldNames ? '' : 'chargePortDoorOpen')
    ..a<$fixnum.Int64>(129, _omitFieldNames ? '' : 'scheduledChargingStartTime',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(130, _omitFieldNames ? '' : 'scheduledChargingPending')
    ..aOB(132, _omitFieldNames ? '' : 'userChargeEnableRequest')
    ..aOB(133, _omitFieldNames ? '' : 'chargeEnableRequest')
    ..aI(134, _omitFieldNames ? '' : 'chargerPhases')
    ..aOB(136, _omitFieldNames ? '' : 'chargePortColdWeatherMode')
    ..aI(137, _omitFieldNames ? '' : 'chargeCurrentRequest')
    ..aI(138, _omitFieldNames ? '' : 'chargeCurrentRequestMax')
    ..aOB(139, _omitFieldNames ? '' : 'managedChargingActive')
    ..aOB(140, _omitFieldNames ? '' : 'managedChargingUserCanceled')
    ..a<$fixnum.Int64>(141, _omitFieldNames ? '' : 'managedChargingStartTime',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(142, _omitFieldNames ? '' : 'minutesToChargeLimit')
    ..aI(147, _omitFieldNames ? '' : 'offPeakHoursEndTime',
        fieldType: $pb.PbFieldType.OU3)
    ..aE<ChargeState_ScheduledChargingMode>(
        148, _omitFieldNames ? '' : 'scheduledChargingMode',
        enumValues: ChargeState_ScheduledChargingMode.values)
    ..aI(149, _omitFieldNames ? '' : 'chargingAmps')
    ..aI(150, _omitFieldNames ? '' : 'scheduledChargingStartTimeMinutes',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(151, _omitFieldNames ? '' : 'scheduledDepartureTimeMinutes',
        fieldType: $pb.PbFieldType.OU3)
    ..aOB(152, _omitFieldNames ? '' : 'preconditioningEnabled')
    ..aI(153, _omitFieldNames ? '' : 'scheduledChargingStartTimeApp',
        fieldType: $pb.PbFieldType.OS3)
    ..aOB(154, _omitFieldNames ? '' : 'superchargerSessionTripPlanner')
    ..aE<ChargeState_ChargePortColor_E>(
        155, _omitFieldNames ? '' : 'chargePortColor',
        enumValues: ChargeState_ChargePortColor_E.values)
    ..aD(156, _omitFieldNames ? '' : 'chargeRateMphFloat',
        fieldType: $pb.PbFieldType.OF)
    ..aE<ChargeState_ChargeLimitReason>(
        157, _omitFieldNames ? '' : 'chargeLimitReason',
        enumValues: ChargeState_ChargeLimitReason.values)
    ..aOM<ManagedChargingState>(
        158, _omitFieldNames ? '' : 'managedChargingState',
        subBuilder: ManagedChargingState.create)
    ..aOB(159, _omitFieldNames ? '' : 'chargeCableUnlatched')
    ..aE<ChargeState_OutletState>(160, _omitFieldNames ? '' : 'outletState',
        enumValues: ChargeState_OutletState.values)
    ..aE<ChargeState_PowerFeedState>(
        161, _omitFieldNames ? '' : 'powerFeedState',
        enumValues: ChargeState_PowerFeedState.values)
    ..aI(162, _omitFieldNames ? '' : 'outletSocLimit')
    ..aI(163, _omitFieldNames ? '' : 'powerFeedSocLimit')
    ..aInt64(164, _omitFieldNames ? '' : 'outletTimeRemaining')
    ..aInt64(165, _omitFieldNames ? '' : 'powerFeedTimeRemaining')
    ..aOB(166, _omitFieldNames ? '' : 'powershareFeatureAllowed')
    ..aOB(167, _omitFieldNames ? '' : 'powershareFeatureEnabled')
    ..aOB(168, _omitFieldNames ? '' : 'powershareRequest')
    ..aE<ChargeState_PowershareType>(
        169, _omitFieldNames ? '' : 'powershareType',
        enumValues: ChargeState_PowershareType.values)
    ..aE<ChargeState_PowershareStatus>(
        170, _omitFieldNames ? '' : 'powershareStatus',
        enumValues: ChargeState_PowershareStatus.values)
    ..aE<ChargeState_PowershareStopReason>(
        171, _omitFieldNames ? '' : 'powershareStopReason',
        enumValues: ChargeState_PowershareStopReason.values)
    ..aD(172, _omitFieldNames ? '' : 'powershareInstantaneousLoadKw',
        fieldType: $pb.PbFieldType.OF)
    ..aI(173, _omitFieldNames ? '' : 'powershareVehicleEnergyLeftHr')
    ..aI(174, _omitFieldNames ? '' : 'powershareSocLimit')
    ..aI(175, _omitFieldNames ? '' : 'oneTimeSocLimit')
    ..aOM<$1.LatLong>(176, _omitFieldNames ? '' : 'homeLocation',
        subBuilder: $1.LatLong.create)
    ..aOM<$1.LatLong>(177, _omitFieldNames ? '' : 'workLocation',
        subBuilder: $1.LatLong.create)
    ..aI(178, _omitFieldNames ? '' : 'outletMaxTimerMinutes')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChargeState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChargeState copyWith(void Function(ChargeState) updates) =>
      super.copyWith((message) => updates(message as ChargeState))
          as ChargeState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChargeState create() => ChargeState._();
  @$core.override
  ChargeState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChargeState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChargeState>(create);
  static ChargeState? _defaultInstance;

  @$pb.TagNumber(104)
  ChargeState_OptionalChargeLimitSoc whichOptionalChargeLimitSoc() =>
      _ChargeState_OptionalChargeLimitSocByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(104)
  void clearOptionalChargeLimitSoc() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(105)
  ChargeState_OptionalChargeLimitSocStd whichOptionalChargeLimitSocStd() =>
      _ChargeState_OptionalChargeLimitSocStdByTag[$_whichOneof(1)]!;
  @$pb.TagNumber(105)
  void clearOptionalChargeLimitSocStd() => $_clearField($_whichOneof(1));

  @$pb.TagNumber(106)
  ChargeState_OptionalChargeLimitSocMin whichOptionalChargeLimitSocMin() =>
      _ChargeState_OptionalChargeLimitSocMinByTag[$_whichOneof(2)]!;
  @$pb.TagNumber(106)
  void clearOptionalChargeLimitSocMin() => $_clearField($_whichOneof(2));

  @$pb.TagNumber(107)
  ChargeState_OptionalChargeLimitSocMax whichOptionalChargeLimitSocMax() =>
      _ChargeState_OptionalChargeLimitSocMaxByTag[$_whichOneof(3)]!;
  @$pb.TagNumber(107)
  void clearOptionalChargeLimitSocMax() => $_clearField($_whichOneof(3));

  @$pb.TagNumber(109)
  ChargeState_OptionalMaxRangeChargeCounter
      whichOptionalMaxRangeChargeCounter() =>
          _ChargeState_OptionalMaxRangeChargeCounterByTag[$_whichOneof(4)]!;
  @$pb.TagNumber(109)
  void clearOptionalMaxRangeChargeCounter() => $_clearField($_whichOneof(4));

  @$pb.TagNumber(110)
  ChargeState_OptionalFastChargerPresent whichOptionalFastChargerPresent() =>
      _ChargeState_OptionalFastChargerPresentByTag[$_whichOneof(5)]!;
  @$pb.TagNumber(110)
  void clearOptionalFastChargerPresent() => $_clearField($_whichOneof(5));

  @$pb.TagNumber(111)
  ChargeState_OptionalBatteryRange whichOptionalBatteryRange() =>
      _ChargeState_OptionalBatteryRangeByTag[$_whichOneof(6)]!;
  @$pb.TagNumber(111)
  void clearOptionalBatteryRange() => $_clearField($_whichOneof(6));

  @$pb.TagNumber(112)
  ChargeState_OptionalEstBatteryRange whichOptionalEstBatteryRange() =>
      _ChargeState_OptionalEstBatteryRangeByTag[$_whichOneof(7)]!;
  @$pb.TagNumber(112)
  void clearOptionalEstBatteryRange() => $_clearField($_whichOneof(7));

  @$pb.TagNumber(113)
  ChargeState_OptionalIdealBatteryRange whichOptionalIdealBatteryRange() =>
      _ChargeState_OptionalIdealBatteryRangeByTag[$_whichOneof(8)]!;
  @$pb.TagNumber(113)
  void clearOptionalIdealBatteryRange() => $_clearField($_whichOneof(8));

  @$pb.TagNumber(114)
  ChargeState_OptionalBatteryLevel whichOptionalBatteryLevel() =>
      _ChargeState_OptionalBatteryLevelByTag[$_whichOneof(9)]!;
  @$pb.TagNumber(114)
  void clearOptionalBatteryLevel() => $_clearField($_whichOneof(9));

  @$pb.TagNumber(115)
  ChargeState_OptionalUsableBatteryLevel whichOptionalUsableBatteryLevel() =>
      _ChargeState_OptionalUsableBatteryLevelByTag[$_whichOneof(10)]!;
  @$pb.TagNumber(115)
  void clearOptionalUsableBatteryLevel() => $_clearField($_whichOneof(10));

  @$pb.TagNumber(116)
  ChargeState_OptionalChargeEnergyAdded whichOptionalChargeEnergyAdded() =>
      _ChargeState_OptionalChargeEnergyAddedByTag[$_whichOneof(11)]!;
  @$pb.TagNumber(116)
  void clearOptionalChargeEnergyAdded() => $_clearField($_whichOneof(11));

  @$pb.TagNumber(117)
  ChargeState_OptionalChargeMilesAddedRated
      whichOptionalChargeMilesAddedRated() =>
          _ChargeState_OptionalChargeMilesAddedRatedByTag[$_whichOneof(12)]!;
  @$pb.TagNumber(117)
  void clearOptionalChargeMilesAddedRated() => $_clearField($_whichOneof(12));

  @$pb.TagNumber(118)
  ChargeState_OptionalChargeMilesAddedIdeal
      whichOptionalChargeMilesAddedIdeal() =>
          _ChargeState_OptionalChargeMilesAddedIdealByTag[$_whichOneof(13)]!;
  @$pb.TagNumber(118)
  void clearOptionalChargeMilesAddedIdeal() => $_clearField($_whichOneof(13));

  @$pb.TagNumber(119)
  ChargeState_OptionalChargerVoltage whichOptionalChargerVoltage() =>
      _ChargeState_OptionalChargerVoltageByTag[$_whichOneof(14)]!;
  @$pb.TagNumber(119)
  void clearOptionalChargerVoltage() => $_clearField($_whichOneof(14));

  @$pb.TagNumber(120)
  ChargeState_OptionalChargerPilotCurrent whichOptionalChargerPilotCurrent() =>
      _ChargeState_OptionalChargerPilotCurrentByTag[$_whichOneof(15)]!;
  @$pb.TagNumber(120)
  void clearOptionalChargerPilotCurrent() => $_clearField($_whichOneof(15));

  @$pb.TagNumber(121)
  ChargeState_OptionalChargerActualCurrent
      whichOptionalChargerActualCurrent() =>
          _ChargeState_OptionalChargerActualCurrentByTag[$_whichOneof(16)]!;
  @$pb.TagNumber(121)
  void clearOptionalChargerActualCurrent() => $_clearField($_whichOneof(16));

  @$pb.TagNumber(122)
  ChargeState_OptionalChargerPower whichOptionalChargerPower() =>
      _ChargeState_OptionalChargerPowerByTag[$_whichOneof(17)]!;
  @$pb.TagNumber(122)
  void clearOptionalChargerPower() => $_clearField($_whichOneof(17));

  @$pb.TagNumber(123)
  ChargeState_OptionalMinutesToFullCharge whichOptionalMinutesToFullCharge() =>
      _ChargeState_OptionalMinutesToFullChargeByTag[$_whichOneof(18)]!;
  @$pb.TagNumber(123)
  void clearOptionalMinutesToFullCharge() => $_clearField($_whichOneof(18));

  @$pb.TagNumber(142)
  ChargeState_OptionalMinutesToChargeLimit
      whichOptionalMinutesToChargeLimit() =>
          _ChargeState_OptionalMinutesToChargeLimitByTag[$_whichOneof(19)]!;
  @$pb.TagNumber(142)
  void clearOptionalMinutesToChargeLimit() => $_clearField($_whichOneof(19));

  @$pb.TagNumber(125)
  ChargeState_OptionalTripCharging whichOptionalTripCharging() =>
      _ChargeState_OptionalTripChargingByTag[$_whichOneof(20)]!;
  @$pb.TagNumber(125)
  void clearOptionalTripCharging() => $_clearField($_whichOneof(20));

  @$pb.TagNumber(126)
  ChargeState_OptionalChargeRateMph whichOptionalChargeRateMph() =>
      _ChargeState_OptionalChargeRateMphByTag[$_whichOneof(21)]!;
  @$pb.TagNumber(126)
  void clearOptionalChargeRateMph() => $_clearField($_whichOneof(21));

  @$pb.TagNumber(127)
  ChargeState_OptionalChargePortDoorOpen whichOptionalChargePortDoorOpen() =>
      _ChargeState_OptionalChargePortDoorOpenByTag[$_whichOneof(22)]!;
  @$pb.TagNumber(127)
  void clearOptionalChargePortDoorOpen() => $_clearField($_whichOneof(22));

  @$pb.TagNumber(129)
  ChargeState_OptionalScheduledChargingStartTime
      whichOptionalScheduledChargingStartTime() =>
          _ChargeState_OptionalScheduledChargingStartTimeByTag[
              $_whichOneof(23)]!;
  @$pb.TagNumber(129)
  void clearOptionalScheduledChargingStartTime() =>
      $_clearField($_whichOneof(23));

  @$pb.TagNumber(130)
  ChargeState_OptionalScheduledChargingPending
      whichOptionalScheduledChargingPending() =>
          _ChargeState_OptionalScheduledChargingPendingByTag[$_whichOneof(24)]!;
  @$pb.TagNumber(130)
  void clearOptionalScheduledChargingPending() =>
      $_clearField($_whichOneof(24));

  @$pb.TagNumber(132)
  ChargeState_OptionalUserChargeEnableRequest
      whichOptionalUserChargeEnableRequest() =>
          _ChargeState_OptionalUserChargeEnableRequestByTag[$_whichOneof(25)]!;
  @$pb.TagNumber(132)
  void clearOptionalUserChargeEnableRequest() => $_clearField($_whichOneof(25));

  @$pb.TagNumber(133)
  ChargeState_OptionalChargeEnableRequest whichOptionalChargeEnableRequest() =>
      _ChargeState_OptionalChargeEnableRequestByTag[$_whichOneof(26)]!;
  @$pb.TagNumber(133)
  void clearOptionalChargeEnableRequest() => $_clearField($_whichOneof(26));

  @$pb.TagNumber(134)
  ChargeState_OptionalChargerPhases whichOptionalChargerPhases() =>
      _ChargeState_OptionalChargerPhasesByTag[$_whichOneof(27)]!;
  @$pb.TagNumber(134)
  void clearOptionalChargerPhases() => $_clearField($_whichOneof(27));

  @$pb.TagNumber(136)
  ChargeState_OptionalChargePortColdWeatherMode
      whichOptionalChargePortColdWeatherMode() =>
          _ChargeState_OptionalChargePortColdWeatherModeByTag[
              $_whichOneof(28)]!;
  @$pb.TagNumber(136)
  void clearOptionalChargePortColdWeatherMode() =>
      $_clearField($_whichOneof(28));

  @$pb.TagNumber(137)
  ChargeState_OptionalChargeCurrentRequest
      whichOptionalChargeCurrentRequest() =>
          _ChargeState_OptionalChargeCurrentRequestByTag[$_whichOneof(29)]!;
  @$pb.TagNumber(137)
  void clearOptionalChargeCurrentRequest() => $_clearField($_whichOneof(29));

  @$pb.TagNumber(138)
  ChargeState_OptionalChargeCurrentRequestMax
      whichOptionalChargeCurrentRequestMax() =>
          _ChargeState_OptionalChargeCurrentRequestMaxByTag[$_whichOneof(30)]!;
  @$pb.TagNumber(138)
  void clearOptionalChargeCurrentRequestMax() => $_clearField($_whichOneof(30));

  @$pb.TagNumber(139)
  ChargeState_OptionalManagedChargingActive
      whichOptionalManagedChargingActive() =>
          _ChargeState_OptionalManagedChargingActiveByTag[$_whichOneof(31)]!;
  @$pb.TagNumber(139)
  void clearOptionalManagedChargingActive() => $_clearField($_whichOneof(31));

  @$pb.TagNumber(140)
  ChargeState_OptionalManagedChargingUserCanceled
      whichOptionalManagedChargingUserCanceled() =>
          _ChargeState_OptionalManagedChargingUserCanceledByTag[
              $_whichOneof(32)]!;
  @$pb.TagNumber(140)
  void clearOptionalManagedChargingUserCanceled() =>
      $_clearField($_whichOneof(32));

  @$pb.TagNumber(141)
  ChargeState_OptionalManagedChargingStartTime
      whichOptionalManagedChargingStartTime() =>
          _ChargeState_OptionalManagedChargingStartTimeByTag[$_whichOneof(33)]!;
  @$pb.TagNumber(141)
  void clearOptionalManagedChargingStartTime() =>
      $_clearField($_whichOneof(33));

  @$pb.TagNumber(147)
  ChargeState_OptionalOffPeakHoursEndTime whichOptionalOffPeakHoursEndTime() =>
      _ChargeState_OptionalOffPeakHoursEndTimeByTag[$_whichOneof(34)]!;
  @$pb.TagNumber(147)
  void clearOptionalOffPeakHoursEndTime() => $_clearField($_whichOneof(34));

  @$pb.TagNumber(148)
  ChargeState_OptionalScheduledChargingMode
      whichOptionalScheduledChargingMode() =>
          _ChargeState_OptionalScheduledChargingModeByTag[$_whichOneof(35)]!;
  @$pb.TagNumber(148)
  void clearOptionalScheduledChargingMode() => $_clearField($_whichOneof(35));

  @$pb.TagNumber(149)
  ChargeState_OptionalChargingAmps whichOptionalChargingAmps() =>
      _ChargeState_OptionalChargingAmpsByTag[$_whichOneof(36)]!;
  @$pb.TagNumber(149)
  void clearOptionalChargingAmps() => $_clearField($_whichOneof(36));

  @$pb.TagNumber(150)
  ChargeState_OptionalScheduledChargingStartTimeMinutes
      whichOptionalScheduledChargingStartTimeMinutes() =>
          _ChargeState_OptionalScheduledChargingStartTimeMinutesByTag[
              $_whichOneof(37)]!;
  @$pb.TagNumber(150)
  void clearOptionalScheduledChargingStartTimeMinutes() =>
      $_clearField($_whichOneof(37));

  @$pb.TagNumber(151)
  ChargeState_OptionalScheduledDepartureTimeMinutes
      whichOptionalScheduledDepartureTimeMinutes() =>
          _ChargeState_OptionalScheduledDepartureTimeMinutesByTag[
              $_whichOneof(38)]!;
  @$pb.TagNumber(151)
  void clearOptionalScheduledDepartureTimeMinutes() =>
      $_clearField($_whichOneof(38));

  @$pb.TagNumber(152)
  ChargeState_OptionalPreconditioningEnabled
      whichOptionalPreconditioningEnabled() =>
          _ChargeState_OptionalPreconditioningEnabledByTag[$_whichOneof(39)]!;
  @$pb.TagNumber(152)
  void clearOptionalPreconditioningEnabled() => $_clearField($_whichOneof(39));

  @$pb.TagNumber(153)
  ChargeState_OptionalScheduledChargingStartTimeApp
      whichOptionalScheduledChargingStartTimeApp() =>
          _ChargeState_OptionalScheduledChargingStartTimeAppByTag[
              $_whichOneof(40)]!;
  @$pb.TagNumber(153)
  void clearOptionalScheduledChargingStartTimeApp() =>
      $_clearField($_whichOneof(40));

  @$pb.TagNumber(154)
  ChargeState_OptionalSuperchargerSessionTripPlanner
      whichOptionalSuperchargerSessionTripPlanner() =>
          _ChargeState_OptionalSuperchargerSessionTripPlannerByTag[
              $_whichOneof(41)]!;
  @$pb.TagNumber(154)
  void clearOptionalSuperchargerSessionTripPlanner() =>
      $_clearField($_whichOneof(41));

  @$pb.TagNumber(155)
  ChargeState_OptionalChargePortColor whichOptionalChargePortColor() =>
      _ChargeState_OptionalChargePortColorByTag[$_whichOneof(42)]!;
  @$pb.TagNumber(155)
  void clearOptionalChargePortColor() => $_clearField($_whichOneof(42));

  @$pb.TagNumber(156)
  ChargeState_OptionalChargeRateMphFloat whichOptionalChargeRateMphFloat() =>
      _ChargeState_OptionalChargeRateMphFloatByTag[$_whichOneof(43)]!;
  @$pb.TagNumber(156)
  void clearOptionalChargeRateMphFloat() => $_clearField($_whichOneof(43));

  @$pb.TagNumber(157)
  ChargeState_OptionalChargeLimitReason whichOptionalChargeLimitReason() =>
      _ChargeState_OptionalChargeLimitReasonByTag[$_whichOneof(44)]!;
  @$pb.TagNumber(157)
  void clearOptionalChargeLimitReason() => $_clearField($_whichOneof(44));

  @$pb.TagNumber(159)
  ChargeState_OptionalChargeCableUnlatched
      whichOptionalChargeCableUnlatched() =>
          _ChargeState_OptionalChargeCableUnlatchedByTag[$_whichOneof(45)]!;
  @$pb.TagNumber(159)
  void clearOptionalChargeCableUnlatched() => $_clearField($_whichOneof(45));

  @$pb.TagNumber(160)
  ChargeState_OptionalOutletState whichOptionalOutletState() =>
      _ChargeState_OptionalOutletStateByTag[$_whichOneof(46)]!;
  @$pb.TagNumber(160)
  void clearOptionalOutletState() => $_clearField($_whichOneof(46));

  @$pb.TagNumber(161)
  ChargeState_OptionalPowerFeedState whichOptionalPowerFeedState() =>
      _ChargeState_OptionalPowerFeedStateByTag[$_whichOneof(47)]!;
  @$pb.TagNumber(161)
  void clearOptionalPowerFeedState() => $_clearField($_whichOneof(47));

  @$pb.TagNumber(162)
  ChargeState_OptionOutletSocLimit whichOptionOutletSocLimit() =>
      _ChargeState_OptionOutletSocLimitByTag[$_whichOneof(48)]!;
  @$pb.TagNumber(162)
  void clearOptionOutletSocLimit() => $_clearField($_whichOneof(48));

  @$pb.TagNumber(163)
  ChargeState_OptionPowerFeedSocLimit whichOptionPowerFeedSocLimit() =>
      _ChargeState_OptionPowerFeedSocLimitByTag[$_whichOneof(49)]!;
  @$pb.TagNumber(163)
  void clearOptionPowerFeedSocLimit() => $_clearField($_whichOneof(49));

  @$pb.TagNumber(164)
  ChargeState_OptionOutletTimeRemaining whichOptionOutletTimeRemaining() =>
      _ChargeState_OptionOutletTimeRemainingByTag[$_whichOneof(50)]!;
  @$pb.TagNumber(164)
  void clearOptionOutletTimeRemaining() => $_clearField($_whichOneof(50));

  @$pb.TagNumber(165)
  ChargeState_OptionPowerFeedTimeRemaining
      whichOptionPowerFeedTimeRemaining() =>
          _ChargeState_OptionPowerFeedTimeRemainingByTag[$_whichOneof(51)]!;
  @$pb.TagNumber(165)
  void clearOptionPowerFeedTimeRemaining() => $_clearField($_whichOneof(51));

  @$pb.TagNumber(166)
  ChargeState_OptionalPowershareFeatureAllowed
      whichOptionalPowershareFeatureAllowed() =>
          _ChargeState_OptionalPowershareFeatureAllowedByTag[$_whichOneof(52)]!;
  @$pb.TagNumber(166)
  void clearOptionalPowershareFeatureAllowed() =>
      $_clearField($_whichOneof(52));

  @$pb.TagNumber(167)
  ChargeState_OptionalPowershareFeatureEnabled
      whichOptionalPowershareFeatureEnabled() =>
          _ChargeState_OptionalPowershareFeatureEnabledByTag[$_whichOneof(53)]!;
  @$pb.TagNumber(167)
  void clearOptionalPowershareFeatureEnabled() =>
      $_clearField($_whichOneof(53));

  @$pb.TagNumber(168)
  ChargeState_OptionalPowershareRequest whichOptionalPowershareRequest() =>
      _ChargeState_OptionalPowershareRequestByTag[$_whichOneof(54)]!;
  @$pb.TagNumber(168)
  void clearOptionalPowershareRequest() => $_clearField($_whichOneof(54));

  @$pb.TagNumber(169)
  ChargeState_OptionalPowershareType whichOptionalPowershareType() =>
      _ChargeState_OptionalPowershareTypeByTag[$_whichOneof(55)]!;
  @$pb.TagNumber(169)
  void clearOptionalPowershareType() => $_clearField($_whichOneof(55));

  @$pb.TagNumber(170)
  ChargeState_OptionalPowershareStatus whichOptionalPowershareStatus() =>
      _ChargeState_OptionalPowershareStatusByTag[$_whichOneof(56)]!;
  @$pb.TagNumber(170)
  void clearOptionalPowershareStatus() => $_clearField($_whichOneof(56));

  @$pb.TagNumber(171)
  ChargeState_OptionalPowershareStopReason
      whichOptionalPowershareStopReason() =>
          _ChargeState_OptionalPowershareStopReasonByTag[$_whichOneof(57)]!;
  @$pb.TagNumber(171)
  void clearOptionalPowershareStopReason() => $_clearField($_whichOneof(57));

  @$pb.TagNumber(172)
  ChargeState_OptionalPowershareInstantaneousLoadKw
      whichOptionalPowershareInstantaneousLoadKw() =>
          _ChargeState_OptionalPowershareInstantaneousLoadKwByTag[
              $_whichOneof(58)]!;
  @$pb.TagNumber(172)
  void clearOptionalPowershareInstantaneousLoadKw() =>
      $_clearField($_whichOneof(58));

  @$pb.TagNumber(173)
  ChargeState_OptionalPowershareVehicleEnergyLeftHr
      whichOptionalPowershareVehicleEnergyLeftHr() =>
          _ChargeState_OptionalPowershareVehicleEnergyLeftHrByTag[
              $_whichOneof(59)]!;
  @$pb.TagNumber(173)
  void clearOptionalPowershareVehicleEnergyLeftHr() =>
      $_clearField($_whichOneof(59));

  @$pb.TagNumber(174)
  ChargeState_OptionalPowershareSocLimit whichOptionalPowershareSocLimit() =>
      _ChargeState_OptionalPowershareSocLimitByTag[$_whichOneof(60)]!;
  @$pb.TagNumber(174)
  void clearOptionalPowershareSocLimit() => $_clearField($_whichOneof(60));

  @$pb.TagNumber(175)
  ChargeState_OptionalOneTimeSocLimit whichOptionalOneTimeSocLimit() =>
      _ChargeState_OptionalOneTimeSocLimitByTag[$_whichOneof(61)]!;
  @$pb.TagNumber(175)
  void clearOptionalOneTimeSocLimit() => $_clearField($_whichOneof(61));

  @$pb.TagNumber(176)
  ChargeState_OptionalHomeLocation whichOptionalHomeLocation() =>
      _ChargeState_OptionalHomeLocationByTag[$_whichOneof(62)]!;
  @$pb.TagNumber(176)
  void clearOptionalHomeLocation() => $_clearField($_whichOneof(62));

  @$pb.TagNumber(177)
  ChargeState_OptionalWorkLocation whichOptionalWorkLocation() =>
      _ChargeState_OptionalWorkLocationByTag[$_whichOneof(63)]!;
  @$pb.TagNumber(177)
  void clearOptionalWorkLocation() => $_clearField($_whichOneof(63));

  @$pb.TagNumber(178)
  ChargeState_OptionalOutletMaxTimerMinutes
      whichOptionalOutletMaxTimerMinutes() =>
          _ChargeState_OptionalOutletMaxTimerMinutesByTag[$_whichOneof(64)]!;
  @$pb.TagNumber(178)
  void clearOptionalOutletMaxTimerMinutes() => $_clearField($_whichOneof(64));

  @$pb.TagNumber(1)
  ChargeState_ChargingState get chargingState => $_getN(0);
  @$pb.TagNumber(1)
  set chargingState(ChargeState_ChargingState value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasChargingState() => $_has(0);
  @$pb.TagNumber(1)
  void clearChargingState() => $_clearField(1);
  @$pb.TagNumber(1)
  ChargeState_ChargingState ensureChargingState() => $_ensure(0);

  @$pb.TagNumber(2)
  ChargeState_ChargerType get fastChargerType => $_getN(1);
  @$pb.TagNumber(2)
  set fastChargerType(ChargeState_ChargerType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasFastChargerType() => $_has(1);
  @$pb.TagNumber(2)
  void clearFastChargerType() => $_clearField(2);
  @$pb.TagNumber(2)
  ChargeState_ChargerType ensureFastChargerType() => $_ensure(1);

  @$pb.TagNumber(3)
  ChargeState_ChargerBrand get fastChargerBrand => $_getN(2);
  @$pb.TagNumber(3)
  set fastChargerBrand(ChargeState_ChargerBrand value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasFastChargerBrand() => $_has(2);
  @$pb.TagNumber(3)
  void clearFastChargerBrand() => $_clearField(3);
  @$pb.TagNumber(3)
  ChargeState_ChargerBrand ensureFastChargerBrand() => $_ensure(2);

  @$pb.TagNumber(28)
  ChargeState_CableType get connChargeCable => $_getN(3);
  @$pb.TagNumber(28)
  set connChargeCable(ChargeState_CableType value) => $_setField(28, value);
  @$pb.TagNumber(28)
  $core.bool hasConnChargeCable() => $_has(3);
  @$pb.TagNumber(28)
  void clearConnChargeCable() => $_clearField(28);
  @$pb.TagNumber(28)
  ChargeState_CableType ensureConnChargeCable() => $_ensure(3);

  @$pb.TagNumber(31)
  $0.Timestamp get scheduledDepartureTime => $_getN(4);
  @$pb.TagNumber(31)
  set scheduledDepartureTime($0.Timestamp value) => $_setField(31, value);
  @$pb.TagNumber(31)
  $core.bool hasScheduledDepartureTime() => $_has(4);
  @$pb.TagNumber(31)
  void clearScheduledDepartureTime() => $_clearField(31);
  @$pb.TagNumber(31)
  $0.Timestamp ensureScheduledDepartureTime() => $_ensure(4);

  @$pb.TagNumber(35)
  $1.ChargePortLatchState get chargePortLatch => $_getN(5);
  @$pb.TagNumber(35)
  set chargePortLatch($1.ChargePortLatchState value) => $_setField(35, value);
  @$pb.TagNumber(35)
  $core.bool hasChargePortLatch() => $_has(5);
  @$pb.TagNumber(35)
  void clearChargePortLatch() => $_clearField(35);
  @$pb.TagNumber(35)
  $1.ChargePortLatchState ensureChargePortLatch() => $_ensure(5);

  @$pb.TagNumber(44)
  $0.Timestamp get timestamp => $_getN(6);
  @$pb.TagNumber(44)
  set timestamp($0.Timestamp value) => $_setField(44, value);
  @$pb.TagNumber(44)
  $core.bool hasTimestamp() => $_has(6);
  @$pb.TagNumber(44)
  void clearTimestamp() => $_clearField(44);
  @$pb.TagNumber(44)
  $0.Timestamp ensureTimestamp() => $_ensure(6);

  @$pb.TagNumber(45)
  $1.PreconditioningTimes get preconditioningTimes => $_getN(7);
  @$pb.TagNumber(45)
  set preconditioningTimes($1.PreconditioningTimes value) =>
      $_setField(45, value);
  @$pb.TagNumber(45)
  $core.bool hasPreconditioningTimes() => $_has(7);
  @$pb.TagNumber(45)
  void clearPreconditioningTimes() => $_clearField(45);
  @$pb.TagNumber(45)
  $1.PreconditioningTimes ensurePreconditioningTimes() => $_ensure(7);

  @$pb.TagNumber(46)
  $1.OffPeakChargingTimes get offPeakChargingTimes => $_getN(8);
  @$pb.TagNumber(46)
  set offPeakChargingTimes($1.OffPeakChargingTimes value) =>
      $_setField(46, value);
  @$pb.TagNumber(46)
  $core.bool hasOffPeakChargingTimes() => $_has(8);
  @$pb.TagNumber(46)
  void clearOffPeakChargingTimes() => $_clearField(46);
  @$pb.TagNumber(46)
  $1.OffPeakChargingTimes ensureOffPeakChargingTimes() => $_ensure(8);

  @$pb.TagNumber(104)
  $core.int get chargeLimitSoc => $_getIZ(9);
  @$pb.TagNumber(104)
  set chargeLimitSoc($core.int value) => $_setSignedInt32(9, value);
  @$pb.TagNumber(104)
  $core.bool hasChargeLimitSoc() => $_has(9);
  @$pb.TagNumber(104)
  void clearChargeLimitSoc() => $_clearField(104);

  @$pb.TagNumber(105)
  $core.int get chargeLimitSocStd => $_getIZ(10);
  @$pb.TagNumber(105)
  set chargeLimitSocStd($core.int value) => $_setSignedInt32(10, value);
  @$pb.TagNumber(105)
  $core.bool hasChargeLimitSocStd() => $_has(10);
  @$pb.TagNumber(105)
  void clearChargeLimitSocStd() => $_clearField(105);

  @$pb.TagNumber(106)
  $core.int get chargeLimitSocMin => $_getIZ(11);
  @$pb.TagNumber(106)
  set chargeLimitSocMin($core.int value) => $_setSignedInt32(11, value);
  @$pb.TagNumber(106)
  $core.bool hasChargeLimitSocMin() => $_has(11);
  @$pb.TagNumber(106)
  void clearChargeLimitSocMin() => $_clearField(106);

  @$pb.TagNumber(107)
  $core.int get chargeLimitSocMax => $_getIZ(12);
  @$pb.TagNumber(107)
  set chargeLimitSocMax($core.int value) => $_setSignedInt32(12, value);
  @$pb.TagNumber(107)
  $core.bool hasChargeLimitSocMax() => $_has(12);
  @$pb.TagNumber(107)
  void clearChargeLimitSocMax() => $_clearField(107);

  @$pb.TagNumber(109)
  $core.int get maxRangeChargeCounter => $_getIZ(13);
  @$pb.TagNumber(109)
  set maxRangeChargeCounter($core.int value) => $_setSignedInt32(13, value);
  @$pb.TagNumber(109)
  $core.bool hasMaxRangeChargeCounter() => $_has(13);
  @$pb.TagNumber(109)
  void clearMaxRangeChargeCounter() => $_clearField(109);

  @$pb.TagNumber(110)
  $core.bool get fastChargerPresent => $_getBF(14);
  @$pb.TagNumber(110)
  set fastChargerPresent($core.bool value) => $_setBool(14, value);
  @$pb.TagNumber(110)
  $core.bool hasFastChargerPresent() => $_has(14);
  @$pb.TagNumber(110)
  void clearFastChargerPresent() => $_clearField(110);

  @$pb.TagNumber(111)
  $core.double get batteryRange => $_getN(15);
  @$pb.TagNumber(111)
  set batteryRange($core.double value) => $_setFloat(15, value);
  @$pb.TagNumber(111)
  $core.bool hasBatteryRange() => $_has(15);
  @$pb.TagNumber(111)
  void clearBatteryRange() => $_clearField(111);

  @$pb.TagNumber(112)
  $core.double get estBatteryRange => $_getN(16);
  @$pb.TagNumber(112)
  set estBatteryRange($core.double value) => $_setFloat(16, value);
  @$pb.TagNumber(112)
  $core.bool hasEstBatteryRange() => $_has(16);
  @$pb.TagNumber(112)
  void clearEstBatteryRange() => $_clearField(112);

  @$pb.TagNumber(113)
  $core.double get idealBatteryRange => $_getN(17);
  @$pb.TagNumber(113)
  set idealBatteryRange($core.double value) => $_setFloat(17, value);
  @$pb.TagNumber(113)
  $core.bool hasIdealBatteryRange() => $_has(17);
  @$pb.TagNumber(113)
  void clearIdealBatteryRange() => $_clearField(113);

  @$pb.TagNumber(114)
  $core.int get batteryLevel => $_getIZ(18);
  @$pb.TagNumber(114)
  set batteryLevel($core.int value) => $_setSignedInt32(18, value);
  @$pb.TagNumber(114)
  $core.bool hasBatteryLevel() => $_has(18);
  @$pb.TagNumber(114)
  void clearBatteryLevel() => $_clearField(114);

  @$pb.TagNumber(115)
  $core.int get usableBatteryLevel => $_getIZ(19);
  @$pb.TagNumber(115)
  set usableBatteryLevel($core.int value) => $_setSignedInt32(19, value);
  @$pb.TagNumber(115)
  $core.bool hasUsableBatteryLevel() => $_has(19);
  @$pb.TagNumber(115)
  void clearUsableBatteryLevel() => $_clearField(115);

  @$pb.TagNumber(116)
  $core.double get chargeEnergyAdded => $_getN(20);
  @$pb.TagNumber(116)
  set chargeEnergyAdded($core.double value) => $_setFloat(20, value);
  @$pb.TagNumber(116)
  $core.bool hasChargeEnergyAdded() => $_has(20);
  @$pb.TagNumber(116)
  void clearChargeEnergyAdded() => $_clearField(116);

  @$pb.TagNumber(117)
  $core.double get chargeMilesAddedRated => $_getN(21);
  @$pb.TagNumber(117)
  set chargeMilesAddedRated($core.double value) => $_setFloat(21, value);
  @$pb.TagNumber(117)
  $core.bool hasChargeMilesAddedRated() => $_has(21);
  @$pb.TagNumber(117)
  void clearChargeMilesAddedRated() => $_clearField(117);

  @$pb.TagNumber(118)
  $core.double get chargeMilesAddedIdeal => $_getN(22);
  @$pb.TagNumber(118)
  set chargeMilesAddedIdeal($core.double value) => $_setFloat(22, value);
  @$pb.TagNumber(118)
  $core.bool hasChargeMilesAddedIdeal() => $_has(22);
  @$pb.TagNumber(118)
  void clearChargeMilesAddedIdeal() => $_clearField(118);

  @$pb.TagNumber(119)
  $core.int get chargerVoltage => $_getIZ(23);
  @$pb.TagNumber(119)
  set chargerVoltage($core.int value) => $_setSignedInt32(23, value);
  @$pb.TagNumber(119)
  $core.bool hasChargerVoltage() => $_has(23);
  @$pb.TagNumber(119)
  void clearChargerVoltage() => $_clearField(119);

  @$pb.TagNumber(120)
  $core.int get chargerPilotCurrent => $_getIZ(24);
  @$pb.TagNumber(120)
  set chargerPilotCurrent($core.int value) => $_setSignedInt32(24, value);
  @$pb.TagNumber(120)
  $core.bool hasChargerPilotCurrent() => $_has(24);
  @$pb.TagNumber(120)
  void clearChargerPilotCurrent() => $_clearField(120);

  @$pb.TagNumber(121)
  $core.int get chargerActualCurrent => $_getIZ(25);
  @$pb.TagNumber(121)
  set chargerActualCurrent($core.int value) => $_setSignedInt32(25, value);
  @$pb.TagNumber(121)
  $core.bool hasChargerActualCurrent() => $_has(25);
  @$pb.TagNumber(121)
  void clearChargerActualCurrent() => $_clearField(121);

  @$pb.TagNumber(122)
  $core.int get chargerPower => $_getIZ(26);
  @$pb.TagNumber(122)
  set chargerPower($core.int value) => $_setSignedInt32(26, value);
  @$pb.TagNumber(122)
  $core.bool hasChargerPower() => $_has(26);
  @$pb.TagNumber(122)
  void clearChargerPower() => $_clearField(122);

  @$pb.TagNumber(123)
  $core.int get minutesToFullCharge => $_getIZ(27);
  @$pb.TagNumber(123)
  set minutesToFullCharge($core.int value) => $_setSignedInt32(27, value);
  @$pb.TagNumber(123)
  $core.bool hasMinutesToFullCharge() => $_has(27);
  @$pb.TagNumber(123)
  void clearMinutesToFullCharge() => $_clearField(123);

  @$pb.TagNumber(125)
  $core.bool get tripCharging => $_getBF(28);
  @$pb.TagNumber(125)
  set tripCharging($core.bool value) => $_setBool(28, value);
  @$pb.TagNumber(125)
  $core.bool hasTripCharging() => $_has(28);
  @$pb.TagNumber(125)
  void clearTripCharging() => $_clearField(125);

  @$pb.TagNumber(126)
  $core.int get chargeRateMph => $_getIZ(29);
  @$pb.TagNumber(126)
  set chargeRateMph($core.int value) => $_setSignedInt32(29, value);
  @$pb.TagNumber(126)
  $core.bool hasChargeRateMph() => $_has(29);
  @$pb.TagNumber(126)
  void clearChargeRateMph() => $_clearField(126);

  @$pb.TagNumber(127)
  $core.bool get chargePortDoorOpen => $_getBF(30);
  @$pb.TagNumber(127)
  set chargePortDoorOpen($core.bool value) => $_setBool(30, value);
  @$pb.TagNumber(127)
  $core.bool hasChargePortDoorOpen() => $_has(30);
  @$pb.TagNumber(127)
  void clearChargePortDoorOpen() => $_clearField(127);

  @$pb.TagNumber(129)
  $fixnum.Int64 get scheduledChargingStartTime => $_getI64(31);
  @$pb.TagNumber(129)
  set scheduledChargingStartTime($fixnum.Int64 value) => $_setInt64(31, value);
  @$pb.TagNumber(129)
  $core.bool hasScheduledChargingStartTime() => $_has(31);
  @$pb.TagNumber(129)
  void clearScheduledChargingStartTime() => $_clearField(129);

  @$pb.TagNumber(130)
  $core.bool get scheduledChargingPending => $_getBF(32);
  @$pb.TagNumber(130)
  set scheduledChargingPending($core.bool value) => $_setBool(32, value);
  @$pb.TagNumber(130)
  $core.bool hasScheduledChargingPending() => $_has(32);
  @$pb.TagNumber(130)
  void clearScheduledChargingPending() => $_clearField(130);

  @$pb.TagNumber(132)
  $core.bool get userChargeEnableRequest => $_getBF(33);
  @$pb.TagNumber(132)
  set userChargeEnableRequest($core.bool value) => $_setBool(33, value);
  @$pb.TagNumber(132)
  $core.bool hasUserChargeEnableRequest() => $_has(33);
  @$pb.TagNumber(132)
  void clearUserChargeEnableRequest() => $_clearField(132);

  @$pb.TagNumber(133)
  $core.bool get chargeEnableRequest => $_getBF(34);
  @$pb.TagNumber(133)
  set chargeEnableRequest($core.bool value) => $_setBool(34, value);
  @$pb.TagNumber(133)
  $core.bool hasChargeEnableRequest() => $_has(34);
  @$pb.TagNumber(133)
  void clearChargeEnableRequest() => $_clearField(133);

  @$pb.TagNumber(134)
  $core.int get chargerPhases => $_getIZ(35);
  @$pb.TagNumber(134)
  set chargerPhases($core.int value) => $_setSignedInt32(35, value);
  @$pb.TagNumber(134)
  $core.bool hasChargerPhases() => $_has(35);
  @$pb.TagNumber(134)
  void clearChargerPhases() => $_clearField(134);

  @$pb.TagNumber(136)
  $core.bool get chargePortColdWeatherMode => $_getBF(36);
  @$pb.TagNumber(136)
  set chargePortColdWeatherMode($core.bool value) => $_setBool(36, value);
  @$pb.TagNumber(136)
  $core.bool hasChargePortColdWeatherMode() => $_has(36);
  @$pb.TagNumber(136)
  void clearChargePortColdWeatherMode() => $_clearField(136);

  @$pb.TagNumber(137)
  $core.int get chargeCurrentRequest => $_getIZ(37);
  @$pb.TagNumber(137)
  set chargeCurrentRequest($core.int value) => $_setSignedInt32(37, value);
  @$pb.TagNumber(137)
  $core.bool hasChargeCurrentRequest() => $_has(37);
  @$pb.TagNumber(137)
  void clearChargeCurrentRequest() => $_clearField(137);

  @$pb.TagNumber(138)
  $core.int get chargeCurrentRequestMax => $_getIZ(38);
  @$pb.TagNumber(138)
  set chargeCurrentRequestMax($core.int value) => $_setSignedInt32(38, value);
  @$pb.TagNumber(138)
  $core.bool hasChargeCurrentRequestMax() => $_has(38);
  @$pb.TagNumber(138)
  void clearChargeCurrentRequestMax() => $_clearField(138);

  @$pb.TagNumber(139)
  $core.bool get managedChargingActive => $_getBF(39);
  @$pb.TagNumber(139)
  set managedChargingActive($core.bool value) => $_setBool(39, value);
  @$pb.TagNumber(139)
  $core.bool hasManagedChargingActive() => $_has(39);
  @$pb.TagNumber(139)
  void clearManagedChargingActive() => $_clearField(139);

  @$pb.TagNumber(140)
  $core.bool get managedChargingUserCanceled => $_getBF(40);
  @$pb.TagNumber(140)
  set managedChargingUserCanceled($core.bool value) => $_setBool(40, value);
  @$pb.TagNumber(140)
  $core.bool hasManagedChargingUserCanceled() => $_has(40);
  @$pb.TagNumber(140)
  void clearManagedChargingUserCanceled() => $_clearField(140);

  @$pb.TagNumber(141)
  $fixnum.Int64 get managedChargingStartTime => $_getI64(41);
  @$pb.TagNumber(141)
  set managedChargingStartTime($fixnum.Int64 value) => $_setInt64(41, value);
  @$pb.TagNumber(141)
  $core.bool hasManagedChargingStartTime() => $_has(41);
  @$pb.TagNumber(141)
  void clearManagedChargingStartTime() => $_clearField(141);

  @$pb.TagNumber(142)
  $core.int get minutesToChargeLimit => $_getIZ(42);
  @$pb.TagNumber(142)
  set minutesToChargeLimit($core.int value) => $_setSignedInt32(42, value);
  @$pb.TagNumber(142)
  $core.bool hasMinutesToChargeLimit() => $_has(42);
  @$pb.TagNumber(142)
  void clearMinutesToChargeLimit() => $_clearField(142);

  @$pb.TagNumber(147)
  $core.int get offPeakHoursEndTime => $_getIZ(43);
  @$pb.TagNumber(147)
  set offPeakHoursEndTime($core.int value) => $_setUnsignedInt32(43, value);
  @$pb.TagNumber(147)
  $core.bool hasOffPeakHoursEndTime() => $_has(43);
  @$pb.TagNumber(147)
  void clearOffPeakHoursEndTime() => $_clearField(147);

  @$pb.TagNumber(148)
  ChargeState_ScheduledChargingMode get scheduledChargingMode => $_getN(44);
  @$pb.TagNumber(148)
  set scheduledChargingMode(ChargeState_ScheduledChargingMode value) =>
      $_setField(148, value);
  @$pb.TagNumber(148)
  $core.bool hasScheduledChargingMode() => $_has(44);
  @$pb.TagNumber(148)
  void clearScheduledChargingMode() => $_clearField(148);

  @$pb.TagNumber(149)
  $core.int get chargingAmps => $_getIZ(45);
  @$pb.TagNumber(149)
  set chargingAmps($core.int value) => $_setSignedInt32(45, value);
  @$pb.TagNumber(149)
  $core.bool hasChargingAmps() => $_has(45);
  @$pb.TagNumber(149)
  void clearChargingAmps() => $_clearField(149);

  @$pb.TagNumber(150)
  $core.int get scheduledChargingStartTimeMinutes => $_getIZ(46);
  @$pb.TagNumber(150)
  set scheduledChargingStartTimeMinutes($core.int value) =>
      $_setUnsignedInt32(46, value);
  @$pb.TagNumber(150)
  $core.bool hasScheduledChargingStartTimeMinutes() => $_has(46);
  @$pb.TagNumber(150)
  void clearScheduledChargingStartTimeMinutes() => $_clearField(150);

  @$pb.TagNumber(151)
  $core.int get scheduledDepartureTimeMinutes => $_getIZ(47);
  @$pb.TagNumber(151)
  set scheduledDepartureTimeMinutes($core.int value) =>
      $_setUnsignedInt32(47, value);
  @$pb.TagNumber(151)
  $core.bool hasScheduledDepartureTimeMinutes() => $_has(47);
  @$pb.TagNumber(151)
  void clearScheduledDepartureTimeMinutes() => $_clearField(151);

  @$pb.TagNumber(152)
  $core.bool get preconditioningEnabled => $_getBF(48);
  @$pb.TagNumber(152)
  set preconditioningEnabled($core.bool value) => $_setBool(48, value);
  @$pb.TagNumber(152)
  $core.bool hasPreconditioningEnabled() => $_has(48);
  @$pb.TagNumber(152)
  void clearPreconditioningEnabled() => $_clearField(152);

  @$pb.TagNumber(153)
  $core.int get scheduledChargingStartTimeApp => $_getIZ(49);
  @$pb.TagNumber(153)
  set scheduledChargingStartTimeApp($core.int value) =>
      $_setSignedInt32(49, value);
  @$pb.TagNumber(153)
  $core.bool hasScheduledChargingStartTimeApp() => $_has(49);
  @$pb.TagNumber(153)
  void clearScheduledChargingStartTimeApp() => $_clearField(153);

  @$pb.TagNumber(154)
  $core.bool get superchargerSessionTripPlanner => $_getBF(50);
  @$pb.TagNumber(154)
  set superchargerSessionTripPlanner($core.bool value) => $_setBool(50, value);
  @$pb.TagNumber(154)
  $core.bool hasSuperchargerSessionTripPlanner() => $_has(50);
  @$pb.TagNumber(154)
  void clearSuperchargerSessionTripPlanner() => $_clearField(154);

  @$pb.TagNumber(155)
  ChargeState_ChargePortColor_E get chargePortColor => $_getN(51);
  @$pb.TagNumber(155)
  set chargePortColor(ChargeState_ChargePortColor_E value) =>
      $_setField(155, value);
  @$pb.TagNumber(155)
  $core.bool hasChargePortColor() => $_has(51);
  @$pb.TagNumber(155)
  void clearChargePortColor() => $_clearField(155);

  @$pb.TagNumber(156)
  $core.double get chargeRateMphFloat => $_getN(52);
  @$pb.TagNumber(156)
  set chargeRateMphFloat($core.double value) => $_setFloat(52, value);
  @$pb.TagNumber(156)
  $core.bool hasChargeRateMphFloat() => $_has(52);
  @$pb.TagNumber(156)
  void clearChargeRateMphFloat() => $_clearField(156);

  @$pb.TagNumber(157)
  ChargeState_ChargeLimitReason get chargeLimitReason => $_getN(53);
  @$pb.TagNumber(157)
  set chargeLimitReason(ChargeState_ChargeLimitReason value) =>
      $_setField(157, value);
  @$pb.TagNumber(157)
  $core.bool hasChargeLimitReason() => $_has(53);
  @$pb.TagNumber(157)
  void clearChargeLimitReason() => $_clearField(157);

  @$pb.TagNumber(158)
  ManagedChargingState get managedChargingState => $_getN(54);
  @$pb.TagNumber(158)
  set managedChargingState(ManagedChargingState value) =>
      $_setField(158, value);
  @$pb.TagNumber(158)
  $core.bool hasManagedChargingState() => $_has(54);
  @$pb.TagNumber(158)
  void clearManagedChargingState() => $_clearField(158);
  @$pb.TagNumber(158)
  ManagedChargingState ensureManagedChargingState() => $_ensure(54);

  @$pb.TagNumber(159)
  $core.bool get chargeCableUnlatched => $_getBF(55);
  @$pb.TagNumber(159)
  set chargeCableUnlatched($core.bool value) => $_setBool(55, value);
  @$pb.TagNumber(159)
  $core.bool hasChargeCableUnlatched() => $_has(55);
  @$pb.TagNumber(159)
  void clearChargeCableUnlatched() => $_clearField(159);

  @$pb.TagNumber(160)
  ChargeState_OutletState get outletState => $_getN(56);
  @$pb.TagNumber(160)
  set outletState(ChargeState_OutletState value) => $_setField(160, value);
  @$pb.TagNumber(160)
  $core.bool hasOutletState() => $_has(56);
  @$pb.TagNumber(160)
  void clearOutletState() => $_clearField(160);

  @$pb.TagNumber(161)
  ChargeState_PowerFeedState get powerFeedState => $_getN(57);
  @$pb.TagNumber(161)
  set powerFeedState(ChargeState_PowerFeedState value) =>
      $_setField(161, value);
  @$pb.TagNumber(161)
  $core.bool hasPowerFeedState() => $_has(57);
  @$pb.TagNumber(161)
  void clearPowerFeedState() => $_clearField(161);

  @$pb.TagNumber(162)
  $core.int get outletSocLimit => $_getIZ(58);
  @$pb.TagNumber(162)
  set outletSocLimit($core.int value) => $_setSignedInt32(58, value);
  @$pb.TagNumber(162)
  $core.bool hasOutletSocLimit() => $_has(58);
  @$pb.TagNumber(162)
  void clearOutletSocLimit() => $_clearField(162);

  @$pb.TagNumber(163)
  $core.int get powerFeedSocLimit => $_getIZ(59);
  @$pb.TagNumber(163)
  set powerFeedSocLimit($core.int value) => $_setSignedInt32(59, value);
  @$pb.TagNumber(163)
  $core.bool hasPowerFeedSocLimit() => $_has(59);
  @$pb.TagNumber(163)
  void clearPowerFeedSocLimit() => $_clearField(163);

  @$pb.TagNumber(164)
  $fixnum.Int64 get outletTimeRemaining => $_getI64(60);
  @$pb.TagNumber(164)
  set outletTimeRemaining($fixnum.Int64 value) => $_setInt64(60, value);
  @$pb.TagNumber(164)
  $core.bool hasOutletTimeRemaining() => $_has(60);
  @$pb.TagNumber(164)
  void clearOutletTimeRemaining() => $_clearField(164);

  @$pb.TagNumber(165)
  $fixnum.Int64 get powerFeedTimeRemaining => $_getI64(61);
  @$pb.TagNumber(165)
  set powerFeedTimeRemaining($fixnum.Int64 value) => $_setInt64(61, value);
  @$pb.TagNumber(165)
  $core.bool hasPowerFeedTimeRemaining() => $_has(61);
  @$pb.TagNumber(165)
  void clearPowerFeedTimeRemaining() => $_clearField(165);

  @$pb.TagNumber(166)
  $core.bool get powershareFeatureAllowed => $_getBF(62);
  @$pb.TagNumber(166)
  set powershareFeatureAllowed($core.bool value) => $_setBool(62, value);
  @$pb.TagNumber(166)
  $core.bool hasPowershareFeatureAllowed() => $_has(62);
  @$pb.TagNumber(166)
  void clearPowershareFeatureAllowed() => $_clearField(166);

  @$pb.TagNumber(167)
  $core.bool get powershareFeatureEnabled => $_getBF(63);
  @$pb.TagNumber(167)
  set powershareFeatureEnabled($core.bool value) => $_setBool(63, value);
  @$pb.TagNumber(167)
  $core.bool hasPowershareFeatureEnabled() => $_has(63);
  @$pb.TagNumber(167)
  void clearPowershareFeatureEnabled() => $_clearField(167);

  @$pb.TagNumber(168)
  $core.bool get powershareRequest => $_getBF(64);
  @$pb.TagNumber(168)
  set powershareRequest($core.bool value) => $_setBool(64, value);
  @$pb.TagNumber(168)
  $core.bool hasPowershareRequest() => $_has(64);
  @$pb.TagNumber(168)
  void clearPowershareRequest() => $_clearField(168);

  @$pb.TagNumber(169)
  ChargeState_PowershareType get powershareType => $_getN(65);
  @$pb.TagNumber(169)
  set powershareType(ChargeState_PowershareType value) =>
      $_setField(169, value);
  @$pb.TagNumber(169)
  $core.bool hasPowershareType() => $_has(65);
  @$pb.TagNumber(169)
  void clearPowershareType() => $_clearField(169);

  @$pb.TagNumber(170)
  ChargeState_PowershareStatus get powershareStatus => $_getN(66);
  @$pb.TagNumber(170)
  set powershareStatus(ChargeState_PowershareStatus value) =>
      $_setField(170, value);
  @$pb.TagNumber(170)
  $core.bool hasPowershareStatus() => $_has(66);
  @$pb.TagNumber(170)
  void clearPowershareStatus() => $_clearField(170);

  @$pb.TagNumber(171)
  ChargeState_PowershareStopReason get powershareStopReason => $_getN(67);
  @$pb.TagNumber(171)
  set powershareStopReason(ChargeState_PowershareStopReason value) =>
      $_setField(171, value);
  @$pb.TagNumber(171)
  $core.bool hasPowershareStopReason() => $_has(67);
  @$pb.TagNumber(171)
  void clearPowershareStopReason() => $_clearField(171);

  @$pb.TagNumber(172)
  $core.double get powershareInstantaneousLoadKw => $_getN(68);
  @$pb.TagNumber(172)
  set powershareInstantaneousLoadKw($core.double value) =>
      $_setFloat(68, value);
  @$pb.TagNumber(172)
  $core.bool hasPowershareInstantaneousLoadKw() => $_has(68);
  @$pb.TagNumber(172)
  void clearPowershareInstantaneousLoadKw() => $_clearField(172);

  @$pb.TagNumber(173)
  $core.int get powershareVehicleEnergyLeftHr => $_getIZ(69);
  @$pb.TagNumber(173)
  set powershareVehicleEnergyLeftHr($core.int value) =>
      $_setSignedInt32(69, value);
  @$pb.TagNumber(173)
  $core.bool hasPowershareVehicleEnergyLeftHr() => $_has(69);
  @$pb.TagNumber(173)
  void clearPowershareVehicleEnergyLeftHr() => $_clearField(173);

  @$pb.TagNumber(174)
  $core.int get powershareSocLimit => $_getIZ(70);
  @$pb.TagNumber(174)
  set powershareSocLimit($core.int value) => $_setSignedInt32(70, value);
  @$pb.TagNumber(174)
  $core.bool hasPowershareSocLimit() => $_has(70);
  @$pb.TagNumber(174)
  void clearPowershareSocLimit() => $_clearField(174);

  @$pb.TagNumber(175)
  $core.int get oneTimeSocLimit => $_getIZ(71);
  @$pb.TagNumber(175)
  set oneTimeSocLimit($core.int value) => $_setSignedInt32(71, value);
  @$pb.TagNumber(175)
  $core.bool hasOneTimeSocLimit() => $_has(71);
  @$pb.TagNumber(175)
  void clearOneTimeSocLimit() => $_clearField(175);

  @$pb.TagNumber(176)
  $1.LatLong get homeLocation => $_getN(72);
  @$pb.TagNumber(176)
  set homeLocation($1.LatLong value) => $_setField(176, value);
  @$pb.TagNumber(176)
  $core.bool hasHomeLocation() => $_has(72);
  @$pb.TagNumber(176)
  void clearHomeLocation() => $_clearField(176);
  @$pb.TagNumber(176)
  $1.LatLong ensureHomeLocation() => $_ensure(72);

  @$pb.TagNumber(177)
  $1.LatLong get workLocation => $_getN(73);
  @$pb.TagNumber(177)
  set workLocation($1.LatLong value) => $_setField(177, value);
  @$pb.TagNumber(177)
  $core.bool hasWorkLocation() => $_has(73);
  @$pb.TagNumber(177)
  void clearWorkLocation() => $_clearField(177);
  @$pb.TagNumber(177)
  $1.LatLong ensureWorkLocation() => $_ensure(73);

  @$pb.TagNumber(178)
  $core.int get outletMaxTimerMinutes => $_getIZ(74);
  @$pb.TagNumber(178)
  set outletMaxTimerMinutes($core.int value) => $_setSignedInt32(74, value);
  @$pb.TagNumber(178)
  $core.bool hasOutletMaxTimerMinutes() => $_has(74);
  @$pb.TagNumber(178)
  void clearOutletMaxTimerMinutes() => $_clearField(178);
}

enum ManagedChargingState_OptionalChargeOnSolarGatewayDin {
  chargeOnSolarGatewayDin,
  notSet
}

enum ManagedChargingState_OptionalTeslaElectricAssetId {
  teslaElectricAssetId,
  notSet
}

enum ManagedChargingState_OptionalMinutesToLowerLimit {
  minutesToLowerLimit,
  notSet
}

class ManagedChargingState extends $pb.GeneratedMessage {
  factory ManagedChargingState({
    ChargeOnSolarState? chargeOnSolarState,
    $core.String? chargeOnSolarGatewayDin,
    $core.String? teslaElectricAssetId,
    $core.int? minutesToLowerLimit,
  }) {
    final result = create();
    if (chargeOnSolarState != null)
      result.chargeOnSolarState = chargeOnSolarState;
    if (chargeOnSolarGatewayDin != null)
      result.chargeOnSolarGatewayDin = chargeOnSolarGatewayDin;
    if (teslaElectricAssetId != null)
      result.teslaElectricAssetId = teslaElectricAssetId;
    if (minutesToLowerLimit != null)
      result.minutesToLowerLimit = minutesToLowerLimit;
    return result;
  }

  ManagedChargingState._();

  factory ManagedChargingState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ManagedChargingState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core
      .Map<$core.int, ManagedChargingState_OptionalChargeOnSolarGatewayDin>
      _ManagedChargingState_OptionalChargeOnSolarGatewayDinByTag = {
    2: ManagedChargingState_OptionalChargeOnSolarGatewayDin
        .chargeOnSolarGatewayDin,
    0: ManagedChargingState_OptionalChargeOnSolarGatewayDin.notSet
  };
  static const $core
      .Map<$core.int, ManagedChargingState_OptionalTeslaElectricAssetId>
      _ManagedChargingState_OptionalTeslaElectricAssetIdByTag = {
    3: ManagedChargingState_OptionalTeslaElectricAssetId.teslaElectricAssetId,
    0: ManagedChargingState_OptionalTeslaElectricAssetId.notSet
  };
  static const $core
      .Map<$core.int, ManagedChargingState_OptionalMinutesToLowerLimit>
      _ManagedChargingState_OptionalMinutesToLowerLimitByTag = {
    4: ManagedChargingState_OptionalMinutesToLowerLimit.minutesToLowerLimit,
    0: ManagedChargingState_OptionalMinutesToLowerLimit.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ManagedChargingState',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..oo(0, [2])
    ..oo(1, [3])
    ..oo(2, [4])
    ..aOM<ChargeOnSolarState>(1, _omitFieldNames ? '' : 'chargeOnSolarState',
        subBuilder: ChargeOnSolarState.create)
    ..aOS(2, _omitFieldNames ? '' : 'chargeOnSolarGatewayDin')
    ..aOS(3, _omitFieldNames ? '' : 'teslaElectricAssetId')
    ..aI(4, _omitFieldNames ? '' : 'minutesToLowerLimit')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ManagedChargingState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ManagedChargingState copyWith(void Function(ManagedChargingState) updates) =>
      super.copyWith((message) => updates(message as ManagedChargingState))
          as ManagedChargingState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ManagedChargingState create() => ManagedChargingState._();
  @$core.override
  ManagedChargingState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ManagedChargingState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ManagedChargingState>(create);
  static ManagedChargingState? _defaultInstance;

  @$pb.TagNumber(2)
  ManagedChargingState_OptionalChargeOnSolarGatewayDin
      whichOptionalChargeOnSolarGatewayDin() =>
          _ManagedChargingState_OptionalChargeOnSolarGatewayDinByTag[
              $_whichOneof(0)]!;
  @$pb.TagNumber(2)
  void clearOptionalChargeOnSolarGatewayDin() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(3)
  ManagedChargingState_OptionalTeslaElectricAssetId
      whichOptionalTeslaElectricAssetId() =>
          _ManagedChargingState_OptionalTeslaElectricAssetIdByTag[
              $_whichOneof(1)]!;
  @$pb.TagNumber(3)
  void clearOptionalTeslaElectricAssetId() => $_clearField($_whichOneof(1));

  @$pb.TagNumber(4)
  ManagedChargingState_OptionalMinutesToLowerLimit
      whichOptionalMinutesToLowerLimit() =>
          _ManagedChargingState_OptionalMinutesToLowerLimitByTag[
              $_whichOneof(2)]!;
  @$pb.TagNumber(4)
  void clearOptionalMinutesToLowerLimit() => $_clearField($_whichOneof(2));

  @$pb.TagNumber(1)
  ChargeOnSolarState get chargeOnSolarState => $_getN(0);
  @$pb.TagNumber(1)
  set chargeOnSolarState(ChargeOnSolarState value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasChargeOnSolarState() => $_has(0);
  @$pb.TagNumber(1)
  void clearChargeOnSolarState() => $_clearField(1);
  @$pb.TagNumber(1)
  ChargeOnSolarState ensureChargeOnSolarState() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get chargeOnSolarGatewayDin => $_getSZ(1);
  @$pb.TagNumber(2)
  set chargeOnSolarGatewayDin($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasChargeOnSolarGatewayDin() => $_has(1);
  @$pb.TagNumber(2)
  void clearChargeOnSolarGatewayDin() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get teslaElectricAssetId => $_getSZ(2);
  @$pb.TagNumber(3)
  set teslaElectricAssetId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTeslaElectricAssetId() => $_has(2);
  @$pb.TagNumber(3)
  void clearTeslaElectricAssetId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get minutesToLowerLimit => $_getIZ(3);
  @$pb.TagNumber(4)
  set minutesToLowerLimit($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMinutesToLowerLimit() => $_has(3);
  @$pb.TagNumber(4)
  void clearMinutesToLowerLimit() => $_clearField(4);
}

enum ChargeOnSolarState_State {
  notAllowed,
  noChargeRecommended,
  chargingOnExcessSolar,
  chargingOnAnything,
  userDisabled,
  waitingForServer,
  error,
  userStopped,
  notSet
}

class ChargeOnSolarState extends $pb.GeneratedMessage {
  factory ChargeOnSolarState({
    ChargeOnSolarStateNotAllowed? notAllowed,
    ChargeOnSolarStateNoChargeRecommended? noChargeRecommended,
    ChargeOnSolarStateChargingOnExcessSolar? chargingOnExcessSolar,
    ChargeOnSolarStateChargingOnAnything? chargingOnAnything,
    ChargeOnSolarStateUserDisabled? userDisabled,
    ChargeOnSolarStateWaitingForServer? waitingForServer,
    ChargeOnSolarStateError? error,
    ChargeOnSolarStateUserStopped? userStopped,
  }) {
    final result = create();
    if (notAllowed != null) result.notAllowed = notAllowed;
    if (noChargeRecommended != null)
      result.noChargeRecommended = noChargeRecommended;
    if (chargingOnExcessSolar != null)
      result.chargingOnExcessSolar = chargingOnExcessSolar;
    if (chargingOnAnything != null)
      result.chargingOnAnything = chargingOnAnything;
    if (userDisabled != null) result.userDisabled = userDisabled;
    if (waitingForServer != null) result.waitingForServer = waitingForServer;
    if (error != null) result.error = error;
    if (userStopped != null) result.userStopped = userStopped;
    return result;
  }

  ChargeOnSolarState._();

  factory ChargeOnSolarState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChargeOnSolarState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ChargeOnSolarState_State>
      _ChargeOnSolarState_StateByTag = {
    1: ChargeOnSolarState_State.notAllowed,
    2: ChargeOnSolarState_State.noChargeRecommended,
    3: ChargeOnSolarState_State.chargingOnExcessSolar,
    4: ChargeOnSolarState_State.chargingOnAnything,
    6: ChargeOnSolarState_State.userDisabled,
    7: ChargeOnSolarState_State.waitingForServer,
    8: ChargeOnSolarState_State.error,
    9: ChargeOnSolarState_State.userStopped,
    0: ChargeOnSolarState_State.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChargeOnSolarState',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 6, 7, 8, 9])
    ..aOM<ChargeOnSolarStateNotAllowed>(1, _omitFieldNames ? '' : 'notAllowed',
        subBuilder: ChargeOnSolarStateNotAllowed.create)
    ..aOM<ChargeOnSolarStateNoChargeRecommended>(
        2, _omitFieldNames ? '' : 'noChargeRecommended',
        subBuilder: ChargeOnSolarStateNoChargeRecommended.create)
    ..aOM<ChargeOnSolarStateChargingOnExcessSolar>(
        3, _omitFieldNames ? '' : 'chargingOnExcessSolar',
        subBuilder: ChargeOnSolarStateChargingOnExcessSolar.create)
    ..aOM<ChargeOnSolarStateChargingOnAnything>(
        4, _omitFieldNames ? '' : 'chargingOnAnything',
        subBuilder: ChargeOnSolarStateChargingOnAnything.create)
    ..aOM<ChargeOnSolarStateUserDisabled>(
        6, _omitFieldNames ? '' : 'userDisabled',
        subBuilder: ChargeOnSolarStateUserDisabled.create)
    ..aOM<ChargeOnSolarStateWaitingForServer>(
        7, _omitFieldNames ? '' : 'waitingForServer',
        subBuilder: ChargeOnSolarStateWaitingForServer.create)
    ..aOM<ChargeOnSolarStateError>(8, _omitFieldNames ? '' : 'error',
        subBuilder: ChargeOnSolarStateError.create)
    ..aOM<ChargeOnSolarStateUserStopped>(
        9, _omitFieldNames ? '' : 'userStopped',
        subBuilder: ChargeOnSolarStateUserStopped.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChargeOnSolarState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChargeOnSolarState copyWith(void Function(ChargeOnSolarState) updates) =>
      super.copyWith((message) => updates(message as ChargeOnSolarState))
          as ChargeOnSolarState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChargeOnSolarState create() => ChargeOnSolarState._();
  @$core.override
  ChargeOnSolarState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChargeOnSolarState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChargeOnSolarState>(create);
  static ChargeOnSolarState? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  ChargeOnSolarState_State whichState() =>
      _ChargeOnSolarState_StateByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  void clearState() => $_clearField($_whichOneof(0));

  /// Conditions do not support the Charge on Solar feature. For example, the vehicle may not be located at
  /// a managed charging site.
  @$pb.TagNumber(1)
  ChargeOnSolarStateNotAllowed get notAllowed => $_getN(0);
  @$pb.TagNumber(1)
  set notAllowed(ChargeOnSolarStateNotAllowed value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasNotAllowed() => $_has(0);
  @$pb.TagNumber(1)
  void clearNotAllowed() => $_clearField(1);
  @$pb.TagNumber(1)
  ChargeOnSolarStateNotAllowed ensureNotAllowed() => $_ensure(0);

  /// The vehicle is receiving no charge recommended commands from the site controller.
  @$pb.TagNumber(2)
  ChargeOnSolarStateNoChargeRecommended get noChargeRecommended => $_getN(1);
  @$pb.TagNumber(2)
  set noChargeRecommended(ChargeOnSolarStateNoChargeRecommended value) =>
      $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasNoChargeRecommended() => $_has(1);
  @$pb.TagNumber(2)
  void clearNoChargeRecommended() => $_clearField(2);
  @$pb.TagNumber(2)
  ChargeOnSolarStateNoChargeRecommended ensureNoChargeRecommended() =>
      $_ensure(1);

  /// The vehicle is actively following charge on solar recommended charge power.
  @$pb.TagNumber(3)
  ChargeOnSolarStateChargingOnExcessSolar get chargingOnExcessSolar =>
      $_getN(2);
  @$pb.TagNumber(3)
  set chargingOnExcessSolar(ChargeOnSolarStateChargingOnExcessSolar value) =>
      $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasChargingOnExcessSolar() => $_has(2);
  @$pb.TagNumber(3)
  void clearChargingOnExcessSolar() => $_clearField(3);
  @$pb.TagNumber(3)
  ChargeOnSolarStateChargingOnExcessSolar ensureChargingOnExcessSolar() =>
      $_ensure(2);

  /// The vehicle is charging at full power on any source.
  @$pb.TagNumber(4)
  ChargeOnSolarStateChargingOnAnything get chargingOnAnything => $_getN(3);
  @$pb.TagNumber(4)
  set chargingOnAnything(ChargeOnSolarStateChargingOnAnything value) =>
      $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasChargingOnAnything() => $_has(3);
  @$pb.TagNumber(4)
  void clearChargingOnAnything() => $_clearField(4);
  @$pb.TagNumber(4)
  ChargeOnSolarStateChargingOnAnything ensureChargingOnAnything() =>
      $_ensure(3);

  /// The user disabled the charge on solar feature.
  @$pb.TagNumber(6)
  ChargeOnSolarStateUserDisabled get userDisabled => $_getN(4);
  @$pb.TagNumber(6)
  set userDisabled(ChargeOnSolarStateUserDisabled value) =>
      $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasUserDisabled() => $_has(4);
  @$pb.TagNumber(6)
  void clearUserDisabled() => $_clearField(6);
  @$pb.TagNumber(6)
  ChargeOnSolarStateUserDisabled ensureUserDisabled() => $_ensure(4);

  /// The vehicle just entered a valid state for Charge on Solar and is waiting for an initial
  /// response from the site controller. It will wait in this state for a configured amount of time before entering
  /// the ChargeOnSolarError state if it does not receive a successful response from the site controller.
  @$pb.TagNumber(7)
  ChargeOnSolarStateWaitingForServer get waitingForServer => $_getN(5);
  @$pb.TagNumber(7)
  set waitingForServer(ChargeOnSolarStateWaitingForServer value) =>
      $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasWaitingForServer() => $_has(5);
  @$pb.TagNumber(7)
  void clearWaitingForServer() => $_clearField(7);
  @$pb.TagNumber(7)
  ChargeOnSolarStateWaitingForServer ensureWaitingForServer() => $_ensure(5);

  /// The managed charging service has received a sustained number of error responses and the
  /// ChargingManager is no longer following the charge on solar power set points.
  @$pb.TagNumber(8)
  ChargeOnSolarStateError get error => $_getN(6);
  @$pb.TagNumber(8)
  set error(ChargeOnSolarStateError value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasError() => $_has(6);
  @$pb.TagNumber(8)
  void clearError() => $_clearField(8);
  @$pb.TagNumber(8)
  ChargeOnSolarStateError ensureError() => $_ensure(6);

  /// The user pressed the Stop Charging button during a Charge on Solar session.
  @$pb.TagNumber(9)
  ChargeOnSolarStateUserStopped get userStopped => $_getN(7);
  @$pb.TagNumber(9)
  set userStopped(ChargeOnSolarStateUserStopped value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasUserStopped() => $_has(7);
  @$pb.TagNumber(9)
  void clearUserStopped() => $_clearField(9);
  @$pb.TagNumber(9)
  ChargeOnSolarStateUserStopped ensureUserStopped() => $_ensure(7);
}

/// Conditions do not support the Charge on Solar feature. For example, the vehicle may not be located at
/// a managed charging site.
class ChargeOnSolarStateNotAllowed extends $pb.GeneratedMessage {
  factory ChargeOnSolarStateNotAllowed() => create();

  ChargeOnSolarStateNotAllowed._();

  factory ChargeOnSolarStateNotAllowed.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChargeOnSolarStateNotAllowed.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChargeOnSolarStateNotAllowed',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChargeOnSolarStateNotAllowed clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChargeOnSolarStateNotAllowed copyWith(
          void Function(ChargeOnSolarStateNotAllowed) updates) =>
      super.copyWith(
              (message) => updates(message as ChargeOnSolarStateNotAllowed))
          as ChargeOnSolarStateNotAllowed;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChargeOnSolarStateNotAllowed create() =>
      ChargeOnSolarStateNotAllowed._();
  @$core.override
  ChargeOnSolarStateNotAllowed createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChargeOnSolarStateNotAllowed getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChargeOnSolarStateNotAllowed>(create);
  static ChargeOnSolarStateNotAllowed? _defaultInstance;
}

/// Charge on solar is enabled and the vehicle SOC is above the lower limit, however the
/// vehicle is not charging off solar for one or more reasons.
/// We return the highest priority reason to the mobile app.
class ChargeOnSolarStateNoChargeRecommended extends $pb.GeneratedMessage {
  factory ChargeOnSolarStateNoChargeRecommended({
    $3.ChargeOnSolarNoChargeReason? reason,
  }) {
    final result = create();
    if (reason != null) result.reason = reason;
    return result;
  }

  ChargeOnSolarStateNoChargeRecommended._();

  factory ChargeOnSolarStateNoChargeRecommended.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChargeOnSolarStateNoChargeRecommended.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChargeOnSolarStateNoChargeRecommended',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aE<$3.ChargeOnSolarNoChargeReason>(1, _omitFieldNames ? '' : 'reason',
        enumValues: $3.ChargeOnSolarNoChargeReason.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChargeOnSolarStateNoChargeRecommended clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChargeOnSolarStateNoChargeRecommended copyWith(
          void Function(ChargeOnSolarStateNoChargeRecommended) updates) =>
      super.copyWith((message) =>
              updates(message as ChargeOnSolarStateNoChargeRecommended))
          as ChargeOnSolarStateNoChargeRecommended;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChargeOnSolarStateNoChargeRecommended create() =>
      ChargeOnSolarStateNoChargeRecommended._();
  @$core.override
  ChargeOnSolarStateNoChargeRecommended createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChargeOnSolarStateNoChargeRecommended getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          ChargeOnSolarStateNoChargeRecommended>(create);
  static ChargeOnSolarStateNoChargeRecommended? _defaultInstance;

  @$pb.TagNumber(1)
  $3.ChargeOnSolarNoChargeReason get reason => $_getN(0);
  @$pb.TagNumber(1)
  set reason($3.ChargeOnSolarNoChargeReason value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasReason() => $_has(0);
  @$pb.TagNumber(1)
  void clearReason() => $_clearField(1);
}

/// Charge on solar is enabled and the conditions allow for charging on solar.
/// The SOC may be above or below the lower left charging limit.
class ChargeOnSolarStateChargingOnExcessSolar extends $pb.GeneratedMessage {
  factory ChargeOnSolarStateChargingOnExcessSolar() => create();

  ChargeOnSolarStateChargingOnExcessSolar._();

  factory ChargeOnSolarStateChargingOnExcessSolar.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChargeOnSolarStateChargingOnExcessSolar.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChargeOnSolarStateChargingOnExcessSolar',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChargeOnSolarStateChargingOnExcessSolar clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChargeOnSolarStateChargingOnExcessSolar copyWith(
          void Function(ChargeOnSolarStateChargingOnExcessSolar) updates) =>
      super.copyWith((message) =>
              updates(message as ChargeOnSolarStateChargingOnExcessSolar))
          as ChargeOnSolarStateChargingOnExcessSolar;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChargeOnSolarStateChargingOnExcessSolar create() =>
      ChargeOnSolarStateChargingOnExcessSolar._();
  @$core.override
  ChargeOnSolarStateChargingOnExcessSolar createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChargeOnSolarStateChargingOnExcessSolar getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          ChargeOnSolarStateChargingOnExcessSolar>(create);
  static ChargeOnSolarStateChargingOnExcessSolar? _defaultInstance;
}

/// The vehicle is charging at full power on any source.
class ChargeOnSolarStateChargingOnAnything extends $pb.GeneratedMessage {
  factory ChargeOnSolarStateChargingOnAnything() => create();

  ChargeOnSolarStateChargingOnAnything._();

  factory ChargeOnSolarStateChargingOnAnything.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChargeOnSolarStateChargingOnAnything.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChargeOnSolarStateChargingOnAnything',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChargeOnSolarStateChargingOnAnything clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChargeOnSolarStateChargingOnAnything copyWith(
          void Function(ChargeOnSolarStateChargingOnAnything) updates) =>
      super.copyWith((message) =>
              updates(message as ChargeOnSolarStateChargingOnAnything))
          as ChargeOnSolarStateChargingOnAnything;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChargeOnSolarStateChargingOnAnything create() =>
      ChargeOnSolarStateChargingOnAnything._();
  @$core.override
  ChargeOnSolarStateChargingOnAnything createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChargeOnSolarStateChargingOnAnything getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          ChargeOnSolarStateChargingOnAnything>(create);
  static ChargeOnSolarStateChargingOnAnything? _defaultInstance;
}

/// The user disabled the charge on solar feature.
class ChargeOnSolarStateUserDisabled extends $pb.GeneratedMessage {
  factory ChargeOnSolarStateUserDisabled() => create();

  ChargeOnSolarStateUserDisabled._();

  factory ChargeOnSolarStateUserDisabled.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChargeOnSolarStateUserDisabled.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChargeOnSolarStateUserDisabled',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChargeOnSolarStateUserDisabled clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChargeOnSolarStateUserDisabled copyWith(
          void Function(ChargeOnSolarStateUserDisabled) updates) =>
      super.copyWith(
              (message) => updates(message as ChargeOnSolarStateUserDisabled))
          as ChargeOnSolarStateUserDisabled;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChargeOnSolarStateUserDisabled create() =>
      ChargeOnSolarStateUserDisabled._();
  @$core.override
  ChargeOnSolarStateUserDisabled createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChargeOnSolarStateUserDisabled getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChargeOnSolarStateUserDisabled>(create);
  static ChargeOnSolarStateUserDisabled? _defaultInstance;
}

/// The vehicle just entered a valid state for Charge on Solar and is waiting for an initial
/// response from the site controller. It will wait in this state for 15min before entering
/// the ChargeOnSolarError state if it does not receive a successful response from the site controller.
class ChargeOnSolarStateWaitingForServer extends $pb.GeneratedMessage {
  factory ChargeOnSolarStateWaitingForServer() => create();

  ChargeOnSolarStateWaitingForServer._();

  factory ChargeOnSolarStateWaitingForServer.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChargeOnSolarStateWaitingForServer.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChargeOnSolarStateWaitingForServer',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChargeOnSolarStateWaitingForServer clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChargeOnSolarStateWaitingForServer copyWith(
          void Function(ChargeOnSolarStateWaitingForServer) updates) =>
      super.copyWith((message) =>
              updates(message as ChargeOnSolarStateWaitingForServer))
          as ChargeOnSolarStateWaitingForServer;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChargeOnSolarStateWaitingForServer create() =>
      ChargeOnSolarStateWaitingForServer._();
  @$core.override
  ChargeOnSolarStateWaitingForServer createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChargeOnSolarStateWaitingForServer getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChargeOnSolarStateWaitingForServer>(
          create);
  static ChargeOnSolarStateWaitingForServer? _defaultInstance;
}

/// The managed charging service has received a sustained number of error responses and the
/// ChargingManager is no longer following the charge on solar power set points.
class ChargeOnSolarStateError extends $pb.GeneratedMessage {
  factory ChargeOnSolarStateError() => create();

  ChargeOnSolarStateError._();

  factory ChargeOnSolarStateError.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChargeOnSolarStateError.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChargeOnSolarStateError',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChargeOnSolarStateError clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChargeOnSolarStateError copyWith(
          void Function(ChargeOnSolarStateError) updates) =>
      super.copyWith((message) => updates(message as ChargeOnSolarStateError))
          as ChargeOnSolarStateError;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChargeOnSolarStateError create() => ChargeOnSolarStateError._();
  @$core.override
  ChargeOnSolarStateError createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChargeOnSolarStateError getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChargeOnSolarStateError>(create);
  static ChargeOnSolarStateError? _defaultInstance;
}

/// The user pressed the Stop Charging button during a Charge on Solar session.
class ChargeOnSolarStateUserStopped extends $pb.GeneratedMessage {
  factory ChargeOnSolarStateUserStopped() => create();

  ChargeOnSolarStateUserStopped._();

  factory ChargeOnSolarStateUserStopped.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChargeOnSolarStateUserStopped.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChargeOnSolarStateUserStopped',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChargeOnSolarStateUserStopped clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChargeOnSolarStateUserStopped copyWith(
          void Function(ChargeOnSolarStateUserStopped) updates) =>
      super.copyWith(
              (message) => updates(message as ChargeOnSolarStateUserStopped))
          as ChargeOnSolarStateUserStopped;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChargeOnSolarStateUserStopped create() =>
      ChargeOnSolarStateUserStopped._();
  @$core.override
  ChargeOnSolarStateUserStopped createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChargeOnSolarStateUserStopped getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChargeOnSolarStateUserStopped>(create);
  static ChargeOnSolarStateUserStopped? _defaultInstance;
}

enum LocationState_GPSCoordinateType_Type { gCJ, wGS, notSet }

class LocationState_GPSCoordinateType extends $pb.GeneratedMessage {
  factory LocationState_GPSCoordinateType({
    $1.Void? gCJ,
    $1.Void? wGS,
  }) {
    final result = create();
    if (gCJ != null) result.gCJ = gCJ;
    if (wGS != null) result.wGS = wGS;
    return result;
  }

  LocationState_GPSCoordinateType._();

  factory LocationState_GPSCoordinateType.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LocationState_GPSCoordinateType.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, LocationState_GPSCoordinateType_Type>
      _LocationState_GPSCoordinateType_TypeByTag = {
    1: LocationState_GPSCoordinateType_Type.gCJ,
    2: LocationState_GPSCoordinateType_Type.wGS,
    0: LocationState_GPSCoordinateType_Type.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LocationState.GPSCoordinateType',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<$1.Void>(1, _omitFieldNames ? '' : 'GCJ',
        protoName: 'GCJ', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(2, _omitFieldNames ? '' : 'WGS',
        protoName: 'WGS', subBuilder: $1.Void.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LocationState_GPSCoordinateType clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LocationState_GPSCoordinateType copyWith(
          void Function(LocationState_GPSCoordinateType) updates) =>
      super.copyWith(
              (message) => updates(message as LocationState_GPSCoordinateType))
          as LocationState_GPSCoordinateType;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LocationState_GPSCoordinateType create() =>
      LocationState_GPSCoordinateType._();
  @$core.override
  LocationState_GPSCoordinateType createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LocationState_GPSCoordinateType getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LocationState_GPSCoordinateType>(
          create);
  static LocationState_GPSCoordinateType? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  LocationState_GPSCoordinateType_Type whichType() =>
      _LocationState_GPSCoordinateType_TypeByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  void clearType() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $1.Void get gCJ => $_getN(0);
  @$pb.TagNumber(1)
  set gCJ($1.Void value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasGCJ() => $_has(0);
  @$pb.TagNumber(1)
  void clearGCJ() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.Void ensureGCJ() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.Void get wGS => $_getN(1);
  @$pb.TagNumber(2)
  set wGS($1.Void value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasWGS() => $_has(1);
  @$pb.TagNumber(2)
  void clearWGS() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.Void ensureWGS() => $_ensure(1);
}

enum LocationState_OptionalLatitude { latitude, notSet }

enum LocationState_OptionalLongitude { longitude, notSet }

enum LocationState_OptionalHeading { heading, notSet }

enum LocationState_OptionalGpsAsOf { gpsAsOf, notSet }

enum LocationState_OptionalNativeLocationSupported {
  nativeLocationSupported,
  notSet
}

enum LocationState_OptionalNativeLatitude { nativeLatitude, notSet }

enum LocationState_OptionalNativeLongitude { nativeLongitude, notSet }

enum LocationState_OptionalCorrectedLatitude { correctedLatitude, notSet }

enum LocationState_OptionalCorrectedLongitude { correctedLongitude, notSet }

enum LocationState_OptionalHomelinkNearby { homelinkNearby, notSet }

enum LocationState_OptionalLocationName { locationName, notSet }

enum LocationState_OptionalGeoLatitude { geoLatitude, notSet }

enum LocationState_OptionalGeoLongitude { geoLongitude, notSet }

enum LocationState_OptionalGeoHeading { geoHeading, notSet }

enum LocationState_OptionalGeoElevation { geoElevation, notSet }

enum LocationState_OptionalGeoAccuracy { geoAccuracy, notSet }

enum LocationState_OptionalEstimatedGpsValid { estimatedGpsValid, notSet }

enum LocationState_OptionalEstimatedToRawDistance {
  estimatedToRawDistance,
  notSet
}

/// LocationState contains information about the vehicle's location. Typically
/// clients will want to use native coordinates, which use either WGS
/// (international) or GCJ (Chinese) coordinate systems depending on the
/// vehicle's region. If the native fields are not provided, WGS clients should
/// fall back to the plain latitude/longitude fields, and GCJ clients should
/// fall back to corrected fields.
///
/// The geo fields contain raw WGS GPS coordinates. They are usually less
/// accurate. However, they should be used if there is a large discrepancy
/// between the raw and estimated location, as determined by the
/// "estimated to raw distance" field. This scenario most frequently arises when
/// the vehicle has recently been transported or towed.
class LocationState extends $pb.GeneratedMessage {
  factory LocationState({
    LocationState_GPSCoordinateType? nativeType,
    $0.Timestamp? timestamp,
    $core.double? latitude,
    $core.double? longitude,
    $core.int? heading,
    $fixnum.Int64? gpsAsOf,
    $core.bool? nativeLocationSupported,
    $core.double? nativeLatitude,
    $core.double? nativeLongitude,
    $core.double? correctedLatitude,
    $core.double? correctedLongitude,
    $core.bool? homelinkNearby,
    $core.String? locationName,
    $core.double? geoLatitude,
    $core.double? geoLongitude,
    $core.double? geoHeading,
    $core.double? geoElevation,
    $core.double? geoAccuracy,
    $core.bool? estimatedGpsValid,
    $core.double? estimatedToRawDistance,
  }) {
    final result = create();
    if (nativeType != null) result.nativeType = nativeType;
    if (timestamp != null) result.timestamp = timestamp;
    if (latitude != null) result.latitude = latitude;
    if (longitude != null) result.longitude = longitude;
    if (heading != null) result.heading = heading;
    if (gpsAsOf != null) result.gpsAsOf = gpsAsOf;
    if (nativeLocationSupported != null)
      result.nativeLocationSupported = nativeLocationSupported;
    if (nativeLatitude != null) result.nativeLatitude = nativeLatitude;
    if (nativeLongitude != null) result.nativeLongitude = nativeLongitude;
    if (correctedLatitude != null) result.correctedLatitude = correctedLatitude;
    if (correctedLongitude != null)
      result.correctedLongitude = correctedLongitude;
    if (homelinkNearby != null) result.homelinkNearby = homelinkNearby;
    if (locationName != null) result.locationName = locationName;
    if (geoLatitude != null) result.geoLatitude = geoLatitude;
    if (geoLongitude != null) result.geoLongitude = geoLongitude;
    if (geoHeading != null) result.geoHeading = geoHeading;
    if (geoElevation != null) result.geoElevation = geoElevation;
    if (geoAccuracy != null) result.geoAccuracy = geoAccuracy;
    if (estimatedGpsValid != null) result.estimatedGpsValid = estimatedGpsValid;
    if (estimatedToRawDistance != null)
      result.estimatedToRawDistance = estimatedToRawDistance;
    return result;
  }

  LocationState._();

  factory LocationState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LocationState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, LocationState_OptionalLatitude>
      _LocationState_OptionalLatitudeByTag = {
    101: LocationState_OptionalLatitude.latitude,
    0: LocationState_OptionalLatitude.notSet
  };
  static const $core.Map<$core.int, LocationState_OptionalLongitude>
      _LocationState_OptionalLongitudeByTag = {
    102: LocationState_OptionalLongitude.longitude,
    0: LocationState_OptionalLongitude.notSet
  };
  static const $core.Map<$core.int, LocationState_OptionalHeading>
      _LocationState_OptionalHeadingByTag = {
    103: LocationState_OptionalHeading.heading,
    0: LocationState_OptionalHeading.notSet
  };
  static const $core.Map<$core.int, LocationState_OptionalGpsAsOf>
      _LocationState_OptionalGpsAsOfByTag = {
    104: LocationState_OptionalGpsAsOf.gpsAsOf,
    0: LocationState_OptionalGpsAsOf.notSet
  };
  static const $core
      .Map<$core.int, LocationState_OptionalNativeLocationSupported>
      _LocationState_OptionalNativeLocationSupportedByTag = {
    105: LocationState_OptionalNativeLocationSupported.nativeLocationSupported,
    0: LocationState_OptionalNativeLocationSupported.notSet
  };
  static const $core.Map<$core.int, LocationState_OptionalNativeLatitude>
      _LocationState_OptionalNativeLatitudeByTag = {
    106: LocationState_OptionalNativeLatitude.nativeLatitude,
    0: LocationState_OptionalNativeLatitude.notSet
  };
  static const $core.Map<$core.int, LocationState_OptionalNativeLongitude>
      _LocationState_OptionalNativeLongitudeByTag = {
    107: LocationState_OptionalNativeLongitude.nativeLongitude,
    0: LocationState_OptionalNativeLongitude.notSet
  };
  static const $core.Map<$core.int, LocationState_OptionalCorrectedLatitude>
      _LocationState_OptionalCorrectedLatitudeByTag = {
    109: LocationState_OptionalCorrectedLatitude.correctedLatitude,
    0: LocationState_OptionalCorrectedLatitude.notSet
  };
  static const $core.Map<$core.int, LocationState_OptionalCorrectedLongitude>
      _LocationState_OptionalCorrectedLongitudeByTag = {
    110: LocationState_OptionalCorrectedLongitude.correctedLongitude,
    0: LocationState_OptionalCorrectedLongitude.notSet
  };
  static const $core.Map<$core.int, LocationState_OptionalHomelinkNearby>
      _LocationState_OptionalHomelinkNearbyByTag = {
    112: LocationState_OptionalHomelinkNearby.homelinkNearby,
    0: LocationState_OptionalHomelinkNearby.notSet
  };
  static const $core.Map<$core.int, LocationState_OptionalLocationName>
      _LocationState_OptionalLocationNameByTag = {
    113: LocationState_OptionalLocationName.locationName,
    0: LocationState_OptionalLocationName.notSet
  };
  static const $core.Map<$core.int, LocationState_OptionalGeoLatitude>
      _LocationState_OptionalGeoLatitudeByTag = {
    114: LocationState_OptionalGeoLatitude.geoLatitude,
    0: LocationState_OptionalGeoLatitude.notSet
  };
  static const $core.Map<$core.int, LocationState_OptionalGeoLongitude>
      _LocationState_OptionalGeoLongitudeByTag = {
    115: LocationState_OptionalGeoLongitude.geoLongitude,
    0: LocationState_OptionalGeoLongitude.notSet
  };
  static const $core.Map<$core.int, LocationState_OptionalGeoHeading>
      _LocationState_OptionalGeoHeadingByTag = {
    116: LocationState_OptionalGeoHeading.geoHeading,
    0: LocationState_OptionalGeoHeading.notSet
  };
  static const $core.Map<$core.int, LocationState_OptionalGeoElevation>
      _LocationState_OptionalGeoElevationByTag = {
    117: LocationState_OptionalGeoElevation.geoElevation,
    0: LocationState_OptionalGeoElevation.notSet
  };
  static const $core.Map<$core.int, LocationState_OptionalGeoAccuracy>
      _LocationState_OptionalGeoAccuracyByTag = {
    118: LocationState_OptionalGeoAccuracy.geoAccuracy,
    0: LocationState_OptionalGeoAccuracy.notSet
  };
  static const $core.Map<$core.int, LocationState_OptionalEstimatedGpsValid>
      _LocationState_OptionalEstimatedGpsValidByTag = {
    119: LocationState_OptionalEstimatedGpsValid.estimatedGpsValid,
    0: LocationState_OptionalEstimatedGpsValid.notSet
  };
  static const $core
      .Map<$core.int, LocationState_OptionalEstimatedToRawDistance>
      _LocationState_OptionalEstimatedToRawDistanceByTag = {
    120: LocationState_OptionalEstimatedToRawDistance.estimatedToRawDistance,
    0: LocationState_OptionalEstimatedToRawDistance.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LocationState',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..oo(0, [101])
    ..oo(1, [102])
    ..oo(2, [103])
    ..oo(3, [104])
    ..oo(4, [105])
    ..oo(5, [106])
    ..oo(6, [107])
    ..oo(7, [109])
    ..oo(8, [110])
    ..oo(9, [112])
    ..oo(10, [113])
    ..oo(11, [114])
    ..oo(12, [115])
    ..oo(13, [116])
    ..oo(14, [117])
    ..oo(15, [118])
    ..oo(16, [119])
    ..oo(17, [120])
    ..aOM<LocationState_GPSCoordinateType>(
        8, _omitFieldNames ? '' : 'nativeType',
        subBuilder: LocationState_GPSCoordinateType.create)
    ..aOM<$0.Timestamp>(11, _omitFieldNames ? '' : 'timestamp',
        subBuilder: $0.Timestamp.create)
    ..aD(101, _omitFieldNames ? '' : 'latitude', fieldType: $pb.PbFieldType.OF)
    ..aD(102, _omitFieldNames ? '' : 'longitude', fieldType: $pb.PbFieldType.OF)
    ..aI(103, _omitFieldNames ? '' : 'heading', fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        104, _omitFieldNames ? '' : 'gpsAsOf', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(105, _omitFieldNames ? '' : 'nativeLocationSupported')
    ..aD(106, _omitFieldNames ? '' : 'nativeLatitude',
        fieldType: $pb.PbFieldType.OF)
    ..aD(107, _omitFieldNames ? '' : 'nativeLongitude',
        fieldType: $pb.PbFieldType.OF)
    ..aD(109, _omitFieldNames ? '' : 'correctedLatitude',
        fieldType: $pb.PbFieldType.OF)
    ..aD(110, _omitFieldNames ? '' : 'correctedLongitude',
        fieldType: $pb.PbFieldType.OF)
    ..aOB(112, _omitFieldNames ? '' : 'homelinkNearby')
    ..aOS(113, _omitFieldNames ? '' : 'locationName')
    ..aD(114, _omitFieldNames ? '' : 'geoLatitude',
        fieldType: $pb.PbFieldType.OF)
    ..aD(115, _omitFieldNames ? '' : 'geoLongitude',
        fieldType: $pb.PbFieldType.OF)
    ..aD(116, _omitFieldNames ? '' : 'geoHeading',
        fieldType: $pb.PbFieldType.OF)
    ..aD(117, _omitFieldNames ? '' : 'geoElevation',
        fieldType: $pb.PbFieldType.OF)
    ..aD(118, _omitFieldNames ? '' : 'geoAccuracy',
        fieldType: $pb.PbFieldType.OF)
    ..aOB(119, _omitFieldNames ? '' : 'estimatedGpsValid')
    ..aD(120, _omitFieldNames ? '' : 'estimatedToRawDistance',
        fieldType: $pb.PbFieldType.OF)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LocationState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LocationState copyWith(void Function(LocationState) updates) =>
      super.copyWith((message) => updates(message as LocationState))
          as LocationState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LocationState create() => LocationState._();
  @$core.override
  LocationState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LocationState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LocationState>(create);
  static LocationState? _defaultInstance;

  @$pb.TagNumber(101)
  LocationState_OptionalLatitude whichOptionalLatitude() =>
      _LocationState_OptionalLatitudeByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(101)
  void clearOptionalLatitude() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(102)
  LocationState_OptionalLongitude whichOptionalLongitude() =>
      _LocationState_OptionalLongitudeByTag[$_whichOneof(1)]!;
  @$pb.TagNumber(102)
  void clearOptionalLongitude() => $_clearField($_whichOneof(1));

  @$pb.TagNumber(103)
  LocationState_OptionalHeading whichOptionalHeading() =>
      _LocationState_OptionalHeadingByTag[$_whichOneof(2)]!;
  @$pb.TagNumber(103)
  void clearOptionalHeading() => $_clearField($_whichOneof(2));

  @$pb.TagNumber(104)
  LocationState_OptionalGpsAsOf whichOptionalGpsAsOf() =>
      _LocationState_OptionalGpsAsOfByTag[$_whichOneof(3)]!;
  @$pb.TagNumber(104)
  void clearOptionalGpsAsOf() => $_clearField($_whichOneof(3));

  @$pb.TagNumber(105)
  LocationState_OptionalNativeLocationSupported
      whichOptionalNativeLocationSupported() =>
          _LocationState_OptionalNativeLocationSupportedByTag[$_whichOneof(4)]!;
  @$pb.TagNumber(105)
  void clearOptionalNativeLocationSupported() => $_clearField($_whichOneof(4));

  @$pb.TagNumber(106)
  LocationState_OptionalNativeLatitude whichOptionalNativeLatitude() =>
      _LocationState_OptionalNativeLatitudeByTag[$_whichOneof(5)]!;
  @$pb.TagNumber(106)
  void clearOptionalNativeLatitude() => $_clearField($_whichOneof(5));

  @$pb.TagNumber(107)
  LocationState_OptionalNativeLongitude whichOptionalNativeLongitude() =>
      _LocationState_OptionalNativeLongitudeByTag[$_whichOneof(6)]!;
  @$pb.TagNumber(107)
  void clearOptionalNativeLongitude() => $_clearField($_whichOneof(6));

  @$pb.TagNumber(109)
  LocationState_OptionalCorrectedLatitude whichOptionalCorrectedLatitude() =>
      _LocationState_OptionalCorrectedLatitudeByTag[$_whichOneof(7)]!;
  @$pb.TagNumber(109)
  void clearOptionalCorrectedLatitude() => $_clearField($_whichOneof(7));

  @$pb.TagNumber(110)
  LocationState_OptionalCorrectedLongitude whichOptionalCorrectedLongitude() =>
      _LocationState_OptionalCorrectedLongitudeByTag[$_whichOneof(8)]!;
  @$pb.TagNumber(110)
  void clearOptionalCorrectedLongitude() => $_clearField($_whichOneof(8));

  @$pb.TagNumber(112)
  LocationState_OptionalHomelinkNearby whichOptionalHomelinkNearby() =>
      _LocationState_OptionalHomelinkNearbyByTag[$_whichOneof(9)]!;
  @$pb.TagNumber(112)
  void clearOptionalHomelinkNearby() => $_clearField($_whichOneof(9));

  @$pb.TagNumber(113)
  LocationState_OptionalLocationName whichOptionalLocationName() =>
      _LocationState_OptionalLocationNameByTag[$_whichOneof(10)]!;
  @$pb.TagNumber(113)
  void clearOptionalLocationName() => $_clearField($_whichOneof(10));

  @$pb.TagNumber(114)
  LocationState_OptionalGeoLatitude whichOptionalGeoLatitude() =>
      _LocationState_OptionalGeoLatitudeByTag[$_whichOneof(11)]!;
  @$pb.TagNumber(114)
  void clearOptionalGeoLatitude() => $_clearField($_whichOneof(11));

  @$pb.TagNumber(115)
  LocationState_OptionalGeoLongitude whichOptionalGeoLongitude() =>
      _LocationState_OptionalGeoLongitudeByTag[$_whichOneof(12)]!;
  @$pb.TagNumber(115)
  void clearOptionalGeoLongitude() => $_clearField($_whichOneof(12));

  @$pb.TagNumber(116)
  LocationState_OptionalGeoHeading whichOptionalGeoHeading() =>
      _LocationState_OptionalGeoHeadingByTag[$_whichOneof(13)]!;
  @$pb.TagNumber(116)
  void clearOptionalGeoHeading() => $_clearField($_whichOneof(13));

  @$pb.TagNumber(117)
  LocationState_OptionalGeoElevation whichOptionalGeoElevation() =>
      _LocationState_OptionalGeoElevationByTag[$_whichOneof(14)]!;
  @$pb.TagNumber(117)
  void clearOptionalGeoElevation() => $_clearField($_whichOneof(14));

  @$pb.TagNumber(118)
  LocationState_OptionalGeoAccuracy whichOptionalGeoAccuracy() =>
      _LocationState_OptionalGeoAccuracyByTag[$_whichOneof(15)]!;
  @$pb.TagNumber(118)
  void clearOptionalGeoAccuracy() => $_clearField($_whichOneof(15));

  @$pb.TagNumber(119)
  LocationState_OptionalEstimatedGpsValid whichOptionalEstimatedGpsValid() =>
      _LocationState_OptionalEstimatedGpsValidByTag[$_whichOneof(16)]!;
  @$pb.TagNumber(119)
  void clearOptionalEstimatedGpsValid() => $_clearField($_whichOneof(16));

  @$pb.TagNumber(120)
  LocationState_OptionalEstimatedToRawDistance
      whichOptionalEstimatedToRawDistance() =>
          _LocationState_OptionalEstimatedToRawDistanceByTag[$_whichOneof(17)]!;
  @$pb.TagNumber(120)
  void clearOptionalEstimatedToRawDistance() => $_clearField($_whichOneof(17));

  @$pb.TagNumber(8)
  LocationState_GPSCoordinateType get nativeType => $_getN(0);
  @$pb.TagNumber(8)
  set nativeType(LocationState_GPSCoordinateType value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasNativeType() => $_has(0);
  @$pb.TagNumber(8)
  void clearNativeType() => $_clearField(8);
  @$pb.TagNumber(8)
  LocationState_GPSCoordinateType ensureNativeType() => $_ensure(0);

  @$pb.TagNumber(11)
  $0.Timestamp get timestamp => $_getN(1);
  @$pb.TagNumber(11)
  set timestamp($0.Timestamp value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasTimestamp() => $_has(1);
  @$pb.TagNumber(11)
  void clearTimestamp() => $_clearField(11);
  @$pb.TagNumber(11)
  $0.Timestamp ensureTimestamp() => $_ensure(1);

  @$pb.TagNumber(101)
  $core.double get latitude => $_getN(2);
  @$pb.TagNumber(101)
  set latitude($core.double value) => $_setFloat(2, value);
  @$pb.TagNumber(101)
  $core.bool hasLatitude() => $_has(2);
  @$pb.TagNumber(101)
  void clearLatitude() => $_clearField(101);

  @$pb.TagNumber(102)
  $core.double get longitude => $_getN(3);
  @$pb.TagNumber(102)
  set longitude($core.double value) => $_setFloat(3, value);
  @$pb.TagNumber(102)
  $core.bool hasLongitude() => $_has(3);
  @$pb.TagNumber(102)
  void clearLongitude() => $_clearField(102);

  @$pb.TagNumber(103)
  $core.int get heading => $_getIZ(4);
  @$pb.TagNumber(103)
  set heading($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(103)
  $core.bool hasHeading() => $_has(4);
  @$pb.TagNumber(103)
  void clearHeading() => $_clearField(103);

  @$pb.TagNumber(104)
  $fixnum.Int64 get gpsAsOf => $_getI64(5);
  @$pb.TagNumber(104)
  set gpsAsOf($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(104)
  $core.bool hasGpsAsOf() => $_has(5);
  @$pb.TagNumber(104)
  void clearGpsAsOf() => $_clearField(104);

  @$pb.TagNumber(105)
  $core.bool get nativeLocationSupported => $_getBF(6);
  @$pb.TagNumber(105)
  set nativeLocationSupported($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(105)
  $core.bool hasNativeLocationSupported() => $_has(6);
  @$pb.TagNumber(105)
  void clearNativeLocationSupported() => $_clearField(105);

  @$pb.TagNumber(106)
  $core.double get nativeLatitude => $_getN(7);
  @$pb.TagNumber(106)
  set nativeLatitude($core.double value) => $_setFloat(7, value);
  @$pb.TagNumber(106)
  $core.bool hasNativeLatitude() => $_has(7);
  @$pb.TagNumber(106)
  void clearNativeLatitude() => $_clearField(106);

  @$pb.TagNumber(107)
  $core.double get nativeLongitude => $_getN(8);
  @$pb.TagNumber(107)
  set nativeLongitude($core.double value) => $_setFloat(8, value);
  @$pb.TagNumber(107)
  $core.bool hasNativeLongitude() => $_has(8);
  @$pb.TagNumber(107)
  void clearNativeLongitude() => $_clearField(107);

  @$pb.TagNumber(109)
  $core.double get correctedLatitude => $_getN(9);
  @$pb.TagNumber(109)
  set correctedLatitude($core.double value) => $_setFloat(9, value);
  @$pb.TagNumber(109)
  $core.bool hasCorrectedLatitude() => $_has(9);
  @$pb.TagNumber(109)
  void clearCorrectedLatitude() => $_clearField(109);

  @$pb.TagNumber(110)
  $core.double get correctedLongitude => $_getN(10);
  @$pb.TagNumber(110)
  set correctedLongitude($core.double value) => $_setFloat(10, value);
  @$pb.TagNumber(110)
  $core.bool hasCorrectedLongitude() => $_has(10);
  @$pb.TagNumber(110)
  void clearCorrectedLongitude() => $_clearField(110);

  @$pb.TagNumber(112)
  $core.bool get homelinkNearby => $_getBF(11);
  @$pb.TagNumber(112)
  set homelinkNearby($core.bool value) => $_setBool(11, value);
  @$pb.TagNumber(112)
  $core.bool hasHomelinkNearby() => $_has(11);
  @$pb.TagNumber(112)
  void clearHomelinkNearby() => $_clearField(112);

  @$pb.TagNumber(113)
  $core.String get locationName => $_getSZ(12);
  @$pb.TagNumber(113)
  set locationName($core.String value) => $_setString(12, value);
  @$pb.TagNumber(113)
  $core.bool hasLocationName() => $_has(12);
  @$pb.TagNumber(113)
  void clearLocationName() => $_clearField(113);

  @$pb.TagNumber(114)
  $core.double get geoLatitude => $_getN(13);
  @$pb.TagNumber(114)
  set geoLatitude($core.double value) => $_setFloat(13, value);
  @$pb.TagNumber(114)
  $core.bool hasGeoLatitude() => $_has(13);
  @$pb.TagNumber(114)
  void clearGeoLatitude() => $_clearField(114);

  @$pb.TagNumber(115)
  $core.double get geoLongitude => $_getN(14);
  @$pb.TagNumber(115)
  set geoLongitude($core.double value) => $_setFloat(14, value);
  @$pb.TagNumber(115)
  $core.bool hasGeoLongitude() => $_has(14);
  @$pb.TagNumber(115)
  void clearGeoLongitude() => $_clearField(115);

  @$pb.TagNumber(116)
  $core.double get geoHeading => $_getN(15);
  @$pb.TagNumber(116)
  set geoHeading($core.double value) => $_setFloat(15, value);
  @$pb.TagNumber(116)
  $core.bool hasGeoHeading() => $_has(15);
  @$pb.TagNumber(116)
  void clearGeoHeading() => $_clearField(116);

  @$pb.TagNumber(117)
  $core.double get geoElevation => $_getN(16);
  @$pb.TagNumber(117)
  set geoElevation($core.double value) => $_setFloat(16, value);
  @$pb.TagNumber(117)
  $core.bool hasGeoElevation() => $_has(16);
  @$pb.TagNumber(117)
  void clearGeoElevation() => $_clearField(117);

  @$pb.TagNumber(118)
  $core.double get geoAccuracy => $_getN(17);
  @$pb.TagNumber(118)
  set geoAccuracy($core.double value) => $_setFloat(17, value);
  @$pb.TagNumber(118)
  $core.bool hasGeoAccuracy() => $_has(17);
  @$pb.TagNumber(118)
  void clearGeoAccuracy() => $_clearField(118);

  @$pb.TagNumber(119)
  $core.bool get estimatedGpsValid => $_getBF(18);
  @$pb.TagNumber(119)
  set estimatedGpsValid($core.bool value) => $_setBool(18, value);
  @$pb.TagNumber(119)
  $core.bool hasEstimatedGpsValid() => $_has(18);
  @$pb.TagNumber(119)
  void clearEstimatedGpsValid() => $_clearField(119);

  @$pb.TagNumber(120)
  $core.double get estimatedToRawDistance => $_getN(19);
  @$pb.TagNumber(120)
  set estimatedToRawDistance($core.double value) => $_setFloat(19, value);
  @$pb.TagNumber(120)
  $core.bool hasEstimatedToRawDistance() => $_has(19);
  @$pb.TagNumber(120)
  void clearEstimatedToRawDistance() => $_clearField(120);
}

class VehicleState_GuestMode extends $pb.GeneratedMessage {
  factory VehicleState_GuestMode({
    $core.bool? guestModeActive,
  }) {
    final result = create();
    if (guestModeActive != null) result.guestModeActive = guestModeActive;
    return result;
  }

  VehicleState_GuestMode._();

  factory VehicleState_GuestMode.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VehicleState_GuestMode.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VehicleState.GuestMode',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'GuestModeActive',
        protoName: 'GuestModeActive')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VehicleState_GuestMode clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VehicleState_GuestMode copyWith(
          void Function(VehicleState_GuestMode) updates) =>
      super.copyWith((message) => updates(message as VehicleState_GuestMode))
          as VehicleState_GuestMode;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VehicleState_GuestMode create() => VehicleState_GuestMode._();
  @$core.override
  VehicleState_GuestMode createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VehicleState_GuestMode getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VehicleState_GuestMode>(create);
  static VehicleState_GuestMode? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get guestModeActive => $_getBF(0);
  @$pb.TagNumber(1)
  set guestModeActive($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGuestModeActive() => $_has(0);
  @$pb.TagNumber(1)
  void clearGuestModeActive() => $_clearField(1);
}

class VehicleState extends $pb.GeneratedMessage {
  factory VehicleState({
    VehicleState_GuestMode? guestMode,
  }) {
    final result = create();
    if (guestMode != null) result.guestMode = guestMode;
    return result;
  }

  VehicleState._();

  factory VehicleState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VehicleState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VehicleState',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aOM<VehicleState_GuestMode>(74, _omitFieldNames ? '' : 'guestMode',
        protoName: 'guestMode', subBuilder: VehicleState_GuestMode.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VehicleState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VehicleState copyWith(void Function(VehicleState) updates) =>
      super.copyWith((message) => updates(message as VehicleState))
          as VehicleState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VehicleState create() => VehicleState._();
  @$core.override
  VehicleState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VehicleState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VehicleState>(create);
  static VehicleState? _defaultInstance;

  @$pb.TagNumber(74)
  VehicleState_GuestMode get guestMode => $_getN(0);
  @$pb.TagNumber(74)
  set guestMode(VehicleState_GuestMode value) => $_setField(74, value);
  @$pb.TagNumber(74)
  $core.bool hasGuestMode() => $_has(0);
  @$pb.TagNumber(74)
  void clearGuestMode() => $_clearField(74);
  @$pb.TagNumber(74)
  VehicleState_GuestMode ensureGuestMode() => $_ensure(0);
}

enum ClimateState_ClimateKeeperMode_Type {
  unknown,
  off,
  on,
  dog,
  party,
  notSet
}

class ClimateState_ClimateKeeperMode extends $pb.GeneratedMessage {
  factory ClimateState_ClimateKeeperMode({
    $1.Void? unknown,
    $1.Void? off,
    $1.Void? on,
    $1.Void? dog,
    $1.Void? party,
  }) {
    final result = create();
    if (unknown != null) result.unknown = unknown;
    if (off != null) result.off = off;
    if (on != null) result.on = on;
    if (dog != null) result.dog = dog;
    if (party != null) result.party = party;
    return result;
  }

  ClimateState_ClimateKeeperMode._();

  factory ClimateState_ClimateKeeperMode.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ClimateState_ClimateKeeperMode.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ClimateState_ClimateKeeperMode_Type>
      _ClimateState_ClimateKeeperMode_TypeByTag = {
    1: ClimateState_ClimateKeeperMode_Type.unknown,
    2: ClimateState_ClimateKeeperMode_Type.off,
    3: ClimateState_ClimateKeeperMode_Type.on,
    4: ClimateState_ClimateKeeperMode_Type.dog,
    5: ClimateState_ClimateKeeperMode_Type.party,
    0: ClimateState_ClimateKeeperMode_Type.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClimateState.ClimateKeeperMode',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5])
    ..aOM<$1.Void>(1, _omitFieldNames ? '' : 'Unknown',
        protoName: 'Unknown', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(2, _omitFieldNames ? '' : 'Off',
        protoName: 'Off', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(3, _omitFieldNames ? '' : 'On',
        protoName: 'On', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(4, _omitFieldNames ? '' : 'Dog',
        protoName: 'Dog', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(5, _omitFieldNames ? '' : 'Party',
        protoName: 'Party', subBuilder: $1.Void.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClimateState_ClimateKeeperMode clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClimateState_ClimateKeeperMode copyWith(
          void Function(ClimateState_ClimateKeeperMode) updates) =>
      super.copyWith(
              (message) => updates(message as ClimateState_ClimateKeeperMode))
          as ClimateState_ClimateKeeperMode;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClimateState_ClimateKeeperMode create() =>
      ClimateState_ClimateKeeperMode._();
  @$core.override
  ClimateState_ClimateKeeperMode createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ClimateState_ClimateKeeperMode getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClimateState_ClimateKeeperMode>(create);
  static ClimateState_ClimateKeeperMode? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  ClimateState_ClimateKeeperMode_Type whichType() =>
      _ClimateState_ClimateKeeperMode_TypeByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  void clearType() => $_clearField($_whichOneof(0));

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
  $1.Void get off => $_getN(1);
  @$pb.TagNumber(2)
  set off($1.Void value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasOff() => $_has(1);
  @$pb.TagNumber(2)
  void clearOff() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.Void ensureOff() => $_ensure(1);

  @$pb.TagNumber(3)
  $1.Void get on => $_getN(2);
  @$pb.TagNumber(3)
  set on($1.Void value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasOn() => $_has(2);
  @$pb.TagNumber(3)
  void clearOn() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.Void ensureOn() => $_ensure(2);

  @$pb.TagNumber(4)
  $1.Void get dog => $_getN(3);
  @$pb.TagNumber(4)
  set dog($1.Void value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasDog() => $_has(3);
  @$pb.TagNumber(4)
  void clearDog() => $_clearField(4);
  @$pb.TagNumber(4)
  $1.Void ensureDog() => $_ensure(3);

  @$pb.TagNumber(5)
  $1.Void get party => $_getN(4);
  @$pb.TagNumber(5)
  set party($1.Void value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasParty() => $_has(4);
  @$pb.TagNumber(5)
  void clearParty() => $_clearField(5);
  @$pb.TagNumber(5)
  $1.Void ensureParty() => $_ensure(4);
}

enum ClimateState_DefrostMode_Type { off, normal, max, notSet }

class ClimateState_DefrostMode extends $pb.GeneratedMessage {
  factory ClimateState_DefrostMode({
    $1.Void? off,
    $1.Void? normal,
    $1.Void? max,
  }) {
    final result = create();
    if (off != null) result.off = off;
    if (normal != null) result.normal = normal;
    if (max != null) result.max = max;
    return result;
  }

  ClimateState_DefrostMode._();

  factory ClimateState_DefrostMode.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ClimateState_DefrostMode.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ClimateState_DefrostMode_Type>
      _ClimateState_DefrostMode_TypeByTag = {
    1: ClimateState_DefrostMode_Type.off,
    2: ClimateState_DefrostMode_Type.normal,
    3: ClimateState_DefrostMode_Type.max,
    0: ClimateState_DefrostMode_Type.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClimateState.DefrostMode',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..aOM<$1.Void>(1, _omitFieldNames ? '' : 'Off',
        protoName: 'Off', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(2, _omitFieldNames ? '' : 'Normal',
        protoName: 'Normal', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(3, _omitFieldNames ? '' : 'Max',
        protoName: 'Max', subBuilder: $1.Void.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClimateState_DefrostMode clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClimateState_DefrostMode copyWith(
          void Function(ClimateState_DefrostMode) updates) =>
      super.copyWith((message) => updates(message as ClimateState_DefrostMode))
          as ClimateState_DefrostMode;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClimateState_DefrostMode create() => ClimateState_DefrostMode._();
  @$core.override
  ClimateState_DefrostMode createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ClimateState_DefrostMode getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClimateState_DefrostMode>(create);
  static ClimateState_DefrostMode? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  ClimateState_DefrostMode_Type whichType() =>
      _ClimateState_DefrostMode_TypeByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  void clearType() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $1.Void get off => $_getN(0);
  @$pb.TagNumber(1)
  set off($1.Void value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasOff() => $_has(0);
  @$pb.TagNumber(1)
  void clearOff() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.Void ensureOff() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.Void get normal => $_getN(1);
  @$pb.TagNumber(2)
  set normal($1.Void value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasNormal() => $_has(1);
  @$pb.TagNumber(2)
  void clearNormal() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.Void ensureNormal() => $_ensure(1);

  @$pb.TagNumber(3)
  $1.Void get max => $_getN(2);
  @$pb.TagNumber(3)
  set max($1.Void value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasMax() => $_has(2);
  @$pb.TagNumber(3)
  void clearMax() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.Void ensureMax() => $_ensure(2);
}

enum ClimateState_OptionalInsideTempCelsius { insideTempCelsius, notSet }

enum ClimateState_OptionalOutsideTempCelsius { outsideTempCelsius, notSet }

enum ClimateState_OptionalDriverTempSetting { driverTempSetting, notSet }

enum ClimateState_OptionalPassengerTempSetting { passengerTempSetting, notSet }

enum ClimateState_OptionalLeftTempDirection { leftTempDirection, notSet }

enum ClimateState_OptionalRightTempDirection { rightTempDirection, notSet }

enum ClimateState_OptionalIsFrontDefrosterOn { isFrontDefrosterOn, notSet }

enum ClimateState_OptionalIsRearDefrosterOn { isRearDefrosterOn, notSet }

enum ClimateState_OptionalFanStatus { fanStatus, notSet }

enum ClimateState_OptionalIsClimateOn { isClimateOn, notSet }

enum ClimateState_OptionalMinAvailTempCelsius { minAvailTempCelsius, notSet }

enum ClimateState_OptionalMaxAvailTempCelsius { maxAvailTempCelsius, notSet }

enum ClimateState_OptionalSeatHeaterLeft { seatHeaterLeft, notSet }

enum ClimateState_OptionalSeatHeaterRight { seatHeaterRight, notSet }

enum ClimateState_OptionalSeatHeaterRearLeft { seatHeaterRearLeft, notSet }

enum ClimateState_OptionalSeatHeaterRearRight { seatHeaterRearRight, notSet }

enum ClimateState_OptionalSeatHeaterRearCenter { seatHeaterRearCenter, notSet }

enum ClimateState_OptionalSeatHeaterRearRightBack {
  seatHeaterRearRightBack,
  notSet
}

enum ClimateState_OptionalSeatHeaterRearLeftBack {
  seatHeaterRearLeftBack,
  notSet
}

enum ClimateState_OptionalSeatHeaterThirdRowRight {
  seatHeaterThirdRowRight,
  notSet
}

enum ClimateState_OptionalSeatHeaterThirdRowLeft {
  seatHeaterThirdRowLeft,
  notSet
}

enum ClimateState_OptionalBatteryHeater { batteryHeater, notSet }

enum ClimateState_OptionalBatteryHeaterNoPower { batteryHeaterNoPower, notSet }

enum ClimateState_OptionalSteeringWheelHeater { steeringWheelHeater, notSet }

enum ClimateState_OptionalWiperBladeHeater { wiperBladeHeater, notSet }

enum ClimateState_OptionalSideMirrorHeaters { sideMirrorHeaters, notSet }

enum ClimateState_OptionalIsPreconditioning { isPreconditioning, notSet }

enum ClimateState_OptionalRemoteHeaterControlEnabled {
  remoteHeaterControlEnabled,
  notSet
}

enum ClimateState_OptionalBioweaponModeOn { bioweaponModeOn, notSet }

enum ClimateState_OptionalIsAutoConditioningOn { isAutoConditioningOn, notSet }

enum ClimateState_OptionalAutoSeatClimateLeft { autoSeatClimateLeft, notSet }

enum ClimateState_OptionalAutoSeatClimateRight { autoSeatClimateRight, notSet }

enum ClimateState_OptionalSeatFanFrontLeft { seatFanFrontLeft, notSet }

enum ClimateState_OptionalSeatFanFrontRight { seatFanFrontRight, notSet }

enum ClimateState_OptionalAllowCabinOverheatProtection {
  allowCabinOverheatProtection,
  notSet
}

enum ClimateState_OptionalSupportsFanOnlyCabinOverheatProtection {
  supportsFanOnlyCabinOverheatProtection,
  notSet
}

enum ClimateState_OptionalCabinOverheatProtection {
  cabinOverheatProtection,
  notSet
}

enum ClimateState_OptionalCabinOverheatProtectionActivelyCooling {
  cabinOverheatProtectionActivelyCooling,
  notSet
}

enum ClimateState_OptionalCopActivationTemperature {
  copActivationTemperature,
  notSet
}

enum ClimateState_OptionalAutoSteeringWheelHeat {
  autoSteeringWheelHeat,
  notSet
}

enum ClimateState_OptionalSteeringWheelHeatLevel {
  steeringWheelHeatLevel,
  notSet
}

enum ClimateState_OptionalHvacAutoRequest { hvacAutoRequest, notSet }

enum ClimateState_OptionalCopNotRunningReason { copNotRunningReason, notSet }

class ClimateState extends $pb.GeneratedMessage {
  factory ClimateState({
    ClimateState_ClimateKeeperMode? climateKeeperMode,
    $0.Timestamp? timestamp,
    ClimateState_DefrostMode? defrostMode,
    $core.double? insideTempCelsius,
    $core.double? outsideTempCelsius,
    $core.double? driverTempSetting,
    $core.double? passengerTempSetting,
    $core.int? leftTempDirection,
    $core.int? rightTempDirection,
    $core.bool? isFrontDefrosterOn,
    $core.bool? isRearDefrosterOn,
    $core.int? fanStatus,
    $core.bool? isClimateOn,
    $core.double? minAvailTempCelsius,
    $core.double? maxAvailTempCelsius,
    $core.int? seatHeaterLeft,
    $core.int? seatHeaterRight,
    $core.int? seatHeaterRearLeft,
    $core.int? seatHeaterRearRight,
    $core.int? seatHeaterRearCenter,
    $core.int? seatHeaterRearRightBack,
    $core.int? seatHeaterRearLeftBack,
    $core.int? seatHeaterThirdRowRight,
    $core.int? seatHeaterThirdRowLeft,
    $core.bool? batteryHeater,
    $core.bool? batteryHeaterNoPower,
    $core.bool? steeringWheelHeater,
    $core.bool? wiperBladeHeater,
    $core.bool? sideMirrorHeaters,
    $core.bool? isPreconditioning,
    $core.bool? remoteHeaterControlEnabled,
    $core.bool? bioweaponModeOn,
    $core.bool? isAutoConditioningOn,
    $core.bool? autoSeatClimateLeft,
    $core.bool? autoSeatClimateRight,
    $core.int? seatFanFrontLeft,
    $core.int? seatFanFrontRight,
    $core.bool? allowCabinOverheatProtection,
    $core.bool? supportsFanOnlyCabinOverheatProtection,
    ClimateState_CabinOverheatProtection_E? cabinOverheatProtection,
    $core.bool? cabinOverheatProtectionActivelyCooling,
    ClimateState_CopActivationTemp? copActivationTemperature,
    $core.bool? autoSteeringWheelHeat,
    $1.StwHeatLevel? steeringWheelHeatLevel,
    ClimateState_HvacAutoRequest? hvacAutoRequest,
    ClimateState_COPNotRunningReason? copNotRunningReason,
  }) {
    final result = create();
    if (climateKeeperMode != null) result.climateKeeperMode = climateKeeperMode;
    if (timestamp != null) result.timestamp = timestamp;
    if (defrostMode != null) result.defrostMode = defrostMode;
    if (insideTempCelsius != null) result.insideTempCelsius = insideTempCelsius;
    if (outsideTempCelsius != null)
      result.outsideTempCelsius = outsideTempCelsius;
    if (driverTempSetting != null) result.driverTempSetting = driverTempSetting;
    if (passengerTempSetting != null)
      result.passengerTempSetting = passengerTempSetting;
    if (leftTempDirection != null) result.leftTempDirection = leftTempDirection;
    if (rightTempDirection != null)
      result.rightTempDirection = rightTempDirection;
    if (isFrontDefrosterOn != null)
      result.isFrontDefrosterOn = isFrontDefrosterOn;
    if (isRearDefrosterOn != null) result.isRearDefrosterOn = isRearDefrosterOn;
    if (fanStatus != null) result.fanStatus = fanStatus;
    if (isClimateOn != null) result.isClimateOn = isClimateOn;
    if (minAvailTempCelsius != null)
      result.minAvailTempCelsius = minAvailTempCelsius;
    if (maxAvailTempCelsius != null)
      result.maxAvailTempCelsius = maxAvailTempCelsius;
    if (seatHeaterLeft != null) result.seatHeaterLeft = seatHeaterLeft;
    if (seatHeaterRight != null) result.seatHeaterRight = seatHeaterRight;
    if (seatHeaterRearLeft != null)
      result.seatHeaterRearLeft = seatHeaterRearLeft;
    if (seatHeaterRearRight != null)
      result.seatHeaterRearRight = seatHeaterRearRight;
    if (seatHeaterRearCenter != null)
      result.seatHeaterRearCenter = seatHeaterRearCenter;
    if (seatHeaterRearRightBack != null)
      result.seatHeaterRearRightBack = seatHeaterRearRightBack;
    if (seatHeaterRearLeftBack != null)
      result.seatHeaterRearLeftBack = seatHeaterRearLeftBack;
    if (seatHeaterThirdRowRight != null)
      result.seatHeaterThirdRowRight = seatHeaterThirdRowRight;
    if (seatHeaterThirdRowLeft != null)
      result.seatHeaterThirdRowLeft = seatHeaterThirdRowLeft;
    if (batteryHeater != null) result.batteryHeater = batteryHeater;
    if (batteryHeaterNoPower != null)
      result.batteryHeaterNoPower = batteryHeaterNoPower;
    if (steeringWheelHeater != null)
      result.steeringWheelHeater = steeringWheelHeater;
    if (wiperBladeHeater != null) result.wiperBladeHeater = wiperBladeHeater;
    if (sideMirrorHeaters != null) result.sideMirrorHeaters = sideMirrorHeaters;
    if (isPreconditioning != null) result.isPreconditioning = isPreconditioning;
    if (remoteHeaterControlEnabled != null)
      result.remoteHeaterControlEnabled = remoteHeaterControlEnabled;
    if (bioweaponModeOn != null) result.bioweaponModeOn = bioweaponModeOn;
    if (isAutoConditioningOn != null)
      result.isAutoConditioningOn = isAutoConditioningOn;
    if (autoSeatClimateLeft != null)
      result.autoSeatClimateLeft = autoSeatClimateLeft;
    if (autoSeatClimateRight != null)
      result.autoSeatClimateRight = autoSeatClimateRight;
    if (seatFanFrontLeft != null) result.seatFanFrontLeft = seatFanFrontLeft;
    if (seatFanFrontRight != null) result.seatFanFrontRight = seatFanFrontRight;
    if (allowCabinOverheatProtection != null)
      result.allowCabinOverheatProtection = allowCabinOverheatProtection;
    if (supportsFanOnlyCabinOverheatProtection != null)
      result.supportsFanOnlyCabinOverheatProtection =
          supportsFanOnlyCabinOverheatProtection;
    if (cabinOverheatProtection != null)
      result.cabinOverheatProtection = cabinOverheatProtection;
    if (cabinOverheatProtectionActivelyCooling != null)
      result.cabinOverheatProtectionActivelyCooling =
          cabinOverheatProtectionActivelyCooling;
    if (copActivationTemperature != null)
      result.copActivationTemperature = copActivationTemperature;
    if (autoSteeringWheelHeat != null)
      result.autoSteeringWheelHeat = autoSteeringWheelHeat;
    if (steeringWheelHeatLevel != null)
      result.steeringWheelHeatLevel = steeringWheelHeatLevel;
    if (hvacAutoRequest != null) result.hvacAutoRequest = hvacAutoRequest;
    if (copNotRunningReason != null)
      result.copNotRunningReason = copNotRunningReason;
    return result;
  }

  ClimateState._();

  factory ClimateState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ClimateState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ClimateState_OptionalInsideTempCelsius>
      _ClimateState_OptionalInsideTempCelsiusByTag = {
    101: ClimateState_OptionalInsideTempCelsius.insideTempCelsius,
    0: ClimateState_OptionalInsideTempCelsius.notSet
  };
  static const $core.Map<$core.int, ClimateState_OptionalOutsideTempCelsius>
      _ClimateState_OptionalOutsideTempCelsiusByTag = {
    102: ClimateState_OptionalOutsideTempCelsius.outsideTempCelsius,
    0: ClimateState_OptionalOutsideTempCelsius.notSet
  };
  static const $core.Map<$core.int, ClimateState_OptionalDriverTempSetting>
      _ClimateState_OptionalDriverTempSettingByTag = {
    103: ClimateState_OptionalDriverTempSetting.driverTempSetting,
    0: ClimateState_OptionalDriverTempSetting.notSet
  };
  static const $core.Map<$core.int, ClimateState_OptionalPassengerTempSetting>
      _ClimateState_OptionalPassengerTempSettingByTag = {
    104: ClimateState_OptionalPassengerTempSetting.passengerTempSetting,
    0: ClimateState_OptionalPassengerTempSetting.notSet
  };
  static const $core.Map<$core.int, ClimateState_OptionalLeftTempDirection>
      _ClimateState_OptionalLeftTempDirectionByTag = {
    105: ClimateState_OptionalLeftTempDirection.leftTempDirection,
    0: ClimateState_OptionalLeftTempDirection.notSet
  };
  static const $core.Map<$core.int, ClimateState_OptionalRightTempDirection>
      _ClimateState_OptionalRightTempDirectionByTag = {
    106: ClimateState_OptionalRightTempDirection.rightTempDirection,
    0: ClimateState_OptionalRightTempDirection.notSet
  };
  static const $core.Map<$core.int, ClimateState_OptionalIsFrontDefrosterOn>
      _ClimateState_OptionalIsFrontDefrosterOnByTag = {
    107: ClimateState_OptionalIsFrontDefrosterOn.isFrontDefrosterOn,
    0: ClimateState_OptionalIsFrontDefrosterOn.notSet
  };
  static const $core.Map<$core.int, ClimateState_OptionalIsRearDefrosterOn>
      _ClimateState_OptionalIsRearDefrosterOnByTag = {
    108: ClimateState_OptionalIsRearDefrosterOn.isRearDefrosterOn,
    0: ClimateState_OptionalIsRearDefrosterOn.notSet
  };
  static const $core.Map<$core.int, ClimateState_OptionalFanStatus>
      _ClimateState_OptionalFanStatusByTag = {
    109: ClimateState_OptionalFanStatus.fanStatus,
    0: ClimateState_OptionalFanStatus.notSet
  };
  static const $core.Map<$core.int, ClimateState_OptionalIsClimateOn>
      _ClimateState_OptionalIsClimateOnByTag = {
    110: ClimateState_OptionalIsClimateOn.isClimateOn,
    0: ClimateState_OptionalIsClimateOn.notSet
  };
  static const $core.Map<$core.int, ClimateState_OptionalMinAvailTempCelsius>
      _ClimateState_OptionalMinAvailTempCelsiusByTag = {
    111: ClimateState_OptionalMinAvailTempCelsius.minAvailTempCelsius,
    0: ClimateState_OptionalMinAvailTempCelsius.notSet
  };
  static const $core.Map<$core.int, ClimateState_OptionalMaxAvailTempCelsius>
      _ClimateState_OptionalMaxAvailTempCelsiusByTag = {
    112: ClimateState_OptionalMaxAvailTempCelsius.maxAvailTempCelsius,
    0: ClimateState_OptionalMaxAvailTempCelsius.notSet
  };
  static const $core.Map<$core.int, ClimateState_OptionalSeatHeaterLeft>
      _ClimateState_OptionalSeatHeaterLeftByTag = {
    113: ClimateState_OptionalSeatHeaterLeft.seatHeaterLeft,
    0: ClimateState_OptionalSeatHeaterLeft.notSet
  };
  static const $core.Map<$core.int, ClimateState_OptionalSeatHeaterRight>
      _ClimateState_OptionalSeatHeaterRightByTag = {
    114: ClimateState_OptionalSeatHeaterRight.seatHeaterRight,
    0: ClimateState_OptionalSeatHeaterRight.notSet
  };
  static const $core.Map<$core.int, ClimateState_OptionalSeatHeaterRearLeft>
      _ClimateState_OptionalSeatHeaterRearLeftByTag = {
    115: ClimateState_OptionalSeatHeaterRearLeft.seatHeaterRearLeft,
    0: ClimateState_OptionalSeatHeaterRearLeft.notSet
  };
  static const $core.Map<$core.int, ClimateState_OptionalSeatHeaterRearRight>
      _ClimateState_OptionalSeatHeaterRearRightByTag = {
    116: ClimateState_OptionalSeatHeaterRearRight.seatHeaterRearRight,
    0: ClimateState_OptionalSeatHeaterRearRight.notSet
  };
  static const $core.Map<$core.int, ClimateState_OptionalSeatHeaterRearCenter>
      _ClimateState_OptionalSeatHeaterRearCenterByTag = {
    117: ClimateState_OptionalSeatHeaterRearCenter.seatHeaterRearCenter,
    0: ClimateState_OptionalSeatHeaterRearCenter.notSet
  };
  static const $core
      .Map<$core.int, ClimateState_OptionalSeatHeaterRearRightBack>
      _ClimateState_OptionalSeatHeaterRearRightBackByTag = {
    118: ClimateState_OptionalSeatHeaterRearRightBack.seatHeaterRearRightBack,
    0: ClimateState_OptionalSeatHeaterRearRightBack.notSet
  };
  static const $core.Map<$core.int, ClimateState_OptionalSeatHeaterRearLeftBack>
      _ClimateState_OptionalSeatHeaterRearLeftBackByTag = {
    119: ClimateState_OptionalSeatHeaterRearLeftBack.seatHeaterRearLeftBack,
    0: ClimateState_OptionalSeatHeaterRearLeftBack.notSet
  };
  static const $core
      .Map<$core.int, ClimateState_OptionalSeatHeaterThirdRowRight>
      _ClimateState_OptionalSeatHeaterThirdRowRightByTag = {
    120: ClimateState_OptionalSeatHeaterThirdRowRight.seatHeaterThirdRowRight,
    0: ClimateState_OptionalSeatHeaterThirdRowRight.notSet
  };
  static const $core.Map<$core.int, ClimateState_OptionalSeatHeaterThirdRowLeft>
      _ClimateState_OptionalSeatHeaterThirdRowLeftByTag = {
    121: ClimateState_OptionalSeatHeaterThirdRowLeft.seatHeaterThirdRowLeft,
    0: ClimateState_OptionalSeatHeaterThirdRowLeft.notSet
  };
  static const $core.Map<$core.int, ClimateState_OptionalBatteryHeater>
      _ClimateState_OptionalBatteryHeaterByTag = {
    122: ClimateState_OptionalBatteryHeater.batteryHeater,
    0: ClimateState_OptionalBatteryHeater.notSet
  };
  static const $core.Map<$core.int, ClimateState_OptionalBatteryHeaterNoPower>
      _ClimateState_OptionalBatteryHeaterNoPowerByTag = {
    123: ClimateState_OptionalBatteryHeaterNoPower.batteryHeaterNoPower,
    0: ClimateState_OptionalBatteryHeaterNoPower.notSet
  };
  static const $core.Map<$core.int, ClimateState_OptionalSteeringWheelHeater>
      _ClimateState_OptionalSteeringWheelHeaterByTag = {
    125: ClimateState_OptionalSteeringWheelHeater.steeringWheelHeater,
    0: ClimateState_OptionalSteeringWheelHeater.notSet
  };
  static const $core.Map<$core.int, ClimateState_OptionalWiperBladeHeater>
      _ClimateState_OptionalWiperBladeHeaterByTag = {
    126: ClimateState_OptionalWiperBladeHeater.wiperBladeHeater,
    0: ClimateState_OptionalWiperBladeHeater.notSet
  };
  static const $core.Map<$core.int, ClimateState_OptionalSideMirrorHeaters>
      _ClimateState_OptionalSideMirrorHeatersByTag = {
    127: ClimateState_OptionalSideMirrorHeaters.sideMirrorHeaters,
    0: ClimateState_OptionalSideMirrorHeaters.notSet
  };
  static const $core.Map<$core.int, ClimateState_OptionalIsPreconditioning>
      _ClimateState_OptionalIsPreconditioningByTag = {
    128: ClimateState_OptionalIsPreconditioning.isPreconditioning,
    0: ClimateState_OptionalIsPreconditioning.notSet
  };
  static const $core
      .Map<$core.int, ClimateState_OptionalRemoteHeaterControlEnabled>
      _ClimateState_OptionalRemoteHeaterControlEnabledByTag = {
    129: ClimateState_OptionalRemoteHeaterControlEnabled
        .remoteHeaterControlEnabled,
    0: ClimateState_OptionalRemoteHeaterControlEnabled.notSet
  };
  static const $core.Map<$core.int, ClimateState_OptionalBioweaponModeOn>
      _ClimateState_OptionalBioweaponModeOnByTag = {
    134: ClimateState_OptionalBioweaponModeOn.bioweaponModeOn,
    0: ClimateState_OptionalBioweaponModeOn.notSet
  };
  static const $core.Map<$core.int, ClimateState_OptionalIsAutoConditioningOn>
      _ClimateState_OptionalIsAutoConditioningOnByTag = {
    136: ClimateState_OptionalIsAutoConditioningOn.isAutoConditioningOn,
    0: ClimateState_OptionalIsAutoConditioningOn.notSet
  };
  static const $core.Map<$core.int, ClimateState_OptionalAutoSeatClimateLeft>
      _ClimateState_OptionalAutoSeatClimateLeftByTag = {
    137: ClimateState_OptionalAutoSeatClimateLeft.autoSeatClimateLeft,
    0: ClimateState_OptionalAutoSeatClimateLeft.notSet
  };
  static const $core.Map<$core.int, ClimateState_OptionalAutoSeatClimateRight>
      _ClimateState_OptionalAutoSeatClimateRightByTag = {
    138: ClimateState_OptionalAutoSeatClimateRight.autoSeatClimateRight,
    0: ClimateState_OptionalAutoSeatClimateRight.notSet
  };
  static const $core.Map<$core.int, ClimateState_OptionalSeatFanFrontLeft>
      _ClimateState_OptionalSeatFanFrontLeftByTag = {
    139: ClimateState_OptionalSeatFanFrontLeft.seatFanFrontLeft,
    0: ClimateState_OptionalSeatFanFrontLeft.notSet
  };
  static const $core.Map<$core.int, ClimateState_OptionalSeatFanFrontRight>
      _ClimateState_OptionalSeatFanFrontRightByTag = {
    140: ClimateState_OptionalSeatFanFrontRight.seatFanFrontRight,
    0: ClimateState_OptionalSeatFanFrontRight.notSet
  };
  static const $core
      .Map<$core.int, ClimateState_OptionalAllowCabinOverheatProtection>
      _ClimateState_OptionalAllowCabinOverheatProtectionByTag = {
    141: ClimateState_OptionalAllowCabinOverheatProtection
        .allowCabinOverheatProtection,
    0: ClimateState_OptionalAllowCabinOverheatProtection.notSet
  };
  static const $core.Map<$core.int,
          ClimateState_OptionalSupportsFanOnlyCabinOverheatProtection>
      _ClimateState_OptionalSupportsFanOnlyCabinOverheatProtectionByTag = {
    142: ClimateState_OptionalSupportsFanOnlyCabinOverheatProtection
        .supportsFanOnlyCabinOverheatProtection,
    0: ClimateState_OptionalSupportsFanOnlyCabinOverheatProtection.notSet
  };
  static const $core
      .Map<$core.int, ClimateState_OptionalCabinOverheatProtection>
      _ClimateState_OptionalCabinOverheatProtectionByTag = {
    143: ClimateState_OptionalCabinOverheatProtection.cabinOverheatProtection,
    0: ClimateState_OptionalCabinOverheatProtection.notSet
  };
  static const $core.Map<$core.int,
          ClimateState_OptionalCabinOverheatProtectionActivelyCooling>
      _ClimateState_OptionalCabinOverheatProtectionActivelyCoolingByTag = {
    144: ClimateState_OptionalCabinOverheatProtectionActivelyCooling
        .cabinOverheatProtectionActivelyCooling,
    0: ClimateState_OptionalCabinOverheatProtectionActivelyCooling.notSet
  };
  static const $core
      .Map<$core.int, ClimateState_OptionalCopActivationTemperature>
      _ClimateState_OptionalCopActivationTemperatureByTag = {
    146: ClimateState_OptionalCopActivationTemperature.copActivationTemperature,
    0: ClimateState_OptionalCopActivationTemperature.notSet
  };
  static const $core.Map<$core.int, ClimateState_OptionalAutoSteeringWheelHeat>
      _ClimateState_OptionalAutoSteeringWheelHeatByTag = {
    147: ClimateState_OptionalAutoSteeringWheelHeat.autoSteeringWheelHeat,
    0: ClimateState_OptionalAutoSteeringWheelHeat.notSet
  };
  static const $core.Map<$core.int, ClimateState_OptionalSteeringWheelHeatLevel>
      _ClimateState_OptionalSteeringWheelHeatLevelByTag = {
    148: ClimateState_OptionalSteeringWheelHeatLevel.steeringWheelHeatLevel,
    0: ClimateState_OptionalSteeringWheelHeatLevel.notSet
  };
  static const $core.Map<$core.int, ClimateState_OptionalHvacAutoRequest>
      _ClimateState_OptionalHvacAutoRequestByTag = {
    150: ClimateState_OptionalHvacAutoRequest.hvacAutoRequest,
    0: ClimateState_OptionalHvacAutoRequest.notSet
  };
  static const $core.Map<$core.int, ClimateState_OptionalCopNotRunningReason>
      _ClimateState_OptionalCopNotRunningReasonByTag = {
    151: ClimateState_OptionalCopNotRunningReason.copNotRunningReason,
    0: ClimateState_OptionalCopNotRunningReason.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClimateState',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..oo(0, [101])
    ..oo(1, [102])
    ..oo(2, [103])
    ..oo(3, [104])
    ..oo(4, [105])
    ..oo(5, [106])
    ..oo(6, [107])
    ..oo(7, [108])
    ..oo(8, [109])
    ..oo(9, [110])
    ..oo(10, [111])
    ..oo(11, [112])
    ..oo(12, [113])
    ..oo(13, [114])
    ..oo(14, [115])
    ..oo(15, [116])
    ..oo(16, [117])
    ..oo(17, [118])
    ..oo(18, [119])
    ..oo(19, [120])
    ..oo(20, [121])
    ..oo(21, [122])
    ..oo(22, [123])
    ..oo(23, [125])
    ..oo(24, [126])
    ..oo(25, [127])
    ..oo(26, [128])
    ..oo(27, [129])
    ..oo(28, [134])
    ..oo(29, [136])
    ..oo(30, [137])
    ..oo(31, [138])
    ..oo(32, [139])
    ..oo(33, [140])
    ..oo(34, [141])
    ..oo(35, [142])
    ..oo(36, [143])
    ..oo(37, [144])
    ..oo(38, [146])
    ..oo(39, [147])
    ..oo(40, [148])
    ..oo(41, [150])
    ..oo(42, [151])
    ..aOM<ClimateState_ClimateKeeperMode>(
        30, _omitFieldNames ? '' : 'climateKeeperMode',
        subBuilder: ClimateState_ClimateKeeperMode.create)
    ..aOM<$0.Timestamp>(33, _omitFieldNames ? '' : 'timestamp',
        subBuilder: $0.Timestamp.create)
    ..aOM<ClimateState_DefrostMode>(35, _omitFieldNames ? '' : 'defrostMode',
        subBuilder: ClimateState_DefrostMode.create)
    ..aD(101, _omitFieldNames ? '' : 'insideTempCelsius',
        fieldType: $pb.PbFieldType.OF)
    ..aD(102, _omitFieldNames ? '' : 'outsideTempCelsius',
        fieldType: $pb.PbFieldType.OF)
    ..aD(103, _omitFieldNames ? '' : 'driverTempSetting',
        fieldType: $pb.PbFieldType.OF)
    ..aD(104, _omitFieldNames ? '' : 'passengerTempSetting',
        fieldType: $pb.PbFieldType.OF)
    ..aI(105, _omitFieldNames ? '' : 'leftTempDirection')
    ..aI(106, _omitFieldNames ? '' : 'rightTempDirection')
    ..aOB(107, _omitFieldNames ? '' : 'isFrontDefrosterOn')
    ..aOB(108, _omitFieldNames ? '' : 'isRearDefrosterOn')
    ..aI(109, _omitFieldNames ? '' : 'fanStatus')
    ..aOB(110, _omitFieldNames ? '' : 'isClimateOn')
    ..aD(111, _omitFieldNames ? '' : 'minAvailTempCelsius',
        fieldType: $pb.PbFieldType.OF)
    ..aD(112, _omitFieldNames ? '' : 'maxAvailTempCelsius',
        fieldType: $pb.PbFieldType.OF)
    ..aI(113, _omitFieldNames ? '' : 'seatHeaterLeft')
    ..aI(114, _omitFieldNames ? '' : 'seatHeaterRight')
    ..aI(115, _omitFieldNames ? '' : 'seatHeaterRearLeft')
    ..aI(116, _omitFieldNames ? '' : 'seatHeaterRearRight')
    ..aI(117, _omitFieldNames ? '' : 'seatHeaterRearCenter')
    ..aI(118, _omitFieldNames ? '' : 'seatHeaterRearRightBack')
    ..aI(119, _omitFieldNames ? '' : 'seatHeaterRearLeftBack')
    ..aI(120, _omitFieldNames ? '' : 'seatHeaterThirdRowRight')
    ..aI(121, _omitFieldNames ? '' : 'seatHeaterThirdRowLeft')
    ..aOB(122, _omitFieldNames ? '' : 'batteryHeater')
    ..aOB(123, _omitFieldNames ? '' : 'batteryHeaterNoPower')
    ..aOB(125, _omitFieldNames ? '' : 'steeringWheelHeater')
    ..aOB(126, _omitFieldNames ? '' : 'wiperBladeHeater')
    ..aOB(127, _omitFieldNames ? '' : 'sideMirrorHeaters')
    ..aOB(128, _omitFieldNames ? '' : 'isPreconditioning')
    ..aOB(129, _omitFieldNames ? '' : 'remoteHeaterControlEnabled')
    ..aOB(134, _omitFieldNames ? '' : 'bioweaponModeOn')
    ..aOB(136, _omitFieldNames ? '' : 'isAutoConditioningOn')
    ..aOB(137, _omitFieldNames ? '' : 'autoSeatClimateLeft')
    ..aOB(138, _omitFieldNames ? '' : 'autoSeatClimateRight')
    ..aI(139, _omitFieldNames ? '' : 'seatFanFrontLeft')
    ..aI(140, _omitFieldNames ? '' : 'seatFanFrontRight')
    ..aOB(141, _omitFieldNames ? '' : 'allowCabinOverheatProtection')
    ..aOB(142, _omitFieldNames ? '' : 'supportsFanOnlyCabinOverheatProtection')
    ..aE<ClimateState_CabinOverheatProtection_E>(
        143, _omitFieldNames ? '' : 'cabinOverheatProtection',
        enumValues: ClimateState_CabinOverheatProtection_E.values)
    ..aOB(144, _omitFieldNames ? '' : 'cabinOverheatProtectionActivelyCooling')
    ..aE<ClimateState_CopActivationTemp>(
        146, _omitFieldNames ? '' : 'copActivationTemperature',
        enumValues: ClimateState_CopActivationTemp.values)
    ..aOB(147, _omitFieldNames ? '' : 'autoSteeringWheelHeat')
    ..aE<$1.StwHeatLevel>(148, _omitFieldNames ? '' : 'steeringWheelHeatLevel',
        enumValues: $1.StwHeatLevel.values)
    ..aE<ClimateState_HvacAutoRequest>(
        150, _omitFieldNames ? '' : 'hvacAutoRequest',
        enumValues: ClimateState_HvacAutoRequest.values)
    ..aE<ClimateState_COPNotRunningReason>(
        151, _omitFieldNames ? '' : 'copNotRunningReason',
        enumValues: ClimateState_COPNotRunningReason.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClimateState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClimateState copyWith(void Function(ClimateState) updates) =>
      super.copyWith((message) => updates(message as ClimateState))
          as ClimateState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClimateState create() => ClimateState._();
  @$core.override
  ClimateState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ClimateState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClimateState>(create);
  static ClimateState? _defaultInstance;

  @$pb.TagNumber(101)
  ClimateState_OptionalInsideTempCelsius whichOptionalInsideTempCelsius() =>
      _ClimateState_OptionalInsideTempCelsiusByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(101)
  void clearOptionalInsideTempCelsius() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(102)
  ClimateState_OptionalOutsideTempCelsius whichOptionalOutsideTempCelsius() =>
      _ClimateState_OptionalOutsideTempCelsiusByTag[$_whichOneof(1)]!;
  @$pb.TagNumber(102)
  void clearOptionalOutsideTempCelsius() => $_clearField($_whichOneof(1));

  @$pb.TagNumber(103)
  ClimateState_OptionalDriverTempSetting whichOptionalDriverTempSetting() =>
      _ClimateState_OptionalDriverTempSettingByTag[$_whichOneof(2)]!;
  @$pb.TagNumber(103)
  void clearOptionalDriverTempSetting() => $_clearField($_whichOneof(2));

  @$pb.TagNumber(104)
  ClimateState_OptionalPassengerTempSetting
      whichOptionalPassengerTempSetting() =>
          _ClimateState_OptionalPassengerTempSettingByTag[$_whichOneof(3)]!;
  @$pb.TagNumber(104)
  void clearOptionalPassengerTempSetting() => $_clearField($_whichOneof(3));

  @$pb.TagNumber(105)
  ClimateState_OptionalLeftTempDirection whichOptionalLeftTempDirection() =>
      _ClimateState_OptionalLeftTempDirectionByTag[$_whichOneof(4)]!;
  @$pb.TagNumber(105)
  void clearOptionalLeftTempDirection() => $_clearField($_whichOneof(4));

  @$pb.TagNumber(106)
  ClimateState_OptionalRightTempDirection whichOptionalRightTempDirection() =>
      _ClimateState_OptionalRightTempDirectionByTag[$_whichOneof(5)]!;
  @$pb.TagNumber(106)
  void clearOptionalRightTempDirection() => $_clearField($_whichOneof(5));

  @$pb.TagNumber(107)
  ClimateState_OptionalIsFrontDefrosterOn whichOptionalIsFrontDefrosterOn() =>
      _ClimateState_OptionalIsFrontDefrosterOnByTag[$_whichOneof(6)]!;
  @$pb.TagNumber(107)
  void clearOptionalIsFrontDefrosterOn() => $_clearField($_whichOneof(6));

  @$pb.TagNumber(108)
  ClimateState_OptionalIsRearDefrosterOn whichOptionalIsRearDefrosterOn() =>
      _ClimateState_OptionalIsRearDefrosterOnByTag[$_whichOneof(7)]!;
  @$pb.TagNumber(108)
  void clearOptionalIsRearDefrosterOn() => $_clearField($_whichOneof(7));

  @$pb.TagNumber(109)
  ClimateState_OptionalFanStatus whichOptionalFanStatus() =>
      _ClimateState_OptionalFanStatusByTag[$_whichOneof(8)]!;
  @$pb.TagNumber(109)
  void clearOptionalFanStatus() => $_clearField($_whichOneof(8));

  @$pb.TagNumber(110)
  ClimateState_OptionalIsClimateOn whichOptionalIsClimateOn() =>
      _ClimateState_OptionalIsClimateOnByTag[$_whichOneof(9)]!;
  @$pb.TagNumber(110)
  void clearOptionalIsClimateOn() => $_clearField($_whichOneof(9));

  @$pb.TagNumber(111)
  ClimateState_OptionalMinAvailTempCelsius whichOptionalMinAvailTempCelsius() =>
      _ClimateState_OptionalMinAvailTempCelsiusByTag[$_whichOneof(10)]!;
  @$pb.TagNumber(111)
  void clearOptionalMinAvailTempCelsius() => $_clearField($_whichOneof(10));

  @$pb.TagNumber(112)
  ClimateState_OptionalMaxAvailTempCelsius whichOptionalMaxAvailTempCelsius() =>
      _ClimateState_OptionalMaxAvailTempCelsiusByTag[$_whichOneof(11)]!;
  @$pb.TagNumber(112)
  void clearOptionalMaxAvailTempCelsius() => $_clearField($_whichOneof(11));

  @$pb.TagNumber(113)
  ClimateState_OptionalSeatHeaterLeft whichOptionalSeatHeaterLeft() =>
      _ClimateState_OptionalSeatHeaterLeftByTag[$_whichOneof(12)]!;
  @$pb.TagNumber(113)
  void clearOptionalSeatHeaterLeft() => $_clearField($_whichOneof(12));

  @$pb.TagNumber(114)
  ClimateState_OptionalSeatHeaterRight whichOptionalSeatHeaterRight() =>
      _ClimateState_OptionalSeatHeaterRightByTag[$_whichOneof(13)]!;
  @$pb.TagNumber(114)
  void clearOptionalSeatHeaterRight() => $_clearField($_whichOneof(13));

  @$pb.TagNumber(115)
  ClimateState_OptionalSeatHeaterRearLeft whichOptionalSeatHeaterRearLeft() =>
      _ClimateState_OptionalSeatHeaterRearLeftByTag[$_whichOneof(14)]!;
  @$pb.TagNumber(115)
  void clearOptionalSeatHeaterRearLeft() => $_clearField($_whichOneof(14));

  @$pb.TagNumber(116)
  ClimateState_OptionalSeatHeaterRearRight whichOptionalSeatHeaterRearRight() =>
      _ClimateState_OptionalSeatHeaterRearRightByTag[$_whichOneof(15)]!;
  @$pb.TagNumber(116)
  void clearOptionalSeatHeaterRearRight() => $_clearField($_whichOneof(15));

  @$pb.TagNumber(117)
  ClimateState_OptionalSeatHeaterRearCenter
      whichOptionalSeatHeaterRearCenter() =>
          _ClimateState_OptionalSeatHeaterRearCenterByTag[$_whichOneof(16)]!;
  @$pb.TagNumber(117)
  void clearOptionalSeatHeaterRearCenter() => $_clearField($_whichOneof(16));

  @$pb.TagNumber(118)
  ClimateState_OptionalSeatHeaterRearRightBack
      whichOptionalSeatHeaterRearRightBack() =>
          _ClimateState_OptionalSeatHeaterRearRightBackByTag[$_whichOneof(17)]!;
  @$pb.TagNumber(118)
  void clearOptionalSeatHeaterRearRightBack() => $_clearField($_whichOneof(17));

  @$pb.TagNumber(119)
  ClimateState_OptionalSeatHeaterRearLeftBack
      whichOptionalSeatHeaterRearLeftBack() =>
          _ClimateState_OptionalSeatHeaterRearLeftBackByTag[$_whichOneof(18)]!;
  @$pb.TagNumber(119)
  void clearOptionalSeatHeaterRearLeftBack() => $_clearField($_whichOneof(18));

  @$pb.TagNumber(120)
  ClimateState_OptionalSeatHeaterThirdRowRight
      whichOptionalSeatHeaterThirdRowRight() =>
          _ClimateState_OptionalSeatHeaterThirdRowRightByTag[$_whichOneof(19)]!;
  @$pb.TagNumber(120)
  void clearOptionalSeatHeaterThirdRowRight() => $_clearField($_whichOneof(19));

  @$pb.TagNumber(121)
  ClimateState_OptionalSeatHeaterThirdRowLeft
      whichOptionalSeatHeaterThirdRowLeft() =>
          _ClimateState_OptionalSeatHeaterThirdRowLeftByTag[$_whichOneof(20)]!;
  @$pb.TagNumber(121)
  void clearOptionalSeatHeaterThirdRowLeft() => $_clearField($_whichOneof(20));

  @$pb.TagNumber(122)
  ClimateState_OptionalBatteryHeater whichOptionalBatteryHeater() =>
      _ClimateState_OptionalBatteryHeaterByTag[$_whichOneof(21)]!;
  @$pb.TagNumber(122)
  void clearOptionalBatteryHeater() => $_clearField($_whichOneof(21));

  @$pb.TagNumber(123)
  ClimateState_OptionalBatteryHeaterNoPower
      whichOptionalBatteryHeaterNoPower() =>
          _ClimateState_OptionalBatteryHeaterNoPowerByTag[$_whichOneof(22)]!;
  @$pb.TagNumber(123)
  void clearOptionalBatteryHeaterNoPower() => $_clearField($_whichOneof(22));

  @$pb.TagNumber(125)
  ClimateState_OptionalSteeringWheelHeater whichOptionalSteeringWheelHeater() =>
      _ClimateState_OptionalSteeringWheelHeaterByTag[$_whichOneof(23)]!;
  @$pb.TagNumber(125)
  void clearOptionalSteeringWheelHeater() => $_clearField($_whichOneof(23));

  @$pb.TagNumber(126)
  ClimateState_OptionalWiperBladeHeater whichOptionalWiperBladeHeater() =>
      _ClimateState_OptionalWiperBladeHeaterByTag[$_whichOneof(24)]!;
  @$pb.TagNumber(126)
  void clearOptionalWiperBladeHeater() => $_clearField($_whichOneof(24));

  @$pb.TagNumber(127)
  ClimateState_OptionalSideMirrorHeaters whichOptionalSideMirrorHeaters() =>
      _ClimateState_OptionalSideMirrorHeatersByTag[$_whichOneof(25)]!;
  @$pb.TagNumber(127)
  void clearOptionalSideMirrorHeaters() => $_clearField($_whichOneof(25));

  @$pb.TagNumber(128)
  ClimateState_OptionalIsPreconditioning whichOptionalIsPreconditioning() =>
      _ClimateState_OptionalIsPreconditioningByTag[$_whichOneof(26)]!;
  @$pb.TagNumber(128)
  void clearOptionalIsPreconditioning() => $_clearField($_whichOneof(26));

  @$pb.TagNumber(129)
  ClimateState_OptionalRemoteHeaterControlEnabled
      whichOptionalRemoteHeaterControlEnabled() =>
          _ClimateState_OptionalRemoteHeaterControlEnabledByTag[
              $_whichOneof(27)]!;
  @$pb.TagNumber(129)
  void clearOptionalRemoteHeaterControlEnabled() =>
      $_clearField($_whichOneof(27));

  @$pb.TagNumber(134)
  ClimateState_OptionalBioweaponModeOn whichOptionalBioweaponModeOn() =>
      _ClimateState_OptionalBioweaponModeOnByTag[$_whichOneof(28)]!;
  @$pb.TagNumber(134)
  void clearOptionalBioweaponModeOn() => $_clearField($_whichOneof(28));

  @$pb.TagNumber(136)
  ClimateState_OptionalIsAutoConditioningOn
      whichOptionalIsAutoConditioningOn() =>
          _ClimateState_OptionalIsAutoConditioningOnByTag[$_whichOneof(29)]!;
  @$pb.TagNumber(136)
  void clearOptionalIsAutoConditioningOn() => $_clearField($_whichOneof(29));

  @$pb.TagNumber(137)
  ClimateState_OptionalAutoSeatClimateLeft whichOptionalAutoSeatClimateLeft() =>
      _ClimateState_OptionalAutoSeatClimateLeftByTag[$_whichOneof(30)]!;
  @$pb.TagNumber(137)
  void clearOptionalAutoSeatClimateLeft() => $_clearField($_whichOneof(30));

  @$pb.TagNumber(138)
  ClimateState_OptionalAutoSeatClimateRight
      whichOptionalAutoSeatClimateRight() =>
          _ClimateState_OptionalAutoSeatClimateRightByTag[$_whichOneof(31)]!;
  @$pb.TagNumber(138)
  void clearOptionalAutoSeatClimateRight() => $_clearField($_whichOneof(31));

  @$pb.TagNumber(139)
  ClimateState_OptionalSeatFanFrontLeft whichOptionalSeatFanFrontLeft() =>
      _ClimateState_OptionalSeatFanFrontLeftByTag[$_whichOneof(32)]!;
  @$pb.TagNumber(139)
  void clearOptionalSeatFanFrontLeft() => $_clearField($_whichOneof(32));

  @$pb.TagNumber(140)
  ClimateState_OptionalSeatFanFrontRight whichOptionalSeatFanFrontRight() =>
      _ClimateState_OptionalSeatFanFrontRightByTag[$_whichOneof(33)]!;
  @$pb.TagNumber(140)
  void clearOptionalSeatFanFrontRight() => $_clearField($_whichOneof(33));

  @$pb.TagNumber(141)
  ClimateState_OptionalAllowCabinOverheatProtection
      whichOptionalAllowCabinOverheatProtection() =>
          _ClimateState_OptionalAllowCabinOverheatProtectionByTag[
              $_whichOneof(34)]!;
  @$pb.TagNumber(141)
  void clearOptionalAllowCabinOverheatProtection() =>
      $_clearField($_whichOneof(34));

  @$pb.TagNumber(142)
  ClimateState_OptionalSupportsFanOnlyCabinOverheatProtection
      whichOptionalSupportsFanOnlyCabinOverheatProtection() =>
          _ClimateState_OptionalSupportsFanOnlyCabinOverheatProtectionByTag[
              $_whichOneof(35)]!;
  @$pb.TagNumber(142)
  void clearOptionalSupportsFanOnlyCabinOverheatProtection() =>
      $_clearField($_whichOneof(35));

  @$pb.TagNumber(143)
  ClimateState_OptionalCabinOverheatProtection
      whichOptionalCabinOverheatProtection() =>
          _ClimateState_OptionalCabinOverheatProtectionByTag[$_whichOneof(36)]!;
  @$pb.TagNumber(143)
  void clearOptionalCabinOverheatProtection() => $_clearField($_whichOneof(36));

  @$pb.TagNumber(144)
  ClimateState_OptionalCabinOverheatProtectionActivelyCooling
      whichOptionalCabinOverheatProtectionActivelyCooling() =>
          _ClimateState_OptionalCabinOverheatProtectionActivelyCoolingByTag[
              $_whichOneof(37)]!;
  @$pb.TagNumber(144)
  void clearOptionalCabinOverheatProtectionActivelyCooling() =>
      $_clearField($_whichOneof(37));

  @$pb.TagNumber(146)
  ClimateState_OptionalCopActivationTemperature
      whichOptionalCopActivationTemperature() =>
          _ClimateState_OptionalCopActivationTemperatureByTag[
              $_whichOneof(38)]!;
  @$pb.TagNumber(146)
  void clearOptionalCopActivationTemperature() =>
      $_clearField($_whichOneof(38));

  @$pb.TagNumber(147)
  ClimateState_OptionalAutoSteeringWheelHeat
      whichOptionalAutoSteeringWheelHeat() =>
          _ClimateState_OptionalAutoSteeringWheelHeatByTag[$_whichOneof(39)]!;
  @$pb.TagNumber(147)
  void clearOptionalAutoSteeringWheelHeat() => $_clearField($_whichOneof(39));

  @$pb.TagNumber(148)
  ClimateState_OptionalSteeringWheelHeatLevel
      whichOptionalSteeringWheelHeatLevel() =>
          _ClimateState_OptionalSteeringWheelHeatLevelByTag[$_whichOneof(40)]!;
  @$pb.TagNumber(148)
  void clearOptionalSteeringWheelHeatLevel() => $_clearField($_whichOneof(40));

  @$pb.TagNumber(150)
  ClimateState_OptionalHvacAutoRequest whichOptionalHvacAutoRequest() =>
      _ClimateState_OptionalHvacAutoRequestByTag[$_whichOneof(41)]!;
  @$pb.TagNumber(150)
  void clearOptionalHvacAutoRequest() => $_clearField($_whichOneof(41));

  @$pb.TagNumber(151)
  ClimateState_OptionalCopNotRunningReason whichOptionalCopNotRunningReason() =>
      _ClimateState_OptionalCopNotRunningReasonByTag[$_whichOneof(42)]!;
  @$pb.TagNumber(151)
  void clearOptionalCopNotRunningReason() => $_clearField($_whichOneof(42));

  @$pb.TagNumber(30)
  ClimateState_ClimateKeeperMode get climateKeeperMode => $_getN(0);
  @$pb.TagNumber(30)
  set climateKeeperMode(ClimateState_ClimateKeeperMode value) =>
      $_setField(30, value);
  @$pb.TagNumber(30)
  $core.bool hasClimateKeeperMode() => $_has(0);
  @$pb.TagNumber(30)
  void clearClimateKeeperMode() => $_clearField(30);
  @$pb.TagNumber(30)
  ClimateState_ClimateKeeperMode ensureClimateKeeperMode() => $_ensure(0);

  @$pb.TagNumber(33)
  $0.Timestamp get timestamp => $_getN(1);
  @$pb.TagNumber(33)
  set timestamp($0.Timestamp value) => $_setField(33, value);
  @$pb.TagNumber(33)
  $core.bool hasTimestamp() => $_has(1);
  @$pb.TagNumber(33)
  void clearTimestamp() => $_clearField(33);
  @$pb.TagNumber(33)
  $0.Timestamp ensureTimestamp() => $_ensure(1);

  @$pb.TagNumber(35)
  ClimateState_DefrostMode get defrostMode => $_getN(2);
  @$pb.TagNumber(35)
  set defrostMode(ClimateState_DefrostMode value) => $_setField(35, value);
  @$pb.TagNumber(35)
  $core.bool hasDefrostMode() => $_has(2);
  @$pb.TagNumber(35)
  void clearDefrostMode() => $_clearField(35);
  @$pb.TagNumber(35)
  ClimateState_DefrostMode ensureDefrostMode() => $_ensure(2);

  @$pb.TagNumber(101)
  $core.double get insideTempCelsius => $_getN(3);
  @$pb.TagNumber(101)
  set insideTempCelsius($core.double value) => $_setFloat(3, value);
  @$pb.TagNumber(101)
  $core.bool hasInsideTempCelsius() => $_has(3);
  @$pb.TagNumber(101)
  void clearInsideTempCelsius() => $_clearField(101);

  @$pb.TagNumber(102)
  $core.double get outsideTempCelsius => $_getN(4);
  @$pb.TagNumber(102)
  set outsideTempCelsius($core.double value) => $_setFloat(4, value);
  @$pb.TagNumber(102)
  $core.bool hasOutsideTempCelsius() => $_has(4);
  @$pb.TagNumber(102)
  void clearOutsideTempCelsius() => $_clearField(102);

  @$pb.TagNumber(103)
  $core.double get driverTempSetting => $_getN(5);
  @$pb.TagNumber(103)
  set driverTempSetting($core.double value) => $_setFloat(5, value);
  @$pb.TagNumber(103)
  $core.bool hasDriverTempSetting() => $_has(5);
  @$pb.TagNumber(103)
  void clearDriverTempSetting() => $_clearField(103);

  @$pb.TagNumber(104)
  $core.double get passengerTempSetting => $_getN(6);
  @$pb.TagNumber(104)
  set passengerTempSetting($core.double value) => $_setFloat(6, value);
  @$pb.TagNumber(104)
  $core.bool hasPassengerTempSetting() => $_has(6);
  @$pb.TagNumber(104)
  void clearPassengerTempSetting() => $_clearField(104);

  @$pb.TagNumber(105)
  $core.int get leftTempDirection => $_getIZ(7);
  @$pb.TagNumber(105)
  set leftTempDirection($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(105)
  $core.bool hasLeftTempDirection() => $_has(7);
  @$pb.TagNumber(105)
  void clearLeftTempDirection() => $_clearField(105);

  @$pb.TagNumber(106)
  $core.int get rightTempDirection => $_getIZ(8);
  @$pb.TagNumber(106)
  set rightTempDirection($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(106)
  $core.bool hasRightTempDirection() => $_has(8);
  @$pb.TagNumber(106)
  void clearRightTempDirection() => $_clearField(106);

  @$pb.TagNumber(107)
  $core.bool get isFrontDefrosterOn => $_getBF(9);
  @$pb.TagNumber(107)
  set isFrontDefrosterOn($core.bool value) => $_setBool(9, value);
  @$pb.TagNumber(107)
  $core.bool hasIsFrontDefrosterOn() => $_has(9);
  @$pb.TagNumber(107)
  void clearIsFrontDefrosterOn() => $_clearField(107);

  @$pb.TagNumber(108)
  $core.bool get isRearDefrosterOn => $_getBF(10);
  @$pb.TagNumber(108)
  set isRearDefrosterOn($core.bool value) => $_setBool(10, value);
  @$pb.TagNumber(108)
  $core.bool hasIsRearDefrosterOn() => $_has(10);
  @$pb.TagNumber(108)
  void clearIsRearDefrosterOn() => $_clearField(108);

  @$pb.TagNumber(109)
  $core.int get fanStatus => $_getIZ(11);
  @$pb.TagNumber(109)
  set fanStatus($core.int value) => $_setSignedInt32(11, value);
  @$pb.TagNumber(109)
  $core.bool hasFanStatus() => $_has(11);
  @$pb.TagNumber(109)
  void clearFanStatus() => $_clearField(109);

  @$pb.TagNumber(110)
  $core.bool get isClimateOn => $_getBF(12);
  @$pb.TagNumber(110)
  set isClimateOn($core.bool value) => $_setBool(12, value);
  @$pb.TagNumber(110)
  $core.bool hasIsClimateOn() => $_has(12);
  @$pb.TagNumber(110)
  void clearIsClimateOn() => $_clearField(110);

  @$pb.TagNumber(111)
  $core.double get minAvailTempCelsius => $_getN(13);
  @$pb.TagNumber(111)
  set minAvailTempCelsius($core.double value) => $_setFloat(13, value);
  @$pb.TagNumber(111)
  $core.bool hasMinAvailTempCelsius() => $_has(13);
  @$pb.TagNumber(111)
  void clearMinAvailTempCelsius() => $_clearField(111);

  @$pb.TagNumber(112)
  $core.double get maxAvailTempCelsius => $_getN(14);
  @$pb.TagNumber(112)
  set maxAvailTempCelsius($core.double value) => $_setFloat(14, value);
  @$pb.TagNumber(112)
  $core.bool hasMaxAvailTempCelsius() => $_has(14);
  @$pb.TagNumber(112)
  void clearMaxAvailTempCelsius() => $_clearField(112);

  @$pb.TagNumber(113)
  $core.int get seatHeaterLeft => $_getIZ(15);
  @$pb.TagNumber(113)
  set seatHeaterLeft($core.int value) => $_setSignedInt32(15, value);
  @$pb.TagNumber(113)
  $core.bool hasSeatHeaterLeft() => $_has(15);
  @$pb.TagNumber(113)
  void clearSeatHeaterLeft() => $_clearField(113);

  @$pb.TagNumber(114)
  $core.int get seatHeaterRight => $_getIZ(16);
  @$pb.TagNumber(114)
  set seatHeaterRight($core.int value) => $_setSignedInt32(16, value);
  @$pb.TagNumber(114)
  $core.bool hasSeatHeaterRight() => $_has(16);
  @$pb.TagNumber(114)
  void clearSeatHeaterRight() => $_clearField(114);

  @$pb.TagNumber(115)
  $core.int get seatHeaterRearLeft => $_getIZ(17);
  @$pb.TagNumber(115)
  set seatHeaterRearLeft($core.int value) => $_setSignedInt32(17, value);
  @$pb.TagNumber(115)
  $core.bool hasSeatHeaterRearLeft() => $_has(17);
  @$pb.TagNumber(115)
  void clearSeatHeaterRearLeft() => $_clearField(115);

  @$pb.TagNumber(116)
  $core.int get seatHeaterRearRight => $_getIZ(18);
  @$pb.TagNumber(116)
  set seatHeaterRearRight($core.int value) => $_setSignedInt32(18, value);
  @$pb.TagNumber(116)
  $core.bool hasSeatHeaterRearRight() => $_has(18);
  @$pb.TagNumber(116)
  void clearSeatHeaterRearRight() => $_clearField(116);

  @$pb.TagNumber(117)
  $core.int get seatHeaterRearCenter => $_getIZ(19);
  @$pb.TagNumber(117)
  set seatHeaterRearCenter($core.int value) => $_setSignedInt32(19, value);
  @$pb.TagNumber(117)
  $core.bool hasSeatHeaterRearCenter() => $_has(19);
  @$pb.TagNumber(117)
  void clearSeatHeaterRearCenter() => $_clearField(117);

  @$pb.TagNumber(118)
  $core.int get seatHeaterRearRightBack => $_getIZ(20);
  @$pb.TagNumber(118)
  set seatHeaterRearRightBack($core.int value) => $_setSignedInt32(20, value);
  @$pb.TagNumber(118)
  $core.bool hasSeatHeaterRearRightBack() => $_has(20);
  @$pb.TagNumber(118)
  void clearSeatHeaterRearRightBack() => $_clearField(118);

  @$pb.TagNumber(119)
  $core.int get seatHeaterRearLeftBack => $_getIZ(21);
  @$pb.TagNumber(119)
  set seatHeaterRearLeftBack($core.int value) => $_setSignedInt32(21, value);
  @$pb.TagNumber(119)
  $core.bool hasSeatHeaterRearLeftBack() => $_has(21);
  @$pb.TagNumber(119)
  void clearSeatHeaterRearLeftBack() => $_clearField(119);

  @$pb.TagNumber(120)
  $core.int get seatHeaterThirdRowRight => $_getIZ(22);
  @$pb.TagNumber(120)
  set seatHeaterThirdRowRight($core.int value) => $_setSignedInt32(22, value);
  @$pb.TagNumber(120)
  $core.bool hasSeatHeaterThirdRowRight() => $_has(22);
  @$pb.TagNumber(120)
  void clearSeatHeaterThirdRowRight() => $_clearField(120);

  @$pb.TagNumber(121)
  $core.int get seatHeaterThirdRowLeft => $_getIZ(23);
  @$pb.TagNumber(121)
  set seatHeaterThirdRowLeft($core.int value) => $_setSignedInt32(23, value);
  @$pb.TagNumber(121)
  $core.bool hasSeatHeaterThirdRowLeft() => $_has(23);
  @$pb.TagNumber(121)
  void clearSeatHeaterThirdRowLeft() => $_clearField(121);

  @$pb.TagNumber(122)
  $core.bool get batteryHeater => $_getBF(24);
  @$pb.TagNumber(122)
  set batteryHeater($core.bool value) => $_setBool(24, value);
  @$pb.TagNumber(122)
  $core.bool hasBatteryHeater() => $_has(24);
  @$pb.TagNumber(122)
  void clearBatteryHeater() => $_clearField(122);

  @$pb.TagNumber(123)
  $core.bool get batteryHeaterNoPower => $_getBF(25);
  @$pb.TagNumber(123)
  set batteryHeaterNoPower($core.bool value) => $_setBool(25, value);
  @$pb.TagNumber(123)
  $core.bool hasBatteryHeaterNoPower() => $_has(25);
  @$pb.TagNumber(123)
  void clearBatteryHeaterNoPower() => $_clearField(123);

  @$pb.TagNumber(125)
  $core.bool get steeringWheelHeater => $_getBF(26);
  @$pb.TagNumber(125)
  set steeringWheelHeater($core.bool value) => $_setBool(26, value);
  @$pb.TagNumber(125)
  $core.bool hasSteeringWheelHeater() => $_has(26);
  @$pb.TagNumber(125)
  void clearSteeringWheelHeater() => $_clearField(125);

  @$pb.TagNumber(126)
  $core.bool get wiperBladeHeater => $_getBF(27);
  @$pb.TagNumber(126)
  set wiperBladeHeater($core.bool value) => $_setBool(27, value);
  @$pb.TagNumber(126)
  $core.bool hasWiperBladeHeater() => $_has(27);
  @$pb.TagNumber(126)
  void clearWiperBladeHeater() => $_clearField(126);

  @$pb.TagNumber(127)
  $core.bool get sideMirrorHeaters => $_getBF(28);
  @$pb.TagNumber(127)
  set sideMirrorHeaters($core.bool value) => $_setBool(28, value);
  @$pb.TagNumber(127)
  $core.bool hasSideMirrorHeaters() => $_has(28);
  @$pb.TagNumber(127)
  void clearSideMirrorHeaters() => $_clearField(127);

  @$pb.TagNumber(128)
  $core.bool get isPreconditioning => $_getBF(29);
  @$pb.TagNumber(128)
  set isPreconditioning($core.bool value) => $_setBool(29, value);
  @$pb.TagNumber(128)
  $core.bool hasIsPreconditioning() => $_has(29);
  @$pb.TagNumber(128)
  void clearIsPreconditioning() => $_clearField(128);

  @$pb.TagNumber(129)
  $core.bool get remoteHeaterControlEnabled => $_getBF(30);
  @$pb.TagNumber(129)
  set remoteHeaterControlEnabled($core.bool value) => $_setBool(30, value);
  @$pb.TagNumber(129)
  $core.bool hasRemoteHeaterControlEnabled() => $_has(30);
  @$pb.TagNumber(129)
  void clearRemoteHeaterControlEnabled() => $_clearField(129);

  @$pb.TagNumber(134)
  $core.bool get bioweaponModeOn => $_getBF(31);
  @$pb.TagNumber(134)
  set bioweaponModeOn($core.bool value) => $_setBool(31, value);
  @$pb.TagNumber(134)
  $core.bool hasBioweaponModeOn() => $_has(31);
  @$pb.TagNumber(134)
  void clearBioweaponModeOn() => $_clearField(134);

  @$pb.TagNumber(136)
  $core.bool get isAutoConditioningOn => $_getBF(32);
  @$pb.TagNumber(136)
  set isAutoConditioningOn($core.bool value) => $_setBool(32, value);
  @$pb.TagNumber(136)
  $core.bool hasIsAutoConditioningOn() => $_has(32);
  @$pb.TagNumber(136)
  void clearIsAutoConditioningOn() => $_clearField(136);

  @$pb.TagNumber(137)
  $core.bool get autoSeatClimateLeft => $_getBF(33);
  @$pb.TagNumber(137)
  set autoSeatClimateLeft($core.bool value) => $_setBool(33, value);
  @$pb.TagNumber(137)
  $core.bool hasAutoSeatClimateLeft() => $_has(33);
  @$pb.TagNumber(137)
  void clearAutoSeatClimateLeft() => $_clearField(137);

  @$pb.TagNumber(138)
  $core.bool get autoSeatClimateRight => $_getBF(34);
  @$pb.TagNumber(138)
  set autoSeatClimateRight($core.bool value) => $_setBool(34, value);
  @$pb.TagNumber(138)
  $core.bool hasAutoSeatClimateRight() => $_has(34);
  @$pb.TagNumber(138)
  void clearAutoSeatClimateRight() => $_clearField(138);

  @$pb.TagNumber(139)
  $core.int get seatFanFrontLeft => $_getIZ(35);
  @$pb.TagNumber(139)
  set seatFanFrontLeft($core.int value) => $_setSignedInt32(35, value);
  @$pb.TagNumber(139)
  $core.bool hasSeatFanFrontLeft() => $_has(35);
  @$pb.TagNumber(139)
  void clearSeatFanFrontLeft() => $_clearField(139);

  @$pb.TagNumber(140)
  $core.int get seatFanFrontRight => $_getIZ(36);
  @$pb.TagNumber(140)
  set seatFanFrontRight($core.int value) => $_setSignedInt32(36, value);
  @$pb.TagNumber(140)
  $core.bool hasSeatFanFrontRight() => $_has(36);
  @$pb.TagNumber(140)
  void clearSeatFanFrontRight() => $_clearField(140);

  @$pb.TagNumber(141)
  $core.bool get allowCabinOverheatProtection => $_getBF(37);
  @$pb.TagNumber(141)
  set allowCabinOverheatProtection($core.bool value) => $_setBool(37, value);
  @$pb.TagNumber(141)
  $core.bool hasAllowCabinOverheatProtection() => $_has(37);
  @$pb.TagNumber(141)
  void clearAllowCabinOverheatProtection() => $_clearField(141);

  @$pb.TagNumber(142)
  $core.bool get supportsFanOnlyCabinOverheatProtection => $_getBF(38);
  @$pb.TagNumber(142)
  set supportsFanOnlyCabinOverheatProtection($core.bool value) =>
      $_setBool(38, value);
  @$pb.TagNumber(142)
  $core.bool hasSupportsFanOnlyCabinOverheatProtection() => $_has(38);
  @$pb.TagNumber(142)
  void clearSupportsFanOnlyCabinOverheatProtection() => $_clearField(142);

  @$pb.TagNumber(143)
  ClimateState_CabinOverheatProtection_E get cabinOverheatProtection =>
      $_getN(39);
  @$pb.TagNumber(143)
  set cabinOverheatProtection(ClimateState_CabinOverheatProtection_E value) =>
      $_setField(143, value);
  @$pb.TagNumber(143)
  $core.bool hasCabinOverheatProtection() => $_has(39);
  @$pb.TagNumber(143)
  void clearCabinOverheatProtection() => $_clearField(143);

  @$pb.TagNumber(144)
  $core.bool get cabinOverheatProtectionActivelyCooling => $_getBF(40);
  @$pb.TagNumber(144)
  set cabinOverheatProtectionActivelyCooling($core.bool value) =>
      $_setBool(40, value);
  @$pb.TagNumber(144)
  $core.bool hasCabinOverheatProtectionActivelyCooling() => $_has(40);
  @$pb.TagNumber(144)
  void clearCabinOverheatProtectionActivelyCooling() => $_clearField(144);

  @$pb.TagNumber(146)
  ClimateState_CopActivationTemp get copActivationTemperature => $_getN(41);
  @$pb.TagNumber(146)
  set copActivationTemperature(ClimateState_CopActivationTemp value) =>
      $_setField(146, value);
  @$pb.TagNumber(146)
  $core.bool hasCopActivationTemperature() => $_has(41);
  @$pb.TagNumber(146)
  void clearCopActivationTemperature() => $_clearField(146);

  @$pb.TagNumber(147)
  $core.bool get autoSteeringWheelHeat => $_getBF(42);
  @$pb.TagNumber(147)
  set autoSteeringWheelHeat($core.bool value) => $_setBool(42, value);
  @$pb.TagNumber(147)
  $core.bool hasAutoSteeringWheelHeat() => $_has(42);
  @$pb.TagNumber(147)
  void clearAutoSteeringWheelHeat() => $_clearField(147);

  @$pb.TagNumber(148)
  $1.StwHeatLevel get steeringWheelHeatLevel => $_getN(43);
  @$pb.TagNumber(148)
  set steeringWheelHeatLevel($1.StwHeatLevel value) => $_setField(148, value);
  @$pb.TagNumber(148)
  $core.bool hasSteeringWheelHeatLevel() => $_has(43);
  @$pb.TagNumber(148)
  void clearSteeringWheelHeatLevel() => $_clearField(148);

  @$pb.TagNumber(150)
  ClimateState_HvacAutoRequest get hvacAutoRequest => $_getN(44);
  @$pb.TagNumber(150)
  set hvacAutoRequest(ClimateState_HvacAutoRequest value) =>
      $_setField(150, value);
  @$pb.TagNumber(150)
  $core.bool hasHvacAutoRequest() => $_has(44);
  @$pb.TagNumber(150)
  void clearHvacAutoRequest() => $_clearField(150);

  @$pb.TagNumber(151)
  ClimateState_COPNotRunningReason get copNotRunningReason => $_getN(45);
  @$pb.TagNumber(151)
  set copNotRunningReason(ClimateState_COPNotRunningReason value) =>
      $_setField(151, value);
  @$pb.TagNumber(151)
  $core.bool hasCopNotRunningReason() => $_has(45);
  @$pb.TagNumber(151)
  void clearCopNotRunningReason() => $_clearField(151);
}

enum TirePressureState_OptionalTpmsPressureFl { tpmsPressureFl, notSet }

enum TirePressureState_OptionalTpmsPressureFr { tpmsPressureFr, notSet }

enum TirePressureState_OptionalTpmsPressureRl { tpmsPressureRl, notSet }

enum TirePressureState_OptionalTpmsPressureRr { tpmsPressureRr, notSet }

enum TirePressureState_OptionalTpmsHardWarningFl { tpmsHardWarningFl, notSet }

enum TirePressureState_OptionalTpmsHardWarningFr { tpmsHardWarningFr, notSet }

enum TirePressureState_OptionalTpmsHardWarningRl { tpmsHardWarningRl, notSet }

enum TirePressureState_OptionalTpmsHardWarningRr { tpmsHardWarningRr, notSet }

enum TirePressureState_OptionalTpmsSoftWarningFl { tpmsSoftWarningFl, notSet }

enum TirePressureState_OptionalTpmsSoftWarningFr { tpmsSoftWarningFr, notSet }

enum TirePressureState_OptionalTpmsSoftWarningRl { tpmsSoftWarningRl, notSet }

enum TirePressureState_OptionalTpmsSoftWarningRr { tpmsSoftWarningRr, notSet }

enum TirePressureState_OptionalTpmsRcpFrontValue { tpmsRcpFrontValue, notSet }

enum TirePressureState_OptionalTpmsRcpRearValue { tpmsRcpRearValue, notSet }

class TirePressureState extends $pb.GeneratedMessage {
  factory TirePressureState({
    $0.Timestamp? timestamp,
    $core.double? tpmsPressureFl,
    $core.double? tpmsPressureFr,
    $core.double? tpmsPressureRl,
    $core.double? tpmsPressureRr,
    $0.Timestamp? tpmsLastSeenPressureTimeFl,
    $0.Timestamp? tpmsLastSeenPressureTimeFr,
    $0.Timestamp? tpmsLastSeenPressureTimeRl,
    $0.Timestamp? tpmsLastSeenPressureTimeRr,
    $core.bool? tpmsHardWarningFl,
    $core.bool? tpmsHardWarningFr,
    $core.bool? tpmsHardWarningRl,
    $core.bool? tpmsHardWarningRr,
    $core.bool? tpmsSoftWarningFl,
    $core.bool? tpmsSoftWarningFr,
    $core.bool? tpmsSoftWarningRl,
    $core.bool? tpmsSoftWarningRr,
    $core.double? tpmsRcpFrontValue,
    $core.double? tpmsRcpRearValue,
  }) {
    final result = create();
    if (timestamp != null) result.timestamp = timestamp;
    if (tpmsPressureFl != null) result.tpmsPressureFl = tpmsPressureFl;
    if (tpmsPressureFr != null) result.tpmsPressureFr = tpmsPressureFr;
    if (tpmsPressureRl != null) result.tpmsPressureRl = tpmsPressureRl;
    if (tpmsPressureRr != null) result.tpmsPressureRr = tpmsPressureRr;
    if (tpmsLastSeenPressureTimeFl != null)
      result.tpmsLastSeenPressureTimeFl = tpmsLastSeenPressureTimeFl;
    if (tpmsLastSeenPressureTimeFr != null)
      result.tpmsLastSeenPressureTimeFr = tpmsLastSeenPressureTimeFr;
    if (tpmsLastSeenPressureTimeRl != null)
      result.tpmsLastSeenPressureTimeRl = tpmsLastSeenPressureTimeRl;
    if (tpmsLastSeenPressureTimeRr != null)
      result.tpmsLastSeenPressureTimeRr = tpmsLastSeenPressureTimeRr;
    if (tpmsHardWarningFl != null) result.tpmsHardWarningFl = tpmsHardWarningFl;
    if (tpmsHardWarningFr != null) result.tpmsHardWarningFr = tpmsHardWarningFr;
    if (tpmsHardWarningRl != null) result.tpmsHardWarningRl = tpmsHardWarningRl;
    if (tpmsHardWarningRr != null) result.tpmsHardWarningRr = tpmsHardWarningRr;
    if (tpmsSoftWarningFl != null) result.tpmsSoftWarningFl = tpmsSoftWarningFl;
    if (tpmsSoftWarningFr != null) result.tpmsSoftWarningFr = tpmsSoftWarningFr;
    if (tpmsSoftWarningRl != null) result.tpmsSoftWarningRl = tpmsSoftWarningRl;
    if (tpmsSoftWarningRr != null) result.tpmsSoftWarningRr = tpmsSoftWarningRr;
    if (tpmsRcpFrontValue != null) result.tpmsRcpFrontValue = tpmsRcpFrontValue;
    if (tpmsRcpRearValue != null) result.tpmsRcpRearValue = tpmsRcpRearValue;
    return result;
  }

  TirePressureState._();

  factory TirePressureState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TirePressureState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, TirePressureState_OptionalTpmsPressureFl>
      _TirePressureState_OptionalTpmsPressureFlByTag = {
    2: TirePressureState_OptionalTpmsPressureFl.tpmsPressureFl,
    0: TirePressureState_OptionalTpmsPressureFl.notSet
  };
  static const $core.Map<$core.int, TirePressureState_OptionalTpmsPressureFr>
      _TirePressureState_OptionalTpmsPressureFrByTag = {
    3: TirePressureState_OptionalTpmsPressureFr.tpmsPressureFr,
    0: TirePressureState_OptionalTpmsPressureFr.notSet
  };
  static const $core.Map<$core.int, TirePressureState_OptionalTpmsPressureRl>
      _TirePressureState_OptionalTpmsPressureRlByTag = {
    4: TirePressureState_OptionalTpmsPressureRl.tpmsPressureRl,
    0: TirePressureState_OptionalTpmsPressureRl.notSet
  };
  static const $core.Map<$core.int, TirePressureState_OptionalTpmsPressureRr>
      _TirePressureState_OptionalTpmsPressureRrByTag = {
    5: TirePressureState_OptionalTpmsPressureRr.tpmsPressureRr,
    0: TirePressureState_OptionalTpmsPressureRr.notSet
  };
  static const $core.Map<$core.int, TirePressureState_OptionalTpmsHardWarningFl>
      _TirePressureState_OptionalTpmsHardWarningFlByTag = {
    10: TirePressureState_OptionalTpmsHardWarningFl.tpmsHardWarningFl,
    0: TirePressureState_OptionalTpmsHardWarningFl.notSet
  };
  static const $core.Map<$core.int, TirePressureState_OptionalTpmsHardWarningFr>
      _TirePressureState_OptionalTpmsHardWarningFrByTag = {
    11: TirePressureState_OptionalTpmsHardWarningFr.tpmsHardWarningFr,
    0: TirePressureState_OptionalTpmsHardWarningFr.notSet
  };
  static const $core.Map<$core.int, TirePressureState_OptionalTpmsHardWarningRl>
      _TirePressureState_OptionalTpmsHardWarningRlByTag = {
    12: TirePressureState_OptionalTpmsHardWarningRl.tpmsHardWarningRl,
    0: TirePressureState_OptionalTpmsHardWarningRl.notSet
  };
  static const $core.Map<$core.int, TirePressureState_OptionalTpmsHardWarningRr>
      _TirePressureState_OptionalTpmsHardWarningRrByTag = {
    13: TirePressureState_OptionalTpmsHardWarningRr.tpmsHardWarningRr,
    0: TirePressureState_OptionalTpmsHardWarningRr.notSet
  };
  static const $core.Map<$core.int, TirePressureState_OptionalTpmsSoftWarningFl>
      _TirePressureState_OptionalTpmsSoftWarningFlByTag = {
    14: TirePressureState_OptionalTpmsSoftWarningFl.tpmsSoftWarningFl,
    0: TirePressureState_OptionalTpmsSoftWarningFl.notSet
  };
  static const $core.Map<$core.int, TirePressureState_OptionalTpmsSoftWarningFr>
      _TirePressureState_OptionalTpmsSoftWarningFrByTag = {
    15: TirePressureState_OptionalTpmsSoftWarningFr.tpmsSoftWarningFr,
    0: TirePressureState_OptionalTpmsSoftWarningFr.notSet
  };
  static const $core.Map<$core.int, TirePressureState_OptionalTpmsSoftWarningRl>
      _TirePressureState_OptionalTpmsSoftWarningRlByTag = {
    16: TirePressureState_OptionalTpmsSoftWarningRl.tpmsSoftWarningRl,
    0: TirePressureState_OptionalTpmsSoftWarningRl.notSet
  };
  static const $core.Map<$core.int, TirePressureState_OptionalTpmsSoftWarningRr>
      _TirePressureState_OptionalTpmsSoftWarningRrByTag = {
    17: TirePressureState_OptionalTpmsSoftWarningRr.tpmsSoftWarningRr,
    0: TirePressureState_OptionalTpmsSoftWarningRr.notSet
  };
  static const $core.Map<$core.int, TirePressureState_OptionalTpmsRcpFrontValue>
      _TirePressureState_OptionalTpmsRcpFrontValueByTag = {
    18: TirePressureState_OptionalTpmsRcpFrontValue.tpmsRcpFrontValue,
    0: TirePressureState_OptionalTpmsRcpFrontValue.notSet
  };
  static const $core.Map<$core.int, TirePressureState_OptionalTpmsRcpRearValue>
      _TirePressureState_OptionalTpmsRcpRearValueByTag = {
    19: TirePressureState_OptionalTpmsRcpRearValue.tpmsRcpRearValue,
    0: TirePressureState_OptionalTpmsRcpRearValue.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TirePressureState',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..oo(0, [2])
    ..oo(1, [3])
    ..oo(2, [4])
    ..oo(3, [5])
    ..oo(4, [10])
    ..oo(5, [11])
    ..oo(6, [12])
    ..oo(7, [13])
    ..oo(8, [14])
    ..oo(9, [15])
    ..oo(10, [16])
    ..oo(11, [17])
    ..oo(12, [18])
    ..oo(13, [19])
    ..aOM<$0.Timestamp>(1, _omitFieldNames ? '' : 'timestamp',
        subBuilder: $0.Timestamp.create)
    ..aD(2, _omitFieldNames ? '' : 'tpmsPressureFl',
        fieldType: $pb.PbFieldType.OF)
    ..aD(3, _omitFieldNames ? '' : 'tpmsPressureFr',
        fieldType: $pb.PbFieldType.OF)
    ..aD(4, _omitFieldNames ? '' : 'tpmsPressureRl',
        fieldType: $pb.PbFieldType.OF)
    ..aD(5, _omitFieldNames ? '' : 'tpmsPressureRr',
        fieldType: $pb.PbFieldType.OF)
    ..aOM<$0.Timestamp>(6, _omitFieldNames ? '' : 'tpmsLastSeenPressureTimeFl',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(7, _omitFieldNames ? '' : 'tpmsLastSeenPressureTimeFr',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(8, _omitFieldNames ? '' : 'tpmsLastSeenPressureTimeRl',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(9, _omitFieldNames ? '' : 'tpmsLastSeenPressureTimeRr',
        subBuilder: $0.Timestamp.create)
    ..aOB(10, _omitFieldNames ? '' : 'tpmsHardWarningFl')
    ..aOB(11, _omitFieldNames ? '' : 'tpmsHardWarningFr')
    ..aOB(12, _omitFieldNames ? '' : 'tpmsHardWarningRl')
    ..aOB(13, _omitFieldNames ? '' : 'tpmsHardWarningRr')
    ..aOB(14, _omitFieldNames ? '' : 'tpmsSoftWarningFl')
    ..aOB(15, _omitFieldNames ? '' : 'tpmsSoftWarningFr')
    ..aOB(16, _omitFieldNames ? '' : 'tpmsSoftWarningRl')
    ..aOB(17, _omitFieldNames ? '' : 'tpmsSoftWarningRr')
    ..aD(18, _omitFieldNames ? '' : 'tpmsRcpFrontValue',
        fieldType: $pb.PbFieldType.OF)
    ..aD(19, _omitFieldNames ? '' : 'tpmsRcpRearValue',
        fieldType: $pb.PbFieldType.OF)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TirePressureState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TirePressureState copyWith(void Function(TirePressureState) updates) =>
      super.copyWith((message) => updates(message as TirePressureState))
          as TirePressureState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TirePressureState create() => TirePressureState._();
  @$core.override
  TirePressureState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TirePressureState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TirePressureState>(create);
  static TirePressureState? _defaultInstance;

  @$pb.TagNumber(2)
  TirePressureState_OptionalTpmsPressureFl whichOptionalTpmsPressureFl() =>
      _TirePressureState_OptionalTpmsPressureFlByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(2)
  void clearOptionalTpmsPressureFl() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(3)
  TirePressureState_OptionalTpmsPressureFr whichOptionalTpmsPressureFr() =>
      _TirePressureState_OptionalTpmsPressureFrByTag[$_whichOneof(1)]!;
  @$pb.TagNumber(3)
  void clearOptionalTpmsPressureFr() => $_clearField($_whichOneof(1));

  @$pb.TagNumber(4)
  TirePressureState_OptionalTpmsPressureRl whichOptionalTpmsPressureRl() =>
      _TirePressureState_OptionalTpmsPressureRlByTag[$_whichOneof(2)]!;
  @$pb.TagNumber(4)
  void clearOptionalTpmsPressureRl() => $_clearField($_whichOneof(2));

  @$pb.TagNumber(5)
  TirePressureState_OptionalTpmsPressureRr whichOptionalTpmsPressureRr() =>
      _TirePressureState_OptionalTpmsPressureRrByTag[$_whichOneof(3)]!;
  @$pb.TagNumber(5)
  void clearOptionalTpmsPressureRr() => $_clearField($_whichOneof(3));

  @$pb.TagNumber(10)
  TirePressureState_OptionalTpmsHardWarningFl
      whichOptionalTpmsHardWarningFl() =>
          _TirePressureState_OptionalTpmsHardWarningFlByTag[$_whichOneof(4)]!;
  @$pb.TagNumber(10)
  void clearOptionalTpmsHardWarningFl() => $_clearField($_whichOneof(4));

  @$pb.TagNumber(11)
  TirePressureState_OptionalTpmsHardWarningFr
      whichOptionalTpmsHardWarningFr() =>
          _TirePressureState_OptionalTpmsHardWarningFrByTag[$_whichOneof(5)]!;
  @$pb.TagNumber(11)
  void clearOptionalTpmsHardWarningFr() => $_clearField($_whichOneof(5));

  @$pb.TagNumber(12)
  TirePressureState_OptionalTpmsHardWarningRl
      whichOptionalTpmsHardWarningRl() =>
          _TirePressureState_OptionalTpmsHardWarningRlByTag[$_whichOneof(6)]!;
  @$pb.TagNumber(12)
  void clearOptionalTpmsHardWarningRl() => $_clearField($_whichOneof(6));

  @$pb.TagNumber(13)
  TirePressureState_OptionalTpmsHardWarningRr
      whichOptionalTpmsHardWarningRr() =>
          _TirePressureState_OptionalTpmsHardWarningRrByTag[$_whichOneof(7)]!;
  @$pb.TagNumber(13)
  void clearOptionalTpmsHardWarningRr() => $_clearField($_whichOneof(7));

  @$pb.TagNumber(14)
  TirePressureState_OptionalTpmsSoftWarningFl
      whichOptionalTpmsSoftWarningFl() =>
          _TirePressureState_OptionalTpmsSoftWarningFlByTag[$_whichOneof(8)]!;
  @$pb.TagNumber(14)
  void clearOptionalTpmsSoftWarningFl() => $_clearField($_whichOneof(8));

  @$pb.TagNumber(15)
  TirePressureState_OptionalTpmsSoftWarningFr
      whichOptionalTpmsSoftWarningFr() =>
          _TirePressureState_OptionalTpmsSoftWarningFrByTag[$_whichOneof(9)]!;
  @$pb.TagNumber(15)
  void clearOptionalTpmsSoftWarningFr() => $_clearField($_whichOneof(9));

  @$pb.TagNumber(16)
  TirePressureState_OptionalTpmsSoftWarningRl
      whichOptionalTpmsSoftWarningRl() =>
          _TirePressureState_OptionalTpmsSoftWarningRlByTag[$_whichOneof(10)]!;
  @$pb.TagNumber(16)
  void clearOptionalTpmsSoftWarningRl() => $_clearField($_whichOneof(10));

  @$pb.TagNumber(17)
  TirePressureState_OptionalTpmsSoftWarningRr
      whichOptionalTpmsSoftWarningRr() =>
          _TirePressureState_OptionalTpmsSoftWarningRrByTag[$_whichOneof(11)]!;
  @$pb.TagNumber(17)
  void clearOptionalTpmsSoftWarningRr() => $_clearField($_whichOneof(11));

  @$pb.TagNumber(18)
  TirePressureState_OptionalTpmsRcpFrontValue
      whichOptionalTpmsRcpFrontValue() =>
          _TirePressureState_OptionalTpmsRcpFrontValueByTag[$_whichOneof(12)]!;
  @$pb.TagNumber(18)
  void clearOptionalTpmsRcpFrontValue() => $_clearField($_whichOneof(12));

  @$pb.TagNumber(19)
  TirePressureState_OptionalTpmsRcpRearValue whichOptionalTpmsRcpRearValue() =>
      _TirePressureState_OptionalTpmsRcpRearValueByTag[$_whichOneof(13)]!;
  @$pb.TagNumber(19)
  void clearOptionalTpmsRcpRearValue() => $_clearField($_whichOneof(13));

  /// tpms pressure values in bar
  @$pb.TagNumber(1)
  $0.Timestamp get timestamp => $_getN(0);
  @$pb.TagNumber(1)
  set timestamp($0.Timestamp value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTimestamp() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimestamp() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.Timestamp ensureTimestamp() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.double get tpmsPressureFl => $_getN(1);
  @$pb.TagNumber(2)
  set tpmsPressureFl($core.double value) => $_setFloat(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTpmsPressureFl() => $_has(1);
  @$pb.TagNumber(2)
  void clearTpmsPressureFl() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get tpmsPressureFr => $_getN(2);
  @$pb.TagNumber(3)
  set tpmsPressureFr($core.double value) => $_setFloat(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTpmsPressureFr() => $_has(2);
  @$pb.TagNumber(3)
  void clearTpmsPressureFr() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get tpmsPressureRl => $_getN(3);
  @$pb.TagNumber(4)
  set tpmsPressureRl($core.double value) => $_setFloat(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTpmsPressureRl() => $_has(3);
  @$pb.TagNumber(4)
  void clearTpmsPressureRl() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get tpmsPressureRr => $_getN(4);
  @$pb.TagNumber(5)
  set tpmsPressureRr($core.double value) => $_setFloat(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTpmsPressureRr() => $_has(4);
  @$pb.TagNumber(5)
  void clearTpmsPressureRr() => $_clearField(5);

  @$pb.TagNumber(6)
  $0.Timestamp get tpmsLastSeenPressureTimeFl => $_getN(5);
  @$pb.TagNumber(6)
  set tpmsLastSeenPressureTimeFl($0.Timestamp value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasTpmsLastSeenPressureTimeFl() => $_has(5);
  @$pb.TagNumber(6)
  void clearTpmsLastSeenPressureTimeFl() => $_clearField(6);
  @$pb.TagNumber(6)
  $0.Timestamp ensureTpmsLastSeenPressureTimeFl() => $_ensure(5);

  @$pb.TagNumber(7)
  $0.Timestamp get tpmsLastSeenPressureTimeFr => $_getN(6);
  @$pb.TagNumber(7)
  set tpmsLastSeenPressureTimeFr($0.Timestamp value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasTpmsLastSeenPressureTimeFr() => $_has(6);
  @$pb.TagNumber(7)
  void clearTpmsLastSeenPressureTimeFr() => $_clearField(7);
  @$pb.TagNumber(7)
  $0.Timestamp ensureTpmsLastSeenPressureTimeFr() => $_ensure(6);

  @$pb.TagNumber(8)
  $0.Timestamp get tpmsLastSeenPressureTimeRl => $_getN(7);
  @$pb.TagNumber(8)
  set tpmsLastSeenPressureTimeRl($0.Timestamp value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasTpmsLastSeenPressureTimeRl() => $_has(7);
  @$pb.TagNumber(8)
  void clearTpmsLastSeenPressureTimeRl() => $_clearField(8);
  @$pb.TagNumber(8)
  $0.Timestamp ensureTpmsLastSeenPressureTimeRl() => $_ensure(7);

  @$pb.TagNumber(9)
  $0.Timestamp get tpmsLastSeenPressureTimeRr => $_getN(8);
  @$pb.TagNumber(9)
  set tpmsLastSeenPressureTimeRr($0.Timestamp value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasTpmsLastSeenPressureTimeRr() => $_has(8);
  @$pb.TagNumber(9)
  void clearTpmsLastSeenPressureTimeRr() => $_clearField(9);
  @$pb.TagNumber(9)
  $0.Timestamp ensureTpmsLastSeenPressureTimeRr() => $_ensure(8);

  @$pb.TagNumber(10)
  $core.bool get tpmsHardWarningFl => $_getBF(9);
  @$pb.TagNumber(10)
  set tpmsHardWarningFl($core.bool value) => $_setBool(9, value);
  @$pb.TagNumber(10)
  $core.bool hasTpmsHardWarningFl() => $_has(9);
  @$pb.TagNumber(10)
  void clearTpmsHardWarningFl() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.bool get tpmsHardWarningFr => $_getBF(10);
  @$pb.TagNumber(11)
  set tpmsHardWarningFr($core.bool value) => $_setBool(10, value);
  @$pb.TagNumber(11)
  $core.bool hasTpmsHardWarningFr() => $_has(10);
  @$pb.TagNumber(11)
  void clearTpmsHardWarningFr() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.bool get tpmsHardWarningRl => $_getBF(11);
  @$pb.TagNumber(12)
  set tpmsHardWarningRl($core.bool value) => $_setBool(11, value);
  @$pb.TagNumber(12)
  $core.bool hasTpmsHardWarningRl() => $_has(11);
  @$pb.TagNumber(12)
  void clearTpmsHardWarningRl() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.bool get tpmsHardWarningRr => $_getBF(12);
  @$pb.TagNumber(13)
  set tpmsHardWarningRr($core.bool value) => $_setBool(12, value);
  @$pb.TagNumber(13)
  $core.bool hasTpmsHardWarningRr() => $_has(12);
  @$pb.TagNumber(13)
  void clearTpmsHardWarningRr() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.bool get tpmsSoftWarningFl => $_getBF(13);
  @$pb.TagNumber(14)
  set tpmsSoftWarningFl($core.bool value) => $_setBool(13, value);
  @$pb.TagNumber(14)
  $core.bool hasTpmsSoftWarningFl() => $_has(13);
  @$pb.TagNumber(14)
  void clearTpmsSoftWarningFl() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.bool get tpmsSoftWarningFr => $_getBF(14);
  @$pb.TagNumber(15)
  set tpmsSoftWarningFr($core.bool value) => $_setBool(14, value);
  @$pb.TagNumber(15)
  $core.bool hasTpmsSoftWarningFr() => $_has(14);
  @$pb.TagNumber(15)
  void clearTpmsSoftWarningFr() => $_clearField(15);

  @$pb.TagNumber(16)
  $core.bool get tpmsSoftWarningRl => $_getBF(15);
  @$pb.TagNumber(16)
  set tpmsSoftWarningRl($core.bool value) => $_setBool(15, value);
  @$pb.TagNumber(16)
  $core.bool hasTpmsSoftWarningRl() => $_has(15);
  @$pb.TagNumber(16)
  void clearTpmsSoftWarningRl() => $_clearField(16);

  @$pb.TagNumber(17)
  $core.bool get tpmsSoftWarningRr => $_getBF(16);
  @$pb.TagNumber(17)
  set tpmsSoftWarningRr($core.bool value) => $_setBool(16, value);
  @$pb.TagNumber(17)
  $core.bool hasTpmsSoftWarningRr() => $_has(16);
  @$pb.TagNumber(17)
  void clearTpmsSoftWarningRr() => $_clearField(17);

  @$pb.TagNumber(18)
  $core.double get tpmsRcpFrontValue => $_getN(17);
  @$pb.TagNumber(18)
  set tpmsRcpFrontValue($core.double value) => $_setFloat(17, value);
  @$pb.TagNumber(18)
  $core.bool hasTpmsRcpFrontValue() => $_has(17);
  @$pb.TagNumber(18)
  void clearTpmsRcpFrontValue() => $_clearField(18);

  @$pb.TagNumber(19)
  $core.double get tpmsRcpRearValue => $_getN(18);
  @$pb.TagNumber(19)
  set tpmsRcpRearValue($core.double value) => $_setFloat(18, value);
  @$pb.TagNumber(19)
  $core.bool hasTpmsRcpRearValue() => $_has(18);
  @$pb.TagNumber(19)
  void clearTpmsRcpRearValue() => $_clearField(19);
}

enum MediaState_OptionalRemoteControlEnabled { remoteControlEnabled, notSet }

enum MediaState_OptionalNowPlayingArtist { nowPlayingArtist, notSet }

enum MediaState_OptionalNowPlayingTitle { nowPlayingTitle, notSet }

enum MediaState_OptionalAudioVolume { audioVolume, notSet }

enum MediaState_OptionalAudioVolumeIncrement { audioVolumeIncrement, notSet }

enum MediaState_OptionalAudioVolumeMax { audioVolumeMax, notSet }

enum MediaState_OptionalNowPlayingSource { nowPlayingSource, notSet }

enum MediaState_OptionalMediaPlaybackStatus { mediaPlaybackStatus, notSet }

class MediaState extends $pb.GeneratedMessage {
  factory MediaState({
    $0.Timestamp? timestamp,
    $core.bool? remoteControlEnabled,
    $core.String? nowPlayingArtist,
    $core.String? nowPlayingTitle,
    $core.double? audioVolume,
    $core.double? audioVolumeIncrement,
    $core.double? audioVolumeMax,
    MediaSourceType? nowPlayingSource,
    $1.MediaPlaybackStatus? mediaPlaybackStatus,
  }) {
    final result = create();
    if (timestamp != null) result.timestamp = timestamp;
    if (remoteControlEnabled != null)
      result.remoteControlEnabled = remoteControlEnabled;
    if (nowPlayingArtist != null) result.nowPlayingArtist = nowPlayingArtist;
    if (nowPlayingTitle != null) result.nowPlayingTitle = nowPlayingTitle;
    if (audioVolume != null) result.audioVolume = audioVolume;
    if (audioVolumeIncrement != null)
      result.audioVolumeIncrement = audioVolumeIncrement;
    if (audioVolumeMax != null) result.audioVolumeMax = audioVolumeMax;
    if (nowPlayingSource != null) result.nowPlayingSource = nowPlayingSource;
    if (mediaPlaybackStatus != null)
      result.mediaPlaybackStatus = mediaPlaybackStatus;
    return result;
  }

  MediaState._();

  factory MediaState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MediaState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, MediaState_OptionalRemoteControlEnabled>
      _MediaState_OptionalRemoteControlEnabledByTag = {
    2: MediaState_OptionalRemoteControlEnabled.remoteControlEnabled,
    0: MediaState_OptionalRemoteControlEnabled.notSet
  };
  static const $core.Map<$core.int, MediaState_OptionalNowPlayingArtist>
      _MediaState_OptionalNowPlayingArtistByTag = {
    3: MediaState_OptionalNowPlayingArtist.nowPlayingArtist,
    0: MediaState_OptionalNowPlayingArtist.notSet
  };
  static const $core.Map<$core.int, MediaState_OptionalNowPlayingTitle>
      _MediaState_OptionalNowPlayingTitleByTag = {
    4: MediaState_OptionalNowPlayingTitle.nowPlayingTitle,
    0: MediaState_OptionalNowPlayingTitle.notSet
  };
  static const $core.Map<$core.int, MediaState_OptionalAudioVolume>
      _MediaState_OptionalAudioVolumeByTag = {
    5: MediaState_OptionalAudioVolume.audioVolume,
    0: MediaState_OptionalAudioVolume.notSet
  };
  static const $core.Map<$core.int, MediaState_OptionalAudioVolumeIncrement>
      _MediaState_OptionalAudioVolumeIncrementByTag = {
    6: MediaState_OptionalAudioVolumeIncrement.audioVolumeIncrement,
    0: MediaState_OptionalAudioVolumeIncrement.notSet
  };
  static const $core.Map<$core.int, MediaState_OptionalAudioVolumeMax>
      _MediaState_OptionalAudioVolumeMaxByTag = {
    7: MediaState_OptionalAudioVolumeMax.audioVolumeMax,
    0: MediaState_OptionalAudioVolumeMax.notSet
  };
  static const $core.Map<$core.int, MediaState_OptionalNowPlayingSource>
      _MediaState_OptionalNowPlayingSourceByTag = {
    8: MediaState_OptionalNowPlayingSource.nowPlayingSource,
    0: MediaState_OptionalNowPlayingSource.notSet
  };
  static const $core.Map<$core.int, MediaState_OptionalMediaPlaybackStatus>
      _MediaState_OptionalMediaPlaybackStatusByTag = {
    9: MediaState_OptionalMediaPlaybackStatus.mediaPlaybackStatus,
    0: MediaState_OptionalMediaPlaybackStatus.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MediaState',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..oo(0, [2])
    ..oo(1, [3])
    ..oo(2, [4])
    ..oo(3, [5])
    ..oo(4, [6])
    ..oo(5, [7])
    ..oo(6, [8])
    ..oo(7, [9])
    ..aOM<$0.Timestamp>(1, _omitFieldNames ? '' : 'timestamp',
        subBuilder: $0.Timestamp.create)
    ..aOB(2, _omitFieldNames ? '' : 'remoteControlEnabled')
    ..aOS(3, _omitFieldNames ? '' : 'nowPlayingArtist')
    ..aOS(4, _omitFieldNames ? '' : 'nowPlayingTitle')
    ..aD(5, _omitFieldNames ? '' : 'audioVolume', fieldType: $pb.PbFieldType.OF)
    ..aD(6, _omitFieldNames ? '' : 'audioVolumeIncrement',
        fieldType: $pb.PbFieldType.OF)
    ..aD(7, _omitFieldNames ? '' : 'audioVolumeMax',
        fieldType: $pb.PbFieldType.OF)
    ..aE<MediaSourceType>(8, _omitFieldNames ? '' : 'nowPlayingSource',
        enumValues: MediaSourceType.values)
    ..aE<$1.MediaPlaybackStatus>(
        9, _omitFieldNames ? '' : 'mediaPlaybackStatus',
        enumValues: $1.MediaPlaybackStatus.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MediaState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MediaState copyWith(void Function(MediaState) updates) =>
      super.copyWith((message) => updates(message as MediaState)) as MediaState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MediaState create() => MediaState._();
  @$core.override
  MediaState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MediaState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MediaState>(create);
  static MediaState? _defaultInstance;

  @$pb.TagNumber(2)
  MediaState_OptionalRemoteControlEnabled whichOptionalRemoteControlEnabled() =>
      _MediaState_OptionalRemoteControlEnabledByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(2)
  void clearOptionalRemoteControlEnabled() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(3)
  MediaState_OptionalNowPlayingArtist whichOptionalNowPlayingArtist() =>
      _MediaState_OptionalNowPlayingArtistByTag[$_whichOneof(1)]!;
  @$pb.TagNumber(3)
  void clearOptionalNowPlayingArtist() => $_clearField($_whichOneof(1));

  @$pb.TagNumber(4)
  MediaState_OptionalNowPlayingTitle whichOptionalNowPlayingTitle() =>
      _MediaState_OptionalNowPlayingTitleByTag[$_whichOneof(2)]!;
  @$pb.TagNumber(4)
  void clearOptionalNowPlayingTitle() => $_clearField($_whichOneof(2));

  @$pb.TagNumber(5)
  MediaState_OptionalAudioVolume whichOptionalAudioVolume() =>
      _MediaState_OptionalAudioVolumeByTag[$_whichOneof(3)]!;
  @$pb.TagNumber(5)
  void clearOptionalAudioVolume() => $_clearField($_whichOneof(3));

  @$pb.TagNumber(6)
  MediaState_OptionalAudioVolumeIncrement whichOptionalAudioVolumeIncrement() =>
      _MediaState_OptionalAudioVolumeIncrementByTag[$_whichOneof(4)]!;
  @$pb.TagNumber(6)
  void clearOptionalAudioVolumeIncrement() => $_clearField($_whichOneof(4));

  @$pb.TagNumber(7)
  MediaState_OptionalAudioVolumeMax whichOptionalAudioVolumeMax() =>
      _MediaState_OptionalAudioVolumeMaxByTag[$_whichOneof(5)]!;
  @$pb.TagNumber(7)
  void clearOptionalAudioVolumeMax() => $_clearField($_whichOneof(5));

  @$pb.TagNumber(8)
  MediaState_OptionalNowPlayingSource whichOptionalNowPlayingSource() =>
      _MediaState_OptionalNowPlayingSourceByTag[$_whichOneof(6)]!;
  @$pb.TagNumber(8)
  void clearOptionalNowPlayingSource() => $_clearField($_whichOneof(6));

  @$pb.TagNumber(9)
  MediaState_OptionalMediaPlaybackStatus whichOptionalMediaPlaybackStatus() =>
      _MediaState_OptionalMediaPlaybackStatusByTag[$_whichOneof(7)]!;
  @$pb.TagNumber(9)
  void clearOptionalMediaPlaybackStatus() => $_clearField($_whichOneof(7));

  @$pb.TagNumber(1)
  $0.Timestamp get timestamp => $_getN(0);
  @$pb.TagNumber(1)
  set timestamp($0.Timestamp value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTimestamp() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimestamp() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.Timestamp ensureTimestamp() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.bool get remoteControlEnabled => $_getBF(1);
  @$pb.TagNumber(2)
  set remoteControlEnabled($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRemoteControlEnabled() => $_has(1);
  @$pb.TagNumber(2)
  void clearRemoteControlEnabled() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get nowPlayingArtist => $_getSZ(2);
  @$pb.TagNumber(3)
  set nowPlayingArtist($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNowPlayingArtist() => $_has(2);
  @$pb.TagNumber(3)
  void clearNowPlayingArtist() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get nowPlayingTitle => $_getSZ(3);
  @$pb.TagNumber(4)
  set nowPlayingTitle($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasNowPlayingTitle() => $_has(3);
  @$pb.TagNumber(4)
  void clearNowPlayingTitle() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get audioVolume => $_getN(4);
  @$pb.TagNumber(5)
  set audioVolume($core.double value) => $_setFloat(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAudioVolume() => $_has(4);
  @$pb.TagNumber(5)
  void clearAudioVolume() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.double get audioVolumeIncrement => $_getN(5);
  @$pb.TagNumber(6)
  set audioVolumeIncrement($core.double value) => $_setFloat(5, value);
  @$pb.TagNumber(6)
  $core.bool hasAudioVolumeIncrement() => $_has(5);
  @$pb.TagNumber(6)
  void clearAudioVolumeIncrement() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.double get audioVolumeMax => $_getN(6);
  @$pb.TagNumber(7)
  set audioVolumeMax($core.double value) => $_setFloat(6, value);
  @$pb.TagNumber(7)
  $core.bool hasAudioVolumeMax() => $_has(6);
  @$pb.TagNumber(7)
  void clearAudioVolumeMax() => $_clearField(7);

  @$pb.TagNumber(8)
  MediaSourceType get nowPlayingSource => $_getN(7);
  @$pb.TagNumber(8)
  set nowPlayingSource(MediaSourceType value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasNowPlayingSource() => $_has(7);
  @$pb.TagNumber(8)
  void clearNowPlayingSource() => $_clearField(8);

  @$pb.TagNumber(9)
  $1.MediaPlaybackStatus get mediaPlaybackStatus => $_getN(8);
  @$pb.TagNumber(9)
  set mediaPlaybackStatus($1.MediaPlaybackStatus value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasMediaPlaybackStatus() => $_has(8);
  @$pb.TagNumber(9)
  void clearMediaPlaybackStatus() => $_clearField(9);
}

enum MediaDetailState_OptionalNowPlayingDuration { nowPlayingDuration, notSet }

enum MediaDetailState_OptionalNowPlayingElapsed { nowPlayingElapsed, notSet }

enum MediaDetailState_OptionalNowPlayingSourceString {
  nowPlayingSourceString,
  notSet
}

enum MediaDetailState_OptionalNowPlayingAlbum { nowPlayingAlbum, notSet }

enum MediaDetailState_OptionalNowPlayingStation { nowPlayingStation, notSet }

enum MediaDetailState_OptionalA2dpSourceName { a2dpSourceName, notSet }

class MediaDetailState extends $pb.GeneratedMessage {
  factory MediaDetailState({
    $0.Timestamp? timestamp,
    $core.int? nowPlayingDuration,
    $core.int? nowPlayingElapsed,
    $core.String? nowPlayingSourceString,
    $core.String? nowPlayingAlbum,
    $core.String? nowPlayingStation,
    $core.String? a2dpSourceName,
  }) {
    final result = create();
    if (timestamp != null) result.timestamp = timestamp;
    if (nowPlayingDuration != null)
      result.nowPlayingDuration = nowPlayingDuration;
    if (nowPlayingElapsed != null) result.nowPlayingElapsed = nowPlayingElapsed;
    if (nowPlayingSourceString != null)
      result.nowPlayingSourceString = nowPlayingSourceString;
    if (nowPlayingAlbum != null) result.nowPlayingAlbum = nowPlayingAlbum;
    if (nowPlayingStation != null) result.nowPlayingStation = nowPlayingStation;
    if (a2dpSourceName != null) result.a2dpSourceName = a2dpSourceName;
    return result;
  }

  MediaDetailState._();

  factory MediaDetailState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MediaDetailState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, MediaDetailState_OptionalNowPlayingDuration>
      _MediaDetailState_OptionalNowPlayingDurationByTag = {
    2: MediaDetailState_OptionalNowPlayingDuration.nowPlayingDuration,
    0: MediaDetailState_OptionalNowPlayingDuration.notSet
  };
  static const $core.Map<$core.int, MediaDetailState_OptionalNowPlayingElapsed>
      _MediaDetailState_OptionalNowPlayingElapsedByTag = {
    3: MediaDetailState_OptionalNowPlayingElapsed.nowPlayingElapsed,
    0: MediaDetailState_OptionalNowPlayingElapsed.notSet
  };
  static const $core
      .Map<$core.int, MediaDetailState_OptionalNowPlayingSourceString>
      _MediaDetailState_OptionalNowPlayingSourceStringByTag = {
    4: MediaDetailState_OptionalNowPlayingSourceString.nowPlayingSourceString,
    0: MediaDetailState_OptionalNowPlayingSourceString.notSet
  };
  static const $core.Map<$core.int, MediaDetailState_OptionalNowPlayingAlbum>
      _MediaDetailState_OptionalNowPlayingAlbumByTag = {
    5: MediaDetailState_OptionalNowPlayingAlbum.nowPlayingAlbum,
    0: MediaDetailState_OptionalNowPlayingAlbum.notSet
  };
  static const $core.Map<$core.int, MediaDetailState_OptionalNowPlayingStation>
      _MediaDetailState_OptionalNowPlayingStationByTag = {
    6: MediaDetailState_OptionalNowPlayingStation.nowPlayingStation,
    0: MediaDetailState_OptionalNowPlayingStation.notSet
  };
  static const $core.Map<$core.int, MediaDetailState_OptionalA2dpSourceName>
      _MediaDetailState_OptionalA2dpSourceNameByTag = {
    7: MediaDetailState_OptionalA2dpSourceName.a2dpSourceName,
    0: MediaDetailState_OptionalA2dpSourceName.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MediaDetailState',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..oo(0, [2])
    ..oo(1, [3])
    ..oo(2, [4])
    ..oo(3, [5])
    ..oo(4, [6])
    ..oo(5, [7])
    ..aOM<$0.Timestamp>(1, _omitFieldNames ? '' : 'timestamp',
        subBuilder: $0.Timestamp.create)
    ..aI(2, _omitFieldNames ? '' : 'nowPlayingDuration')
    ..aI(3, _omitFieldNames ? '' : 'nowPlayingElapsed')
    ..aOS(4, _omitFieldNames ? '' : 'nowPlayingSourceString')
    ..aOS(5, _omitFieldNames ? '' : 'nowPlayingAlbum')
    ..aOS(6, _omitFieldNames ? '' : 'nowPlayingStation')
    ..aOS(7, _omitFieldNames ? '' : 'a2dpSourceName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MediaDetailState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MediaDetailState copyWith(void Function(MediaDetailState) updates) =>
      super.copyWith((message) => updates(message as MediaDetailState))
          as MediaDetailState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MediaDetailState create() => MediaDetailState._();
  @$core.override
  MediaDetailState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MediaDetailState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MediaDetailState>(create);
  static MediaDetailState? _defaultInstance;

  @$pb.TagNumber(2)
  MediaDetailState_OptionalNowPlayingDuration
      whichOptionalNowPlayingDuration() =>
          _MediaDetailState_OptionalNowPlayingDurationByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(2)
  void clearOptionalNowPlayingDuration() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(3)
  MediaDetailState_OptionalNowPlayingElapsed whichOptionalNowPlayingElapsed() =>
      _MediaDetailState_OptionalNowPlayingElapsedByTag[$_whichOneof(1)]!;
  @$pb.TagNumber(3)
  void clearOptionalNowPlayingElapsed() => $_clearField($_whichOneof(1));

  @$pb.TagNumber(4)
  MediaDetailState_OptionalNowPlayingSourceString
      whichOptionalNowPlayingSourceString() =>
          _MediaDetailState_OptionalNowPlayingSourceStringByTag[
              $_whichOneof(2)]!;
  @$pb.TagNumber(4)
  void clearOptionalNowPlayingSourceString() => $_clearField($_whichOneof(2));

  @$pb.TagNumber(5)
  MediaDetailState_OptionalNowPlayingAlbum whichOptionalNowPlayingAlbum() =>
      _MediaDetailState_OptionalNowPlayingAlbumByTag[$_whichOneof(3)]!;
  @$pb.TagNumber(5)
  void clearOptionalNowPlayingAlbum() => $_clearField($_whichOneof(3));

  @$pb.TagNumber(6)
  MediaDetailState_OptionalNowPlayingStation whichOptionalNowPlayingStation() =>
      _MediaDetailState_OptionalNowPlayingStationByTag[$_whichOneof(4)]!;
  @$pb.TagNumber(6)
  void clearOptionalNowPlayingStation() => $_clearField($_whichOneof(4));

  @$pb.TagNumber(7)
  MediaDetailState_OptionalA2dpSourceName whichOptionalA2dpSourceName() =>
      _MediaDetailState_OptionalA2dpSourceNameByTag[$_whichOneof(5)]!;
  @$pb.TagNumber(7)
  void clearOptionalA2dpSourceName() => $_clearField($_whichOneof(5));

  @$pb.TagNumber(1)
  $0.Timestamp get timestamp => $_getN(0);
  @$pb.TagNumber(1)
  set timestamp($0.Timestamp value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTimestamp() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimestamp() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.Timestamp ensureTimestamp() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get nowPlayingDuration => $_getIZ(1);
  @$pb.TagNumber(2)
  set nowPlayingDuration($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNowPlayingDuration() => $_has(1);
  @$pb.TagNumber(2)
  void clearNowPlayingDuration() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get nowPlayingElapsed => $_getIZ(2);
  @$pb.TagNumber(3)
  set nowPlayingElapsed($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNowPlayingElapsed() => $_has(2);
  @$pb.TagNumber(3)
  void clearNowPlayingElapsed() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get nowPlayingSourceString => $_getSZ(3);
  @$pb.TagNumber(4)
  set nowPlayingSourceString($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasNowPlayingSourceString() => $_has(3);
  @$pb.TagNumber(4)
  void clearNowPlayingSourceString() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get nowPlayingAlbum => $_getSZ(4);
  @$pb.TagNumber(5)
  set nowPlayingAlbum($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasNowPlayingAlbum() => $_has(4);
  @$pb.TagNumber(5)
  void clearNowPlayingAlbum() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get nowPlayingStation => $_getSZ(5);
  @$pb.TagNumber(6)
  set nowPlayingStation($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasNowPlayingStation() => $_has(5);
  @$pb.TagNumber(6)
  void clearNowPlayingStation() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get a2dpSourceName => $_getSZ(6);
  @$pb.TagNumber(7)
  set a2dpSourceName($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasA2dpSourceName() => $_has(6);
  @$pb.TagNumber(7)
  void clearA2dpSourceName() => $_clearField(7);
}

enum ShiftState_Type { invalid, p, r, n, d, sNA, notSet }

class ShiftState extends $pb.GeneratedMessage {
  factory ShiftState({
    $1.Void? invalid,
    $1.Void? p,
    $1.Void? r,
    $1.Void? n,
    $1.Void? d,
    $1.Void? sNA,
  }) {
    final result = create();
    if (invalid != null) result.invalid = invalid;
    if (p != null) result.p = p;
    if (r != null) result.r = r;
    if (n != null) result.n = n;
    if (d != null) result.d = d;
    if (sNA != null) result.sNA = sNA;
    return result;
  }

  ShiftState._();

  factory ShiftState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ShiftState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ShiftState_Type> _ShiftState_TypeByTag = {
    1: ShiftState_Type.invalid,
    2: ShiftState_Type.p,
    3: ShiftState_Type.r,
    4: ShiftState_Type.n,
    5: ShiftState_Type.d,
    6: ShiftState_Type.sNA,
    0: ShiftState_Type.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ShiftState',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5, 6])
    ..aOM<$1.Void>(1, _omitFieldNames ? '' : 'Invalid',
        protoName: 'Invalid', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(2, _omitFieldNames ? '' : 'P',
        protoName: 'P', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(3, _omitFieldNames ? '' : 'R',
        protoName: 'R', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(4, _omitFieldNames ? '' : 'N',
        protoName: 'N', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(5, _omitFieldNames ? '' : 'D',
        protoName: 'D', subBuilder: $1.Void.create)
    ..aOM<$1.Void>(6, _omitFieldNames ? '' : 'SNA',
        protoName: 'SNA', subBuilder: $1.Void.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ShiftState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ShiftState copyWith(void Function(ShiftState) updates) =>
      super.copyWith((message) => updates(message as ShiftState)) as ShiftState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ShiftState create() => ShiftState._();
  @$core.override
  ShiftState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ShiftState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ShiftState>(create);
  static ShiftState? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  ShiftState_Type whichType() => _ShiftState_TypeByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  void clearType() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $1.Void get invalid => $_getN(0);
  @$pb.TagNumber(1)
  set invalid($1.Void value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasInvalid() => $_has(0);
  @$pb.TagNumber(1)
  void clearInvalid() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.Void ensureInvalid() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.Void get p => $_getN(1);
  @$pb.TagNumber(2)
  set p($1.Void value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasP() => $_has(1);
  @$pb.TagNumber(2)
  void clearP() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.Void ensureP() => $_ensure(1);

  @$pb.TagNumber(3)
  $1.Void get r => $_getN(2);
  @$pb.TagNumber(3)
  set r($1.Void value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasR() => $_has(2);
  @$pb.TagNumber(3)
  void clearR() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.Void ensureR() => $_ensure(2);

  @$pb.TagNumber(4)
  $1.Void get n => $_getN(3);
  @$pb.TagNumber(4)
  set n($1.Void value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasN() => $_has(3);
  @$pb.TagNumber(4)
  void clearN() => $_clearField(4);
  @$pb.TagNumber(4)
  $1.Void ensureN() => $_ensure(3);

  @$pb.TagNumber(5)
  $1.Void get d => $_getN(4);
  @$pb.TagNumber(5)
  set d($1.Void value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasD() => $_has(4);
  @$pb.TagNumber(5)
  void clearD() => $_clearField(5);
  @$pb.TagNumber(5)
  $1.Void ensureD() => $_ensure(4);

  @$pb.TagNumber(6)
  $1.Void get sNA => $_getN(5);
  @$pb.TagNumber(6)
  set sNA($1.Void value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasSNA() => $_has(5);
  @$pb.TagNumber(6)
  void clearSNA() => $_clearField(6);
  @$pb.TagNumber(6)
  $1.Void ensureSNA() => $_ensure(5);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

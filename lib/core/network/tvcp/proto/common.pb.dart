// This is a generated file - do not edit.
//
// Generated from common.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'common.pbenum.dart';

class Void extends $pb.GeneratedMessage {
  factory Void() => create();

  Void._();

  factory Void.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Void.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Void',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Void clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Void copyWith(void Function(Void) updates) =>
      super.copyWith((message) => updates(message as Void)) as Void;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Void create() => Void._();
  @$core.override
  Void createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Void getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Void>(create);
  static Void? _defaultInstance;
}

class LatLong extends $pb.GeneratedMessage {
  factory LatLong({
    $core.double? latitude,
    $core.double? longitude,
  }) {
    final result = create();
    if (latitude != null) result.latitude = latitude;
    if (longitude != null) result.longitude = longitude;
    return result;
  }

  LatLong._();

  factory LatLong.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LatLong.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LatLong',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..aD(1, _omitFieldNames ? '' : 'latitude', fieldType: $pb.PbFieldType.OF)
    ..aD(2, _omitFieldNames ? '' : 'longitude', fieldType: $pb.PbFieldType.OF)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LatLong clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LatLong copyWith(void Function(LatLong) updates) =>
      super.copyWith((message) => updates(message as LatLong)) as LatLong;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LatLong create() => LatLong._();
  @$core.override
  LatLong createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LatLong getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LatLong>(create);
  static LatLong? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get latitude => $_getN(0);
  @$pb.TagNumber(1)
  set latitude($core.double value) => $_setFloat(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLatitude() => $_has(0);
  @$pb.TagNumber(1)
  void clearLatitude() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get longitude => $_getN(1);
  @$pb.TagNumber(2)
  set longitude($core.double value) => $_setFloat(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLongitude() => $_has(1);
  @$pb.TagNumber(2)
  void clearLongitude() => $_clearField(2);
}

enum ChargePortLatchState_Type { sNA, disengaged, engaged, blocking, notSet }

class ChargePortLatchState extends $pb.GeneratedMessage {
  factory ChargePortLatchState({
    Void? sNA,
    Void? disengaged,
    Void? engaged,
    Void? blocking,
  }) {
    final result = create();
    if (sNA != null) result.sNA = sNA;
    if (disengaged != null) result.disengaged = disengaged;
    if (engaged != null) result.engaged = engaged;
    if (blocking != null) result.blocking = blocking;
    return result;
  }

  ChargePortLatchState._();

  factory ChargePortLatchState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChargePortLatchState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ChargePortLatchState_Type>
      _ChargePortLatchState_TypeByTag = {
    1: ChargePortLatchState_Type.sNA,
    2: ChargePortLatchState_Type.disengaged,
    3: ChargePortLatchState_Type.engaged,
    4: ChargePortLatchState_Type.blocking,
    0: ChargePortLatchState_Type.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChargePortLatchState',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4])
    ..aOM<Void>(1, _omitFieldNames ? '' : 'SNA',
        protoName: 'SNA', subBuilder: Void.create)
    ..aOM<Void>(2, _omitFieldNames ? '' : 'Disengaged',
        protoName: 'Disengaged', subBuilder: Void.create)
    ..aOM<Void>(3, _omitFieldNames ? '' : 'Engaged',
        protoName: 'Engaged', subBuilder: Void.create)
    ..aOM<Void>(4, _omitFieldNames ? '' : 'Blocking',
        protoName: 'Blocking', subBuilder: Void.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChargePortLatchState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChargePortLatchState copyWith(void Function(ChargePortLatchState) updates) =>
      super.copyWith((message) => updates(message as ChargePortLatchState))
          as ChargePortLatchState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChargePortLatchState create() => ChargePortLatchState._();
  @$core.override
  ChargePortLatchState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChargePortLatchState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChargePortLatchState>(create);
  static ChargePortLatchState? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  ChargePortLatchState_Type whichType() =>
      _ChargePortLatchState_TypeByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  void clearType() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Void get sNA => $_getN(0);
  @$pb.TagNumber(1)
  set sNA(Void value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSNA() => $_has(0);
  @$pb.TagNumber(1)
  void clearSNA() => $_clearField(1);
  @$pb.TagNumber(1)
  Void ensureSNA() => $_ensure(0);

  @$pb.TagNumber(2)
  Void get disengaged => $_getN(1);
  @$pb.TagNumber(2)
  set disengaged(Void value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasDisengaged() => $_has(1);
  @$pb.TagNumber(2)
  void clearDisengaged() => $_clearField(2);
  @$pb.TagNumber(2)
  Void ensureDisengaged() => $_ensure(1);

  @$pb.TagNumber(3)
  Void get engaged => $_getN(2);
  @$pb.TagNumber(3)
  set engaged(Void value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasEngaged() => $_has(2);
  @$pb.TagNumber(3)
  void clearEngaged() => $_clearField(3);
  @$pb.TagNumber(3)
  Void ensureEngaged() => $_ensure(2);

  @$pb.TagNumber(4)
  Void get blocking => $_getN(3);
  @$pb.TagNumber(4)
  set blocking(Void value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasBlocking() => $_has(3);
  @$pb.TagNumber(4)
  void clearBlocking() => $_clearField(4);
  @$pb.TagNumber(4)
  Void ensureBlocking() => $_ensure(3);
}

enum PreconditioningTimes_Times { allWeek, weekdays, notSet }

class PreconditioningTimes extends $pb.GeneratedMessage {
  factory PreconditioningTimes({
    Void? allWeek,
    Void? weekdays,
  }) {
    final result = create();
    if (allWeek != null) result.allWeek = allWeek;
    if (weekdays != null) result.weekdays = weekdays;
    return result;
  }

  PreconditioningTimes._();

  factory PreconditioningTimes.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PreconditioningTimes.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, PreconditioningTimes_Times>
      _PreconditioningTimes_TimesByTag = {
    1: PreconditioningTimes_Times.allWeek,
    2: PreconditioningTimes_Times.weekdays,
    0: PreconditioningTimes_Times.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PreconditioningTimes',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<Void>(1, _omitFieldNames ? '' : 'allWeek', subBuilder: Void.create)
    ..aOM<Void>(2, _omitFieldNames ? '' : 'weekdays', subBuilder: Void.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PreconditioningTimes clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PreconditioningTimes copyWith(void Function(PreconditioningTimes) updates) =>
      super.copyWith((message) => updates(message as PreconditioningTimes))
          as PreconditioningTimes;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PreconditioningTimes create() => PreconditioningTimes._();
  @$core.override
  PreconditioningTimes createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PreconditioningTimes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PreconditioningTimes>(create);
  static PreconditioningTimes? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  PreconditioningTimes_Times whichTimes() =>
      _PreconditioningTimes_TimesByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  void clearTimes() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Void get allWeek => $_getN(0);
  @$pb.TagNumber(1)
  set allWeek(Void value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasAllWeek() => $_has(0);
  @$pb.TagNumber(1)
  void clearAllWeek() => $_clearField(1);
  @$pb.TagNumber(1)
  Void ensureAllWeek() => $_ensure(0);

  @$pb.TagNumber(2)
  Void get weekdays => $_getN(1);
  @$pb.TagNumber(2)
  set weekdays(Void value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasWeekdays() => $_has(1);
  @$pb.TagNumber(2)
  void clearWeekdays() => $_clearField(2);
  @$pb.TagNumber(2)
  Void ensureWeekdays() => $_ensure(1);
}

enum OffPeakChargingTimes_Times { allWeek, weekdays, notSet }

class OffPeakChargingTimes extends $pb.GeneratedMessage {
  factory OffPeakChargingTimes({
    Void? allWeek,
    Void? weekdays,
  }) {
    final result = create();
    if (allWeek != null) result.allWeek = allWeek;
    if (weekdays != null) result.weekdays = weekdays;
    return result;
  }

  OffPeakChargingTimes._();

  factory OffPeakChargingTimes.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OffPeakChargingTimes.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, OffPeakChargingTimes_Times>
      _OffPeakChargingTimes_TimesByTag = {
    1: OffPeakChargingTimes_Times.allWeek,
    2: OffPeakChargingTimes_Times.weekdays,
    0: OffPeakChargingTimes_Times.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OffPeakChargingTimes',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<Void>(1, _omitFieldNames ? '' : 'allWeek', subBuilder: Void.create)
    ..aOM<Void>(2, _omitFieldNames ? '' : 'weekdays', subBuilder: Void.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OffPeakChargingTimes clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OffPeakChargingTimes copyWith(void Function(OffPeakChargingTimes) updates) =>
      super.copyWith((message) => updates(message as OffPeakChargingTimes))
          as OffPeakChargingTimes;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OffPeakChargingTimes create() => OffPeakChargingTimes._();
  @$core.override
  OffPeakChargingTimes createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OffPeakChargingTimes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OffPeakChargingTimes>(create);
  static OffPeakChargingTimes? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  OffPeakChargingTimes_Times whichTimes() =>
      _OffPeakChargingTimes_TimesByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  void clearTimes() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Void get allWeek => $_getN(0);
  @$pb.TagNumber(1)
  set allWeek(Void value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasAllWeek() => $_has(0);
  @$pb.TagNumber(1)
  void clearAllWeek() => $_clearField(1);
  @$pb.TagNumber(1)
  Void ensureAllWeek() => $_ensure(0);

  @$pb.TagNumber(2)
  Void get weekdays => $_getN(1);
  @$pb.TagNumber(2)
  set weekdays(Void value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasWeekdays() => $_has(1);
  @$pb.TagNumber(2)
  void clearWeekdays() => $_clearField(2);
  @$pb.TagNumber(2)
  Void ensureWeekdays() => $_ensure(1);
}

class ChargeSchedule extends $pb.GeneratedMessage {
  factory ChargeSchedule({
    $fixnum.Int64? id,
    $core.String? name,
    $core.int? daysOfWeek,
    $core.bool? startEnabled,
    $core.int? startTime,
    $core.bool? endEnabled,
    $core.int? endTime,
    $core.bool? oneTime,
    $core.bool? enabled,
    $core.double? latitude,
    $core.double? longitude,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (daysOfWeek != null) result.daysOfWeek = daysOfWeek;
    if (startEnabled != null) result.startEnabled = startEnabled;
    if (startTime != null) result.startTime = startTime;
    if (endEnabled != null) result.endEnabled = endEnabled;
    if (endTime != null) result.endTime = endTime;
    if (oneTime != null) result.oneTime = oneTime;
    if (enabled != null) result.enabled = enabled;
    if (latitude != null) result.latitude = latitude;
    if (longitude != null) result.longitude = longitude;
    return result;
  }

  ChargeSchedule._();

  factory ChargeSchedule.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChargeSchedule.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChargeSchedule',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aI(3, _omitFieldNames ? '' : 'daysOfWeek')
    ..aOB(4, _omitFieldNames ? '' : 'startEnabled')
    ..aI(5, _omitFieldNames ? '' : 'startTime')
    ..aOB(6, _omitFieldNames ? '' : 'endEnabled')
    ..aI(7, _omitFieldNames ? '' : 'endTime')
    ..aOB(8, _omitFieldNames ? '' : 'oneTime')
    ..aOB(9, _omitFieldNames ? '' : 'enabled')
    ..aD(10, _omitFieldNames ? '' : 'latitude', fieldType: $pb.PbFieldType.OF)
    ..aD(11, _omitFieldNames ? '' : 'longitude', fieldType: $pb.PbFieldType.OF)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChargeSchedule clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChargeSchedule copyWith(void Function(ChargeSchedule) updates) =>
      super.copyWith((message) => updates(message as ChargeSchedule))
          as ChargeSchedule;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChargeSchedule create() => ChargeSchedule._();
  @$core.override
  ChargeSchedule createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChargeSchedule getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChargeSchedule>(create);
  static ChargeSchedule? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get daysOfWeek => $_getIZ(2);
  @$pb.TagNumber(3)
  set daysOfWeek($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDaysOfWeek() => $_has(2);
  @$pb.TagNumber(3)
  void clearDaysOfWeek() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get startEnabled => $_getBF(3);
  @$pb.TagNumber(4)
  set startEnabled($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasStartEnabled() => $_has(3);
  @$pb.TagNumber(4)
  void clearStartEnabled() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get startTime => $_getIZ(4);
  @$pb.TagNumber(5)
  set startTime($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasStartTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearStartTime() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get endEnabled => $_getBF(5);
  @$pb.TagNumber(6)
  set endEnabled($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasEndEnabled() => $_has(5);
  @$pb.TagNumber(6)
  void clearEndEnabled() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get endTime => $_getIZ(6);
  @$pb.TagNumber(7)
  set endTime($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasEndTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearEndTime() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.bool get oneTime => $_getBF(7);
  @$pb.TagNumber(8)
  set oneTime($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasOneTime() => $_has(7);
  @$pb.TagNumber(8)
  void clearOneTime() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.bool get enabled => $_getBF(8);
  @$pb.TagNumber(9)
  set enabled($core.bool value) => $_setBool(8, value);
  @$pb.TagNumber(9)
  $core.bool hasEnabled() => $_has(8);
  @$pb.TagNumber(9)
  void clearEnabled() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.double get latitude => $_getN(9);
  @$pb.TagNumber(10)
  set latitude($core.double value) => $_setFloat(9, value);
  @$pb.TagNumber(10)
  $core.bool hasLatitude() => $_has(9);
  @$pb.TagNumber(10)
  void clearLatitude() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.double get longitude => $_getN(10);
  @$pb.TagNumber(11)
  set longitude($core.double value) => $_setFloat(10, value);
  @$pb.TagNumber(11)
  $core.bool hasLongitude() => $_has(10);
  @$pb.TagNumber(11)
  void clearLongitude() => $_clearField(11);
}

class PreconditionSchedule extends $pb.GeneratedMessage {
  factory PreconditionSchedule({
    $fixnum.Int64? id,
    $core.String? name,
    $core.int? daysOfWeek,
    $core.int? preconditionTime,
    $core.bool? oneTime,
    $core.bool? enabled,
    $core.double? latitude,
    $core.double? longitude,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (daysOfWeek != null) result.daysOfWeek = daysOfWeek;
    if (preconditionTime != null) result.preconditionTime = preconditionTime;
    if (oneTime != null) result.oneTime = oneTime;
    if (enabled != null) result.enabled = enabled;
    if (latitude != null) result.latitude = latitude;
    if (longitude != null) result.longitude = longitude;
    return result;
  }

  PreconditionSchedule._();

  factory PreconditionSchedule.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PreconditionSchedule.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PreconditionSchedule',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'CarServer'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aI(3, _omitFieldNames ? '' : 'daysOfWeek')
    ..aI(4, _omitFieldNames ? '' : 'preconditionTime')
    ..aOB(5, _omitFieldNames ? '' : 'oneTime')
    ..aOB(6, _omitFieldNames ? '' : 'enabled')
    ..aD(7, _omitFieldNames ? '' : 'latitude', fieldType: $pb.PbFieldType.OF)
    ..aD(8, _omitFieldNames ? '' : 'longitude', fieldType: $pb.PbFieldType.OF)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PreconditionSchedule clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PreconditionSchedule copyWith(void Function(PreconditionSchedule) updates) =>
      super.copyWith((message) => updates(message as PreconditionSchedule))
          as PreconditionSchedule;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PreconditionSchedule create() => PreconditionSchedule._();
  @$core.override
  PreconditionSchedule createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PreconditionSchedule getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PreconditionSchedule>(create);
  static PreconditionSchedule? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get daysOfWeek => $_getIZ(2);
  @$pb.TagNumber(3)
  set daysOfWeek($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDaysOfWeek() => $_has(2);
  @$pb.TagNumber(3)
  void clearDaysOfWeek() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get preconditionTime => $_getIZ(3);
  @$pb.TagNumber(4)
  set preconditionTime($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPreconditionTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearPreconditionTime() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get oneTime => $_getBF(4);
  @$pb.TagNumber(5)
  set oneTime($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasOneTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearOneTime() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get enabled => $_getBF(5);
  @$pb.TagNumber(6)
  set enabled($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasEnabled() => $_has(5);
  @$pb.TagNumber(6)
  void clearEnabled() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.double get latitude => $_getN(6);
  @$pb.TagNumber(7)
  set latitude($core.double value) => $_setFloat(6, value);
  @$pb.TagNumber(7)
  $core.bool hasLatitude() => $_has(6);
  @$pb.TagNumber(7)
  void clearLatitude() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.double get longitude => $_getN(7);
  @$pb.TagNumber(8)
  set longitude($core.double value) => $_setFloat(7, value);
  @$pb.TagNumber(8)
  $core.bool hasLongitude() => $_has(7);
  @$pb.TagNumber(8)
  void clearLongitude() => $_clearField(8);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

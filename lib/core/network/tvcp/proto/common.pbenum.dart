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

import 'package:protobuf/protobuf.dart' as $pb;

class Invalid extends $pb.ProtobufEnum {
  static const Invalid INVALID = Invalid._(0, _omitEnumNames ? '' : 'INVALID');

  static const $core.List<Invalid> values = <Invalid>[
    INVALID,
  ];

  static final $core.List<Invalid?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 0);
  static Invalid? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Invalid._(super.value, super.name);
}

class MediaPlaybackStatus extends $pb.ProtobufEnum {
  static const MediaPlaybackStatus Stopped =
      MediaPlaybackStatus._(0, _omitEnumNames ? '' : 'Stopped');
  static const MediaPlaybackStatus Playing =
      MediaPlaybackStatus._(1, _omitEnumNames ? '' : 'Playing');
  static const MediaPlaybackStatus Paused =
      MediaPlaybackStatus._(2, _omitEnumNames ? '' : 'Paused');

  static const $core.List<MediaPlaybackStatus> values = <MediaPlaybackStatus>[
    Stopped,
    Playing,
    Paused,
  ];

  static final $core.List<MediaPlaybackStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static MediaPlaybackStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const MediaPlaybackStatus._(super.value, super.name);
}

class StwHeatLevel extends $pb.ProtobufEnum {
  static const StwHeatLevel StwHeatLevel_Unknown =
      StwHeatLevel._(0, _omitEnumNames ? '' : 'StwHeatLevel_Unknown');
  static const StwHeatLevel StwHeatLevel_Off =
      StwHeatLevel._(1, _omitEnumNames ? '' : 'StwHeatLevel_Off');
  static const StwHeatLevel StwHeatLevel_Low =
      StwHeatLevel._(2, _omitEnumNames ? '' : 'StwHeatLevel_Low');
  static const StwHeatLevel StwHeatLevel_High =
      StwHeatLevel._(3, _omitEnumNames ? '' : 'StwHeatLevel_High');

  static const $core.List<StwHeatLevel> values = <StwHeatLevel>[
    StwHeatLevel_Unknown,
    StwHeatLevel_Off,
    StwHeatLevel_Low,
    StwHeatLevel_High,
  ];

  static final $core.List<StwHeatLevel?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static StwHeatLevel? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const StwHeatLevel._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

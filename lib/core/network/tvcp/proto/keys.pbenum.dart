// This is a generated file - do not edit.
//
// Generated from keys.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Role extends $pb.ProtobufEnum {
  static const Role ROLE_NONE = Role._(0, _omitEnumNames ? '' : 'ROLE_NONE');
  static const Role ROLE_SERVICE =
      Role._(1, _omitEnumNames ? '' : 'ROLE_SERVICE');
  static const Role ROLE_OWNER = Role._(2, _omitEnumNames ? '' : 'ROLE_OWNER');
  static const Role ROLE_DRIVER =
      Role._(3, _omitEnumNames ? '' : 'ROLE_DRIVER');
  static const Role ROLE_FM = Role._(4, _omitEnumNames ? '' : 'ROLE_FM');
  static const Role ROLE_VEHICLE_MONITOR =
      Role._(5, _omitEnumNames ? '' : 'ROLE_VEHICLE_MONITOR');
  static const Role ROLE_CHARGING_MANAGER =
      Role._(6, _omitEnumNames ? '' : 'ROLE_CHARGING_MANAGER');

  static const $core.List<Role> values = <Role>[
    ROLE_NONE,
    ROLE_SERVICE,
    ROLE_OWNER,
    ROLE_DRIVER,
    ROLE_FM,
    ROLE_VEHICLE_MONITOR,
    ROLE_CHARGING_MANAGER,
  ];

  static final $core.List<Role?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 6);
  static Role? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Role._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

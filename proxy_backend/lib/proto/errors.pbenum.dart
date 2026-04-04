// This is a generated file - do not edit.
//
// Generated from errors.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class GenericError_E extends $pb.ProtobufEnum {
  static const GenericError_E GENERICERROR_NONE =
      GenericError_E._(0, _omitEnumNames ? '' : 'GENERICERROR_NONE');
  static const GenericError_E GENERICERROR_UNKNOWN =
      GenericError_E._(1, _omitEnumNames ? '' : 'GENERICERROR_UNKNOWN');
  static const GenericError_E GENERICERROR_CLOSURES_OPEN =
      GenericError_E._(2, _omitEnumNames ? '' : 'GENERICERROR_CLOSURES_OPEN');
  static const GenericError_E GENERICERROR_ALREADY_ON =
      GenericError_E._(3, _omitEnumNames ? '' : 'GENERICERROR_ALREADY_ON');
  static const GenericError_E GENERICERROR_DISABLED_FOR_USER_COMMAND =
      GenericError_E._(
          4, _omitEnumNames ? '' : 'GENERICERROR_DISABLED_FOR_USER_COMMAND');
  static const GenericError_E GENERICERROR_VEHICLE_NOT_IN_PARK =
      GenericError_E._(
          5, _omitEnumNames ? '' : 'GENERICERROR_VEHICLE_NOT_IN_PARK');
  static const GenericError_E GENERICERROR_UNAUTHORIZED =
      GenericError_E._(6, _omitEnumNames ? '' : 'GENERICERROR_UNAUTHORIZED');
  static const GenericError_E GENERICERROR_NOT_ALLOWED_OVER_TRANSPORT =
      GenericError_E._(
          7, _omitEnumNames ? '' : 'GENERICERROR_NOT_ALLOWED_OVER_TRANSPORT');

  static const $core.List<GenericError_E> values = <GenericError_E>[
    GENERICERROR_NONE,
    GENERICERROR_UNKNOWN,
    GENERICERROR_CLOSURES_OPEN,
    GENERICERROR_ALREADY_ON,
    GENERICERROR_DISABLED_FOR_USER_COMMAND,
    GENERICERROR_VEHICLE_NOT_IN_PARK,
    GENERICERROR_UNAUTHORIZED,
    GENERICERROR_NOT_ALLOWED_OVER_TRANSPORT,
  ];

  static final $core.List<GenericError_E?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 7);
  static GenericError_E? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const GenericError_E._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

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

import 'errors.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'errors.pbenum.dart';

class NominalError extends $pb.GeneratedMessage {
  factory NominalError({
    GenericError_E? genericError,
  }) {
    final result = create();
    if (genericError != null) result.genericError = genericError;
    return result;
  }

  NominalError._();

  factory NominalError.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NominalError.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NominalError',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Errors'),
      createEmptyInstance: create)
    ..aE<GenericError_E>(1, _omitFieldNames ? '' : 'genericError',
        protoName: 'genericError', enumValues: GenericError_E.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NominalError clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NominalError copyWith(void Function(NominalError) updates) =>
      super.copyWith((message) => updates(message as NominalError))
          as NominalError;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NominalError create() => NominalError._();
  @$core.override
  NominalError createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NominalError getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NominalError>(create);
  static NominalError? _defaultInstance;

  @$pb.TagNumber(1)
  GenericError_E get genericError => $_getN(0);
  @$pb.TagNumber(1)
  set genericError(GenericError_E value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasGenericError() => $_has(0);
  @$pb.TagNumber(1)
  void clearGenericError() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

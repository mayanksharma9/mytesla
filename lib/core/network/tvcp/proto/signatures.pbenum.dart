// This is a generated file - do not edit.
//
// Generated from signatures.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Tag extends $pb.ProtobufEnum {
  static const Tag TAG_SIGNATURE_TYPE =
      Tag._(0, _omitEnumNames ? '' : 'TAG_SIGNATURE_TYPE');
  static const Tag TAG_DOMAIN = Tag._(1, _omitEnumNames ? '' : 'TAG_DOMAIN');
  static const Tag TAG_PERSONALIZATION =
      Tag._(2, _omitEnumNames ? '' : 'TAG_PERSONALIZATION');
  static const Tag TAG_EPOCH = Tag._(3, _omitEnumNames ? '' : 'TAG_EPOCH');
  static const Tag TAG_EXPIRES_AT =
      Tag._(4, _omitEnumNames ? '' : 'TAG_EXPIRES_AT');
  static const Tag TAG_COUNTER = Tag._(5, _omitEnumNames ? '' : 'TAG_COUNTER');
  static const Tag TAG_CHALLENGE =
      Tag._(6, _omitEnumNames ? '' : 'TAG_CHALLENGE');
  static const Tag TAG_FLAGS = Tag._(7, _omitEnumNames ? '' : 'TAG_FLAGS');
  static const Tag TAG_REQUEST_HASH =
      Tag._(8, _omitEnumNames ? '' : 'TAG_REQUEST_HASH');
  static const Tag TAG_FAULT = Tag._(9, _omitEnumNames ? '' : 'TAG_FAULT');
  static const Tag TAG_END = Tag._(255, _omitEnumNames ? '' : 'TAG_END');

  static const $core.List<Tag> values = <Tag>[
    TAG_SIGNATURE_TYPE,
    TAG_DOMAIN,
    TAG_PERSONALIZATION,
    TAG_EPOCH,
    TAG_EXPIRES_AT,
    TAG_COUNTER,
    TAG_CHALLENGE,
    TAG_FLAGS,
    TAG_REQUEST_HASH,
    TAG_FAULT,
    TAG_END,
  ];

  static final $core.Map<$core.int, Tag> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static Tag? valueOf($core.int value) => _byValue[value];

  const Tag._(super.value, super.name);
}

class SignatureType extends $pb.ProtobufEnum {
  static const SignatureType SIGNATURE_TYPE_AES_GCM =
      SignatureType._(0, _omitEnumNames ? '' : 'SIGNATURE_TYPE_AES_GCM');
  static const SignatureType SIGNATURE_TYPE_AES_GCM_PERSONALIZED =
      SignatureType._(
          5, _omitEnumNames ? '' : 'SIGNATURE_TYPE_AES_GCM_PERSONALIZED');
  static const SignatureType SIGNATURE_TYPE_HMAC =
      SignatureType._(6, _omitEnumNames ? '' : 'SIGNATURE_TYPE_HMAC');
  static const SignatureType SIGNATURE_TYPE_HMAC_PERSONALIZED = SignatureType._(
      8, _omitEnumNames ? '' : 'SIGNATURE_TYPE_HMAC_PERSONALIZED');
  static const SignatureType SIGNATURE_TYPE_AES_GCM_RESPONSE = SignatureType._(
      9, _omitEnumNames ? '' : 'SIGNATURE_TYPE_AES_GCM_RESPONSE');

  static const $core.List<SignatureType> values = <SignatureType>[
    SIGNATURE_TYPE_AES_GCM,
    SIGNATURE_TYPE_AES_GCM_PERSONALIZED,
    SIGNATURE_TYPE_HMAC,
    SIGNATURE_TYPE_HMAC_PERSONALIZED,
    SIGNATURE_TYPE_AES_GCM_RESPONSE,
  ];

  static final $core.Map<$core.int, SignatureType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static SignatureType? valueOf($core.int value) => _byValue[value];

  const SignatureType._(super.value, super.name);
}

class Session_Info_Status extends $pb.ProtobufEnum {
  static const Session_Info_Status SESSION_INFO_STATUS_OK =
      Session_Info_Status._(0, _omitEnumNames ? '' : 'SESSION_INFO_STATUS_OK');
  static const Session_Info_Status SESSION_INFO_STATUS_KEY_NOT_ON_WHITELIST =
      Session_Info_Status._(
          1, _omitEnumNames ? '' : 'SESSION_INFO_STATUS_KEY_NOT_ON_WHITELIST');

  static const $core.List<Session_Info_Status> values = <Session_Info_Status>[
    SESSION_INFO_STATUS_OK,
    SESSION_INFO_STATUS_KEY_NOT_ON_WHITELIST,
  ];

  static final $core.List<Session_Info_Status?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static Session_Info_Status? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Session_Info_Status._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

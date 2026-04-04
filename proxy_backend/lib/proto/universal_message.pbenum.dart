// This is a generated file - do not edit.
//
// Generated from universal_message.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Domain extends $pb.ProtobufEnum {
  static const Domain DOMAIN_BROADCAST =
      Domain._(0, _omitEnumNames ? '' : 'DOMAIN_BROADCAST');
  static const Domain DOMAIN_VEHICLE_SECURITY =
      Domain._(2, _omitEnumNames ? '' : 'DOMAIN_VEHICLE_SECURITY');
  static const Domain DOMAIN_INFOTAINMENT =
      Domain._(3, _omitEnumNames ? '' : 'DOMAIN_INFOTAINMENT');

  static const $core.List<Domain> values = <Domain>[
    DOMAIN_BROADCAST,
    DOMAIN_VEHICLE_SECURITY,
    DOMAIN_INFOTAINMENT,
  ];

  static final $core.List<Domain?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static Domain? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Domain._(super.value, super.name);
}

class OperationStatus_E extends $pb.ProtobufEnum {
  static const OperationStatus_E OPERATIONSTATUS_OK =
      OperationStatus_E._(0, _omitEnumNames ? '' : 'OPERATIONSTATUS_OK');
  static const OperationStatus_E OPERATIONSTATUS_WAIT =
      OperationStatus_E._(1, _omitEnumNames ? '' : 'OPERATIONSTATUS_WAIT');
  static const OperationStatus_E OPERATIONSTATUS_ERROR =
      OperationStatus_E._(2, _omitEnumNames ? '' : 'OPERATIONSTATUS_ERROR');

  static const $core.List<OperationStatus_E> values = <OperationStatus_E>[
    OPERATIONSTATUS_OK,
    OPERATIONSTATUS_WAIT,
    OPERATIONSTATUS_ERROR,
  ];

  static final $core.List<OperationStatus_E?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static OperationStatus_E? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const OperationStatus_E._(super.value, super.name);
}

class MessageFault_E extends $pb.ProtobufEnum {
  static const MessageFault_E MESSAGEFAULT_ERROR_NONE =
      MessageFault_E._(0, _omitEnumNames ? '' : 'MESSAGEFAULT_ERROR_NONE');
  static const MessageFault_E MESSAGEFAULT_ERROR_BUSY =
      MessageFault_E._(1, _omitEnumNames ? '' : 'MESSAGEFAULT_ERROR_BUSY');
  static const MessageFault_E MESSAGEFAULT_ERROR_TIMEOUT =
      MessageFault_E._(2, _omitEnumNames ? '' : 'MESSAGEFAULT_ERROR_TIMEOUT');
  static const MessageFault_E MESSAGEFAULT_ERROR_UNKNOWN_KEY_ID =
      MessageFault_E._(
          3, _omitEnumNames ? '' : 'MESSAGEFAULT_ERROR_UNKNOWN_KEY_ID');
  static const MessageFault_E MESSAGEFAULT_ERROR_INACTIVE_KEY =
      MessageFault_E._(
          4, _omitEnumNames ? '' : 'MESSAGEFAULT_ERROR_INACTIVE_KEY');
  static const MessageFault_E MESSAGEFAULT_ERROR_INVALID_SIGNATURE =
      MessageFault_E._(
          5, _omitEnumNames ? '' : 'MESSAGEFAULT_ERROR_INVALID_SIGNATURE');
  static const MessageFault_E MESSAGEFAULT_ERROR_INVALID_TOKEN_OR_COUNTER =
      MessageFault_E._(6,
          _omitEnumNames ? '' : 'MESSAGEFAULT_ERROR_INVALID_TOKEN_OR_COUNTER');
  static const MessageFault_E MESSAGEFAULT_ERROR_INSUFFICIENT_PRIVILEGES =
      MessageFault_E._(7,
          _omitEnumNames ? '' : 'MESSAGEFAULT_ERROR_INSUFFICIENT_PRIVILEGES');
  static const MessageFault_E MESSAGEFAULT_ERROR_INVALID_DOMAINS =
      MessageFault_E._(
          8, _omitEnumNames ? '' : 'MESSAGEFAULT_ERROR_INVALID_DOMAINS');
  static const MessageFault_E MESSAGEFAULT_ERROR_INVALID_COMMAND =
      MessageFault_E._(
          9, _omitEnumNames ? '' : 'MESSAGEFAULT_ERROR_INVALID_COMMAND');
  static const MessageFault_E MESSAGEFAULT_ERROR_DECODING =
      MessageFault_E._(10, _omitEnumNames ? '' : 'MESSAGEFAULT_ERROR_DECODING');
  static const MessageFault_E MESSAGEFAULT_ERROR_INTERNAL =
      MessageFault_E._(11, _omitEnumNames ? '' : 'MESSAGEFAULT_ERROR_INTERNAL');
  static const MessageFault_E MESSAGEFAULT_ERROR_WRONG_PERSONALIZATION =
      MessageFault_E._(
          12, _omitEnumNames ? '' : 'MESSAGEFAULT_ERROR_WRONG_PERSONALIZATION');
  static const MessageFault_E MESSAGEFAULT_ERROR_BAD_PARAMETER =
      MessageFault_E._(
          13, _omitEnumNames ? '' : 'MESSAGEFAULT_ERROR_BAD_PARAMETER');
  static const MessageFault_E MESSAGEFAULT_ERROR_KEYCHAIN_IS_FULL =
      MessageFault_E._(
          14, _omitEnumNames ? '' : 'MESSAGEFAULT_ERROR_KEYCHAIN_IS_FULL');
  static const MessageFault_E MESSAGEFAULT_ERROR_INCORRECT_EPOCH =
      MessageFault_E._(
          15, _omitEnumNames ? '' : 'MESSAGEFAULT_ERROR_INCORRECT_EPOCH');
  static const MessageFault_E MESSAGEFAULT_ERROR_IV_INCORRECT_LENGTH =
      MessageFault_E._(
          16, _omitEnumNames ? '' : 'MESSAGEFAULT_ERROR_IV_INCORRECT_LENGTH');
  static const MessageFault_E MESSAGEFAULT_ERROR_TIME_EXPIRED =
      MessageFault_E._(
          17, _omitEnumNames ? '' : 'MESSAGEFAULT_ERROR_TIME_EXPIRED');
  static const MessageFault_E MESSAGEFAULT_ERROR_NOT_PROVISIONED_WITH_IDENTITY =
      MessageFault_E._(
          18,
          _omitEnumNames
              ? ''
              : 'MESSAGEFAULT_ERROR_NOT_PROVISIONED_WITH_IDENTITY');
  static const MessageFault_E MESSAGEFAULT_ERROR_COULD_NOT_HASH_METADATA =
      MessageFault_E._(19,
          _omitEnumNames ? '' : 'MESSAGEFAULT_ERROR_COULD_NOT_HASH_METADATA');
  static const MessageFault_E MESSAGEFAULT_ERROR_TIME_TO_LIVE_TOO_LONG =
      MessageFault_E._(
          20, _omitEnumNames ? '' : 'MESSAGEFAULT_ERROR_TIME_TO_LIVE_TOO_LONG');
  static const MessageFault_E MESSAGEFAULT_ERROR_REMOTE_ACCESS_DISABLED =
      MessageFault_E._(21,
          _omitEnumNames ? '' : 'MESSAGEFAULT_ERROR_REMOTE_ACCESS_DISABLED');
  static const MessageFault_E
      MESSAGEFAULT_ERROR_REMOTE_SERVICE_ACCESS_DISABLED = MessageFault_E._(
          22,
          _omitEnumNames
              ? ''
              : 'MESSAGEFAULT_ERROR_REMOTE_SERVICE_ACCESS_DISABLED');
  static const MessageFault_E
      MESSAGEFAULT_ERROR_COMMAND_REQUIRES_ACCOUNT_CREDENTIALS =
      MessageFault_E._(
          23,
          _omitEnumNames
              ? ''
              : 'MESSAGEFAULT_ERROR_COMMAND_REQUIRES_ACCOUNT_CREDENTIALS');
  static const MessageFault_E MESSAGEFAULT_ERROR_REQUEST_MTU_EXCEEDED =
      MessageFault_E._(
          24, _omitEnumNames ? '' : 'MESSAGEFAULT_ERROR_REQUEST_MTU_EXCEEDED');
  static const MessageFault_E MESSAGEFAULT_ERROR_RESPONSE_MTU_EXCEEDED =
      MessageFault_E._(
          25, _omitEnumNames ? '' : 'MESSAGEFAULT_ERROR_RESPONSE_MTU_EXCEEDED');
  static const MessageFault_E MESSAGEFAULT_ERROR_REPEATED_COUNTER =
      MessageFault_E._(
          26, _omitEnumNames ? '' : 'MESSAGEFAULT_ERROR_REPEATED_COUNTER');
  static const MessageFault_E MESSAGEFAULT_ERROR_INVALID_KEY_HANDLE =
      MessageFault_E._(
          27, _omitEnumNames ? '' : 'MESSAGEFAULT_ERROR_INVALID_KEY_HANDLE');
  static const MessageFault_E MESSAGEFAULT_ERROR_REQUIRES_RESPONSE_ENCRYPTION =
      MessageFault_E._(
          28,
          _omitEnumNames
              ? ''
              : 'MESSAGEFAULT_ERROR_REQUIRES_RESPONSE_ENCRYPTION');

  static const $core.List<MessageFault_E> values = <MessageFault_E>[
    MESSAGEFAULT_ERROR_NONE,
    MESSAGEFAULT_ERROR_BUSY,
    MESSAGEFAULT_ERROR_TIMEOUT,
    MESSAGEFAULT_ERROR_UNKNOWN_KEY_ID,
    MESSAGEFAULT_ERROR_INACTIVE_KEY,
    MESSAGEFAULT_ERROR_INVALID_SIGNATURE,
    MESSAGEFAULT_ERROR_INVALID_TOKEN_OR_COUNTER,
    MESSAGEFAULT_ERROR_INSUFFICIENT_PRIVILEGES,
    MESSAGEFAULT_ERROR_INVALID_DOMAINS,
    MESSAGEFAULT_ERROR_INVALID_COMMAND,
    MESSAGEFAULT_ERROR_DECODING,
    MESSAGEFAULT_ERROR_INTERNAL,
    MESSAGEFAULT_ERROR_WRONG_PERSONALIZATION,
    MESSAGEFAULT_ERROR_BAD_PARAMETER,
    MESSAGEFAULT_ERROR_KEYCHAIN_IS_FULL,
    MESSAGEFAULT_ERROR_INCORRECT_EPOCH,
    MESSAGEFAULT_ERROR_IV_INCORRECT_LENGTH,
    MESSAGEFAULT_ERROR_TIME_EXPIRED,
    MESSAGEFAULT_ERROR_NOT_PROVISIONED_WITH_IDENTITY,
    MESSAGEFAULT_ERROR_COULD_NOT_HASH_METADATA,
    MESSAGEFAULT_ERROR_TIME_TO_LIVE_TOO_LONG,
    MESSAGEFAULT_ERROR_REMOTE_ACCESS_DISABLED,
    MESSAGEFAULT_ERROR_REMOTE_SERVICE_ACCESS_DISABLED,
    MESSAGEFAULT_ERROR_COMMAND_REQUIRES_ACCOUNT_CREDENTIALS,
    MESSAGEFAULT_ERROR_REQUEST_MTU_EXCEEDED,
    MESSAGEFAULT_ERROR_RESPONSE_MTU_EXCEEDED,
    MESSAGEFAULT_ERROR_REPEATED_COUNTER,
    MESSAGEFAULT_ERROR_INVALID_KEY_HANDLE,
    MESSAGEFAULT_ERROR_REQUIRES_RESPONSE_ENCRYPTION,
  ];

  static final $core.List<MessageFault_E?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 28);
  static MessageFault_E? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const MessageFault_E._(super.value, super.name);
}

class Flags extends $pb.ProtobufEnum {
  static const Flags FLAG_USER_COMMAND =
      Flags._(0, _omitEnumNames ? '' : 'FLAG_USER_COMMAND');
  static const Flags FLAG_ENCRYPT_RESPONSE =
      Flags._(1, _omitEnumNames ? '' : 'FLAG_ENCRYPT_RESPONSE');

  static const $core.List<Flags> values = <Flags>[
    FLAG_USER_COMMAND,
    FLAG_ENCRYPT_RESPONSE,
  ];

  static final $core.List<Flags?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static Flags? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Flags._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

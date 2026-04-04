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

import 'signatures.pb.dart' as $0;
import 'universal_message.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'universal_message.pbenum.dart';

enum Destination_SubDestination { domain, routingAddress, notSet }

class Destination extends $pb.GeneratedMessage {
  factory Destination({
    Domain? domain,
    $core.List<$core.int>? routingAddress,
  }) {
    final result = create();
    if (domain != null) result.domain = domain;
    if (routingAddress != null) result.routingAddress = routingAddress;
    return result;
  }

  Destination._();

  factory Destination.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Destination.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, Destination_SubDestination>
      _Destination_SubDestinationByTag = {
    1: Destination_SubDestination.domain,
    2: Destination_SubDestination.routingAddress,
    0: Destination_SubDestination.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Destination',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'UniversalMessage'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aE<Domain>(1, _omitFieldNames ? '' : 'domain', enumValues: Domain.values)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'routingAddress', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Destination clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Destination copyWith(void Function(Destination) updates) =>
      super.copyWith((message) => updates(message as Destination))
          as Destination;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Destination create() => Destination._();
  @$core.override
  Destination createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Destination getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Destination>(create);
  static Destination? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  Destination_SubDestination whichSubDestination() =>
      _Destination_SubDestinationByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  void clearSubDestination() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Domain get domain => $_getN(0);
  @$pb.TagNumber(1)
  set domain(Domain value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasDomain() => $_has(0);
  @$pb.TagNumber(1)
  void clearDomain() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get routingAddress => $_getN(1);
  @$pb.TagNumber(2)
  set routingAddress($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRoutingAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoutingAddress() => $_clearField(2);
}

class MessageStatus extends $pb.GeneratedMessage {
  factory MessageStatus({
    OperationStatus_E? operationStatus,
    MessageFault_E? signedMessageFault,
  }) {
    final result = create();
    if (operationStatus != null) result.operationStatus = operationStatus;
    if (signedMessageFault != null)
      result.signedMessageFault = signedMessageFault;
    return result;
  }

  MessageStatus._();

  factory MessageStatus.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MessageStatus.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MessageStatus',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'UniversalMessage'),
      createEmptyInstance: create)
    ..aE<OperationStatus_E>(1, _omitFieldNames ? '' : 'operationStatus',
        enumValues: OperationStatus_E.values)
    ..aE<MessageFault_E>(2, _omitFieldNames ? '' : 'signedMessageFault',
        enumValues: MessageFault_E.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MessageStatus clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MessageStatus copyWith(void Function(MessageStatus) updates) =>
      super.copyWith((message) => updates(message as MessageStatus))
          as MessageStatus;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MessageStatus create() => MessageStatus._();
  @$core.override
  MessageStatus createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MessageStatus getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MessageStatus>(create);
  static MessageStatus? _defaultInstance;

  @$pb.TagNumber(1)
  OperationStatus_E get operationStatus => $_getN(0);
  @$pb.TagNumber(1)
  set operationStatus(OperationStatus_E value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasOperationStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearOperationStatus() => $_clearField(1);

  @$pb.TagNumber(2)
  MessageFault_E get signedMessageFault => $_getN(1);
  @$pb.TagNumber(2)
  set signedMessageFault(MessageFault_E value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasSignedMessageFault() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignedMessageFault() => $_clearField(2);
}

class SessionInfoRequest extends $pb.GeneratedMessage {
  factory SessionInfoRequest({
    $core.List<$core.int>? publicKey,
    $core.List<$core.int>? challenge,
  }) {
    final result = create();
    if (publicKey != null) result.publicKey = publicKey;
    if (challenge != null) result.challenge = challenge;
    return result;
  }

  SessionInfoRequest._();

  factory SessionInfoRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SessionInfoRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SessionInfoRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'UniversalMessage'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'publicKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'challenge', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SessionInfoRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SessionInfoRequest copyWith(void Function(SessionInfoRequest) updates) =>
      super.copyWith((message) => updates(message as SessionInfoRequest))
          as SessionInfoRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SessionInfoRequest create() => SessionInfoRequest._();
  @$core.override
  SessionInfoRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SessionInfoRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SessionInfoRequest>(create);
  static SessionInfoRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get publicKey => $_getN(0);
  @$pb.TagNumber(1)
  set publicKey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPublicKey() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get challenge => $_getN(1);
  @$pb.TagNumber(2)
  set challenge($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasChallenge() => $_has(1);
  @$pb.TagNumber(2)
  void clearChallenge() => $_clearField(2);
}

enum RoutableMessage_Payload {
  protobufMessageAsBytes,
  sessionInfoRequest,
  sessionInfo,
  notSet
}

enum RoutableMessage_SubSigData { signatureData, notSet }

class RoutableMessage extends $pb.GeneratedMessage {
  factory RoutableMessage({
    Destination? toDestination,
    Destination? fromDestination,
    $core.List<$core.int>? protobufMessageAsBytes,
    MessageStatus? signedMessageStatus,
    $0.SignatureData? signatureData,
    SessionInfoRequest? sessionInfoRequest,
    $core.List<$core.int>? sessionInfo,
    $core.List<$core.int>? requestUuid,
    $core.List<$core.int>? uuid,
    $core.int? flags,
  }) {
    final result = create();
    if (toDestination != null) result.toDestination = toDestination;
    if (fromDestination != null) result.fromDestination = fromDestination;
    if (protobufMessageAsBytes != null)
      result.protobufMessageAsBytes = protobufMessageAsBytes;
    if (signedMessageStatus != null)
      result.signedMessageStatus = signedMessageStatus;
    if (signatureData != null) result.signatureData = signatureData;
    if (sessionInfoRequest != null)
      result.sessionInfoRequest = sessionInfoRequest;
    if (sessionInfo != null) result.sessionInfo = sessionInfo;
    if (requestUuid != null) result.requestUuid = requestUuid;
    if (uuid != null) result.uuid = uuid;
    if (flags != null) result.flags = flags;
    return result;
  }

  RoutableMessage._();

  factory RoutableMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoutableMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, RoutableMessage_Payload>
      _RoutableMessage_PayloadByTag = {
    10: RoutableMessage_Payload.protobufMessageAsBytes,
    14: RoutableMessage_Payload.sessionInfoRequest,
    15: RoutableMessage_Payload.sessionInfo,
    0: RoutableMessage_Payload.notSet
  };
  static const $core.Map<$core.int, RoutableMessage_SubSigData>
      _RoutableMessage_SubSigDataByTag = {
    13: RoutableMessage_SubSigData.signatureData,
    0: RoutableMessage_SubSigData.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoutableMessage',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'UniversalMessage'),
      createEmptyInstance: create)
    ..oo(0, [10, 14, 15])
    ..oo(1, [13])
    ..aOM<Destination>(6, _omitFieldNames ? '' : 'toDestination',
        subBuilder: Destination.create)
    ..aOM<Destination>(7, _omitFieldNames ? '' : 'fromDestination',
        subBuilder: Destination.create)
    ..a<$core.List<$core.int>>(
        10, _omitFieldNames ? '' : 'protobufMessageAsBytes', $pb.PbFieldType.OY)
    ..aOM<MessageStatus>(12, _omitFieldNames ? '' : 'signedMessageStatus',
        protoName: 'signedMessageStatus', subBuilder: MessageStatus.create)
    ..aOM<$0.SignatureData>(13, _omitFieldNames ? '' : 'signatureData',
        subBuilder: $0.SignatureData.create)
    ..aOM<SessionInfoRequest>(14, _omitFieldNames ? '' : 'sessionInfoRequest',
        subBuilder: SessionInfoRequest.create)
    ..a<$core.List<$core.int>>(
        15, _omitFieldNames ? '' : 'sessionInfo', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        50, _omitFieldNames ? '' : 'requestUuid', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        51, _omitFieldNames ? '' : 'uuid', $pb.PbFieldType.OY)
    ..aI(52, _omitFieldNames ? '' : 'flags', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoutableMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoutableMessage copyWith(void Function(RoutableMessage) updates) =>
      super.copyWith((message) => updates(message as RoutableMessage))
          as RoutableMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoutableMessage create() => RoutableMessage._();
  @$core.override
  RoutableMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoutableMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoutableMessage>(create);
  static RoutableMessage? _defaultInstance;

  @$pb.TagNumber(10)
  @$pb.TagNumber(14)
  @$pb.TagNumber(15)
  RoutableMessage_Payload whichPayload() =>
      _RoutableMessage_PayloadByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(10)
  @$pb.TagNumber(14)
  @$pb.TagNumber(15)
  void clearPayload() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(13)
  RoutableMessage_SubSigData whichSubSigData() =>
      _RoutableMessage_SubSigDataByTag[$_whichOneof(1)]!;
  @$pb.TagNumber(13)
  void clearSubSigData() => $_clearField($_whichOneof(1));

  @$pb.TagNumber(6)
  Destination get toDestination => $_getN(0);
  @$pb.TagNumber(6)
  set toDestination(Destination value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasToDestination() => $_has(0);
  @$pb.TagNumber(6)
  void clearToDestination() => $_clearField(6);
  @$pb.TagNumber(6)
  Destination ensureToDestination() => $_ensure(0);

  @$pb.TagNumber(7)
  Destination get fromDestination => $_getN(1);
  @$pb.TagNumber(7)
  set fromDestination(Destination value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasFromDestination() => $_has(1);
  @$pb.TagNumber(7)
  void clearFromDestination() => $_clearField(7);
  @$pb.TagNumber(7)
  Destination ensureFromDestination() => $_ensure(1);

  @$pb.TagNumber(10)
  $core.List<$core.int> get protobufMessageAsBytes => $_getN(2);
  @$pb.TagNumber(10)
  set protobufMessageAsBytes($core.List<$core.int> value) =>
      $_setBytes(2, value);
  @$pb.TagNumber(10)
  $core.bool hasProtobufMessageAsBytes() => $_has(2);
  @$pb.TagNumber(10)
  void clearProtobufMessageAsBytes() => $_clearField(10);

  @$pb.TagNumber(12)
  MessageStatus get signedMessageStatus => $_getN(3);
  @$pb.TagNumber(12)
  set signedMessageStatus(MessageStatus value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasSignedMessageStatus() => $_has(3);
  @$pb.TagNumber(12)
  void clearSignedMessageStatus() => $_clearField(12);
  @$pb.TagNumber(12)
  MessageStatus ensureSignedMessageStatus() => $_ensure(3);

  @$pb.TagNumber(13)
  $0.SignatureData get signatureData => $_getN(4);
  @$pb.TagNumber(13)
  set signatureData($0.SignatureData value) => $_setField(13, value);
  @$pb.TagNumber(13)
  $core.bool hasSignatureData() => $_has(4);
  @$pb.TagNumber(13)
  void clearSignatureData() => $_clearField(13);
  @$pb.TagNumber(13)
  $0.SignatureData ensureSignatureData() => $_ensure(4);

  @$pb.TagNumber(14)
  SessionInfoRequest get sessionInfoRequest => $_getN(5);
  @$pb.TagNumber(14)
  set sessionInfoRequest(SessionInfoRequest value) => $_setField(14, value);
  @$pb.TagNumber(14)
  $core.bool hasSessionInfoRequest() => $_has(5);
  @$pb.TagNumber(14)
  void clearSessionInfoRequest() => $_clearField(14);
  @$pb.TagNumber(14)
  SessionInfoRequest ensureSessionInfoRequest() => $_ensure(5);

  @$pb.TagNumber(15)
  $core.List<$core.int> get sessionInfo => $_getN(6);
  @$pb.TagNumber(15)
  set sessionInfo($core.List<$core.int> value) => $_setBytes(6, value);
  @$pb.TagNumber(15)
  $core.bool hasSessionInfo() => $_has(6);
  @$pb.TagNumber(15)
  void clearSessionInfo() => $_clearField(15);

  @$pb.TagNumber(50)
  $core.List<$core.int> get requestUuid => $_getN(7);
  @$pb.TagNumber(50)
  set requestUuid($core.List<$core.int> value) => $_setBytes(7, value);
  @$pb.TagNumber(50)
  $core.bool hasRequestUuid() => $_has(7);
  @$pb.TagNumber(50)
  void clearRequestUuid() => $_clearField(50);

  @$pb.TagNumber(51)
  $core.List<$core.int> get uuid => $_getN(8);
  @$pb.TagNumber(51)
  set uuid($core.List<$core.int> value) => $_setBytes(8, value);
  @$pb.TagNumber(51)
  $core.bool hasUuid() => $_has(8);
  @$pb.TagNumber(51)
  void clearUuid() => $_clearField(51);

  @$pb.TagNumber(52)
  $core.int get flags => $_getIZ(9);
  @$pb.TagNumber(52)
  set flags($core.int value) => $_setUnsignedInt32(9, value);
  @$pb.TagNumber(52)
  $core.bool hasFlags() => $_has(9);
  @$pb.TagNumber(52)
  void clearFlags() => $_clearField(52);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

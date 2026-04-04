// This is a generated file - do not edit.
//
// Generated from vcsec.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'errors.pb.dart' as $0;
import 'keys.pbenum.dart' as $1;
import 'vcsec.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'vcsec.pbenum.dart';

class SignedMessage extends $pb.GeneratedMessage {
  factory SignedMessage({
    $core.List<$core.int>? protobufMessageAsBytes,
    SignatureType? signatureType,
  }) {
    final result = create();
    if (protobufMessageAsBytes != null)
      result.protobufMessageAsBytes = protobufMessageAsBytes;
    if (signatureType != null) result.signatureType = signatureType;
    return result;
  }

  SignedMessage._();

  factory SignedMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SignedMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SignedMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VCSEC'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'protobufMessageAsBytes', $pb.PbFieldType.OY,
        protoName: 'protobufMessageAsBytes')
    ..aE<SignatureType>(3, _omitFieldNames ? '' : 'signatureType',
        protoName: 'signatureType', enumValues: SignatureType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SignedMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SignedMessage copyWith(void Function(SignedMessage) updates) =>
      super.copyWith((message) => updates(message as SignedMessage))
          as SignedMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SignedMessage create() => SignedMessage._();
  @$core.override
  SignedMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SignedMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SignedMessage>(create);
  static SignedMessage? _defaultInstance;

  @$pb.TagNumber(2)
  $core.List<$core.int> get protobufMessageAsBytes => $_getN(0);
  @$pb.TagNumber(2)
  set protobufMessageAsBytes($core.List<$core.int> value) =>
      $_setBytes(0, value);
  @$pb.TagNumber(2)
  $core.bool hasProtobufMessageAsBytes() => $_has(0);
  @$pb.TagNumber(2)
  void clearProtobufMessageAsBytes() => $_clearField(2);

  @$pb.TagNumber(3)
  SignatureType get signatureType => $_getN(1);
  @$pb.TagNumber(3)
  set signatureType(SignatureType value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasSignatureType() => $_has(1);
  @$pb.TagNumber(3)
  void clearSignatureType() => $_clearField(3);
}

class ToVCSECMessage extends $pb.GeneratedMessage {
  factory ToVCSECMessage({
    SignedMessage? signedMessage,
  }) {
    final result = create();
    if (signedMessage != null) result.signedMessage = signedMessage;
    return result;
  }

  ToVCSECMessage._();

  factory ToVCSECMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ToVCSECMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ToVCSECMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VCSEC'),
      createEmptyInstance: create)
    ..aOM<SignedMessage>(1, _omitFieldNames ? '' : 'signedMessage',
        protoName: 'signedMessage', subBuilder: SignedMessage.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ToVCSECMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ToVCSECMessage copyWith(void Function(ToVCSECMessage) updates) =>
      super.copyWith((message) => updates(message as ToVCSECMessage))
          as ToVCSECMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ToVCSECMessage create() => ToVCSECMessage._();
  @$core.override
  ToVCSECMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ToVCSECMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ToVCSECMessage>(create);
  static ToVCSECMessage? _defaultInstance;

  @$pb.TagNumber(1)
  SignedMessage get signedMessage => $_getN(0);
  @$pb.TagNumber(1)
  set signedMessage(SignedMessage value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSignedMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearSignedMessage() => $_clearField(1);
  @$pb.TagNumber(1)
  SignedMessage ensureSignedMessage() => $_ensure(0);
}

class KeyIdentifier extends $pb.GeneratedMessage {
  factory KeyIdentifier({
    $core.List<$core.int>? publicKeySHA1,
  }) {
    final result = create();
    if (publicKeySHA1 != null) result.publicKeySHA1 = publicKeySHA1;
    return result;
  }

  KeyIdentifier._();

  factory KeyIdentifier.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory KeyIdentifier.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'KeyIdentifier',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VCSEC'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'publicKeySHA1', $pb.PbFieldType.OY,
        protoName: 'publicKeySHA1')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KeyIdentifier clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KeyIdentifier copyWith(void Function(KeyIdentifier) updates) =>
      super.copyWith((message) => updates(message as KeyIdentifier))
          as KeyIdentifier;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static KeyIdentifier create() => KeyIdentifier._();
  @$core.override
  KeyIdentifier createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static KeyIdentifier getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KeyIdentifier>(create);
  static KeyIdentifier? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get publicKeySHA1 => $_getN(0);
  @$pb.TagNumber(1)
  set publicKeySHA1($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPublicKeySHA1() => $_has(0);
  @$pb.TagNumber(1)
  void clearPublicKeySHA1() => $_clearField(1);
}

class KeyMetadata extends $pb.GeneratedMessage {
  factory KeyMetadata({
    KeyFormFactor? keyFormFactor,
  }) {
    final result = create();
    if (keyFormFactor != null) result.keyFormFactor = keyFormFactor;
    return result;
  }

  KeyMetadata._();

  factory KeyMetadata.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory KeyMetadata.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'KeyMetadata',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VCSEC'),
      createEmptyInstance: create)
    ..aE<KeyFormFactor>(1, _omitFieldNames ? '' : 'keyFormFactor',
        protoName: 'keyFormFactor', enumValues: KeyFormFactor.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KeyMetadata clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KeyMetadata copyWith(void Function(KeyMetadata) updates) =>
      super.copyWith((message) => updates(message as KeyMetadata))
          as KeyMetadata;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static KeyMetadata create() => KeyMetadata._();
  @$core.override
  KeyMetadata createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static KeyMetadata getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KeyMetadata>(create);
  static KeyMetadata? _defaultInstance;

  @$pb.TagNumber(1)
  KeyFormFactor get keyFormFactor => $_getN(0);
  @$pb.TagNumber(1)
  set keyFormFactor(KeyFormFactor value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasKeyFormFactor() => $_has(0);
  @$pb.TagNumber(1)
  void clearKeyFormFactor() => $_clearField(1);
}

class PublicKey extends $pb.GeneratedMessage {
  factory PublicKey({
    $core.List<$core.int>? publicKeyRaw,
  }) {
    final result = create();
    if (publicKeyRaw != null) result.publicKeyRaw = publicKeyRaw;
    return result;
  }

  PublicKey._();

  factory PublicKey.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PublicKey.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PublicKey',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VCSEC'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'PublicKeyRaw', $pb.PbFieldType.OY,
        protoName: 'PublicKeyRaw')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PublicKey clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PublicKey copyWith(void Function(PublicKey) updates) =>
      super.copyWith((message) => updates(message as PublicKey)) as PublicKey;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PublicKey create() => PublicKey._();
  @$core.override
  PublicKey createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PublicKey getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PublicKey>(create);
  static PublicKey? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get publicKeyRaw => $_getN(0);
  @$pb.TagNumber(1)
  set publicKeyRaw($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPublicKeyRaw() => $_has(0);
  @$pb.TagNumber(1)
  void clearPublicKeyRaw() => $_clearField(1);
}

class WhitelistInfo extends $pb.GeneratedMessage {
  factory WhitelistInfo({
    $core.int? numberOfEntries,
    $core.Iterable<KeyIdentifier>? whitelistEntries,
    $core.int? slotMask,
  }) {
    final result = create();
    if (numberOfEntries != null) result.numberOfEntries = numberOfEntries;
    if (whitelistEntries != null)
      result.whitelistEntries.addAll(whitelistEntries);
    if (slotMask != null) result.slotMask = slotMask;
    return result;
  }

  WhitelistInfo._();

  factory WhitelistInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WhitelistInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WhitelistInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VCSEC'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'numberOfEntries',
        protoName: 'numberOfEntries', fieldType: $pb.PbFieldType.OU3)
    ..pPM<KeyIdentifier>(2, _omitFieldNames ? '' : 'whitelistEntries',
        protoName: 'whitelistEntries', subBuilder: KeyIdentifier.create)
    ..aI(3, _omitFieldNames ? '' : 'slotMask',
        protoName: 'slotMask', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WhitelistInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WhitelistInfo copyWith(void Function(WhitelistInfo) updates) =>
      super.copyWith((message) => updates(message as WhitelistInfo))
          as WhitelistInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WhitelistInfo create() => WhitelistInfo._();
  @$core.override
  WhitelistInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WhitelistInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WhitelistInfo>(create);
  static WhitelistInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get numberOfEntries => $_getIZ(0);
  @$pb.TagNumber(1)
  set numberOfEntries($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNumberOfEntries() => $_has(0);
  @$pb.TagNumber(1)
  void clearNumberOfEntries() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<KeyIdentifier> get whitelistEntries => $_getList(1);

  @$pb.TagNumber(3)
  $core.int get slotMask => $_getIZ(2);
  @$pb.TagNumber(3)
  set slotMask($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSlotMask() => $_has(2);
  @$pb.TagNumber(3)
  void clearSlotMask() => $_clearField(3);
}

class WhitelistEntryInfo extends $pb.GeneratedMessage {
  factory WhitelistEntryInfo({
    KeyIdentifier? keyId,
    PublicKey? publicKey,
    KeyMetadata? metadataForKey,
    $core.int? slot,
    $1.Role? keyRole,
  }) {
    final result = create();
    if (keyId != null) result.keyId = keyId;
    if (publicKey != null) result.publicKey = publicKey;
    if (metadataForKey != null) result.metadataForKey = metadataForKey;
    if (slot != null) result.slot = slot;
    if (keyRole != null) result.keyRole = keyRole;
    return result;
  }

  WhitelistEntryInfo._();

  factory WhitelistEntryInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WhitelistEntryInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WhitelistEntryInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VCSEC'),
      createEmptyInstance: create)
    ..aOM<KeyIdentifier>(1, _omitFieldNames ? '' : 'keyId',
        protoName: 'keyId', subBuilder: KeyIdentifier.create)
    ..aOM<PublicKey>(2, _omitFieldNames ? '' : 'publicKey',
        protoName: 'publicKey', subBuilder: PublicKey.create)
    ..aOM<KeyMetadata>(4, _omitFieldNames ? '' : 'metadataForKey',
        protoName: 'metadataForKey', subBuilder: KeyMetadata.create)
    ..aI(6, _omitFieldNames ? '' : 'slot', fieldType: $pb.PbFieldType.OU3)
    ..aE<$1.Role>(7, _omitFieldNames ? '' : 'keyRole',
        protoName: 'keyRole', enumValues: $1.Role.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WhitelistEntryInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WhitelistEntryInfo copyWith(void Function(WhitelistEntryInfo) updates) =>
      super.copyWith((message) => updates(message as WhitelistEntryInfo))
          as WhitelistEntryInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WhitelistEntryInfo create() => WhitelistEntryInfo._();
  @$core.override
  WhitelistEntryInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WhitelistEntryInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WhitelistEntryInfo>(create);
  static WhitelistEntryInfo? _defaultInstance;

  @$pb.TagNumber(1)
  KeyIdentifier get keyId => $_getN(0);
  @$pb.TagNumber(1)
  set keyId(KeyIdentifier value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasKeyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearKeyId() => $_clearField(1);
  @$pb.TagNumber(1)
  KeyIdentifier ensureKeyId() => $_ensure(0);

  @$pb.TagNumber(2)
  PublicKey get publicKey => $_getN(1);
  @$pb.TagNumber(2)
  set publicKey(PublicKey value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearPublicKey() => $_clearField(2);
  @$pb.TagNumber(2)
  PublicKey ensurePublicKey() => $_ensure(1);

  @$pb.TagNumber(4)
  KeyMetadata get metadataForKey => $_getN(2);
  @$pb.TagNumber(4)
  set metadataForKey(KeyMetadata value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasMetadataForKey() => $_has(2);
  @$pb.TagNumber(4)
  void clearMetadataForKey() => $_clearField(4);
  @$pb.TagNumber(4)
  KeyMetadata ensureMetadataForKey() => $_ensure(2);

  @$pb.TagNumber(6)
  $core.int get slot => $_getIZ(3);
  @$pb.TagNumber(6)
  set slot($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(6)
  $core.bool hasSlot() => $_has(3);
  @$pb.TagNumber(6)
  void clearSlot() => $_clearField(6);

  @$pb.TagNumber(7)
  $1.Role get keyRole => $_getN(4);
  @$pb.TagNumber(7)
  set keyRole($1.Role value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasKeyRole() => $_has(4);
  @$pb.TagNumber(7)
  void clearKeyRole() => $_clearField(7);
}

enum InformationRequest_Key { keyId, publicKey, slot, notSet }

class InformationRequest extends $pb.GeneratedMessage {
  factory InformationRequest({
    InformationRequestType? informationRequestType,
    KeyIdentifier? keyId,
    $core.List<$core.int>? publicKey,
    $core.int? slot,
  }) {
    final result = create();
    if (informationRequestType != null)
      result.informationRequestType = informationRequestType;
    if (keyId != null) result.keyId = keyId;
    if (publicKey != null) result.publicKey = publicKey;
    if (slot != null) result.slot = slot;
    return result;
  }

  InformationRequest._();

  factory InformationRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InformationRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, InformationRequest_Key>
      _InformationRequest_KeyByTag = {
    2: InformationRequest_Key.keyId,
    3: InformationRequest_Key.publicKey,
    4: InformationRequest_Key.slot,
    0: InformationRequest_Key.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InformationRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VCSEC'),
      createEmptyInstance: create)
    ..oo(0, [2, 3, 4])
    ..aE<InformationRequestType>(
        1, _omitFieldNames ? '' : 'informationRequestType',
        protoName: 'informationRequestType',
        enumValues: InformationRequestType.values)
    ..aOM<KeyIdentifier>(2, _omitFieldNames ? '' : 'keyId',
        protoName: 'keyId', subBuilder: KeyIdentifier.create)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'publicKey', $pb.PbFieldType.OY,
        protoName: 'publicKey')
    ..aI(4, _omitFieldNames ? '' : 'slot', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InformationRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InformationRequest copyWith(void Function(InformationRequest) updates) =>
      super.copyWith((message) => updates(message as InformationRequest))
          as InformationRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InformationRequest create() => InformationRequest._();
  @$core.override
  InformationRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InformationRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InformationRequest>(create);
  static InformationRequest? _defaultInstance;

  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  InformationRequest_Key whichKey() =>
      _InformationRequest_KeyByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  void clearKey() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  InformationRequestType get informationRequestType => $_getN(0);
  @$pb.TagNumber(1)
  set informationRequestType(InformationRequestType value) =>
      $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasInformationRequestType() => $_has(0);
  @$pb.TagNumber(1)
  void clearInformationRequestType() => $_clearField(1);

  @$pb.TagNumber(2)
  KeyIdentifier get keyId => $_getN(1);
  @$pb.TagNumber(2)
  set keyId(KeyIdentifier value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasKeyId() => $_has(1);
  @$pb.TagNumber(2)
  void clearKeyId() => $_clearField(2);
  @$pb.TagNumber(2)
  KeyIdentifier ensureKeyId() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<$core.int> get publicKey => $_getN(2);
  @$pb.TagNumber(3)
  set publicKey($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPublicKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearPublicKey() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get slot => $_getIZ(3);
  @$pb.TagNumber(4)
  set slot($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSlot() => $_has(3);
  @$pb.TagNumber(4)
  void clearSlot() => $_clearField(4);
}

class ClosureMoveRequest extends $pb.GeneratedMessage {
  factory ClosureMoveRequest({
    ClosureMoveType_E? frontDriverDoor,
    ClosureMoveType_E? frontPassengerDoor,
    ClosureMoveType_E? rearDriverDoor,
    ClosureMoveType_E? rearPassengerDoor,
    ClosureMoveType_E? rearTrunk,
    ClosureMoveType_E? frontTrunk,
    ClosureMoveType_E? chargePort,
    ClosureMoveType_E? tonneau,
  }) {
    final result = create();
    if (frontDriverDoor != null) result.frontDriverDoor = frontDriverDoor;
    if (frontPassengerDoor != null)
      result.frontPassengerDoor = frontPassengerDoor;
    if (rearDriverDoor != null) result.rearDriverDoor = rearDriverDoor;
    if (rearPassengerDoor != null) result.rearPassengerDoor = rearPassengerDoor;
    if (rearTrunk != null) result.rearTrunk = rearTrunk;
    if (frontTrunk != null) result.frontTrunk = frontTrunk;
    if (chargePort != null) result.chargePort = chargePort;
    if (tonneau != null) result.tonneau = tonneau;
    return result;
  }

  ClosureMoveRequest._();

  factory ClosureMoveRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ClosureMoveRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClosureMoveRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VCSEC'),
      createEmptyInstance: create)
    ..aE<ClosureMoveType_E>(1, _omitFieldNames ? '' : 'frontDriverDoor',
        protoName: 'frontDriverDoor', enumValues: ClosureMoveType_E.values)
    ..aE<ClosureMoveType_E>(2, _omitFieldNames ? '' : 'frontPassengerDoor',
        protoName: 'frontPassengerDoor', enumValues: ClosureMoveType_E.values)
    ..aE<ClosureMoveType_E>(3, _omitFieldNames ? '' : 'rearDriverDoor',
        protoName: 'rearDriverDoor', enumValues: ClosureMoveType_E.values)
    ..aE<ClosureMoveType_E>(4, _omitFieldNames ? '' : 'rearPassengerDoor',
        protoName: 'rearPassengerDoor', enumValues: ClosureMoveType_E.values)
    ..aE<ClosureMoveType_E>(5, _omitFieldNames ? '' : 'rearTrunk',
        protoName: 'rearTrunk', enumValues: ClosureMoveType_E.values)
    ..aE<ClosureMoveType_E>(6, _omitFieldNames ? '' : 'frontTrunk',
        protoName: 'frontTrunk', enumValues: ClosureMoveType_E.values)
    ..aE<ClosureMoveType_E>(7, _omitFieldNames ? '' : 'chargePort',
        protoName: 'chargePort', enumValues: ClosureMoveType_E.values)
    ..aE<ClosureMoveType_E>(8, _omitFieldNames ? '' : 'tonneau',
        enumValues: ClosureMoveType_E.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClosureMoveRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClosureMoveRequest copyWith(void Function(ClosureMoveRequest) updates) =>
      super.copyWith((message) => updates(message as ClosureMoveRequest))
          as ClosureMoveRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClosureMoveRequest create() => ClosureMoveRequest._();
  @$core.override
  ClosureMoveRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ClosureMoveRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClosureMoveRequest>(create);
  static ClosureMoveRequest? _defaultInstance;

  @$pb.TagNumber(1)
  ClosureMoveType_E get frontDriverDoor => $_getN(0);
  @$pb.TagNumber(1)
  set frontDriverDoor(ClosureMoveType_E value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasFrontDriverDoor() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrontDriverDoor() => $_clearField(1);

  @$pb.TagNumber(2)
  ClosureMoveType_E get frontPassengerDoor => $_getN(1);
  @$pb.TagNumber(2)
  set frontPassengerDoor(ClosureMoveType_E value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasFrontPassengerDoor() => $_has(1);
  @$pb.TagNumber(2)
  void clearFrontPassengerDoor() => $_clearField(2);

  @$pb.TagNumber(3)
  ClosureMoveType_E get rearDriverDoor => $_getN(2);
  @$pb.TagNumber(3)
  set rearDriverDoor(ClosureMoveType_E value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasRearDriverDoor() => $_has(2);
  @$pb.TagNumber(3)
  void clearRearDriverDoor() => $_clearField(3);

  @$pb.TagNumber(4)
  ClosureMoveType_E get rearPassengerDoor => $_getN(3);
  @$pb.TagNumber(4)
  set rearPassengerDoor(ClosureMoveType_E value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasRearPassengerDoor() => $_has(3);
  @$pb.TagNumber(4)
  void clearRearPassengerDoor() => $_clearField(4);

  @$pb.TagNumber(5)
  ClosureMoveType_E get rearTrunk => $_getN(4);
  @$pb.TagNumber(5)
  set rearTrunk(ClosureMoveType_E value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasRearTrunk() => $_has(4);
  @$pb.TagNumber(5)
  void clearRearTrunk() => $_clearField(5);

  @$pb.TagNumber(6)
  ClosureMoveType_E get frontTrunk => $_getN(5);
  @$pb.TagNumber(6)
  set frontTrunk(ClosureMoveType_E value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasFrontTrunk() => $_has(5);
  @$pb.TagNumber(6)
  void clearFrontTrunk() => $_clearField(6);

  @$pb.TagNumber(7)
  ClosureMoveType_E get chargePort => $_getN(6);
  @$pb.TagNumber(7)
  set chargePort(ClosureMoveType_E value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasChargePort() => $_has(6);
  @$pb.TagNumber(7)
  void clearChargePort() => $_clearField(7);

  @$pb.TagNumber(8)
  ClosureMoveType_E get tonneau => $_getN(7);
  @$pb.TagNumber(8)
  set tonneau(ClosureMoveType_E value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasTonneau() => $_has(7);
  @$pb.TagNumber(8)
  void clearTonneau() => $_clearField(8);
}

class PermissionChange extends $pb.GeneratedMessage {
  factory PermissionChange({
    PublicKey? key,
    $core.int? secondsToBeActive,
    $1.Role? keyRole,
  }) {
    final result = create();
    if (key != null) result.key = key;
    if (secondsToBeActive != null) result.secondsToBeActive = secondsToBeActive;
    if (keyRole != null) result.keyRole = keyRole;
    return result;
  }

  PermissionChange._();

  factory PermissionChange.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PermissionChange.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PermissionChange',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VCSEC'),
      createEmptyInstance: create)
    ..aOM<PublicKey>(1, _omitFieldNames ? '' : 'key',
        subBuilder: PublicKey.create)
    ..aI(3, _omitFieldNames ? '' : 'secondsToBeActive',
        protoName: 'secondsToBeActive', fieldType: $pb.PbFieldType.OU3)
    ..aE<$1.Role>(4, _omitFieldNames ? '' : 'keyRole',
        protoName: 'keyRole', enumValues: $1.Role.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PermissionChange clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PermissionChange copyWith(void Function(PermissionChange) updates) =>
      super.copyWith((message) => updates(message as PermissionChange))
          as PermissionChange;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PermissionChange create() => PermissionChange._();
  @$core.override
  PermissionChange createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PermissionChange getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PermissionChange>(create);
  static PermissionChange? _defaultInstance;

  @$pb.TagNumber(1)
  PublicKey get key => $_getN(0);
  @$pb.TagNumber(1)
  set key(PublicKey value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => $_clearField(1);
  @$pb.TagNumber(1)
  PublicKey ensureKey() => $_ensure(0);

  @$pb.TagNumber(3)
  $core.int get secondsToBeActive => $_getIZ(1);
  @$pb.TagNumber(3)
  set secondsToBeActive($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(3)
  $core.bool hasSecondsToBeActive() => $_has(1);
  @$pb.TagNumber(3)
  void clearSecondsToBeActive() => $_clearField(3);

  @$pb.TagNumber(4)
  $1.Role get keyRole => $_getN(2);
  @$pb.TagNumber(4)
  set keyRole($1.Role value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasKeyRole() => $_has(2);
  @$pb.TagNumber(4)
  void clearKeyRole() => $_clearField(4);
}

enum ReplaceKey_KeyToReplace { publicKeyToReplace, slotToReplace, notSet }

class ReplaceKey extends $pb.GeneratedMessage {
  factory ReplaceKey({
    PublicKey? publicKeyToReplace,
    $core.int? slotToReplace,
    PublicKey? keyToAdd,
    $1.Role? keyRole,
    $core.bool? impermanent,
  }) {
    final result = create();
    if (publicKeyToReplace != null)
      result.publicKeyToReplace = publicKeyToReplace;
    if (slotToReplace != null) result.slotToReplace = slotToReplace;
    if (keyToAdd != null) result.keyToAdd = keyToAdd;
    if (keyRole != null) result.keyRole = keyRole;
    if (impermanent != null) result.impermanent = impermanent;
    return result;
  }

  ReplaceKey._();

  factory ReplaceKey.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReplaceKey.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ReplaceKey_KeyToReplace>
      _ReplaceKey_KeyToReplaceByTag = {
    1: ReplaceKey_KeyToReplace.publicKeyToReplace,
    2: ReplaceKey_KeyToReplace.slotToReplace,
    0: ReplaceKey_KeyToReplace.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReplaceKey',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VCSEC'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<PublicKey>(1, _omitFieldNames ? '' : 'publicKeyToReplace',
        protoName: 'publicKeyToReplace', subBuilder: PublicKey.create)
    ..aI(2, _omitFieldNames ? '' : 'slotToReplace',
        protoName: 'slotToReplace', fieldType: $pb.PbFieldType.OU3)
    ..aOM<PublicKey>(3, _omitFieldNames ? '' : 'keyToAdd',
        protoName: 'keyToAdd', subBuilder: PublicKey.create)
    ..aE<$1.Role>(4, _omitFieldNames ? '' : 'keyRole',
        protoName: 'keyRole', enumValues: $1.Role.values)
    ..aOB(5, _omitFieldNames ? '' : 'impermanent')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReplaceKey clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReplaceKey copyWith(void Function(ReplaceKey) updates) =>
      super.copyWith((message) => updates(message as ReplaceKey)) as ReplaceKey;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReplaceKey create() => ReplaceKey._();
  @$core.override
  ReplaceKey createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ReplaceKey getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReplaceKey>(create);
  static ReplaceKey? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  ReplaceKey_KeyToReplace whichKeyToReplace() =>
      _ReplaceKey_KeyToReplaceByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  void clearKeyToReplace() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  PublicKey get publicKeyToReplace => $_getN(0);
  @$pb.TagNumber(1)
  set publicKeyToReplace(PublicKey value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPublicKeyToReplace() => $_has(0);
  @$pb.TagNumber(1)
  void clearPublicKeyToReplace() => $_clearField(1);
  @$pb.TagNumber(1)
  PublicKey ensurePublicKeyToReplace() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get slotToReplace => $_getIZ(1);
  @$pb.TagNumber(2)
  set slotToReplace($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSlotToReplace() => $_has(1);
  @$pb.TagNumber(2)
  void clearSlotToReplace() => $_clearField(2);

  @$pb.TagNumber(3)
  PublicKey get keyToAdd => $_getN(2);
  @$pb.TagNumber(3)
  set keyToAdd(PublicKey value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasKeyToAdd() => $_has(2);
  @$pb.TagNumber(3)
  void clearKeyToAdd() => $_clearField(3);
  @$pb.TagNumber(3)
  PublicKey ensureKeyToAdd() => $_ensure(2);

  @$pb.TagNumber(4)
  $1.Role get keyRole => $_getN(3);
  @$pb.TagNumber(4)
  set keyRole($1.Role value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasKeyRole() => $_has(3);
  @$pb.TagNumber(4)
  void clearKeyRole() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get impermanent => $_getBF(4);
  @$pb.TagNumber(5)
  set impermanent($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasImpermanent() => $_has(4);
  @$pb.TagNumber(5)
  void clearImpermanent() => $_clearField(5);
}

enum WhitelistOperation_SubMessage {
  addPublicKeyToWhitelist,
  removePublicKeyFromWhitelist,
  addPermissionsToPublicKey,
  removePermissionsFromPublicKey,
  addKeyToWhitelistAndAddPermissions,
  updateKeyAndPermissions,
  addImpermanentKey,
  addImpermanentKeyAndRemoveExisting,
  removeAllImpermanentKeys,
  replaceKey,
  notSet
}

class WhitelistOperation extends $pb.GeneratedMessage {
  factory WhitelistOperation({
    PublicKey? addPublicKeyToWhitelist,
    PublicKey? removePublicKeyFromWhitelist,
    PermissionChange? addPermissionsToPublicKey,
    PermissionChange? removePermissionsFromPublicKey,
    PermissionChange? addKeyToWhitelistAndAddPermissions,
    KeyMetadata? metadataForKey,
    PermissionChange? updateKeyAndPermissions,
    PermissionChange? addImpermanentKey,
    PermissionChange? addImpermanentKeyAndRemoveExisting,
    $core.bool? removeAllImpermanentKeys,
    ReplaceKey? replaceKey,
  }) {
    final result = create();
    if (addPublicKeyToWhitelist != null)
      result.addPublicKeyToWhitelist = addPublicKeyToWhitelist;
    if (removePublicKeyFromWhitelist != null)
      result.removePublicKeyFromWhitelist = removePublicKeyFromWhitelist;
    if (addPermissionsToPublicKey != null)
      result.addPermissionsToPublicKey = addPermissionsToPublicKey;
    if (removePermissionsFromPublicKey != null)
      result.removePermissionsFromPublicKey = removePermissionsFromPublicKey;
    if (addKeyToWhitelistAndAddPermissions != null)
      result.addKeyToWhitelistAndAddPermissions =
          addKeyToWhitelistAndAddPermissions;
    if (metadataForKey != null) result.metadataForKey = metadataForKey;
    if (updateKeyAndPermissions != null)
      result.updateKeyAndPermissions = updateKeyAndPermissions;
    if (addImpermanentKey != null) result.addImpermanentKey = addImpermanentKey;
    if (addImpermanentKeyAndRemoveExisting != null)
      result.addImpermanentKeyAndRemoveExisting =
          addImpermanentKeyAndRemoveExisting;
    if (removeAllImpermanentKeys != null)
      result.removeAllImpermanentKeys = removeAllImpermanentKeys;
    if (replaceKey != null) result.replaceKey = replaceKey;
    return result;
  }

  WhitelistOperation._();

  factory WhitelistOperation.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WhitelistOperation.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, WhitelistOperation_SubMessage>
      _WhitelistOperation_SubMessageByTag = {
    1: WhitelistOperation_SubMessage.addPublicKeyToWhitelist,
    2: WhitelistOperation_SubMessage.removePublicKeyFromWhitelist,
    3: WhitelistOperation_SubMessage.addPermissionsToPublicKey,
    4: WhitelistOperation_SubMessage.removePermissionsFromPublicKey,
    5: WhitelistOperation_SubMessage.addKeyToWhitelistAndAddPermissions,
    7: WhitelistOperation_SubMessage.updateKeyAndPermissions,
    8: WhitelistOperation_SubMessage.addImpermanentKey,
    9: WhitelistOperation_SubMessage.addImpermanentKeyAndRemoveExisting,
    16: WhitelistOperation_SubMessage.removeAllImpermanentKeys,
    17: WhitelistOperation_SubMessage.replaceKey,
    0: WhitelistOperation_SubMessage.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WhitelistOperation',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VCSEC'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5, 7, 8, 9, 16, 17])
    ..aOM<PublicKey>(1, _omitFieldNames ? '' : 'addPublicKeyToWhitelist',
        protoName: 'addPublicKeyToWhitelist', subBuilder: PublicKey.create)
    ..aOM<PublicKey>(2, _omitFieldNames ? '' : 'removePublicKeyFromWhitelist',
        protoName: 'removePublicKeyFromWhitelist', subBuilder: PublicKey.create)
    ..aOM<PermissionChange>(
        3, _omitFieldNames ? '' : 'addPermissionsToPublicKey',
        protoName: 'addPermissionsToPublicKey',
        subBuilder: PermissionChange.create)
    ..aOM<PermissionChange>(
        4, _omitFieldNames ? '' : 'removePermissionsFromPublicKey',
        protoName: 'removePermissionsFromPublicKey',
        subBuilder: PermissionChange.create)
    ..aOM<PermissionChange>(
        5, _omitFieldNames ? '' : 'addKeyToWhitelistAndAddPermissions',
        protoName: 'addKeyToWhitelistAndAddPermissions',
        subBuilder: PermissionChange.create)
    ..aOM<KeyMetadata>(6, _omitFieldNames ? '' : 'metadataForKey',
        protoName: 'metadataForKey', subBuilder: KeyMetadata.create)
    ..aOM<PermissionChange>(7, _omitFieldNames ? '' : 'updateKeyAndPermissions',
        protoName: 'updateKeyAndPermissions',
        subBuilder: PermissionChange.create)
    ..aOM<PermissionChange>(8, _omitFieldNames ? '' : 'addImpermanentKey',
        protoName: 'addImpermanentKey', subBuilder: PermissionChange.create)
    ..aOM<PermissionChange>(
        9, _omitFieldNames ? '' : 'addImpermanentKeyAndRemoveExisting',
        protoName: 'addImpermanentKeyAndRemoveExisting',
        subBuilder: PermissionChange.create)
    ..aOB(16, _omitFieldNames ? '' : 'removeAllImpermanentKeys',
        protoName: 'removeAllImpermanentKeys')
    ..aOM<ReplaceKey>(17, _omitFieldNames ? '' : 'replaceKey',
        protoName: 'replaceKey', subBuilder: ReplaceKey.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WhitelistOperation clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WhitelistOperation copyWith(void Function(WhitelistOperation) updates) =>
      super.copyWith((message) => updates(message as WhitelistOperation))
          as WhitelistOperation;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WhitelistOperation create() => WhitelistOperation._();
  @$core.override
  WhitelistOperation createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WhitelistOperation getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WhitelistOperation>(create);
  static WhitelistOperation? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  @$pb.TagNumber(16)
  @$pb.TagNumber(17)
  WhitelistOperation_SubMessage whichSubMessage() =>
      _WhitelistOperation_SubMessageByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  @$pb.TagNumber(16)
  @$pb.TagNumber(17)
  void clearSubMessage() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  PublicKey get addPublicKeyToWhitelist => $_getN(0);
  @$pb.TagNumber(1)
  set addPublicKeyToWhitelist(PublicKey value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasAddPublicKeyToWhitelist() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddPublicKeyToWhitelist() => $_clearField(1);
  @$pb.TagNumber(1)
  PublicKey ensureAddPublicKeyToWhitelist() => $_ensure(0);

  @$pb.TagNumber(2)
  PublicKey get removePublicKeyFromWhitelist => $_getN(1);
  @$pb.TagNumber(2)
  set removePublicKeyFromWhitelist(PublicKey value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasRemovePublicKeyFromWhitelist() => $_has(1);
  @$pb.TagNumber(2)
  void clearRemovePublicKeyFromWhitelist() => $_clearField(2);
  @$pb.TagNumber(2)
  PublicKey ensureRemovePublicKeyFromWhitelist() => $_ensure(1);

  @$pb.TagNumber(3)
  PermissionChange get addPermissionsToPublicKey => $_getN(2);
  @$pb.TagNumber(3)
  set addPermissionsToPublicKey(PermissionChange value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasAddPermissionsToPublicKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearAddPermissionsToPublicKey() => $_clearField(3);
  @$pb.TagNumber(3)
  PermissionChange ensureAddPermissionsToPublicKey() => $_ensure(2);

  @$pb.TagNumber(4)
  PermissionChange get removePermissionsFromPublicKey => $_getN(3);
  @$pb.TagNumber(4)
  set removePermissionsFromPublicKey(PermissionChange value) =>
      $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasRemovePermissionsFromPublicKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearRemovePermissionsFromPublicKey() => $_clearField(4);
  @$pb.TagNumber(4)
  PermissionChange ensureRemovePermissionsFromPublicKey() => $_ensure(3);

  @$pb.TagNumber(5)
  PermissionChange get addKeyToWhitelistAndAddPermissions => $_getN(4);
  @$pb.TagNumber(5)
  set addKeyToWhitelistAndAddPermissions(PermissionChange value) =>
      $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasAddKeyToWhitelistAndAddPermissions() => $_has(4);
  @$pb.TagNumber(5)
  void clearAddKeyToWhitelistAndAddPermissions() => $_clearField(5);
  @$pb.TagNumber(5)
  PermissionChange ensureAddKeyToWhitelistAndAddPermissions() => $_ensure(4);

  @$pb.TagNumber(6)
  KeyMetadata get metadataForKey => $_getN(5);
  @$pb.TagNumber(6)
  set metadataForKey(KeyMetadata value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasMetadataForKey() => $_has(5);
  @$pb.TagNumber(6)
  void clearMetadataForKey() => $_clearField(6);
  @$pb.TagNumber(6)
  KeyMetadata ensureMetadataForKey() => $_ensure(5);

  @$pb.TagNumber(7)
  PermissionChange get updateKeyAndPermissions => $_getN(6);
  @$pb.TagNumber(7)
  set updateKeyAndPermissions(PermissionChange value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasUpdateKeyAndPermissions() => $_has(6);
  @$pb.TagNumber(7)
  void clearUpdateKeyAndPermissions() => $_clearField(7);
  @$pb.TagNumber(7)
  PermissionChange ensureUpdateKeyAndPermissions() => $_ensure(6);

  @$pb.TagNumber(8)
  PermissionChange get addImpermanentKey => $_getN(7);
  @$pb.TagNumber(8)
  set addImpermanentKey(PermissionChange value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasAddImpermanentKey() => $_has(7);
  @$pb.TagNumber(8)
  void clearAddImpermanentKey() => $_clearField(8);
  @$pb.TagNumber(8)
  PermissionChange ensureAddImpermanentKey() => $_ensure(7);

  @$pb.TagNumber(9)
  PermissionChange get addImpermanentKeyAndRemoveExisting => $_getN(8);
  @$pb.TagNumber(9)
  set addImpermanentKeyAndRemoveExisting(PermissionChange value) =>
      $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasAddImpermanentKeyAndRemoveExisting() => $_has(8);
  @$pb.TagNumber(9)
  void clearAddImpermanentKeyAndRemoveExisting() => $_clearField(9);
  @$pb.TagNumber(9)
  PermissionChange ensureAddImpermanentKeyAndRemoveExisting() => $_ensure(8);

  @$pb.TagNumber(16)
  $core.bool get removeAllImpermanentKeys => $_getBF(9);
  @$pb.TagNumber(16)
  set removeAllImpermanentKeys($core.bool value) => $_setBool(9, value);
  @$pb.TagNumber(16)
  $core.bool hasRemoveAllImpermanentKeys() => $_has(9);
  @$pb.TagNumber(16)
  void clearRemoveAllImpermanentKeys() => $_clearField(16);

  @$pb.TagNumber(17)
  ReplaceKey get replaceKey => $_getN(10);
  @$pb.TagNumber(17)
  set replaceKey(ReplaceKey value) => $_setField(17, value);
  @$pb.TagNumber(17)
  $core.bool hasReplaceKey() => $_has(10);
  @$pb.TagNumber(17)
  void clearReplaceKey() => $_clearField(17);
  @$pb.TagNumber(17)
  ReplaceKey ensureReplaceKey() => $_ensure(10);
}

class WhitelistOperation_status extends $pb.GeneratedMessage {
  factory WhitelistOperation_status({
    WhitelistOperation_information_E? whitelistOperationInformation,
    KeyIdentifier? signerOfOperation,
    OperationStatus_E? operationStatus,
  }) {
    final result = create();
    if (whitelistOperationInformation != null)
      result.whitelistOperationInformation = whitelistOperationInformation;
    if (signerOfOperation != null) result.signerOfOperation = signerOfOperation;
    if (operationStatus != null) result.operationStatus = operationStatus;
    return result;
  }

  WhitelistOperation_status._();

  factory WhitelistOperation_status.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WhitelistOperation_status.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WhitelistOperation_status',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VCSEC'),
      createEmptyInstance: create)
    ..aE<WhitelistOperation_information_E>(
        1, _omitFieldNames ? '' : 'whitelistOperationInformation',
        protoName: 'whitelistOperationInformation',
        enumValues: WhitelistOperation_information_E.values)
    ..aOM<KeyIdentifier>(2, _omitFieldNames ? '' : 'signerOfOperation',
        protoName: 'signerOfOperation', subBuilder: KeyIdentifier.create)
    ..aE<OperationStatus_E>(3, _omitFieldNames ? '' : 'operationStatus',
        protoName: 'operationStatus', enumValues: OperationStatus_E.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WhitelistOperation_status clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WhitelistOperation_status copyWith(
          void Function(WhitelistOperation_status) updates) =>
      super.copyWith((message) => updates(message as WhitelistOperation_status))
          as WhitelistOperation_status;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WhitelistOperation_status create() => WhitelistOperation_status._();
  @$core.override
  WhitelistOperation_status createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WhitelistOperation_status getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WhitelistOperation_status>(create);
  static WhitelistOperation_status? _defaultInstance;

  @$pb.TagNumber(1)
  WhitelistOperation_information_E get whitelistOperationInformation =>
      $_getN(0);
  @$pb.TagNumber(1)
  set whitelistOperationInformation(WhitelistOperation_information_E value) =>
      $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasWhitelistOperationInformation() => $_has(0);
  @$pb.TagNumber(1)
  void clearWhitelistOperationInformation() => $_clearField(1);

  @$pb.TagNumber(2)
  KeyIdentifier get signerOfOperation => $_getN(1);
  @$pb.TagNumber(2)
  set signerOfOperation(KeyIdentifier value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasSignerOfOperation() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignerOfOperation() => $_clearField(2);
  @$pb.TagNumber(2)
  KeyIdentifier ensureSignerOfOperation() => $_ensure(1);

  @$pb.TagNumber(3)
  OperationStatus_E get operationStatus => $_getN(2);
  @$pb.TagNumber(3)
  set operationStatus(OperationStatus_E value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasOperationStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearOperationStatus() => $_clearField(3);
}

class SignedMessage_status extends $pb.GeneratedMessage {
  factory SignedMessage_status({
    $core.int? counter,
    SignedMessage_information_E? signedMessageInformation,
  }) {
    final result = create();
    if (counter != null) result.counter = counter;
    if (signedMessageInformation != null)
      result.signedMessageInformation = signedMessageInformation;
    return result;
  }

  SignedMessage_status._();

  factory SignedMessage_status.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SignedMessage_status.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SignedMessage_status',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VCSEC'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'counter', fieldType: $pb.PbFieldType.OU3)
    ..aE<SignedMessage_information_E>(
        2, _omitFieldNames ? '' : 'signedMessageInformation',
        protoName: 'signedMessageInformation',
        enumValues: SignedMessage_information_E.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SignedMessage_status clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SignedMessage_status copyWith(void Function(SignedMessage_status) updates) =>
      super.copyWith((message) => updates(message as SignedMessage_status))
          as SignedMessage_status;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SignedMessage_status create() => SignedMessage_status._();
  @$core.override
  SignedMessage_status createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SignedMessage_status getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SignedMessage_status>(create);
  static SignedMessage_status? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get counter => $_getIZ(0);
  @$pb.TagNumber(1)
  set counter($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCounter() => $_has(0);
  @$pb.TagNumber(1)
  void clearCounter() => $_clearField(1);

  @$pb.TagNumber(2)
  SignedMessage_information_E get signedMessageInformation => $_getN(1);
  @$pb.TagNumber(2)
  set signedMessageInformation(SignedMessage_information_E value) =>
      $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasSignedMessageInformation() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignedMessageInformation() => $_clearField(2);
}

enum CommandStatus_SubMessage {
  signedMessageStatus,
  whitelistOperationStatus,
  notSet
}

class CommandStatus extends $pb.GeneratedMessage {
  factory CommandStatus({
    OperationStatus_E? operationStatus,
    SignedMessage_status? signedMessageStatus,
    WhitelistOperation_status? whitelistOperationStatus,
  }) {
    final result = create();
    if (operationStatus != null) result.operationStatus = operationStatus;
    if (signedMessageStatus != null)
      result.signedMessageStatus = signedMessageStatus;
    if (whitelistOperationStatus != null)
      result.whitelistOperationStatus = whitelistOperationStatus;
    return result;
  }

  CommandStatus._();

  factory CommandStatus.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CommandStatus.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, CommandStatus_SubMessage>
      _CommandStatus_SubMessageByTag = {
    2: CommandStatus_SubMessage.signedMessageStatus,
    3: CommandStatus_SubMessage.whitelistOperationStatus,
    0: CommandStatus_SubMessage.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CommandStatus',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VCSEC'),
      createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..aE<OperationStatus_E>(1, _omitFieldNames ? '' : 'operationStatus',
        protoName: 'operationStatus', enumValues: OperationStatus_E.values)
    ..aOM<SignedMessage_status>(2, _omitFieldNames ? '' : 'signedMessageStatus',
        protoName: 'signedMessageStatus',
        subBuilder: SignedMessage_status.create)
    ..aOM<WhitelistOperation_status>(
        3, _omitFieldNames ? '' : 'whitelistOperationStatus',
        protoName: 'whitelistOperationStatus',
        subBuilder: WhitelistOperation_status.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CommandStatus clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CommandStatus copyWith(void Function(CommandStatus) updates) =>
      super.copyWith((message) => updates(message as CommandStatus))
          as CommandStatus;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CommandStatus create() => CommandStatus._();
  @$core.override
  CommandStatus createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CommandStatus getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CommandStatus>(create);
  static CommandStatus? _defaultInstance;

  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  CommandStatus_SubMessage whichSubMessage() =>
      _CommandStatus_SubMessageByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  void clearSubMessage() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  OperationStatus_E get operationStatus => $_getN(0);
  @$pb.TagNumber(1)
  set operationStatus(OperationStatus_E value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasOperationStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearOperationStatus() => $_clearField(1);

  @$pb.TagNumber(2)
  SignedMessage_status get signedMessageStatus => $_getN(1);
  @$pb.TagNumber(2)
  set signedMessageStatus(SignedMessage_status value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasSignedMessageStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignedMessageStatus() => $_clearField(2);
  @$pb.TagNumber(2)
  SignedMessage_status ensureSignedMessageStatus() => $_ensure(1);

  @$pb.TagNumber(3)
  WhitelistOperation_status get whitelistOperationStatus => $_getN(2);
  @$pb.TagNumber(3)
  set whitelistOperationStatus(WhitelistOperation_status value) =>
      $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasWhitelistOperationStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearWhitelistOperationStatus() => $_clearField(3);
  @$pb.TagNumber(3)
  WhitelistOperation_status ensureWhitelistOperationStatus() => $_ensure(2);
}

enum UnsignedMessage_SubMessage {
  informationRequest,
  rKEAction,
  closureMoveRequest,
  whitelistOperation,
  notSet
}

class UnsignedMessage extends $pb.GeneratedMessage {
  factory UnsignedMessage({
    InformationRequest? informationRequest,
    RKEAction_E? rKEAction,
    ClosureMoveRequest? closureMoveRequest,
    WhitelistOperation? whitelistOperation,
  }) {
    final result = create();
    if (informationRequest != null)
      result.informationRequest = informationRequest;
    if (rKEAction != null) result.rKEAction = rKEAction;
    if (closureMoveRequest != null)
      result.closureMoveRequest = closureMoveRequest;
    if (whitelistOperation != null)
      result.whitelistOperation = whitelistOperation;
    return result;
  }

  UnsignedMessage._();

  factory UnsignedMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UnsignedMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, UnsignedMessage_SubMessage>
      _UnsignedMessage_SubMessageByTag = {
    1: UnsignedMessage_SubMessage.informationRequest,
    2: UnsignedMessage_SubMessage.rKEAction,
    4: UnsignedMessage_SubMessage.closureMoveRequest,
    16: UnsignedMessage_SubMessage.whitelistOperation,
    0: UnsignedMessage_SubMessage.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UnsignedMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VCSEC'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 4, 16])
    ..aOM<InformationRequest>(1, _omitFieldNames ? '' : 'InformationRequest',
        protoName: 'InformationRequest', subBuilder: InformationRequest.create)
    ..aE<RKEAction_E>(2, _omitFieldNames ? '' : 'RKEAction',
        protoName: 'RKEAction', enumValues: RKEAction_E.values)
    ..aOM<ClosureMoveRequest>(4, _omitFieldNames ? '' : 'closureMoveRequest',
        protoName: 'closureMoveRequest', subBuilder: ClosureMoveRequest.create)
    ..aOM<WhitelistOperation>(16, _omitFieldNames ? '' : 'WhitelistOperation',
        protoName: 'WhitelistOperation', subBuilder: WhitelistOperation.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UnsignedMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UnsignedMessage copyWith(void Function(UnsignedMessage) updates) =>
      super.copyWith((message) => updates(message as UnsignedMessage))
          as UnsignedMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UnsignedMessage create() => UnsignedMessage._();
  @$core.override
  UnsignedMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UnsignedMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnsignedMessage>(create);
  static UnsignedMessage? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(4)
  @$pb.TagNumber(16)
  UnsignedMessage_SubMessage whichSubMessage() =>
      _UnsignedMessage_SubMessageByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(4)
  @$pb.TagNumber(16)
  void clearSubMessage() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  InformationRequest get informationRequest => $_getN(0);
  @$pb.TagNumber(1)
  set informationRequest(InformationRequest value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasInformationRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearInformationRequest() => $_clearField(1);
  @$pb.TagNumber(1)
  InformationRequest ensureInformationRequest() => $_ensure(0);

  @$pb.TagNumber(2)
  RKEAction_E get rKEAction => $_getN(1);
  @$pb.TagNumber(2)
  set rKEAction(RKEAction_E value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasRKEAction() => $_has(1);
  @$pb.TagNumber(2)
  void clearRKEAction() => $_clearField(2);

  @$pb.TagNumber(4)
  ClosureMoveRequest get closureMoveRequest => $_getN(2);
  @$pb.TagNumber(4)
  set closureMoveRequest(ClosureMoveRequest value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasClosureMoveRequest() => $_has(2);
  @$pb.TagNumber(4)
  void clearClosureMoveRequest() => $_clearField(4);
  @$pb.TagNumber(4)
  ClosureMoveRequest ensureClosureMoveRequest() => $_ensure(2);

  @$pb.TagNumber(16)
  WhitelistOperation get whitelistOperation => $_getN(3);
  @$pb.TagNumber(16)
  set whitelistOperation(WhitelistOperation value) => $_setField(16, value);
  @$pb.TagNumber(16)
  $core.bool hasWhitelistOperation() => $_has(3);
  @$pb.TagNumber(16)
  void clearWhitelistOperation() => $_clearField(16);
  @$pb.TagNumber(16)
  WhitelistOperation ensureWhitelistOperation() => $_ensure(3);
}

class ClosureStatuses extends $pb.GeneratedMessage {
  factory ClosureStatuses({
    ClosureState_E? frontDriverDoor,
    ClosureState_E? frontPassengerDoor,
    ClosureState_E? rearDriverDoor,
    ClosureState_E? rearPassengerDoor,
    ClosureState_E? rearTrunk,
    ClosureState_E? frontTrunk,
    ClosureState_E? chargePort,
    ClosureState_E? tonneau,
  }) {
    final result = create();
    if (frontDriverDoor != null) result.frontDriverDoor = frontDriverDoor;
    if (frontPassengerDoor != null)
      result.frontPassengerDoor = frontPassengerDoor;
    if (rearDriverDoor != null) result.rearDriverDoor = rearDriverDoor;
    if (rearPassengerDoor != null) result.rearPassengerDoor = rearPassengerDoor;
    if (rearTrunk != null) result.rearTrunk = rearTrunk;
    if (frontTrunk != null) result.frontTrunk = frontTrunk;
    if (chargePort != null) result.chargePort = chargePort;
    if (tonneau != null) result.tonneau = tonneau;
    return result;
  }

  ClosureStatuses._();

  factory ClosureStatuses.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ClosureStatuses.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClosureStatuses',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VCSEC'),
      createEmptyInstance: create)
    ..aE<ClosureState_E>(1, _omitFieldNames ? '' : 'frontDriverDoor',
        protoName: 'frontDriverDoor', enumValues: ClosureState_E.values)
    ..aE<ClosureState_E>(2, _omitFieldNames ? '' : 'frontPassengerDoor',
        protoName: 'frontPassengerDoor', enumValues: ClosureState_E.values)
    ..aE<ClosureState_E>(3, _omitFieldNames ? '' : 'rearDriverDoor',
        protoName: 'rearDriverDoor', enumValues: ClosureState_E.values)
    ..aE<ClosureState_E>(4, _omitFieldNames ? '' : 'rearPassengerDoor',
        protoName: 'rearPassengerDoor', enumValues: ClosureState_E.values)
    ..aE<ClosureState_E>(5, _omitFieldNames ? '' : 'rearTrunk',
        protoName: 'rearTrunk', enumValues: ClosureState_E.values)
    ..aE<ClosureState_E>(6, _omitFieldNames ? '' : 'frontTrunk',
        protoName: 'frontTrunk', enumValues: ClosureState_E.values)
    ..aE<ClosureState_E>(7, _omitFieldNames ? '' : 'chargePort',
        protoName: 'chargePort', enumValues: ClosureState_E.values)
    ..aE<ClosureState_E>(8, _omitFieldNames ? '' : 'tonneau',
        enumValues: ClosureState_E.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClosureStatuses clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClosureStatuses copyWith(void Function(ClosureStatuses) updates) =>
      super.copyWith((message) => updates(message as ClosureStatuses))
          as ClosureStatuses;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClosureStatuses create() => ClosureStatuses._();
  @$core.override
  ClosureStatuses createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ClosureStatuses getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClosureStatuses>(create);
  static ClosureStatuses? _defaultInstance;

  @$pb.TagNumber(1)
  ClosureState_E get frontDriverDoor => $_getN(0);
  @$pb.TagNumber(1)
  set frontDriverDoor(ClosureState_E value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasFrontDriverDoor() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrontDriverDoor() => $_clearField(1);

  @$pb.TagNumber(2)
  ClosureState_E get frontPassengerDoor => $_getN(1);
  @$pb.TagNumber(2)
  set frontPassengerDoor(ClosureState_E value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasFrontPassengerDoor() => $_has(1);
  @$pb.TagNumber(2)
  void clearFrontPassengerDoor() => $_clearField(2);

  @$pb.TagNumber(3)
  ClosureState_E get rearDriverDoor => $_getN(2);
  @$pb.TagNumber(3)
  set rearDriverDoor(ClosureState_E value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasRearDriverDoor() => $_has(2);
  @$pb.TagNumber(3)
  void clearRearDriverDoor() => $_clearField(3);

  @$pb.TagNumber(4)
  ClosureState_E get rearPassengerDoor => $_getN(3);
  @$pb.TagNumber(4)
  set rearPassengerDoor(ClosureState_E value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasRearPassengerDoor() => $_has(3);
  @$pb.TagNumber(4)
  void clearRearPassengerDoor() => $_clearField(4);

  @$pb.TagNumber(5)
  ClosureState_E get rearTrunk => $_getN(4);
  @$pb.TagNumber(5)
  set rearTrunk(ClosureState_E value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasRearTrunk() => $_has(4);
  @$pb.TagNumber(5)
  void clearRearTrunk() => $_clearField(5);

  @$pb.TagNumber(6)
  ClosureState_E get frontTrunk => $_getN(5);
  @$pb.TagNumber(6)
  set frontTrunk(ClosureState_E value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasFrontTrunk() => $_has(5);
  @$pb.TagNumber(6)
  void clearFrontTrunk() => $_clearField(6);

  @$pb.TagNumber(7)
  ClosureState_E get chargePort => $_getN(6);
  @$pb.TagNumber(7)
  set chargePort(ClosureState_E value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasChargePort() => $_has(6);
  @$pb.TagNumber(7)
  void clearChargePort() => $_clearField(7);

  @$pb.TagNumber(8)
  ClosureState_E get tonneau => $_getN(7);
  @$pb.TagNumber(8)
  set tonneau(ClosureState_E value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasTonneau() => $_has(7);
  @$pb.TagNumber(8)
  void clearTonneau() => $_clearField(8);
}

class DetailedClosureStatus extends $pb.GeneratedMessage {
  factory DetailedClosureStatus({
    $core.int? tonneauPercentOpen,
  }) {
    final result = create();
    if (tonneauPercentOpen != null)
      result.tonneauPercentOpen = tonneauPercentOpen;
    return result;
  }

  DetailedClosureStatus._();

  factory DetailedClosureStatus.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DetailedClosureStatus.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DetailedClosureStatus',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VCSEC'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'tonneauPercentOpen',
        protoName: 'tonneauPercentOpen', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DetailedClosureStatus clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DetailedClosureStatus copyWith(
          void Function(DetailedClosureStatus) updates) =>
      super.copyWith((message) => updates(message as DetailedClosureStatus))
          as DetailedClosureStatus;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DetailedClosureStatus create() => DetailedClosureStatus._();
  @$core.override
  DetailedClosureStatus createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DetailedClosureStatus getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DetailedClosureStatus>(create);
  static DetailedClosureStatus? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get tonneauPercentOpen => $_getIZ(0);
  @$pb.TagNumber(1)
  set tonneauPercentOpen($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTonneauPercentOpen() => $_has(0);
  @$pb.TagNumber(1)
  void clearTonneauPercentOpen() => $_clearField(1);
}

class VehicleStatus extends $pb.GeneratedMessage {
  factory VehicleStatus({
    ClosureStatuses? closureStatuses,
    VehicleLockState_E? vehicleLockState,
    VehicleSleepStatus_E? vehicleSleepStatus,
    UserPresence_E? userPresence,
    DetailedClosureStatus? detailedClosureStatus,
  }) {
    final result = create();
    if (closureStatuses != null) result.closureStatuses = closureStatuses;
    if (vehicleLockState != null) result.vehicleLockState = vehicleLockState;
    if (vehicleSleepStatus != null)
      result.vehicleSleepStatus = vehicleSleepStatus;
    if (userPresence != null) result.userPresence = userPresence;
    if (detailedClosureStatus != null)
      result.detailedClosureStatus = detailedClosureStatus;
    return result;
  }

  VehicleStatus._();

  factory VehicleStatus.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VehicleStatus.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VehicleStatus',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VCSEC'),
      createEmptyInstance: create)
    ..aOM<ClosureStatuses>(1, _omitFieldNames ? '' : 'closureStatuses',
        protoName: 'closureStatuses', subBuilder: ClosureStatuses.create)
    ..aE<VehicleLockState_E>(2, _omitFieldNames ? '' : 'vehicleLockState',
        protoName: 'vehicleLockState', enumValues: VehicleLockState_E.values)
    ..aE<VehicleSleepStatus_E>(3, _omitFieldNames ? '' : 'vehicleSleepStatus',
        protoName: 'vehicleSleepStatus',
        enumValues: VehicleSleepStatus_E.values)
    ..aE<UserPresence_E>(4, _omitFieldNames ? '' : 'userPresence',
        protoName: 'userPresence', enumValues: UserPresence_E.values)
    ..aOM<DetailedClosureStatus>(
        5, _omitFieldNames ? '' : 'detailedClosureStatus',
        protoName: 'detailedClosureStatus',
        subBuilder: DetailedClosureStatus.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VehicleStatus clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VehicleStatus copyWith(void Function(VehicleStatus) updates) =>
      super.copyWith((message) => updates(message as VehicleStatus))
          as VehicleStatus;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VehicleStatus create() => VehicleStatus._();
  @$core.override
  VehicleStatus createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VehicleStatus getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VehicleStatus>(create);
  static VehicleStatus? _defaultInstance;

  @$pb.TagNumber(1)
  ClosureStatuses get closureStatuses => $_getN(0);
  @$pb.TagNumber(1)
  set closureStatuses(ClosureStatuses value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasClosureStatuses() => $_has(0);
  @$pb.TagNumber(1)
  void clearClosureStatuses() => $_clearField(1);
  @$pb.TagNumber(1)
  ClosureStatuses ensureClosureStatuses() => $_ensure(0);

  @$pb.TagNumber(2)
  VehicleLockState_E get vehicleLockState => $_getN(1);
  @$pb.TagNumber(2)
  set vehicleLockState(VehicleLockState_E value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasVehicleLockState() => $_has(1);
  @$pb.TagNumber(2)
  void clearVehicleLockState() => $_clearField(2);

  @$pb.TagNumber(3)
  VehicleSleepStatus_E get vehicleSleepStatus => $_getN(2);
  @$pb.TagNumber(3)
  set vehicleSleepStatus(VehicleSleepStatus_E value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasVehicleSleepStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearVehicleSleepStatus() => $_clearField(3);

  @$pb.TagNumber(4)
  UserPresence_E get userPresence => $_getN(3);
  @$pb.TagNumber(4)
  set userPresence(UserPresence_E value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasUserPresence() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserPresence() => $_clearField(4);

  @$pb.TagNumber(5)
  DetailedClosureStatus get detailedClosureStatus => $_getN(4);
  @$pb.TagNumber(5)
  set detailedClosureStatus(DetailedClosureStatus value) =>
      $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasDetailedClosureStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearDetailedClosureStatus() => $_clearField(5);
  @$pb.TagNumber(5)
  DetailedClosureStatus ensureDetailedClosureStatus() => $_ensure(4);
}

enum FromVCSECMessage_SubMessage {
  vehicleStatus,
  commandStatus,
  whitelistInfo,
  whitelistEntryInfo,
  nominalError,
  notSet
}

class FromVCSECMessage extends $pb.GeneratedMessage {
  factory FromVCSECMessage({
    VehicleStatus? vehicleStatus,
    CommandStatus? commandStatus,
    WhitelistInfo? whitelistInfo,
    WhitelistEntryInfo? whitelistEntryInfo,
    $0.NominalError? nominalError,
  }) {
    final result = create();
    if (vehicleStatus != null) result.vehicleStatus = vehicleStatus;
    if (commandStatus != null) result.commandStatus = commandStatus;
    if (whitelistInfo != null) result.whitelistInfo = whitelistInfo;
    if (whitelistEntryInfo != null)
      result.whitelistEntryInfo = whitelistEntryInfo;
    if (nominalError != null) result.nominalError = nominalError;
    return result;
  }

  FromVCSECMessage._();

  factory FromVCSECMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FromVCSECMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, FromVCSECMessage_SubMessage>
      _FromVCSECMessage_SubMessageByTag = {
    1: FromVCSECMessage_SubMessage.vehicleStatus,
    4: FromVCSECMessage_SubMessage.commandStatus,
    16: FromVCSECMessage_SubMessage.whitelistInfo,
    17: FromVCSECMessage_SubMessage.whitelistEntryInfo,
    46: FromVCSECMessage_SubMessage.nominalError,
    0: FromVCSECMessage_SubMessage.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FromVCSECMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'VCSEC'),
      createEmptyInstance: create)
    ..oo(0, [1, 4, 16, 17, 46])
    ..aOM<VehicleStatus>(1, _omitFieldNames ? '' : 'vehicleStatus',
        protoName: 'vehicleStatus', subBuilder: VehicleStatus.create)
    ..aOM<CommandStatus>(4, _omitFieldNames ? '' : 'commandStatus',
        protoName: 'commandStatus', subBuilder: CommandStatus.create)
    ..aOM<WhitelistInfo>(16, _omitFieldNames ? '' : 'whitelistInfo',
        protoName: 'whitelistInfo', subBuilder: WhitelistInfo.create)
    ..aOM<WhitelistEntryInfo>(17, _omitFieldNames ? '' : 'whitelistEntryInfo',
        protoName: 'whitelistEntryInfo', subBuilder: WhitelistEntryInfo.create)
    ..aOM<$0.NominalError>(46, _omitFieldNames ? '' : 'nominalError',
        protoName: 'nominalError', subBuilder: $0.NominalError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FromVCSECMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FromVCSECMessage copyWith(void Function(FromVCSECMessage) updates) =>
      super.copyWith((message) => updates(message as FromVCSECMessage))
          as FromVCSECMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FromVCSECMessage create() => FromVCSECMessage._();
  @$core.override
  FromVCSECMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FromVCSECMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FromVCSECMessage>(create);
  static FromVCSECMessage? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(4)
  @$pb.TagNumber(16)
  @$pb.TagNumber(17)
  @$pb.TagNumber(46)
  FromVCSECMessage_SubMessage whichSubMessage() =>
      _FromVCSECMessage_SubMessageByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(4)
  @$pb.TagNumber(16)
  @$pb.TagNumber(17)
  @$pb.TagNumber(46)
  void clearSubMessage() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  VehicleStatus get vehicleStatus => $_getN(0);
  @$pb.TagNumber(1)
  set vehicleStatus(VehicleStatus value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasVehicleStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearVehicleStatus() => $_clearField(1);
  @$pb.TagNumber(1)
  VehicleStatus ensureVehicleStatus() => $_ensure(0);

  @$pb.TagNumber(4)
  CommandStatus get commandStatus => $_getN(1);
  @$pb.TagNumber(4)
  set commandStatus(CommandStatus value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasCommandStatus() => $_has(1);
  @$pb.TagNumber(4)
  void clearCommandStatus() => $_clearField(4);
  @$pb.TagNumber(4)
  CommandStatus ensureCommandStatus() => $_ensure(1);

  @$pb.TagNumber(16)
  WhitelistInfo get whitelistInfo => $_getN(2);
  @$pb.TagNumber(16)
  set whitelistInfo(WhitelistInfo value) => $_setField(16, value);
  @$pb.TagNumber(16)
  $core.bool hasWhitelistInfo() => $_has(2);
  @$pb.TagNumber(16)
  void clearWhitelistInfo() => $_clearField(16);
  @$pb.TagNumber(16)
  WhitelistInfo ensureWhitelistInfo() => $_ensure(2);

  @$pb.TagNumber(17)
  WhitelistEntryInfo get whitelistEntryInfo => $_getN(3);
  @$pb.TagNumber(17)
  set whitelistEntryInfo(WhitelistEntryInfo value) => $_setField(17, value);
  @$pb.TagNumber(17)
  $core.bool hasWhitelistEntryInfo() => $_has(3);
  @$pb.TagNumber(17)
  void clearWhitelistEntryInfo() => $_clearField(17);
  @$pb.TagNumber(17)
  WhitelistEntryInfo ensureWhitelistEntryInfo() => $_ensure(3);

  @$pb.TagNumber(46)
  $0.NominalError get nominalError => $_getN(4);
  @$pb.TagNumber(46)
  set nominalError($0.NominalError value) => $_setField(46, value);
  @$pb.TagNumber(46)
  $core.bool hasNominalError() => $_has(4);
  @$pb.TagNumber(46)
  void clearNominalError() => $_clearField(46);
  @$pb.TagNumber(46)
  $0.NominalError ensureNominalError() => $_ensure(4);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

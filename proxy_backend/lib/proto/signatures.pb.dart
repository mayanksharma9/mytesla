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

import 'signatures.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'signatures.pbenum.dart';

enum KeyIdentity_IdentityType { publicKey, handle, notSet }

class KeyIdentity extends $pb.GeneratedMessage {
  factory KeyIdentity({
    $core.List<$core.int>? publicKey,
    $core.int? handle,
  }) {
    final result = create();
    if (publicKey != null) result.publicKey = publicKey;
    if (handle != null) result.handle = handle;
    return result;
  }

  KeyIdentity._();

  factory KeyIdentity.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory KeyIdentity.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, KeyIdentity_IdentityType>
      _KeyIdentity_IdentityTypeByTag = {
    1: KeyIdentity_IdentityType.publicKey,
    3: KeyIdentity_IdentityType.handle,
    0: KeyIdentity_IdentityType.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'KeyIdentity',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Signatures'),
      createEmptyInstance: create)
    ..oo(0, [1, 3])
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'publicKey', $pb.PbFieldType.OY)
    ..aI(3, _omitFieldNames ? '' : 'handle', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KeyIdentity clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KeyIdentity copyWith(void Function(KeyIdentity) updates) =>
      super.copyWith((message) => updates(message as KeyIdentity))
          as KeyIdentity;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static KeyIdentity create() => KeyIdentity._();
  @$core.override
  KeyIdentity createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static KeyIdentity getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KeyIdentity>(create);
  static KeyIdentity? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(3)
  KeyIdentity_IdentityType whichIdentityType() =>
      _KeyIdentity_IdentityTypeByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(3)
  void clearIdentityType() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.List<$core.int> get publicKey => $_getN(0);
  @$pb.TagNumber(1)
  set publicKey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPublicKey() => $_clearField(1);

  @$pb.TagNumber(3)
  $core.int get handle => $_getIZ(1);
  @$pb.TagNumber(3)
  set handle($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(3)
  $core.bool hasHandle() => $_has(1);
  @$pb.TagNumber(3)
  void clearHandle() => $_clearField(3);
}

class AES_GCM_Personalized_Signature_Data extends $pb.GeneratedMessage {
  factory AES_GCM_Personalized_Signature_Data({
    $core.List<$core.int>? epoch,
    $core.List<$core.int>? nonce,
    $core.int? counter,
    $core.int? expiresAt,
    $core.List<$core.int>? tag,
  }) {
    final result = create();
    if (epoch != null) result.epoch = epoch;
    if (nonce != null) result.nonce = nonce;
    if (counter != null) result.counter = counter;
    if (expiresAt != null) result.expiresAt = expiresAt;
    if (tag != null) result.tag = tag;
    return result;
  }

  AES_GCM_Personalized_Signature_Data._();

  factory AES_GCM_Personalized_Signature_Data.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AES_GCM_Personalized_Signature_Data.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AES_GCM_Personalized_Signature_Data',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Signatures'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'epoch', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'nonce', $pb.PbFieldType.OY)
    ..aI(3, _omitFieldNames ? '' : 'counter', fieldType: $pb.PbFieldType.OU3)
    ..aI(4, _omitFieldNames ? '' : 'expiresAt', fieldType: $pb.PbFieldType.OF3)
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'tag', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AES_GCM_Personalized_Signature_Data clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AES_GCM_Personalized_Signature_Data copyWith(
          void Function(AES_GCM_Personalized_Signature_Data) updates) =>
      super.copyWith((message) =>
              updates(message as AES_GCM_Personalized_Signature_Data))
          as AES_GCM_Personalized_Signature_Data;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AES_GCM_Personalized_Signature_Data create() =>
      AES_GCM_Personalized_Signature_Data._();
  @$core.override
  AES_GCM_Personalized_Signature_Data createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AES_GCM_Personalized_Signature_Data getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          AES_GCM_Personalized_Signature_Data>(create);
  static AES_GCM_Personalized_Signature_Data? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get epoch => $_getN(0);
  @$pb.TagNumber(1)
  set epoch($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEpoch() => $_has(0);
  @$pb.TagNumber(1)
  void clearEpoch() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get nonce => $_getN(1);
  @$pb.TagNumber(2)
  set nonce($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNonce() => $_has(1);
  @$pb.TagNumber(2)
  void clearNonce() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get counter => $_getIZ(2);
  @$pb.TagNumber(3)
  set counter($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCounter() => $_has(2);
  @$pb.TagNumber(3)
  void clearCounter() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get expiresAt => $_getIZ(3);
  @$pb.TagNumber(4)
  set expiresAt($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasExpiresAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearExpiresAt() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get tag => $_getN(4);
  @$pb.TagNumber(5)
  set tag($core.List<$core.int> value) => $_setBytes(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTag() => $_has(4);
  @$pb.TagNumber(5)
  void clearTag() => $_clearField(5);
}

class AES_GCM_Response_Signature_Data extends $pb.GeneratedMessage {
  factory AES_GCM_Response_Signature_Data({
    $core.List<$core.int>? nonce,
    $core.int? counter,
    $core.List<$core.int>? tag,
  }) {
    final result = create();
    if (nonce != null) result.nonce = nonce;
    if (counter != null) result.counter = counter;
    if (tag != null) result.tag = tag;
    return result;
  }

  AES_GCM_Response_Signature_Data._();

  factory AES_GCM_Response_Signature_Data.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AES_GCM_Response_Signature_Data.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AES_GCM_Response_Signature_Data',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Signatures'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'nonce', $pb.PbFieldType.OY)
    ..aI(2, _omitFieldNames ? '' : 'counter', fieldType: $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'tag', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AES_GCM_Response_Signature_Data clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AES_GCM_Response_Signature_Data copyWith(
          void Function(AES_GCM_Response_Signature_Data) updates) =>
      super.copyWith(
              (message) => updates(message as AES_GCM_Response_Signature_Data))
          as AES_GCM_Response_Signature_Data;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AES_GCM_Response_Signature_Data create() =>
      AES_GCM_Response_Signature_Data._();
  @$core.override
  AES_GCM_Response_Signature_Data createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AES_GCM_Response_Signature_Data getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AES_GCM_Response_Signature_Data>(
          create);
  static AES_GCM_Response_Signature_Data? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get nonce => $_getN(0);
  @$pb.TagNumber(1)
  set nonce($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNonce() => $_has(0);
  @$pb.TagNumber(1)
  void clearNonce() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get counter => $_getIZ(1);
  @$pb.TagNumber(2)
  set counter($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCounter() => $_has(1);
  @$pb.TagNumber(2)
  void clearCounter() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get tag => $_getN(2);
  @$pb.TagNumber(3)
  set tag($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTag() => $_has(2);
  @$pb.TagNumber(3)
  void clearTag() => $_clearField(3);
}

class HMAC_Signature_Data extends $pb.GeneratedMessage {
  factory HMAC_Signature_Data({
    $core.List<$core.int>? tag,
  }) {
    final result = create();
    if (tag != null) result.tag = tag;
    return result;
  }

  HMAC_Signature_Data._();

  factory HMAC_Signature_Data.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HMAC_Signature_Data.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HMAC_Signature_Data',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Signatures'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'tag', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HMAC_Signature_Data clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HMAC_Signature_Data copyWith(void Function(HMAC_Signature_Data) updates) =>
      super.copyWith((message) => updates(message as HMAC_Signature_Data))
          as HMAC_Signature_Data;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HMAC_Signature_Data create() => HMAC_Signature_Data._();
  @$core.override
  HMAC_Signature_Data createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HMAC_Signature_Data getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HMAC_Signature_Data>(create);
  static HMAC_Signature_Data? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get tag => $_getN(0);
  @$pb.TagNumber(1)
  set tag($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTag() => $_has(0);
  @$pb.TagNumber(1)
  void clearTag() => $_clearField(1);
}

class HMAC_Personalized_Signature_Data extends $pb.GeneratedMessage {
  factory HMAC_Personalized_Signature_Data({
    $core.List<$core.int>? epoch,
    $core.int? counter,
    $core.int? expiresAt,
    $core.List<$core.int>? tag,
  }) {
    final result = create();
    if (epoch != null) result.epoch = epoch;
    if (counter != null) result.counter = counter;
    if (expiresAt != null) result.expiresAt = expiresAt;
    if (tag != null) result.tag = tag;
    return result;
  }

  HMAC_Personalized_Signature_Data._();

  factory HMAC_Personalized_Signature_Data.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HMAC_Personalized_Signature_Data.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HMAC_Personalized_Signature_Data',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Signatures'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'epoch', $pb.PbFieldType.OY)
    ..aI(2, _omitFieldNames ? '' : 'counter', fieldType: $pb.PbFieldType.OU3)
    ..aI(3, _omitFieldNames ? '' : 'expiresAt', fieldType: $pb.PbFieldType.OF3)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'tag', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HMAC_Personalized_Signature_Data clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HMAC_Personalized_Signature_Data copyWith(
          void Function(HMAC_Personalized_Signature_Data) updates) =>
      super.copyWith(
              (message) => updates(message as HMAC_Personalized_Signature_Data))
          as HMAC_Personalized_Signature_Data;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HMAC_Personalized_Signature_Data create() =>
      HMAC_Personalized_Signature_Data._();
  @$core.override
  HMAC_Personalized_Signature_Data createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HMAC_Personalized_Signature_Data getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HMAC_Personalized_Signature_Data>(
          create);
  static HMAC_Personalized_Signature_Data? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get epoch => $_getN(0);
  @$pb.TagNumber(1)
  set epoch($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEpoch() => $_has(0);
  @$pb.TagNumber(1)
  void clearEpoch() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get counter => $_getIZ(1);
  @$pb.TagNumber(2)
  set counter($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCounter() => $_has(1);
  @$pb.TagNumber(2)
  void clearCounter() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get expiresAt => $_getIZ(2);
  @$pb.TagNumber(3)
  set expiresAt($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasExpiresAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearExpiresAt() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get tag => $_getN(3);
  @$pb.TagNumber(4)
  set tag($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTag() => $_has(3);
  @$pb.TagNumber(4)
  void clearTag() => $_clearField(4);
}

enum SignatureData_SigType {
  aESGCMPersonalizedData,
  sessionInfoTag,
  hMACPersonalizedData,
  aESGCMResponseData,
  notSet
}

class SignatureData extends $pb.GeneratedMessage {
  factory SignatureData({
    KeyIdentity? signerIdentity,
    AES_GCM_Personalized_Signature_Data? aESGCMPersonalizedData,
    HMAC_Signature_Data? sessionInfoTag,
    HMAC_Personalized_Signature_Data? hMACPersonalizedData,
    AES_GCM_Response_Signature_Data? aESGCMResponseData,
  }) {
    final result = create();
    if (signerIdentity != null) result.signerIdentity = signerIdentity;
    if (aESGCMPersonalizedData != null)
      result.aESGCMPersonalizedData = aESGCMPersonalizedData;
    if (sessionInfoTag != null) result.sessionInfoTag = sessionInfoTag;
    if (hMACPersonalizedData != null)
      result.hMACPersonalizedData = hMACPersonalizedData;
    if (aESGCMResponseData != null)
      result.aESGCMResponseData = aESGCMResponseData;
    return result;
  }

  SignatureData._();

  factory SignatureData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SignatureData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, SignatureData_SigType>
      _SignatureData_SigTypeByTag = {
    5: SignatureData_SigType.aESGCMPersonalizedData,
    6: SignatureData_SigType.sessionInfoTag,
    8: SignatureData_SigType.hMACPersonalizedData,
    9: SignatureData_SigType.aESGCMResponseData,
    0: SignatureData_SigType.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SignatureData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Signatures'),
      createEmptyInstance: create)
    ..oo(0, [5, 6, 8, 9])
    ..aOM<KeyIdentity>(1, _omitFieldNames ? '' : 'signerIdentity',
        subBuilder: KeyIdentity.create)
    ..aOM<AES_GCM_Personalized_Signature_Data>(
        5, _omitFieldNames ? '' : 'AESGCMPersonalizedData',
        protoName: 'AES_GCM_Personalized_data',
        subBuilder: AES_GCM_Personalized_Signature_Data.create)
    ..aOM<HMAC_Signature_Data>(6, _omitFieldNames ? '' : 'sessionInfoTag',
        subBuilder: HMAC_Signature_Data.create)
    ..aOM<HMAC_Personalized_Signature_Data>(
        8, _omitFieldNames ? '' : 'HMACPersonalizedData',
        protoName: 'HMAC_Personalized_data',
        subBuilder: HMAC_Personalized_Signature_Data.create)
    ..aOM<AES_GCM_Response_Signature_Data>(
        9, _omitFieldNames ? '' : 'AESGCMResponseData',
        protoName: 'AES_GCM_Response_data',
        subBuilder: AES_GCM_Response_Signature_Data.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SignatureData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SignatureData copyWith(void Function(SignatureData) updates) =>
      super.copyWith((message) => updates(message as SignatureData))
          as SignatureData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SignatureData create() => SignatureData._();
  @$core.override
  SignatureData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SignatureData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SignatureData>(create);
  static SignatureData? _defaultInstance;

  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  SignatureData_SigType whichSigType() =>
      _SignatureData_SigTypeByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  void clearSigType() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  KeyIdentity get signerIdentity => $_getN(0);
  @$pb.TagNumber(1)
  set signerIdentity(KeyIdentity value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSignerIdentity() => $_has(0);
  @$pb.TagNumber(1)
  void clearSignerIdentity() => $_clearField(1);
  @$pb.TagNumber(1)
  KeyIdentity ensureSignerIdentity() => $_ensure(0);

  @$pb.TagNumber(5)
  AES_GCM_Personalized_Signature_Data get aESGCMPersonalizedData => $_getN(1);
  @$pb.TagNumber(5)
  set aESGCMPersonalizedData(AES_GCM_Personalized_Signature_Data value) =>
      $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasAESGCMPersonalizedData() => $_has(1);
  @$pb.TagNumber(5)
  void clearAESGCMPersonalizedData() => $_clearField(5);
  @$pb.TagNumber(5)
  AES_GCM_Personalized_Signature_Data ensureAESGCMPersonalizedData() =>
      $_ensure(1);

  @$pb.TagNumber(6)
  HMAC_Signature_Data get sessionInfoTag => $_getN(2);
  @$pb.TagNumber(6)
  set sessionInfoTag(HMAC_Signature_Data value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasSessionInfoTag() => $_has(2);
  @$pb.TagNumber(6)
  void clearSessionInfoTag() => $_clearField(6);
  @$pb.TagNumber(6)
  HMAC_Signature_Data ensureSessionInfoTag() => $_ensure(2);

  @$pb.TagNumber(8)
  HMAC_Personalized_Signature_Data get hMACPersonalizedData => $_getN(3);
  @$pb.TagNumber(8)
  set hMACPersonalizedData(HMAC_Personalized_Signature_Data value) =>
      $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasHMACPersonalizedData() => $_has(3);
  @$pb.TagNumber(8)
  void clearHMACPersonalizedData() => $_clearField(8);
  @$pb.TagNumber(8)
  HMAC_Personalized_Signature_Data ensureHMACPersonalizedData() => $_ensure(3);

  @$pb.TagNumber(9)
  AES_GCM_Response_Signature_Data get aESGCMResponseData => $_getN(4);
  @$pb.TagNumber(9)
  set aESGCMResponseData(AES_GCM_Response_Signature_Data value) =>
      $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasAESGCMResponseData() => $_has(4);
  @$pb.TagNumber(9)
  void clearAESGCMResponseData() => $_clearField(9);
  @$pb.TagNumber(9)
  AES_GCM_Response_Signature_Data ensureAESGCMResponseData() => $_ensure(4);
}

class GetSessionInfoRequest extends $pb.GeneratedMessage {
  factory GetSessionInfoRequest({
    KeyIdentity? keyIdentity,
  }) {
    final result = create();
    if (keyIdentity != null) result.keyIdentity = keyIdentity;
    return result;
  }

  GetSessionInfoRequest._();

  factory GetSessionInfoRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSessionInfoRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSessionInfoRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Signatures'),
      createEmptyInstance: create)
    ..aOM<KeyIdentity>(1, _omitFieldNames ? '' : 'keyIdentity',
        subBuilder: KeyIdentity.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSessionInfoRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSessionInfoRequest copyWith(
          void Function(GetSessionInfoRequest) updates) =>
      super.copyWith((message) => updates(message as GetSessionInfoRequest))
          as GetSessionInfoRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSessionInfoRequest create() => GetSessionInfoRequest._();
  @$core.override
  GetSessionInfoRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetSessionInfoRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSessionInfoRequest>(create);
  static GetSessionInfoRequest? _defaultInstance;

  @$pb.TagNumber(1)
  KeyIdentity get keyIdentity => $_getN(0);
  @$pb.TagNumber(1)
  set keyIdentity(KeyIdentity value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasKeyIdentity() => $_has(0);
  @$pb.TagNumber(1)
  void clearKeyIdentity() => $_clearField(1);
  @$pb.TagNumber(1)
  KeyIdentity ensureKeyIdentity() => $_ensure(0);
}

class SessionInfo extends $pb.GeneratedMessage {
  factory SessionInfo({
    $core.int? counter,
    $core.List<$core.int>? publicKey,
    $core.List<$core.int>? epoch,
    $core.int? clockTime,
    Session_Info_Status? status,
    $core.int? handle,
  }) {
    final result = create();
    if (counter != null) result.counter = counter;
    if (publicKey != null) result.publicKey = publicKey;
    if (epoch != null) result.epoch = epoch;
    if (clockTime != null) result.clockTime = clockTime;
    if (status != null) result.status = status;
    if (handle != null) result.handle = handle;
    return result;
  }

  SessionInfo._();

  factory SessionInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SessionInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SessionInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Signatures'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'counter', fieldType: $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'publicKey', $pb.PbFieldType.OY,
        protoName: 'publicKey')
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'epoch', $pb.PbFieldType.OY)
    ..aI(4, _omitFieldNames ? '' : 'clockTime', fieldType: $pb.PbFieldType.OF3)
    ..aE<Session_Info_Status>(5, _omitFieldNames ? '' : 'status',
        enumValues: Session_Info_Status.values)
    ..aI(6, _omitFieldNames ? '' : 'handle', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SessionInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SessionInfo copyWith(void Function(SessionInfo) updates) =>
      super.copyWith((message) => updates(message as SessionInfo))
          as SessionInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SessionInfo create() => SessionInfo._();
  @$core.override
  SessionInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SessionInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SessionInfo>(create);
  static SessionInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get counter => $_getIZ(0);
  @$pb.TagNumber(1)
  set counter($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCounter() => $_has(0);
  @$pb.TagNumber(1)
  void clearCounter() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get publicKey => $_getN(1);
  @$pb.TagNumber(2)
  set publicKey($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearPublicKey() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get epoch => $_getN(2);
  @$pb.TagNumber(3)
  set epoch($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasEpoch() => $_has(2);
  @$pb.TagNumber(3)
  void clearEpoch() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get clockTime => $_getIZ(3);
  @$pb.TagNumber(4)
  set clockTime($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasClockTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearClockTime() => $_clearField(4);

  @$pb.TagNumber(5)
  Session_Info_Status get status => $_getN(4);
  @$pb.TagNumber(5)
  set status(Session_Info_Status value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get handle => $_getIZ(5);
  @$pb.TagNumber(6)
  set handle($core.int value) => $_setUnsignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasHandle() => $_has(5);
  @$pb.TagNumber(6)
  void clearHandle() => $_clearField(6);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

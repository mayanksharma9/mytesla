// This is a generated file - do not edit.
//
// Generated from signatures.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use tagDescriptor instead')
const Tag$json = {
  '1': 'Tag',
  '2': [
    {'1': 'TAG_SIGNATURE_TYPE', '2': 0},
    {'1': 'TAG_DOMAIN', '2': 1},
    {'1': 'TAG_PERSONALIZATION', '2': 2},
    {'1': 'TAG_EPOCH', '2': 3},
    {'1': 'TAG_EXPIRES_AT', '2': 4},
    {'1': 'TAG_COUNTER', '2': 5},
    {'1': 'TAG_CHALLENGE', '2': 6},
    {'1': 'TAG_FLAGS', '2': 7},
    {'1': 'TAG_REQUEST_HASH', '2': 8},
    {'1': 'TAG_FAULT', '2': 9},
    {'1': 'TAG_END', '2': 255},
  ],
};

/// Descriptor for `Tag`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List tagDescriptor = $convert.base64Decode(
    'CgNUYWcSFgoSVEFHX1NJR05BVFVSRV9UWVBFEAASDgoKVEFHX0RPTUFJThABEhcKE1RBR19QRV'
    'JTT05BTElaQVRJT04QAhINCglUQUdfRVBPQ0gQAxISCg5UQUdfRVhQSVJFU19BVBAEEg8KC1RB'
    'R19DT1VOVEVSEAUSEQoNVEFHX0NIQUxMRU5HRRAGEg0KCVRBR19GTEFHUxAHEhQKEFRBR19SRV'
    'FVRVNUX0hBU0gQCBINCglUQUdfRkFVTFQQCRIMCgdUQUdfRU5EEP8B');

@$core.Deprecated('Use signatureTypeDescriptor instead')
const SignatureType$json = {
  '1': 'SignatureType',
  '2': [
    {'1': 'SIGNATURE_TYPE_AES_GCM', '2': 0},
    {'1': 'SIGNATURE_TYPE_AES_GCM_PERSONALIZED', '2': 5},
    {'1': 'SIGNATURE_TYPE_HMAC', '2': 6},
    {'1': 'SIGNATURE_TYPE_HMAC_PERSONALIZED', '2': 8},
    {'1': 'SIGNATURE_TYPE_AES_GCM_RESPONSE', '2': 9},
  ],
  '4': [
    {'1': 7, '2': 7},
  ],
};

/// Descriptor for `SignatureType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List signatureTypeDescriptor = $convert.base64Decode(
    'Cg1TaWduYXR1cmVUeXBlEhoKFlNJR05BVFVSRV9UWVBFX0FFU19HQ00QABInCiNTSUdOQVRVUk'
    'VfVFlQRV9BRVNfR0NNX1BFUlNPTkFMSVpFRBAFEhcKE1NJR05BVFVSRV9UWVBFX0hNQUMQBhIk'
    'CiBTSUdOQVRVUkVfVFlQRV9ITUFDX1BFUlNPTkFMSVpFRBAIEiMKH1NJR05BVFVSRV9UWVBFX0'
    'FFU19HQ01fUkVTUE9OU0UQCSIECAcQBw==');

@$core.Deprecated('Use session_Info_StatusDescriptor instead')
const Session_Info_Status$json = {
  '1': 'Session_Info_Status',
  '2': [
    {'1': 'SESSION_INFO_STATUS_OK', '2': 0},
    {'1': 'SESSION_INFO_STATUS_KEY_NOT_ON_WHITELIST', '2': 1},
  ],
};

/// Descriptor for `Session_Info_Status`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List session_Info_StatusDescriptor = $convert.base64Decode(
    'ChNTZXNzaW9uX0luZm9fU3RhdHVzEhoKFlNFU1NJT05fSU5GT19TVEFUVVNfT0sQABIsCihTRV'
    'NTSU9OX0lORk9fU1RBVFVTX0tFWV9OT1RfT05fV0hJVEVMSVNUEAE=');

@$core.Deprecated('Use keyIdentityDescriptor instead')
const KeyIdentity$json = {
  '1': 'KeyIdentity',
  '2': [
    {'1': 'public_key', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'publicKey'},
    {'1': 'handle', '3': 3, '4': 1, '5': 13, '9': 0, '10': 'handle'},
  ],
  '8': [
    {'1': 'identity_type'},
  ],
  '9': [
    {'1': 2, '2': 3},
  ],
};

/// Descriptor for `KeyIdentity`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List keyIdentityDescriptor = $convert.base64Decode(
    'CgtLZXlJZGVudGl0eRIfCgpwdWJsaWNfa2V5GAEgASgMSABSCXB1YmxpY0tleRIYCgZoYW5kbG'
    'UYAyABKA1IAFIGaGFuZGxlQg8KDWlkZW50aXR5X3R5cGVKBAgCEAM=');

@$core.Deprecated('Use aES_GCM_Personalized_Signature_DataDescriptor instead')
const AES_GCM_Personalized_Signature_Data$json = {
  '1': 'AES_GCM_Personalized_Signature_Data',
  '2': [
    {'1': 'epoch', '3': 1, '4': 1, '5': 12, '10': 'epoch'},
    {'1': 'nonce', '3': 2, '4': 1, '5': 12, '10': 'nonce'},
    {'1': 'counter', '3': 3, '4': 1, '5': 13, '10': 'counter'},
    {'1': 'expires_at', '3': 4, '4': 1, '5': 7, '10': 'expiresAt'},
    {'1': 'tag', '3': 5, '4': 1, '5': 12, '10': 'tag'},
  ],
};

/// Descriptor for `AES_GCM_Personalized_Signature_Data`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List aES_GCM_Personalized_Signature_DataDescriptor =
    $convert.base64Decode(
        'CiNBRVNfR0NNX1BlcnNvbmFsaXplZF9TaWduYXR1cmVfRGF0YRIUCgVlcG9jaBgBIAEoDFIFZX'
        'BvY2gSFAoFbm9uY2UYAiABKAxSBW5vbmNlEhgKB2NvdW50ZXIYAyABKA1SB2NvdW50ZXISHQoK'
        'ZXhwaXJlc19hdBgEIAEoB1IJZXhwaXJlc0F0EhAKA3RhZxgFIAEoDFIDdGFn');

@$core.Deprecated('Use aES_GCM_Response_Signature_DataDescriptor instead')
const AES_GCM_Response_Signature_Data$json = {
  '1': 'AES_GCM_Response_Signature_Data',
  '2': [
    {'1': 'nonce', '3': 1, '4': 1, '5': 12, '10': 'nonce'},
    {'1': 'counter', '3': 2, '4': 1, '5': 13, '10': 'counter'},
    {'1': 'tag', '3': 3, '4': 1, '5': 12, '10': 'tag'},
  ],
};

/// Descriptor for `AES_GCM_Response_Signature_Data`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List aES_GCM_Response_Signature_DataDescriptor =
    $convert.base64Decode(
        'Ch9BRVNfR0NNX1Jlc3BvbnNlX1NpZ25hdHVyZV9EYXRhEhQKBW5vbmNlGAEgASgMUgVub25jZR'
        'IYCgdjb3VudGVyGAIgASgNUgdjb3VudGVyEhAKA3RhZxgDIAEoDFIDdGFn');

@$core.Deprecated('Use hMAC_Signature_DataDescriptor instead')
const HMAC_Signature_Data$json = {
  '1': 'HMAC_Signature_Data',
  '2': [
    {'1': 'tag', '3': 1, '4': 1, '5': 12, '10': 'tag'},
  ],
};

/// Descriptor for `HMAC_Signature_Data`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List hMAC_Signature_DataDescriptor = $convert
    .base64Decode('ChNITUFDX1NpZ25hdHVyZV9EYXRhEhAKA3RhZxgBIAEoDFIDdGFn');

@$core.Deprecated('Use hMAC_Personalized_Signature_DataDescriptor instead')
const HMAC_Personalized_Signature_Data$json = {
  '1': 'HMAC_Personalized_Signature_Data',
  '2': [
    {'1': 'epoch', '3': 1, '4': 1, '5': 12, '10': 'epoch'},
    {'1': 'counter', '3': 2, '4': 1, '5': 13, '10': 'counter'},
    {'1': 'expires_at', '3': 3, '4': 1, '5': 7, '10': 'expiresAt'},
    {'1': 'tag', '3': 4, '4': 1, '5': 12, '10': 'tag'},
  ],
};

/// Descriptor for `HMAC_Personalized_Signature_Data`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List hMAC_Personalized_Signature_DataDescriptor =
    $convert.base64Decode(
        'CiBITUFDX1BlcnNvbmFsaXplZF9TaWduYXR1cmVfRGF0YRIUCgVlcG9jaBgBIAEoDFIFZXBvY2'
        'gSGAoHY291bnRlchgCIAEoDVIHY291bnRlchIdCgpleHBpcmVzX2F0GAMgASgHUglleHBpcmVz'
        'QXQSEAoDdGFnGAQgASgMUgN0YWc=');

@$core.Deprecated('Use signatureDataDescriptor instead')
const SignatureData$json = {
  '1': 'SignatureData',
  '2': [
    {
      '1': 'signer_identity',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.Signatures.KeyIdentity',
      '10': 'signerIdentity'
    },
    {
      '1': 'AES_GCM_Personalized_data',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.Signatures.AES_GCM_Personalized_Signature_Data',
      '9': 0,
      '10': 'AESGCMPersonalizedData'
    },
    {
      '1': 'session_info_tag',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.Signatures.HMAC_Signature_Data',
      '9': 0,
      '10': 'sessionInfoTag'
    },
    {
      '1': 'HMAC_Personalized_data',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.Signatures.HMAC_Personalized_Signature_Data',
      '9': 0,
      '10': 'HMACPersonalizedData'
    },
    {
      '1': 'AES_GCM_Response_data',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.Signatures.AES_GCM_Response_Signature_Data',
      '9': 0,
      '10': 'AESGCMResponseData'
    },
  ],
  '8': [
    {'1': 'sig_type'},
  ],
  '9': [
    {'1': 7, '2': 8},
  ],
};

/// Descriptor for `SignatureData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signatureDataDescriptor = $convert.base64Decode(
    'Cg1TaWduYXR1cmVEYXRhEkAKD3NpZ25lcl9pZGVudGl0eRgBIAEoCzIXLlNpZ25hdHVyZXMuS2'
    'V5SWRlbnRpdHlSDnNpZ25lcklkZW50aXR5EmwKGUFFU19HQ01fUGVyc29uYWxpemVkX2RhdGEY'
    'BSABKAsyLy5TaWduYXR1cmVzLkFFU19HQ01fUGVyc29uYWxpemVkX1NpZ25hdHVyZV9EYXRhSA'
    'BSFkFFU0dDTVBlcnNvbmFsaXplZERhdGESSwoQc2Vzc2lvbl9pbmZvX3RhZxgGIAEoCzIfLlNp'
    'Z25hdHVyZXMuSE1BQ19TaWduYXR1cmVfRGF0YUgAUg5zZXNzaW9uSW5mb1RhZxJkChZITUFDX1'
    'BlcnNvbmFsaXplZF9kYXRhGAggASgLMiwuU2lnbmF0dXJlcy5ITUFDX1BlcnNvbmFsaXplZF9T'
    'aWduYXR1cmVfRGF0YUgAUhRITUFDUGVyc29uYWxpemVkRGF0YRJgChVBRVNfR0NNX1Jlc3Bvbn'
    'NlX2RhdGEYCSABKAsyKy5TaWduYXR1cmVzLkFFU19HQ01fUmVzcG9uc2VfU2lnbmF0dXJlX0Rh'
    'dGFIAFISQUVTR0NNUmVzcG9uc2VEYXRhQgoKCHNpZ190eXBlSgQIBxAI');

@$core.Deprecated('Use getSessionInfoRequestDescriptor instead')
const GetSessionInfoRequest$json = {
  '1': 'GetSessionInfoRequest',
  '2': [
    {
      '1': 'key_identity',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.Signatures.KeyIdentity',
      '10': 'keyIdentity'
    },
  ],
};

/// Descriptor for `GetSessionInfoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSessionInfoRequestDescriptor = $convert.base64Decode(
    'ChVHZXRTZXNzaW9uSW5mb1JlcXVlc3QSOgoMa2V5X2lkZW50aXR5GAEgASgLMhcuU2lnbmF0dX'
    'Jlcy5LZXlJZGVudGl0eVILa2V5SWRlbnRpdHk=');

@$core.Deprecated('Use sessionInfoDescriptor instead')
const SessionInfo$json = {
  '1': 'SessionInfo',
  '2': [
    {'1': 'counter', '3': 1, '4': 1, '5': 13, '10': 'counter'},
    {'1': 'publicKey', '3': 2, '4': 1, '5': 12, '10': 'publicKey'},
    {'1': 'epoch', '3': 3, '4': 1, '5': 12, '10': 'epoch'},
    {'1': 'clock_time', '3': 4, '4': 1, '5': 7, '10': 'clockTime'},
    {
      '1': 'status',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.Signatures.Session_Info_Status',
      '10': 'status'
    },
    {'1': 'handle', '3': 6, '4': 1, '5': 13, '10': 'handle'},
  ],
};

/// Descriptor for `SessionInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sessionInfoDescriptor = $convert.base64Decode(
    'CgtTZXNzaW9uSW5mbxIYCgdjb3VudGVyGAEgASgNUgdjb3VudGVyEhwKCXB1YmxpY0tleRgCIA'
    'EoDFIJcHVibGljS2V5EhQKBWVwb2NoGAMgASgMUgVlcG9jaBIdCgpjbG9ja190aW1lGAQgASgH'
    'UgljbG9ja1RpbWUSNwoGc3RhdHVzGAUgASgOMh8uU2lnbmF0dXJlcy5TZXNzaW9uX0luZm9fU3'
    'RhdHVzUgZzdGF0dXMSFgoGaGFuZGxlGAYgASgNUgZoYW5kbGU=');

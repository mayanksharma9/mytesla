// This is a generated file - do not edit.
//
// Generated from universal_message.proto.

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

@$core.Deprecated('Use domainDescriptor instead')
const Domain$json = {
  '1': 'Domain',
  '2': [
    {'1': 'DOMAIN_BROADCAST', '2': 0},
    {'1': 'DOMAIN_VEHICLE_SECURITY', '2': 2},
    {'1': 'DOMAIN_INFOTAINMENT', '2': 3},
  ],
};

/// Descriptor for `Domain`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List domainDescriptor = $convert.base64Decode(
    'CgZEb21haW4SFAoQRE9NQUlOX0JST0FEQ0FTVBAAEhsKF0RPTUFJTl9WRUhJQ0xFX1NFQ1VSSV'
    'RZEAISFwoTRE9NQUlOX0lORk9UQUlOTUVOVBAD');

@$core.Deprecated('Use operationStatus_EDescriptor instead')
const OperationStatus_E$json = {
  '1': 'OperationStatus_E',
  '2': [
    {'1': 'OPERATIONSTATUS_OK', '2': 0},
    {'1': 'OPERATIONSTATUS_WAIT', '2': 1},
    {'1': 'OPERATIONSTATUS_ERROR', '2': 2},
  ],
};

/// Descriptor for `OperationStatus_E`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List operationStatus_EDescriptor = $convert.base64Decode(
    'ChFPcGVyYXRpb25TdGF0dXNfRRIWChJPUEVSQVRJT05TVEFUVVNfT0sQABIYChRPUEVSQVRJT0'
    '5TVEFUVVNfV0FJVBABEhkKFU9QRVJBVElPTlNUQVRVU19FUlJPUhAC');

@$core.Deprecated('Use messageFault_EDescriptor instead')
const MessageFault_E$json = {
  '1': 'MessageFault_E',
  '2': [
    {'1': 'MESSAGEFAULT_ERROR_NONE', '2': 0},
    {'1': 'MESSAGEFAULT_ERROR_BUSY', '2': 1},
    {'1': 'MESSAGEFAULT_ERROR_TIMEOUT', '2': 2},
    {'1': 'MESSAGEFAULT_ERROR_UNKNOWN_KEY_ID', '2': 3},
    {'1': 'MESSAGEFAULT_ERROR_INACTIVE_KEY', '2': 4},
    {'1': 'MESSAGEFAULT_ERROR_INVALID_SIGNATURE', '2': 5},
    {'1': 'MESSAGEFAULT_ERROR_INVALID_TOKEN_OR_COUNTER', '2': 6},
    {'1': 'MESSAGEFAULT_ERROR_INSUFFICIENT_PRIVILEGES', '2': 7},
    {'1': 'MESSAGEFAULT_ERROR_INVALID_DOMAINS', '2': 8},
    {'1': 'MESSAGEFAULT_ERROR_INVALID_COMMAND', '2': 9},
    {'1': 'MESSAGEFAULT_ERROR_DECODING', '2': 10},
    {'1': 'MESSAGEFAULT_ERROR_INTERNAL', '2': 11},
    {'1': 'MESSAGEFAULT_ERROR_WRONG_PERSONALIZATION', '2': 12},
    {'1': 'MESSAGEFAULT_ERROR_BAD_PARAMETER', '2': 13},
    {'1': 'MESSAGEFAULT_ERROR_KEYCHAIN_IS_FULL', '2': 14},
    {'1': 'MESSAGEFAULT_ERROR_INCORRECT_EPOCH', '2': 15},
    {'1': 'MESSAGEFAULT_ERROR_IV_INCORRECT_LENGTH', '2': 16},
    {'1': 'MESSAGEFAULT_ERROR_TIME_EXPIRED', '2': 17},
    {'1': 'MESSAGEFAULT_ERROR_NOT_PROVISIONED_WITH_IDENTITY', '2': 18},
    {'1': 'MESSAGEFAULT_ERROR_COULD_NOT_HASH_METADATA', '2': 19},
    {'1': 'MESSAGEFAULT_ERROR_TIME_TO_LIVE_TOO_LONG', '2': 20},
    {'1': 'MESSAGEFAULT_ERROR_REMOTE_ACCESS_DISABLED', '2': 21},
    {'1': 'MESSAGEFAULT_ERROR_REMOTE_SERVICE_ACCESS_DISABLED', '2': 22},
    {'1': 'MESSAGEFAULT_ERROR_COMMAND_REQUIRES_ACCOUNT_CREDENTIALS', '2': 23},
    {'1': 'MESSAGEFAULT_ERROR_REQUEST_MTU_EXCEEDED', '2': 24},
    {'1': 'MESSAGEFAULT_ERROR_RESPONSE_MTU_EXCEEDED', '2': 25},
    {'1': 'MESSAGEFAULT_ERROR_REPEATED_COUNTER', '2': 26},
    {'1': 'MESSAGEFAULT_ERROR_INVALID_KEY_HANDLE', '2': 27},
    {'1': 'MESSAGEFAULT_ERROR_REQUIRES_RESPONSE_ENCRYPTION', '2': 28},
  ],
};

/// Descriptor for `MessageFault_E`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List messageFault_EDescriptor = $convert.base64Decode(
    'Cg5NZXNzYWdlRmF1bHRfRRIbChdNRVNTQUdFRkFVTFRfRVJST1JfTk9ORRAAEhsKF01FU1NBR0'
    'VGQVVMVF9FUlJPUl9CVVNZEAESHgoaTUVTU0FHRUZBVUxUX0VSUk9SX1RJTUVPVVQQAhIlCiFN'
    'RVNTQUdFRkFVTFRfRVJST1JfVU5LTk9XTl9LRVlfSUQQAxIjCh9NRVNTQUdFRkFVTFRfRVJST1'
    'JfSU5BQ1RJVkVfS0VZEAQSKAokTUVTU0FHRUZBVUxUX0VSUk9SX0lOVkFMSURfU0lHTkFUVVJF'
    'EAUSLworTUVTU0FHRUZBVUxUX0VSUk9SX0lOVkFMSURfVE9LRU5fT1JfQ09VTlRFUhAGEi4KKk'
    '1FU1NBR0VGQVVMVF9FUlJPUl9JTlNVRkZJQ0lFTlRfUFJJVklMRUdFUxAHEiYKIk1FU1NBR0VG'
    'QVVMVF9FUlJPUl9JTlZBTElEX0RPTUFJTlMQCBImCiJNRVNTQUdFRkFVTFRfRVJST1JfSU5WQU'
    'xJRF9DT01NQU5EEAkSHwobTUVTU0FHRUZBVUxUX0VSUk9SX0RFQ09ESU5HEAoSHwobTUVTU0FH'
    'RUZBVUxUX0VSUk9SX0lOVEVSTkFMEAsSLAooTUVTU0FHRUZBVUxUX0VSUk9SX1dST05HX1BFUl'
    'NPTkFMSVpBVElPThAMEiQKIE1FU1NBR0VGQVVMVF9FUlJPUl9CQURfUEFSQU1FVEVSEA0SJwoj'
    'TUVTU0FHRUZBVUxUX0VSUk9SX0tFWUNIQUlOX0lTX0ZVTEwQDhImCiJNRVNTQUdFRkFVTFRfRV'
    'JST1JfSU5DT1JSRUNUX0VQT0NIEA8SKgomTUVTU0FHRUZBVUxUX0VSUk9SX0lWX0lOQ09SUkVD'
    'VF9MRU5HVEgQEBIjCh9NRVNTQUdFRkFVTFRfRVJST1JfVElNRV9FWFBJUkVEEBESNAowTUVTU0'
    'FHRUZBVUxUX0VSUk9SX05PVF9QUk9WSVNJT05FRF9XSVRIX0lERU5USVRZEBISLgoqTUVTU0FH'
    'RUZBVUxUX0VSUk9SX0NPVUxEX05PVF9IQVNIX01FVEFEQVRBEBMSLAooTUVTU0FHRUZBVUxUX0'
    'VSUk9SX1RJTUVfVE9fTElWRV9UT09fTE9ORxAUEi0KKU1FU1NBR0VGQVVMVF9FUlJPUl9SRU1P'
    'VEVfQUNDRVNTX0RJU0FCTEVEEBUSNQoxTUVTU0FHRUZBVUxUX0VSUk9SX1JFTU9URV9TRVJWSU'
    'NFX0FDQ0VTU19ESVNBQkxFRBAWEjsKN01FU1NBR0VGQVVMVF9FUlJPUl9DT01NQU5EX1JFUVVJ'
    'UkVTX0FDQ09VTlRfQ1JFREVOVElBTFMQFxIrCidNRVNTQUdFRkFVTFRfRVJST1JfUkVRVUVTVF'
    '9NVFVfRVhDRUVERUQQGBIsCihNRVNTQUdFRkFVTFRfRVJST1JfUkVTUE9OU0VfTVRVX0VYQ0VF'
    'REVEEBkSJwojTUVTU0FHRUZBVUxUX0VSUk9SX1JFUEVBVEVEX0NPVU5URVIQGhIpCiVNRVNTQU'
    'dFRkFVTFRfRVJST1JfSU5WQUxJRF9LRVlfSEFORExFEBsSMwovTUVTU0FHRUZBVUxUX0VSUk9S'
    'X1JFUVVJUkVTX1JFU1BPTlNFX0VOQ1JZUFRJT04QHA==');

@$core.Deprecated('Use flagsDescriptor instead')
const Flags$json = {
  '1': 'Flags',
  '2': [
    {'1': 'FLAG_USER_COMMAND', '2': 0},
    {'1': 'FLAG_ENCRYPT_RESPONSE', '2': 1},
  ],
};

/// Descriptor for `Flags`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List flagsDescriptor = $convert.base64Decode(
    'CgVGbGFncxIVChFGTEFHX1VTRVJfQ09NTUFORBAAEhkKFUZMQUdfRU5DUllQVF9SRVNQT05TRR'
    'AB');

@$core.Deprecated('Use destinationDescriptor instead')
const Destination$json = {
  '1': 'Destination',
  '2': [
    {
      '1': 'domain',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.UniversalMessage.Domain',
      '9': 0,
      '10': 'domain'
    },
    {
      '1': 'routing_address',
      '3': 2,
      '4': 1,
      '5': 12,
      '9': 0,
      '10': 'routingAddress'
    },
  ],
  '8': [
    {'1': 'sub_destination'},
  ],
};

/// Descriptor for `Destination`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List destinationDescriptor = $convert.base64Decode(
    'CgtEZXN0aW5hdGlvbhIyCgZkb21haW4YASABKA4yGC5Vbml2ZXJzYWxNZXNzYWdlLkRvbWFpbk'
    'gAUgZkb21haW4SKQoPcm91dGluZ19hZGRyZXNzGAIgASgMSABSDnJvdXRpbmdBZGRyZXNzQhEK'
    'D3N1Yl9kZXN0aW5hdGlvbg==');

@$core.Deprecated('Use messageStatusDescriptor instead')
const MessageStatus$json = {
  '1': 'MessageStatus',
  '2': [
    {
      '1': 'operation_status',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.UniversalMessage.OperationStatus_E',
      '10': 'operationStatus'
    },
    {
      '1': 'signed_message_fault',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.UniversalMessage.MessageFault_E',
      '10': 'signedMessageFault'
    },
  ],
};

/// Descriptor for `MessageStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageStatusDescriptor = $convert.base64Decode(
    'Cg1NZXNzYWdlU3RhdHVzEk4KEG9wZXJhdGlvbl9zdGF0dXMYASABKA4yIy5Vbml2ZXJzYWxNZX'
    'NzYWdlLk9wZXJhdGlvblN0YXR1c19FUg9vcGVyYXRpb25TdGF0dXMSUgoUc2lnbmVkX21lc3Nh'
    'Z2VfZmF1bHQYAiABKA4yIC5Vbml2ZXJzYWxNZXNzYWdlLk1lc3NhZ2VGYXVsdF9FUhJzaWduZW'
    'RNZXNzYWdlRmF1bHQ=');

@$core.Deprecated('Use sessionInfoRequestDescriptor instead')
const SessionInfoRequest$json = {
  '1': 'SessionInfoRequest',
  '2': [
    {'1': 'public_key', '3': 1, '4': 1, '5': 12, '10': 'publicKey'},
    {'1': 'challenge', '3': 2, '4': 1, '5': 12, '10': 'challenge'},
  ],
};

/// Descriptor for `SessionInfoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sessionInfoRequestDescriptor = $convert.base64Decode(
    'ChJTZXNzaW9uSW5mb1JlcXVlc3QSHQoKcHVibGljX2tleRgBIAEoDFIJcHVibGljS2V5EhwKCW'
    'NoYWxsZW5nZRgCIAEoDFIJY2hhbGxlbmdl');

@$core.Deprecated('Use routableMessageDescriptor instead')
const RoutableMessage$json = {
  '1': 'RoutableMessage',
  '2': [
    {
      '1': 'to_destination',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.UniversalMessage.Destination',
      '10': 'toDestination'
    },
    {
      '1': 'from_destination',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.UniversalMessage.Destination',
      '10': 'fromDestination'
    },
    {
      '1': 'protobuf_message_as_bytes',
      '3': 10,
      '4': 1,
      '5': 12,
      '9': 0,
      '10': 'protobufMessageAsBytes'
    },
    {
      '1': 'session_info_request',
      '3': 14,
      '4': 1,
      '5': 11,
      '6': '.UniversalMessage.SessionInfoRequest',
      '9': 0,
      '10': 'sessionInfoRequest'
    },
    {
      '1': 'session_info',
      '3': 15,
      '4': 1,
      '5': 12,
      '9': 0,
      '10': 'sessionInfo'
    },
    {
      '1': 'signature_data',
      '3': 13,
      '4': 1,
      '5': 11,
      '6': '.Signatures.SignatureData',
      '9': 1,
      '10': 'signatureData'
    },
    {
      '1': 'signedMessageStatus',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.UniversalMessage.MessageStatus',
      '10': 'signedMessageStatus'
    },
    {'1': 'request_uuid', '3': 50, '4': 1, '5': 12, '10': 'requestUuid'},
    {'1': 'uuid', '3': 51, '4': 1, '5': 12, '10': 'uuid'},
    {'1': 'flags', '3': 52, '4': 1, '5': 13, '10': 'flags'},
  ],
  '8': [
    {'1': 'payload'},
    {'1': 'sub_sigData'},
  ],
  '9': [
    {'1': 1, '2': 6},
    {'1': 16, '2': 41},
    {'1': 11, '2': 12},
  ],
};

/// Descriptor for `RoutableMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List routableMessageDescriptor = $convert.base64Decode(
    'Cg9Sb3V0YWJsZU1lc3NhZ2USRAoOdG9fZGVzdGluYXRpb24YBiABKAsyHS5Vbml2ZXJzYWxNZX'
    'NzYWdlLkRlc3RpbmF0aW9uUg10b0Rlc3RpbmF0aW9uEkgKEGZyb21fZGVzdGluYXRpb24YByAB'
    'KAsyHS5Vbml2ZXJzYWxNZXNzYWdlLkRlc3RpbmF0aW9uUg9mcm9tRGVzdGluYXRpb24SOwoZcH'
    'JvdG9idWZfbWVzc2FnZV9hc19ieXRlcxgKIAEoDEgAUhZwcm90b2J1Zk1lc3NhZ2VBc0J5dGVz'
    'ElgKFHNlc3Npb25faW5mb19yZXF1ZXN0GA4gASgLMiQuVW5pdmVyc2FsTWVzc2FnZS5TZXNzaW'
    '9uSW5mb1JlcXVlc3RIAFISc2Vzc2lvbkluZm9SZXF1ZXN0EiMKDHNlc3Npb25faW5mbxgPIAEo'
    'DEgAUgtzZXNzaW9uSW5mbxJCCg5zaWduYXR1cmVfZGF0YRgNIAEoCzIZLlNpZ25hdHVyZXMuU2'
    'lnbmF0dXJlRGF0YUgBUg1zaWduYXR1cmVEYXRhElEKE3NpZ25lZE1lc3NhZ2VTdGF0dXMYDCAB'
    'KAsyHy5Vbml2ZXJzYWxNZXNzYWdlLk1lc3NhZ2VTdGF0dXNSE3NpZ25lZE1lc3NhZ2VTdGF0dX'
    'MSIQoMcmVxdWVzdF91dWlkGDIgASgMUgtyZXF1ZXN0VXVpZBISCgR1dWlkGDMgASgMUgR1dWlk'
    'EhQKBWZsYWdzGDQgASgNUgVmbGFnc0IJCgdwYXlsb2FkQg0KC3N1Yl9zaWdEYXRhSgQIARAGSg'
    'QIEBApSgQICxAM');

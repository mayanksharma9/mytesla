// This is a generated file - do not edit.
//
// Generated from vcsec.proto.

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

@$core.Deprecated('Use signatureTypeDescriptor instead')
const SignatureType$json = {
  '1': 'SignatureType',
  '2': [
    {'1': 'SIGNATURE_TYPE_NONE', '2': 0},
    {'1': 'SIGNATURE_TYPE_PRESENT_KEY', '2': 2},
  ],
};

/// Descriptor for `SignatureType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List signatureTypeDescriptor = $convert.base64Decode(
    'Cg1TaWduYXR1cmVUeXBlEhcKE1NJR05BVFVSRV9UWVBFX05PTkUQABIeChpTSUdOQVRVUkVfVF'
    'lQRV9QUkVTRU5UX0tFWRAC');

@$core.Deprecated('Use keyFormFactorDescriptor instead')
const KeyFormFactor$json = {
  '1': 'KeyFormFactor',
  '2': [
    {'1': 'KEY_FORM_FACTOR_UNKNOWN', '2': 0},
    {'1': 'KEY_FORM_FACTOR_NFC_CARD', '2': 1},
    {'1': 'KEY_FORM_FACTOR_3_BUTTON_BLE_CAR_KEYFOB', '2': 2},
    {'1': 'KEY_FORM_FACTOR_BLE_DEVICE', '2': 3},
    {'1': 'KEY_FORM_FACTOR_NFC_DEVICE', '2': 4},
    {'1': 'KEY_FORM_FACTOR_BLE_AND_NFC_DEVICE', '2': 5},
    {'1': 'KEY_FORM_FACTOR_IOS_DEVICE', '2': 6},
    {'1': 'KEY_FORM_FACTOR_ANDROID_DEVICE', '2': 7},
    {'1': 'KEY_FORM_FACTOR_3_BUTTON_BLE_CAR_KEYFOB_P60', '2': 8},
    {'1': 'KEY_FORM_FACTOR_CLOUD_KEY', '2': 9},
    {'1': 'KEY_FORM_FACTOR_3_BUTTON_GEN2_CAR_KEYFOB_P60', '2': 10},
    {'1': 'KEY_FORM_FACTOR_5_BUTTON_GEN2_CAR_KEYFOB_P60', '2': 11},
    {'1': 'KEY_FORM_FACTOR_3_BUTTON_GEN2_CAR_KEYFOB_P60_V2', '2': 12},
    {'1': 'KEY_FORM_FACTOR_3_BUTTON_GEN2_CAR_KEYFOB_P60_V3', '2': 13},
    {'1': 'KEY_FORM_FACTOR_NFC_CARD_P71', '2': 14},
    {'1': 'KEY_FORM_FACTOR_NFC_CARD_METAL_CARD', '2': 15},
    {'1': 'KEY_FORM_FACTOR_NFC_CARD_PLASTIC_CARD', '2': 16},
    {'1': 'KEY_FORM_FACTOR_APPLE_WATCH', '2': 17},
  ],
};

/// Descriptor for `KeyFormFactor`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List keyFormFactorDescriptor = $convert.base64Decode(
    'Cg1LZXlGb3JtRmFjdG9yEhsKF0tFWV9GT1JNX0ZBQ1RPUl9VTktOT1dOEAASHAoYS0VZX0ZPUk'
    '1fRkFDVE9SX05GQ19DQVJEEAESKwonS0VZX0ZPUk1fRkFDVE9SXzNfQlVUVE9OX0JMRV9DQVJf'
    'S0VZRk9CEAISHgoaS0VZX0ZPUk1fRkFDVE9SX0JMRV9ERVZJQ0UQAxIeChpLRVlfRk9STV9GQU'
    'NUT1JfTkZDX0RFVklDRRAEEiYKIktFWV9GT1JNX0ZBQ1RPUl9CTEVfQU5EX05GQ19ERVZJQ0UQ'
    'BRIeChpLRVlfRk9STV9GQUNUT1JfSU9TX0RFVklDRRAGEiIKHktFWV9GT1JNX0ZBQ1RPUl9BTk'
    'RST0lEX0RFVklDRRAHEi8KK0tFWV9GT1JNX0ZBQ1RPUl8zX0JVVFRPTl9CTEVfQ0FSX0tFWUZP'
    'Ql9QNjAQCBIdChlLRVlfRk9STV9GQUNUT1JfQ0xPVURfS0VZEAkSMAosS0VZX0ZPUk1fRkFDVE'
    '9SXzNfQlVUVE9OX0dFTjJfQ0FSX0tFWUZPQl9QNjAQChIwCixLRVlfRk9STV9GQUNUT1JfNV9C'
    'VVRUT05fR0VOMl9DQVJfS0VZRk9CX1A2MBALEjMKL0tFWV9GT1JNX0ZBQ1RPUl8zX0JVVFRPTl'
    '9HRU4yX0NBUl9LRVlGT0JfUDYwX1YyEAwSMwovS0VZX0ZPUk1fRkFDVE9SXzNfQlVUVE9OX0dF'
    'TjJfQ0FSX0tFWUZPQl9QNjBfVjMQDRIgChxLRVlfRk9STV9GQUNUT1JfTkZDX0NBUkRfUDcxEA'
    '4SJwojS0VZX0ZPUk1fRkFDVE9SX05GQ19DQVJEX01FVEFMX0NBUkQQDxIpCiVLRVlfRk9STV9G'
    'QUNUT1JfTkZDX0NBUkRfUExBU1RJQ19DQVJEEBASHwobS0VZX0ZPUk1fRkFDVE9SX0FQUExFX1'
    'dBVENIEBE=');

@$core.Deprecated('Use informationRequestTypeDescriptor instead')
const InformationRequestType$json = {
  '1': 'InformationRequestType',
  '2': [
    {'1': 'INFORMATION_REQUEST_TYPE_GET_STATUS', '2': 0},
    {'1': 'INFORMATION_REQUEST_TYPE_GET_WHITELIST_INFO', '2': 5},
    {'1': 'INFORMATION_REQUEST_TYPE_GET_WHITELIST_ENTRY_INFO', '2': 6},
  ],
};

/// Descriptor for `InformationRequestType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List informationRequestTypeDescriptor = $convert.base64Decode(
    'ChZJbmZvcm1hdGlvblJlcXVlc3RUeXBlEicKI0lORk9STUFUSU9OX1JFUVVFU1RfVFlQRV9HRV'
    'RfU1RBVFVTEAASLworSU5GT1JNQVRJT05fUkVRVUVTVF9UWVBFX0dFVF9XSElURUxJU1RfSU5G'
    'TxAFEjUKMUlORk9STUFUSU9OX1JFUVVFU1RfVFlQRV9HRVRfV0hJVEVMSVNUX0VOVFJZX0lORk'
    '8QBg==');

@$core.Deprecated('Use rKEAction_EDescriptor instead')
const RKEAction_E$json = {
  '1': 'RKEAction_E',
  '2': [
    {'1': 'RKE_ACTION_UNLOCK', '2': 0},
    {'1': 'RKE_ACTION_LOCK', '2': 1},
    {'1': 'RKE_ACTION_OPEN_TRUNK', '2': 2},
    {'1': 'RKE_ACTION_OPEN_FRUNK', '2': 3},
    {'1': 'RKE_ACTION_OPEN_CHARGE_PORT', '2': 4},
    {'1': 'RKE_ACTION_CLOSE_CHARGE_PORT', '2': 5},
    {'1': 'RKE_ACTION_CANCEL_EXTERNAL_AUTHENTICATE', '2': 6},
    {'1': 'RKE_ACTION_UNKNOWN', '2': 19},
    {'1': 'RKE_ACTION_REMOTE_DRIVE', '2': 20},
    {'1': 'RKE_ACTION_AUTO_SECURE_VEHICLE', '2': 29},
    {'1': 'RKE_ACTION_WAKE_VEHICLE', '2': 30},
  ],
};

/// Descriptor for `RKEAction_E`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List rKEAction_EDescriptor = $convert.base64Decode(
    'CgtSS0VBY3Rpb25fRRIVChFSS0VfQUNUSU9OX1VOTE9DSxAAEhMKD1JLRV9BQ1RJT05fTE9DSx'
    'ABEhkKFVJLRV9BQ1RJT05fT1BFTl9UUlVOSxACEhkKFVJLRV9BQ1RJT05fT1BFTl9GUlVOSxAD'
    'Eh8KG1JLRV9BQ1RJT05fT1BFTl9DSEFSR0VfUE9SVBAEEiAKHFJLRV9BQ1RJT05fQ0xPU0VfQ0'
    'hBUkdFX1BPUlQQBRIrCidSS0VfQUNUSU9OX0NBTkNFTF9FWFRFUk5BTF9BVVRIRU5USUNBVEUQ'
    'BhIWChJSS0VfQUNUSU9OX1VOS05PV04QExIbChdSS0VfQUNUSU9OX1JFTU9URV9EUklWRRAUEi'
    'IKHlJLRV9BQ1RJT05fQVVUT19TRUNVUkVfVkVISUNMRRAdEhsKF1JLRV9BQ1RJT05fV0FLRV9W'
    'RUhJQ0xFEB4=');

@$core.Deprecated('Use closureMoveType_EDescriptor instead')
const ClosureMoveType_E$json = {
  '1': 'ClosureMoveType_E',
  '2': [
    {'1': 'CLOSURE_MOVE_TYPE_NONE', '2': 0},
    {'1': 'CLOSURE_MOVE_TYPE_MOVE', '2': 1},
    {'1': 'CLOSURE_MOVE_TYPE_STOP', '2': 2},
    {'1': 'CLOSURE_MOVE_TYPE_OPEN', '2': 3},
    {'1': 'CLOSURE_MOVE_TYPE_CLOSE', '2': 4},
  ],
};

/// Descriptor for `ClosureMoveType_E`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List closureMoveType_EDescriptor = $convert.base64Decode(
    'ChFDbG9zdXJlTW92ZVR5cGVfRRIaChZDTE9TVVJFX01PVkVfVFlQRV9OT05FEAASGgoWQ0xPU1'
    'VSRV9NT1ZFX1RZUEVfTU9WRRABEhoKFkNMT1NVUkVfTU9WRV9UWVBFX1NUT1AQAhIaChZDTE9T'
    'VVJFX01PVkVfVFlQRV9PUEVOEAMSGwoXQ0xPU1VSRV9NT1ZFX1RZUEVfQ0xPU0UQBA==');

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

@$core.Deprecated('Use signedMessage_information_EDescriptor instead')
const SignedMessage_information_E$json = {
  '1': 'SignedMessage_information_E',
  '2': [
    {'1': 'SIGNEDMESSAGE_INFORMATION_NONE', '2': 0},
    {'1': 'SIGNEDMESSAGE_INFORMATION_FAULT_UNKNOWN', '2': 1},
    {'1': 'SIGNEDMESSAGE_INFORMATION_FAULT_NOT_ON_WHITELIST', '2': 2},
    {'1': 'SIGNEDMESSAGE_INFORMATION_FAULT_IV_SMALLER_THAN_EXPECTED', '2': 3},
    {'1': 'SIGNEDMESSAGE_INFORMATION_FAULT_INVALID_TOKEN', '2': 4},
    {'1': 'SIGNEDMESSAGE_INFORMATION_FAULT_TOKEN_AND_COUNTER_INVALID', '2': 5},
    {'1': 'SIGNEDMESSAGE_INFORMATION_FAULT_AES_DECRYPT_AUTH', '2': 6},
    {'1': 'SIGNEDMESSAGE_INFORMATION_FAULT_ECDSA_INPUT', '2': 7},
    {'1': 'SIGNEDMESSAGE_INFORMATION_FAULT_ECDSA_SIGNATURE', '2': 8},
    {'1': 'SIGNEDMESSAGE_INFORMATION_FAULT_LOCAL_ENTITY_START', '2': 9},
    {'1': 'SIGNEDMESSAGE_INFORMATION_FAULT_LOCAL_ENTITY_RESULT', '2': 10},
    {'1': 'SIGNEDMESSAGE_INFORMATION_FAULT_COULD_NOT_RETRIEVE_KEY', '2': 11},
    {'1': 'SIGNEDMESSAGE_INFORMATION_FAULT_COULD_NOT_RETRIEVE_TOKEN', '2': 12},
    {'1': 'SIGNEDMESSAGE_INFORMATION_FAULT_SIGNATURE_TOO_SHORT', '2': 13},
    {'1': 'SIGNEDMESSAGE_INFORMATION_FAULT_TOKEN_IS_INCORRECT_LENGTH', '2': 14},
    {'1': 'SIGNEDMESSAGE_INFORMATION_FAULT_INCORRECT_EPOCH', '2': 15},
    {'1': 'SIGNEDMESSAGE_INFORMATION_FAULT_IV_INCORRECT_LENGTH', '2': 16},
    {'1': 'SIGNEDMESSAGE_INFORMATION_FAULT_TIME_EXPIRED', '2': 17},
    {
      '1': 'SIGNEDMESSAGE_INFORMATION_FAULT_NOT_PROVISIONED_WITH_IDENTITY',
      '2': 18
    },
    {'1': 'SIGNEDMESSAGE_INFORMATION_FAULT_COULD_NOT_HASH_METADATA', '2': 19},
  ],
};

/// Descriptor for `SignedMessage_information_E`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List signedMessage_information_EDescriptor = $convert.base64Decode(
    'ChtTaWduZWRNZXNzYWdlX2luZm9ybWF0aW9uX0USIgoeU0lHTkVETUVTU0FHRV9JTkZPUk1BVE'
    'lPTl9OT05FEAASKwonU0lHTkVETUVTU0FHRV9JTkZPUk1BVElPTl9GQVVMVF9VTktOT1dOEAES'
    'NAowU0lHTkVETUVTU0FHRV9JTkZPUk1BVElPTl9GQVVMVF9OT1RfT05fV0hJVEVMSVNUEAISPA'
    'o4U0lHTkVETUVTU0FHRV9JTkZPUk1BVElPTl9GQVVMVF9JVl9TTUFMTEVSX1RIQU5fRVhQRUNU'
    'RUQQAxIxCi1TSUdORURNRVNTQUdFX0lORk9STUFUSU9OX0ZBVUxUX0lOVkFMSURfVE9LRU4QBB'
    'I9CjlTSUdORURNRVNTQUdFX0lORk9STUFUSU9OX0ZBVUxUX1RPS0VOX0FORF9DT1VOVEVSX0lO'
    'VkFMSUQQBRI0CjBTSUdORURNRVNTQUdFX0lORk9STUFUSU9OX0ZBVUxUX0FFU19ERUNSWVBUX0'
    'FVVEgQBhIvCitTSUdORURNRVNTQUdFX0lORk9STUFUSU9OX0ZBVUxUX0VDRFNBX0lOUFVUEAcS'
    'MwovU0lHTkVETUVTU0FHRV9JTkZPUk1BVElPTl9GQVVMVF9FQ0RTQV9TSUdOQVRVUkUQCBI2Cj'
    'JTSUdORURNRVNTQUdFX0lORk9STUFUSU9OX0ZBVUxUX0xPQ0FMX0VOVElUWV9TVEFSVBAJEjcK'
    'M1NJR05FRE1FU1NBR0VfSU5GT1JNQVRJT05fRkFVTFRfTE9DQUxfRU5USVRZX1JFU1VMVBAKEj'
    'oKNlNJR05FRE1FU1NBR0VfSU5GT1JNQVRJT05fRkFVTFRfQ09VTERfTk9UX1JFVFJJRVZFX0tF'
    'WRALEjwKOFNJR05FRE1FU1NBR0VfSU5GT1JNQVRJT05fRkFVTFRfQ09VTERfTk9UX1JFVFJJRV'
    'ZFX1RPS0VOEAwSNwozU0lHTkVETUVTU0FHRV9JTkZPUk1BVElPTl9GQVVMVF9TSUdOQVRVUkVf'
    'VE9PX1NIT1JUEA0SPQo5U0lHTkVETUVTU0FHRV9JTkZPUk1BVElPTl9GQVVMVF9UT0tFTl9JU1'
    '9JTkNPUlJFQ1RfTEVOR1RIEA4SMwovU0lHTkVETUVTU0FHRV9JTkZPUk1BVElPTl9GQVVMVF9J'
    'TkNPUlJFQ1RfRVBPQ0gQDxI3CjNTSUdORURNRVNTQUdFX0lORk9STUFUSU9OX0ZBVUxUX0lWX0'
    'lOQ09SUkVDVF9MRU5HVEgQEBIwCixTSUdORURNRVNTQUdFX0lORk9STUFUSU9OX0ZBVUxUX1RJ'
    'TUVfRVhQSVJFRBAREkEKPVNJR05FRE1FU1NBR0VfSU5GT1JNQVRJT05fRkFVTFRfTk9UX1BST1'
    'ZJU0lPTkVEX1dJVEhfSURFTlRJVFkQEhI7CjdTSUdORURNRVNTQUdFX0lORk9STUFUSU9OX0ZB'
    'VUxUX0NPVUxEX05PVF9IQVNIX01FVEFEQVRBEBM=');

@$core.Deprecated('Use whitelistOperation_information_EDescriptor instead')
const WhitelistOperation_information_E$json = {
  '1': 'WhitelistOperation_information_E',
  '2': [
    {'1': 'WHITELISTOPERATION_INFORMATION_NONE', '2': 0},
    {'1': 'WHITELISTOPERATION_INFORMATION_UNDOCUMENTED_ERROR', '2': 1},
    {
      '1': 'WHITELISTOPERATION_INFORMATION_NO_PERMISSION_TO_REMOVE_ONESELF',
      '2': 2
    },
    {'1': 'WHITELISTOPERATION_INFORMATION_KEYFOB_SLOTS_FULL', '2': 3},
    {'1': 'WHITELISTOPERATION_INFORMATION_WHITELIST_FULL', '2': 4},
    {'1': 'WHITELISTOPERATION_INFORMATION_NO_PERMISSION_TO_ADD', '2': 5},
    {'1': 'WHITELISTOPERATION_INFORMATION_INVALID_PUBLIC_KEY', '2': 6},
    {'1': 'WHITELISTOPERATION_INFORMATION_NO_PERMISSION_TO_REMOVE', '2': 7},
    {
      '1': 'WHITELISTOPERATION_INFORMATION_NO_PERMISSION_TO_CHANGE_PERMISSIONS',
      '2': 8
    },
    {
      '1':
          'WHITELISTOPERATION_INFORMATION_ATTEMPTING_TO_ELEVATE_OTHER_ABOVE_ONESELF',
      '2': 9
    },
    {
      '1':
          'WHITELISTOPERATION_INFORMATION_ATTEMPTING_TO_DEMOTE_SUPERIOR_TO_ONESELF',
      '2': 10
    },
    {
      '1':
          'WHITELISTOPERATION_INFORMATION_ATTEMPTING_TO_REMOVE_OWN_PERMISSIONS',
      '2': 11
    },
    {
      '1': 'WHITELISTOPERATION_INFORMATION_PUBLIC_KEY_NOT_ON_WHITELIST',
      '2': 12
    },
    {
      '1':
          'WHITELISTOPERATION_INFORMATION_ATTEMPTING_TO_ADD_KEY_THAT_IS_ALREADY_ON_THE_WHITELIST',
      '2': 13
    },
    {
      '1': 'WHITELISTOPERATION_INFORMATION_NOT_ALLOWED_TO_ADD_UNLESS_ON_READER',
      '2': 14
    },
    {
      '1': 'WHITELISTOPERATION_INFORMATION_FM_MODIFYING_OUTSIDE_OF_F_MODE',
      '2': 15
    },
    {
      '1': 'WHITELISTOPERATION_INFORMATION_FM_ATTEMPTING_TO_ADD_PERMANENT_KEY',
      '2': 16
    },
    {
      '1':
          'WHITELISTOPERATION_INFORMATION_FM_ATTEMPTING_TO_REMOVE_PERMANENT_KEY',
      '2': 17
    },
    {'1': 'WHITELISTOPERATION_INFORMATION_KEYCHAIN_WHILE_FS_FULL', '2': 18},
    {
      '1': 'WHITELISTOPERATION_INFORMATION_ATTEMPTING_TO_ADD_KEY_WITHOUT_ROLE',
      '2': 19
    },
    {
      '1':
          'WHITELISTOPERATION_INFORMATION_ATTEMPTING_TO_ADD_KEY_WITH_SERVICE_ROLE',
      '2': 20
    },
    {
      '1':
          'WHITELISTOPERATION_INFORMATION_NON_SERVICE_KEY_ATTEMPTING_TO_ADD_SERVICE_TECH',
      '2': 21
    },
    {
      '1':
          'WHITELISTOPERATION_INFORMATION_SERVICE_KEY_ATTEMPTING_TO_ADD_SERVICE_TECH_OUTSIDE_SERVICE_MODE',
      '2': 22
    },
    {
      '1': 'WHITELISTOPERATION_INFORMATION_COULD_NOT_START_LOCAL_ENTITY_AUTH',
      '2': 23
    },
    {
      '1': 'WHITELISTOPERATION_INFORMATION_LOCAL_ENTITY_AUTH_FAILED_UI_DENIED',
      '2': 24
    },
    {
      '1':
          'WHITELISTOPERATION_INFORMATION_LOCAL_ENTITY_AUTH_FAILED_TIMED_OUT_WAITING_FOR_TAP',
      '2': 25
    },
    {
      '1':
          'WHITELISTOPERATION_INFORMATION_LOCAL_ENTITY_AUTH_FAILED_TIMED_OUT_WAITING_FOR_UI_ACK',
      '2': 26
    },
    {
      '1': 'WHITELISTOPERATION_INFORMATION_LOCAL_ENTITY_AUTH_FAILED_VALET_MODE',
      '2': 27
    },
    {
      '1': 'WHITELISTOPERATION_INFORMATION_LOCAL_ENTITY_AUTH_FAILED_CANCELLED',
      '2': 28
    },
  ],
};

/// Descriptor for `WhitelistOperation_information_E`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List whitelistOperation_information_EDescriptor = $convert.base64Decode(
    'CiBXaGl0ZWxpc3RPcGVyYXRpb25faW5mb3JtYXRpb25fRRInCiNXSElURUxJU1RPUEVSQVRJT0'
    '5fSU5GT1JNQVRJT05fTk9ORRAAEjUKMVdISVRFTElTVE9QRVJBVElPTl9JTkZPUk1BVElPTl9V'
    'TkRPQ1VNRU5URURfRVJST1IQARJCCj5XSElURUxJU1RPUEVSQVRJT05fSU5GT1JNQVRJT05fTk'
    '9fUEVSTUlTU0lPTl9UT19SRU1PVkVfT05FU0VMRhACEjQKMFdISVRFTElTVE9QRVJBVElPTl9J'
    'TkZPUk1BVElPTl9LRVlGT0JfU0xPVFNfRlVMTBADEjEKLVdISVRFTElTVE9QRVJBVElPTl9JTk'
    'ZPUk1BVElPTl9XSElURUxJU1RfRlVMTBAEEjcKM1dISVRFTElTVE9QRVJBVElPTl9JTkZPUk1B'
    'VElPTl9OT19QRVJNSVNTSU9OX1RPX0FERBAFEjUKMVdISVRFTElTVE9QRVJBVElPTl9JTkZPUk'
    '1BVElPTl9JTlZBTElEX1BVQkxJQ19LRVkQBhI6CjZXSElURUxJU1RPUEVSQVRJT05fSU5GT1JN'
    'QVRJT05fTk9fUEVSTUlTU0lPTl9UT19SRU1PVkUQBxJGCkJXSElURUxJU1RPUEVSQVRJT05fSU'
    '5GT1JNQVRJT05fTk9fUEVSTUlTU0lPTl9UT19DSEFOR0VfUEVSTUlTU0lPTlMQCBJMCkhXSElU'
    'RUxJU1RPUEVSQVRJT05fSU5GT1JNQVRJT05fQVRURU1QVElOR19UT19FTEVWQVRFX09USEVSX0'
    'FCT1ZFX09ORVNFTEYQCRJLCkdXSElURUxJU1RPUEVSQVRJT05fSU5GT1JNQVRJT05fQVRURU1Q'
    'VElOR19UT19ERU1PVEVfU1VQRVJJT1JfVE9fT05FU0VMRhAKEkcKQ1dISVRFTElTVE9QRVJBVE'
    'lPTl9JTkZPUk1BVElPTl9BVFRFTVBUSU5HX1RPX1JFTU9WRV9PV05fUEVSTUlTU0lPTlMQCxI+'
    'CjpXSElURUxJU1RPUEVSQVRJT05fSU5GT1JNQVRJT05fUFVCTElDX0tFWV9OT1RfT05fV0hJVE'
    'VMSVNUEAwSWQpVV0hJVEVMSVNUT1BFUkFUSU9OX0lORk9STUFUSU9OX0FUVEVNUFRJTkdfVE9f'
    'QUREX0tFWV9USEFUX0lTX0FMUkVBRFlfT05fVEhFX1dISVRFTElTVBANEkYKQldISVRFTElTVE'
    '9QRVJBVElPTl9JTkZPUk1BVElPTl9OT1RfQUxMT1dFRF9UT19BRERfVU5MRVNTX09OX1JFQURF'
    'UhAOEkEKPVdISVRFTElTVE9QRVJBVElPTl9JTkZPUk1BVElPTl9GTV9NT0RJRllJTkdfT1VUU0'
    'lERV9PRl9GX01PREUQDxJFCkFXSElURUxJU1RPUEVSQVRJT05fSU5GT1JNQVRJT05fRk1fQVRU'
    'RU1QVElOR19UT19BRERfUEVSTUFORU5UX0tFWRAQEkgKRFdISVRFTElTVE9QRVJBVElPTl9JTk'
    'ZPUk1BVElPTl9GTV9BVFRFTVBUSU5HX1RPX1JFTU9WRV9QRVJNQU5FTlRfS0VZEBESOQo1V0hJ'
    'VEVMSVNUT1BFUkFUSU9OX0lORk9STUFUSU9OX0tFWUNIQUlOX1dISUxFX0ZTX0ZVTEwQEhJFCk'
    'FXSElURUxJU1RPUEVSQVRJT05fSU5GT1JNQVRJT05fQVRURU1QVElOR19UT19BRERfS0VZX1dJ'
    'VEhPVVRfUk9MRRATEkoKRldISVRFTElTVE9QRVJBVElPTl9JTkZPUk1BVElPTl9BVFRFTVBUSU'
    '5HX1RPX0FERF9LRVlfV0lUSF9TRVJWSUNFX1JPTEUQFBJRCk1XSElURUxJU1RPUEVSQVRJT05f'
    'SU5GT1JNQVRJT05fTk9OX1NFUlZJQ0VfS0VZX0FUVEVNUFRJTkdfVE9fQUREX1NFUlZJQ0VfVE'
    'VDSBAVEmIKXldISVRFTElTVE9QRVJBVElPTl9JTkZPUk1BVElPTl9TRVJWSUNFX0tFWV9BVFRF'
    'TVBUSU5HX1RPX0FERF9TRVJWSUNFX1RFQ0hfT1VUU0lERV9TRVJWSUNFX01PREUQFhJECkBXSE'
    'lURUxJU1RPUEVSQVRJT05fSU5GT1JNQVRJT05fQ09VTERfTk9UX1NUQVJUX0xPQ0FMX0VOVElU'
    'WV9BVVRIEBcSRQpBV0hJVEVMSVNUT1BFUkFUSU9OX0lORk9STUFUSU9OX0xPQ0FMX0VOVElUWV'
    '9BVVRIX0ZBSUxFRF9VSV9ERU5JRUQQGBJVClFXSElURUxJU1RPUEVSQVRJT05fSU5GT1JNQVRJ'
    'T05fTE9DQUxfRU5USVRZX0FVVEhfRkFJTEVEX1RJTUVEX09VVF9XQUlUSU5HX0ZPUl9UQVAQGR'
    'JYClRXSElURUxJU1RPUEVSQVRJT05fSU5GT1JNQVRJT05fTE9DQUxfRU5USVRZX0FVVEhfRkFJ'
    'TEVEX1RJTUVEX09VVF9XQUlUSU5HX0ZPUl9VSV9BQ0sQGhJGCkJXSElURUxJU1RPUEVSQVRJT0'
    '5fSU5GT1JNQVRJT05fTE9DQUxfRU5USVRZX0FVVEhfRkFJTEVEX1ZBTEVUX01PREUQGxJFCkFX'
    'SElURUxJU1RPUEVSQVRJT05fSU5GT1JNQVRJT05fTE9DQUxfRU5USVRZX0FVVEhfRkFJTEVEX0'
    'NBTkNFTExFRBAc');

@$core.Deprecated('Use closureState_EDescriptor instead')
const ClosureState_E$json = {
  '1': 'ClosureState_E',
  '2': [
    {'1': 'CLOSURESTATE_CLOSED', '2': 0},
    {'1': 'CLOSURESTATE_OPEN', '2': 1},
    {'1': 'CLOSURESTATE_AJAR', '2': 2},
    {'1': 'CLOSURESTATE_UNKNOWN', '2': 3},
    {'1': 'CLOSURESTATE_FAILED_UNLATCH', '2': 4},
    {'1': 'CLOSURESTATE_OPENING', '2': 5},
    {'1': 'CLOSURESTATE_CLOSING', '2': 6},
  ],
};

/// Descriptor for `ClosureState_E`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List closureState_EDescriptor = $convert.base64Decode(
    'Cg5DbG9zdXJlU3RhdGVfRRIXChNDTE9TVVJFU1RBVEVfQ0xPU0VEEAASFQoRQ0xPU1VSRVNUQV'
    'RFX09QRU4QARIVChFDTE9TVVJFU1RBVEVfQUpBUhACEhgKFENMT1NVUkVTVEFURV9VTktOT1dO'
    'EAMSHwobQ0xPU1VSRVNUQVRFX0ZBSUxFRF9VTkxBVENIEAQSGAoUQ0xPU1VSRVNUQVRFX09QRU'
    '5JTkcQBRIYChRDTE9TVVJFU1RBVEVfQ0xPU0lORxAG');

@$core.Deprecated('Use vehicleLockState_EDescriptor instead')
const VehicleLockState_E$json = {
  '1': 'VehicleLockState_E',
  '2': [
    {'1': 'VEHICLELOCKSTATE_UNLOCKED', '2': 0},
    {'1': 'VEHICLELOCKSTATE_LOCKED', '2': 1},
    {'1': 'VEHICLELOCKSTATE_INTERNAL_LOCKED', '2': 2},
    {'1': 'VEHICLELOCKSTATE_SELECTIVE_UNLOCKED', '2': 3},
  ],
};

/// Descriptor for `VehicleLockState_E`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List vehicleLockState_EDescriptor = $convert.base64Decode(
    'ChJWZWhpY2xlTG9ja1N0YXRlX0USHQoZVkVISUNMRUxPQ0tTVEFURV9VTkxPQ0tFRBAAEhsKF1'
    'ZFSElDTEVMT0NLU1RBVEVfTE9DS0VEEAESJAogVkVISUNMRUxPQ0tTVEFURV9JTlRFUk5BTF9M'
    'T0NLRUQQAhInCiNWRUhJQ0xFTE9DS1NUQVRFX1NFTEVDVElWRV9VTkxPQ0tFRBAD');

@$core.Deprecated('Use vehicleSleepStatus_EDescriptor instead')
const VehicleSleepStatus_E$json = {
  '1': 'VehicleSleepStatus_E',
  '2': [
    {'1': 'VEHICLE_SLEEP_STATUS_UNKNOWN', '2': 0},
    {'1': 'VEHICLE_SLEEP_STATUS_AWAKE', '2': 1},
    {'1': 'VEHICLE_SLEEP_STATUS_ASLEEP', '2': 2},
  ],
};

/// Descriptor for `VehicleSleepStatus_E`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List vehicleSleepStatus_EDescriptor = $convert.base64Decode(
    'ChRWZWhpY2xlU2xlZXBTdGF0dXNfRRIgChxWRUhJQ0xFX1NMRUVQX1NUQVRVU19VTktOT1dOEA'
    'ASHgoaVkVISUNMRV9TTEVFUF9TVEFUVVNfQVdBS0UQARIfChtWRUhJQ0xFX1NMRUVQX1NUQVRV'
    'U19BU0xFRVAQAg==');

@$core.Deprecated('Use userPresence_EDescriptor instead')
const UserPresence_E$json = {
  '1': 'UserPresence_E',
  '2': [
    {'1': 'VEHICLE_USER_PRESENCE_UNKNOWN', '2': 0},
    {'1': 'VEHICLE_USER_PRESENCE_NOT_PRESENT', '2': 1},
    {'1': 'VEHICLE_USER_PRESENCE_PRESENT', '2': 2},
  ],
};

/// Descriptor for `UserPresence_E`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List userPresence_EDescriptor = $convert.base64Decode(
    'Cg5Vc2VyUHJlc2VuY2VfRRIhCh1WRUhJQ0xFX1VTRVJfUFJFU0VOQ0VfVU5LTk9XThAAEiUKIV'
    'ZFSElDTEVfVVNFUl9QUkVTRU5DRV9OT1RfUFJFU0VOVBABEiEKHVZFSElDTEVfVVNFUl9QUkVT'
    'RU5DRV9QUkVTRU5UEAI=');

@$core.Deprecated('Use signedMessageDescriptor instead')
const SignedMessage$json = {
  '1': 'SignedMessage',
  '2': [
    {
      '1': 'protobufMessageAsBytes',
      '3': 2,
      '4': 1,
      '5': 12,
      '10': 'protobufMessageAsBytes'
    },
    {
      '1': 'signatureType',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.VCSEC.SignatureType',
      '10': 'signatureType'
    },
  ],
};

/// Descriptor for `SignedMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signedMessageDescriptor = $convert.base64Decode(
    'Cg1TaWduZWRNZXNzYWdlEjYKFnByb3RvYnVmTWVzc2FnZUFzQnl0ZXMYAiABKAxSFnByb3RvYn'
    'VmTWVzc2FnZUFzQnl0ZXMSOgoNc2lnbmF0dXJlVHlwZRgDIAEoDjIULlZDU0VDLlNpZ25hdHVy'
    'ZVR5cGVSDXNpZ25hdHVyZVR5cGU=');

@$core.Deprecated('Use toVCSECMessageDescriptor instead')
const ToVCSECMessage$json = {
  '1': 'ToVCSECMessage',
  '2': [
    {
      '1': 'signedMessage',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.VCSEC.SignedMessage',
      '10': 'signedMessage'
    },
  ],
};

/// Descriptor for `ToVCSECMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List toVCSECMessageDescriptor = $convert.base64Decode(
    'Cg5Ub1ZDU0VDTWVzc2FnZRI6Cg1zaWduZWRNZXNzYWdlGAEgASgLMhQuVkNTRUMuU2lnbmVkTW'
    'Vzc2FnZVINc2lnbmVkTWVzc2FnZQ==');

@$core.Deprecated('Use keyIdentifierDescriptor instead')
const KeyIdentifier$json = {
  '1': 'KeyIdentifier',
  '2': [
    {'1': 'publicKeySHA1', '3': 1, '4': 1, '5': 12, '10': 'publicKeySHA1'},
  ],
};

/// Descriptor for `KeyIdentifier`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List keyIdentifierDescriptor = $convert.base64Decode(
    'Cg1LZXlJZGVudGlmaWVyEiQKDXB1YmxpY0tleVNIQTEYASABKAxSDXB1YmxpY0tleVNIQTE=');

@$core.Deprecated('Use keyMetadataDescriptor instead')
const KeyMetadata$json = {
  '1': 'KeyMetadata',
  '2': [
    {
      '1': 'keyFormFactor',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.VCSEC.KeyFormFactor',
      '10': 'keyFormFactor'
    },
  ],
};

/// Descriptor for `KeyMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List keyMetadataDescriptor = $convert.base64Decode(
    'CgtLZXlNZXRhZGF0YRI6Cg1rZXlGb3JtRmFjdG9yGAEgASgOMhQuVkNTRUMuS2V5Rm9ybUZhY3'
    'RvclINa2V5Rm9ybUZhY3Rvcg==');

@$core.Deprecated('Use publicKeyDescriptor instead')
const PublicKey$json = {
  '1': 'PublicKey',
  '2': [
    {'1': 'PublicKeyRaw', '3': 1, '4': 1, '5': 12, '10': 'PublicKeyRaw'},
  ],
};

/// Descriptor for `PublicKey`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List publicKeyDescriptor = $convert.base64Decode(
    'CglQdWJsaWNLZXkSIgoMUHVibGljS2V5UmF3GAEgASgMUgxQdWJsaWNLZXlSYXc=');

@$core.Deprecated('Use whitelistInfoDescriptor instead')
const WhitelistInfo$json = {
  '1': 'WhitelistInfo',
  '2': [
    {'1': 'numberOfEntries', '3': 1, '4': 1, '5': 13, '10': 'numberOfEntries'},
    {
      '1': 'whitelistEntries',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.VCSEC.KeyIdentifier',
      '10': 'whitelistEntries'
    },
    {'1': 'slotMask', '3': 3, '4': 1, '5': 13, '10': 'slotMask'},
  ],
};

/// Descriptor for `WhitelistInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List whitelistInfoDescriptor = $convert.base64Decode(
    'Cg1XaGl0ZWxpc3RJbmZvEigKD251bWJlck9mRW50cmllcxgBIAEoDVIPbnVtYmVyT2ZFbnRyaW'
    'VzEkAKEHdoaXRlbGlzdEVudHJpZXMYAiADKAsyFC5WQ1NFQy5LZXlJZGVudGlmaWVyUhB3aGl0'
    'ZWxpc3RFbnRyaWVzEhoKCHNsb3RNYXNrGAMgASgNUghzbG90TWFzaw==');

@$core.Deprecated('Use whitelistEntryInfoDescriptor instead')
const WhitelistEntryInfo$json = {
  '1': 'WhitelistEntryInfo',
  '2': [
    {
      '1': 'keyId',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.VCSEC.KeyIdentifier',
      '10': 'keyId'
    },
    {
      '1': 'publicKey',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.VCSEC.PublicKey',
      '10': 'publicKey'
    },
    {
      '1': 'metadataForKey',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.VCSEC.KeyMetadata',
      '10': 'metadataForKey'
    },
    {'1': 'slot', '3': 6, '4': 1, '5': 13, '10': 'slot'},
    {
      '1': 'keyRole',
      '3': 7,
      '4': 1,
      '5': 14,
      '6': '.Keys.Role',
      '10': 'keyRole'
    },
  ],
};

/// Descriptor for `WhitelistEntryInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List whitelistEntryInfoDescriptor = $convert.base64Decode(
    'ChJXaGl0ZWxpc3RFbnRyeUluZm8SKgoFa2V5SWQYASABKAsyFC5WQ1NFQy5LZXlJZGVudGlmaW'
    'VyUgVrZXlJZBIuCglwdWJsaWNLZXkYAiABKAsyEC5WQ1NFQy5QdWJsaWNLZXlSCXB1YmxpY0tl'
    'eRI6Cg5tZXRhZGF0YUZvcktleRgEIAEoCzISLlZDU0VDLktleU1ldGFkYXRhUg5tZXRhZGF0YU'
    'ZvcktleRISCgRzbG90GAYgASgNUgRzbG90EiQKB2tleVJvbGUYByABKA4yCi5LZXlzLlJvbGVS'
    'B2tleVJvbGU=');

@$core.Deprecated('Use informationRequestDescriptor instead')
const InformationRequest$json = {
  '1': 'InformationRequest',
  '2': [
    {
      '1': 'informationRequestType',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.VCSEC.InformationRequestType',
      '10': 'informationRequestType'
    },
    {
      '1': 'keyId',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.VCSEC.KeyIdentifier',
      '9': 0,
      '10': 'keyId'
    },
    {'1': 'publicKey', '3': 3, '4': 1, '5': 12, '9': 0, '10': 'publicKey'},
    {'1': 'slot', '3': 4, '4': 1, '5': 13, '9': 0, '10': 'slot'},
  ],
  '8': [
    {'1': 'key'},
  ],
};

/// Descriptor for `InformationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List informationRequestDescriptor = $convert.base64Decode(
    'ChJJbmZvcm1hdGlvblJlcXVlc3QSVQoWaW5mb3JtYXRpb25SZXF1ZXN0VHlwZRgBIAEoDjIdLl'
    'ZDU0VDLkluZm9ybWF0aW9uUmVxdWVzdFR5cGVSFmluZm9ybWF0aW9uUmVxdWVzdFR5cGUSLAoF'
    'a2V5SWQYAiABKAsyFC5WQ1NFQy5LZXlJZGVudGlmaWVySABSBWtleUlkEh4KCXB1YmxpY0tleR'
    'gDIAEoDEgAUglwdWJsaWNLZXkSFAoEc2xvdBgEIAEoDUgAUgRzbG90QgUKA2tleQ==');

@$core.Deprecated('Use closureMoveRequestDescriptor instead')
const ClosureMoveRequest$json = {
  '1': 'ClosureMoveRequest',
  '2': [
    {
      '1': 'frontDriverDoor',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.VCSEC.ClosureMoveType_E',
      '10': 'frontDriverDoor'
    },
    {
      '1': 'frontPassengerDoor',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.VCSEC.ClosureMoveType_E',
      '10': 'frontPassengerDoor'
    },
    {
      '1': 'rearDriverDoor',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.VCSEC.ClosureMoveType_E',
      '10': 'rearDriverDoor'
    },
    {
      '1': 'rearPassengerDoor',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.VCSEC.ClosureMoveType_E',
      '10': 'rearPassengerDoor'
    },
    {
      '1': 'rearTrunk',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.VCSEC.ClosureMoveType_E',
      '10': 'rearTrunk'
    },
    {
      '1': 'frontTrunk',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.VCSEC.ClosureMoveType_E',
      '10': 'frontTrunk'
    },
    {
      '1': 'chargePort',
      '3': 7,
      '4': 1,
      '5': 14,
      '6': '.VCSEC.ClosureMoveType_E',
      '10': 'chargePort'
    },
    {
      '1': 'tonneau',
      '3': 8,
      '4': 1,
      '5': 14,
      '6': '.VCSEC.ClosureMoveType_E',
      '10': 'tonneau'
    },
  ],
};

/// Descriptor for `ClosureMoveRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List closureMoveRequestDescriptor = $convert.base64Decode(
    'ChJDbG9zdXJlTW92ZVJlcXVlc3QSQgoPZnJvbnREcml2ZXJEb29yGAEgASgOMhguVkNTRUMuQ2'
    'xvc3VyZU1vdmVUeXBlX0VSD2Zyb250RHJpdmVyRG9vchJIChJmcm9udFBhc3NlbmdlckRvb3IY'
    'AiABKA4yGC5WQ1NFQy5DbG9zdXJlTW92ZVR5cGVfRVISZnJvbnRQYXNzZW5nZXJEb29yEkAKDn'
    'JlYXJEcml2ZXJEb29yGAMgASgOMhguVkNTRUMuQ2xvc3VyZU1vdmVUeXBlX0VSDnJlYXJEcml2'
    'ZXJEb29yEkYKEXJlYXJQYXNzZW5nZXJEb29yGAQgASgOMhguVkNTRUMuQ2xvc3VyZU1vdmVUeX'
    'BlX0VSEXJlYXJQYXNzZW5nZXJEb29yEjYKCXJlYXJUcnVuaxgFIAEoDjIYLlZDU0VDLkNsb3N1'
    'cmVNb3ZlVHlwZV9FUglyZWFyVHJ1bmsSOAoKZnJvbnRUcnVuaxgGIAEoDjIYLlZDU0VDLkNsb3'
    'N1cmVNb3ZlVHlwZV9FUgpmcm9udFRydW5rEjgKCmNoYXJnZVBvcnQYByABKA4yGC5WQ1NFQy5D'
    'bG9zdXJlTW92ZVR5cGVfRVIKY2hhcmdlUG9ydBIyCgd0b25uZWF1GAggASgOMhguVkNTRUMuQ2'
    'xvc3VyZU1vdmVUeXBlX0VSB3Rvbm5lYXU=');

@$core.Deprecated('Use permissionChangeDescriptor instead')
const PermissionChange$json = {
  '1': 'PermissionChange',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 11, '6': '.VCSEC.PublicKey', '10': 'key'},
    {
      '1': 'secondsToBeActive',
      '3': 3,
      '4': 1,
      '5': 13,
      '10': 'secondsToBeActive'
    },
    {
      '1': 'keyRole',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.Keys.Role',
      '10': 'keyRole'
    },
  ],
};

/// Descriptor for `PermissionChange`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List permissionChangeDescriptor = $convert.base64Decode(
    'ChBQZXJtaXNzaW9uQ2hhbmdlEiIKA2tleRgBIAEoCzIQLlZDU0VDLlB1YmxpY0tleVIDa2V5Ei'
    'wKEXNlY29uZHNUb0JlQWN0aXZlGAMgASgNUhFzZWNvbmRzVG9CZUFjdGl2ZRIkCgdrZXlSb2xl'
    'GAQgASgOMgouS2V5cy5Sb2xlUgdrZXlSb2xl');

@$core.Deprecated('Use replaceKeyDescriptor instead')
const ReplaceKey$json = {
  '1': 'ReplaceKey',
  '2': [
    {
      '1': 'publicKeyToReplace',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.VCSEC.PublicKey',
      '9': 0,
      '10': 'publicKeyToReplace'
    },
    {
      '1': 'slotToReplace',
      '3': 2,
      '4': 1,
      '5': 13,
      '9': 0,
      '10': 'slotToReplace'
    },
    {
      '1': 'keyToAdd',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.VCSEC.PublicKey',
      '10': 'keyToAdd'
    },
    {
      '1': 'keyRole',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.Keys.Role',
      '10': 'keyRole'
    },
    {'1': 'impermanent', '3': 5, '4': 1, '5': 8, '10': 'impermanent'},
  ],
  '8': [
    {'1': 'keyToReplace'},
  ],
};

/// Descriptor for `ReplaceKey`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List replaceKeyDescriptor = $convert.base64Decode(
    'CgpSZXBsYWNlS2V5EkIKEnB1YmxpY0tleVRvUmVwbGFjZRgBIAEoCzIQLlZDU0VDLlB1YmxpY0'
    'tleUgAUhJwdWJsaWNLZXlUb1JlcGxhY2USJgoNc2xvdFRvUmVwbGFjZRgCIAEoDUgAUg1zbG90'
    'VG9SZXBsYWNlEiwKCGtleVRvQWRkGAMgASgLMhAuVkNTRUMuUHVibGljS2V5UghrZXlUb0FkZB'
    'IkCgdrZXlSb2xlGAQgASgOMgouS2V5cy5Sb2xlUgdrZXlSb2xlEiAKC2ltcGVybWFuZW50GAUg'
    'ASgIUgtpbXBlcm1hbmVudEIOCgxrZXlUb1JlcGxhY2U=');

@$core.Deprecated('Use whitelistOperationDescriptor instead')
const WhitelistOperation$json = {
  '1': 'WhitelistOperation',
  '2': [
    {
      '1': 'addPublicKeyToWhitelist',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.VCSEC.PublicKey',
      '9': 0,
      '10': 'addPublicKeyToWhitelist'
    },
    {
      '1': 'removePublicKeyFromWhitelist',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.VCSEC.PublicKey',
      '9': 0,
      '10': 'removePublicKeyFromWhitelist'
    },
    {
      '1': 'addPermissionsToPublicKey',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.VCSEC.PermissionChange',
      '9': 0,
      '10': 'addPermissionsToPublicKey'
    },
    {
      '1': 'removePermissionsFromPublicKey',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.VCSEC.PermissionChange',
      '9': 0,
      '10': 'removePermissionsFromPublicKey'
    },
    {
      '1': 'addKeyToWhitelistAndAddPermissions',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.VCSEC.PermissionChange',
      '9': 0,
      '10': 'addKeyToWhitelistAndAddPermissions'
    },
    {
      '1': 'updateKeyAndPermissions',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.VCSEC.PermissionChange',
      '9': 0,
      '10': 'updateKeyAndPermissions'
    },
    {
      '1': 'addImpermanentKey',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.VCSEC.PermissionChange',
      '9': 0,
      '10': 'addImpermanentKey'
    },
    {
      '1': 'addImpermanentKeyAndRemoveExisting',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.VCSEC.PermissionChange',
      '9': 0,
      '10': 'addImpermanentKeyAndRemoveExisting'
    },
    {
      '1': 'removeAllImpermanentKeys',
      '3': 16,
      '4': 1,
      '5': 8,
      '9': 0,
      '10': 'removeAllImpermanentKeys'
    },
    {
      '1': 'replaceKey',
      '3': 17,
      '4': 1,
      '5': 11,
      '6': '.VCSEC.ReplaceKey',
      '9': 0,
      '10': 'replaceKey'
    },
    {
      '1': 'metadataForKey',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.VCSEC.KeyMetadata',
      '10': 'metadataForKey'
    },
  ],
  '8': [
    {'1': 'sub_message'},
  ],
};

/// Descriptor for `WhitelistOperation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List whitelistOperationDescriptor = $convert.base64Decode(
    'ChJXaGl0ZWxpc3RPcGVyYXRpb24STAoXYWRkUHVibGljS2V5VG9XaGl0ZWxpc3QYASABKAsyEC'
    '5WQ1NFQy5QdWJsaWNLZXlIAFIXYWRkUHVibGljS2V5VG9XaGl0ZWxpc3QSVgoccmVtb3ZlUHVi'
    'bGljS2V5RnJvbVdoaXRlbGlzdBgCIAEoCzIQLlZDU0VDLlB1YmxpY0tleUgAUhxyZW1vdmVQdW'
    'JsaWNLZXlGcm9tV2hpdGVsaXN0ElcKGWFkZFBlcm1pc3Npb25zVG9QdWJsaWNLZXkYAyABKAsy'
    'Fy5WQ1NFQy5QZXJtaXNzaW9uQ2hhbmdlSABSGWFkZFBlcm1pc3Npb25zVG9QdWJsaWNLZXkSYQ'
    'oecmVtb3ZlUGVybWlzc2lvbnNGcm9tUHVibGljS2V5GAQgASgLMhcuVkNTRUMuUGVybWlzc2lv'
    'bkNoYW5nZUgAUh5yZW1vdmVQZXJtaXNzaW9uc0Zyb21QdWJsaWNLZXkSaQoiYWRkS2V5VG9XaG'
    'l0ZWxpc3RBbmRBZGRQZXJtaXNzaW9ucxgFIAEoCzIXLlZDU0VDLlBlcm1pc3Npb25DaGFuZ2VI'
    'AFIiYWRkS2V5VG9XaGl0ZWxpc3RBbmRBZGRQZXJtaXNzaW9ucxJTChd1cGRhdGVLZXlBbmRQZX'
    'JtaXNzaW9ucxgHIAEoCzIXLlZDU0VDLlBlcm1pc3Npb25DaGFuZ2VIAFIXdXBkYXRlS2V5QW5k'
    'UGVybWlzc2lvbnMSRwoRYWRkSW1wZXJtYW5lbnRLZXkYCCABKAsyFy5WQ1NFQy5QZXJtaXNzaW'
    '9uQ2hhbmdlSABSEWFkZEltcGVybWFuZW50S2V5EmkKImFkZEltcGVybWFuZW50S2V5QW5kUmVt'
    'b3ZlRXhpc3RpbmcYCSABKAsyFy5WQ1NFQy5QZXJtaXNzaW9uQ2hhbmdlSABSImFkZEltcGVybW'
    'FuZW50S2V5QW5kUmVtb3ZlRXhpc3RpbmcSPAoYcmVtb3ZlQWxsSW1wZXJtYW5lbnRLZXlzGBAg'
    'ASgISABSGHJlbW92ZUFsbEltcGVybWFuZW50S2V5cxIzCgpyZXBsYWNlS2V5GBEgASgLMhEuVk'
    'NTRUMuUmVwbGFjZUtleUgAUgpyZXBsYWNlS2V5EjoKDm1ldGFkYXRhRm9yS2V5GAYgASgLMhIu'
    'VkNTRUMuS2V5TWV0YWRhdGFSDm1ldGFkYXRhRm9yS2V5Qg0KC3N1Yl9tZXNzYWdl');

@$core.Deprecated('Use whitelistOperation_statusDescriptor instead')
const WhitelistOperation_status$json = {
  '1': 'WhitelistOperation_status',
  '2': [
    {
      '1': 'whitelistOperationInformation',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.VCSEC.WhitelistOperation_information_E',
      '10': 'whitelistOperationInformation'
    },
    {
      '1': 'signerOfOperation',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.VCSEC.KeyIdentifier',
      '10': 'signerOfOperation'
    },
    {
      '1': 'operationStatus',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.VCSEC.OperationStatus_E',
      '10': 'operationStatus'
    },
  ],
};

/// Descriptor for `WhitelistOperation_status`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List whitelistOperation_statusDescriptor = $convert.base64Decode(
    'ChlXaGl0ZWxpc3RPcGVyYXRpb25fc3RhdHVzEm0KHXdoaXRlbGlzdE9wZXJhdGlvbkluZm9ybW'
    'F0aW9uGAEgASgOMicuVkNTRUMuV2hpdGVsaXN0T3BlcmF0aW9uX2luZm9ybWF0aW9uX0VSHXdo'
    'aXRlbGlzdE9wZXJhdGlvbkluZm9ybWF0aW9uEkIKEXNpZ25lck9mT3BlcmF0aW9uGAIgASgLMh'
    'QuVkNTRUMuS2V5SWRlbnRpZmllclIRc2lnbmVyT2ZPcGVyYXRpb24SQgoPb3BlcmF0aW9uU3Rh'
    'dHVzGAMgASgOMhguVkNTRUMuT3BlcmF0aW9uU3RhdHVzX0VSD29wZXJhdGlvblN0YXR1cw==');

@$core.Deprecated('Use signedMessage_statusDescriptor instead')
const SignedMessage_status$json = {
  '1': 'SignedMessage_status',
  '2': [
    {'1': 'counter', '3': 1, '4': 1, '5': 13, '10': 'counter'},
    {
      '1': 'signedMessageInformation',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.VCSEC.SignedMessage_information_E',
      '10': 'signedMessageInformation'
    },
  ],
};

/// Descriptor for `SignedMessage_status`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signedMessage_statusDescriptor = $convert.base64Decode(
    'ChRTaWduZWRNZXNzYWdlX3N0YXR1cxIYCgdjb3VudGVyGAEgASgNUgdjb3VudGVyEl4KGHNpZ2'
    '5lZE1lc3NhZ2VJbmZvcm1hdGlvbhgCIAEoDjIiLlZDU0VDLlNpZ25lZE1lc3NhZ2VfaW5mb3Jt'
    'YXRpb25fRVIYc2lnbmVkTWVzc2FnZUluZm9ybWF0aW9u');

@$core.Deprecated('Use commandStatusDescriptor instead')
const CommandStatus$json = {
  '1': 'CommandStatus',
  '2': [
    {
      '1': 'operationStatus',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.VCSEC.OperationStatus_E',
      '10': 'operationStatus'
    },
    {
      '1': 'signedMessageStatus',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.VCSEC.SignedMessage_status',
      '9': 0,
      '10': 'signedMessageStatus'
    },
    {
      '1': 'whitelistOperationStatus',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.VCSEC.WhitelistOperation_status',
      '9': 0,
      '10': 'whitelistOperationStatus'
    },
  ],
  '8': [
    {'1': 'sub_message'},
  ],
};

/// Descriptor for `CommandStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List commandStatusDescriptor = $convert.base64Decode(
    'Cg1Db21tYW5kU3RhdHVzEkIKD29wZXJhdGlvblN0YXR1cxgBIAEoDjIYLlZDU0VDLk9wZXJhdG'
    'lvblN0YXR1c19FUg9vcGVyYXRpb25TdGF0dXMSTwoTc2lnbmVkTWVzc2FnZVN0YXR1cxgCIAEo'
    'CzIbLlZDU0VDLlNpZ25lZE1lc3NhZ2Vfc3RhdHVzSABSE3NpZ25lZE1lc3NhZ2VTdGF0dXMSXg'
    'oYd2hpdGVsaXN0T3BlcmF0aW9uU3RhdHVzGAMgASgLMiAuVkNTRUMuV2hpdGVsaXN0T3BlcmF0'
    'aW9uX3N0YXR1c0gAUhh3aGl0ZWxpc3RPcGVyYXRpb25TdGF0dXNCDQoLc3ViX21lc3NhZ2U=');

@$core.Deprecated('Use unsignedMessageDescriptor instead')
const UnsignedMessage$json = {
  '1': 'UnsignedMessage',
  '2': [
    {
      '1': 'InformationRequest',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.VCSEC.InformationRequest',
      '9': 0,
      '10': 'InformationRequest'
    },
    {
      '1': 'RKEAction',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.VCSEC.RKEAction_E',
      '9': 0,
      '10': 'RKEAction'
    },
    {
      '1': 'closureMoveRequest',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.VCSEC.ClosureMoveRequest',
      '9': 0,
      '10': 'closureMoveRequest'
    },
    {
      '1': 'WhitelistOperation',
      '3': 16,
      '4': 1,
      '5': 11,
      '6': '.VCSEC.WhitelistOperation',
      '9': 0,
      '10': 'WhitelistOperation'
    },
  ],
  '8': [
    {'1': 'sub_message'},
  ],
  '9': [
    {'1': 6, '2': 7},
    {'1': 7, '2': 8},
    {'1': 10, '2': 11},
    {'1': 12, '2': 13},
    {'1': 13, '2': 14},
  ],
};

/// Descriptor for `UnsignedMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unsignedMessageDescriptor = $convert.base64Decode(
    'Cg9VbnNpZ25lZE1lc3NhZ2USSwoSSW5mb3JtYXRpb25SZXF1ZXN0GAEgASgLMhkuVkNTRUMuSW'
    '5mb3JtYXRpb25SZXF1ZXN0SABSEkluZm9ybWF0aW9uUmVxdWVzdBIyCglSS0VBY3Rpb24YAiAB'
    'KA4yEi5WQ1NFQy5SS0VBY3Rpb25fRUgAUglSS0VBY3Rpb24SSwoSY2xvc3VyZU1vdmVSZXF1ZX'
    'N0GAQgASgLMhkuVkNTRUMuQ2xvc3VyZU1vdmVSZXF1ZXN0SABSEmNsb3N1cmVNb3ZlUmVxdWVz'
    'dBJLChJXaGl0ZWxpc3RPcGVyYXRpb24YECABKAsyGS5WQ1NFQy5XaGl0ZWxpc3RPcGVyYXRpb2'
    '5IAFISV2hpdGVsaXN0T3BlcmF0aW9uQg0KC3N1Yl9tZXNzYWdlSgQIBhAHSgQIBxAISgQIChAL'
    'SgQIDBANSgQIDRAO');

@$core.Deprecated('Use closureStatusesDescriptor instead')
const ClosureStatuses$json = {
  '1': 'ClosureStatuses',
  '2': [
    {
      '1': 'frontDriverDoor',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.VCSEC.ClosureState_E',
      '10': 'frontDriverDoor'
    },
    {
      '1': 'frontPassengerDoor',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.VCSEC.ClosureState_E',
      '10': 'frontPassengerDoor'
    },
    {
      '1': 'rearDriverDoor',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.VCSEC.ClosureState_E',
      '10': 'rearDriverDoor'
    },
    {
      '1': 'rearPassengerDoor',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.VCSEC.ClosureState_E',
      '10': 'rearPassengerDoor'
    },
    {
      '1': 'rearTrunk',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.VCSEC.ClosureState_E',
      '10': 'rearTrunk'
    },
    {
      '1': 'frontTrunk',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.VCSEC.ClosureState_E',
      '10': 'frontTrunk'
    },
    {
      '1': 'chargePort',
      '3': 7,
      '4': 1,
      '5': 14,
      '6': '.VCSEC.ClosureState_E',
      '10': 'chargePort'
    },
    {
      '1': 'tonneau',
      '3': 8,
      '4': 1,
      '5': 14,
      '6': '.VCSEC.ClosureState_E',
      '10': 'tonneau'
    },
  ],
};

/// Descriptor for `ClosureStatuses`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List closureStatusesDescriptor = $convert.base64Decode(
    'Cg9DbG9zdXJlU3RhdHVzZXMSPwoPZnJvbnREcml2ZXJEb29yGAEgASgOMhUuVkNTRUMuQ2xvc3'
    'VyZVN0YXRlX0VSD2Zyb250RHJpdmVyRG9vchJFChJmcm9udFBhc3NlbmdlckRvb3IYAiABKA4y'
    'FS5WQ1NFQy5DbG9zdXJlU3RhdGVfRVISZnJvbnRQYXNzZW5nZXJEb29yEj0KDnJlYXJEcml2ZX'
    'JEb29yGAMgASgOMhUuVkNTRUMuQ2xvc3VyZVN0YXRlX0VSDnJlYXJEcml2ZXJEb29yEkMKEXJl'
    'YXJQYXNzZW5nZXJEb29yGAQgASgOMhUuVkNTRUMuQ2xvc3VyZVN0YXRlX0VSEXJlYXJQYXNzZW'
    '5nZXJEb29yEjMKCXJlYXJUcnVuaxgFIAEoDjIVLlZDU0VDLkNsb3N1cmVTdGF0ZV9FUglyZWFy'
    'VHJ1bmsSNQoKZnJvbnRUcnVuaxgGIAEoDjIVLlZDU0VDLkNsb3N1cmVTdGF0ZV9FUgpmcm9udF'
    'RydW5rEjUKCmNoYXJnZVBvcnQYByABKA4yFS5WQ1NFQy5DbG9zdXJlU3RhdGVfRVIKY2hhcmdl'
    'UG9ydBIvCgd0b25uZWF1GAggASgOMhUuVkNTRUMuQ2xvc3VyZVN0YXRlX0VSB3Rvbm5lYXU=');

@$core.Deprecated('Use detailedClosureStatusDescriptor instead')
const DetailedClosureStatus$json = {
  '1': 'DetailedClosureStatus',
  '2': [
    {
      '1': 'tonneauPercentOpen',
      '3': 1,
      '4': 1,
      '5': 13,
      '10': 'tonneauPercentOpen'
    },
  ],
};

/// Descriptor for `DetailedClosureStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List detailedClosureStatusDescriptor = $convert.base64Decode(
    'ChVEZXRhaWxlZENsb3N1cmVTdGF0dXMSLgoSdG9ubmVhdVBlcmNlbnRPcGVuGAEgASgNUhJ0b2'
    '5uZWF1UGVyY2VudE9wZW4=');

@$core.Deprecated('Use vehicleStatusDescriptor instead')
const VehicleStatus$json = {
  '1': 'VehicleStatus',
  '2': [
    {
      '1': 'closureStatuses',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.VCSEC.ClosureStatuses',
      '10': 'closureStatuses'
    },
    {
      '1': 'vehicleLockState',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.VCSEC.VehicleLockState_E',
      '10': 'vehicleLockState'
    },
    {
      '1': 'vehicleSleepStatus',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.VCSEC.VehicleSleepStatus_E',
      '10': 'vehicleSleepStatus'
    },
    {
      '1': 'userPresence',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.VCSEC.UserPresence_E',
      '10': 'userPresence'
    },
    {
      '1': 'detailedClosureStatus',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.VCSEC.DetailedClosureStatus',
      '10': 'detailedClosureStatus'
    },
  ],
};

/// Descriptor for `VehicleStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List vehicleStatusDescriptor = $convert.base64Decode(
    'Cg1WZWhpY2xlU3RhdHVzEkAKD2Nsb3N1cmVTdGF0dXNlcxgBIAEoCzIWLlZDU0VDLkNsb3N1cm'
    'VTdGF0dXNlc1IPY2xvc3VyZVN0YXR1c2VzEkUKEHZlaGljbGVMb2NrU3RhdGUYAiABKA4yGS5W'
    'Q1NFQy5WZWhpY2xlTG9ja1N0YXRlX0VSEHZlaGljbGVMb2NrU3RhdGUSSwoSdmVoaWNsZVNsZW'
    'VwU3RhdHVzGAMgASgOMhsuVkNTRUMuVmVoaWNsZVNsZWVwU3RhdHVzX0VSEnZlaGljbGVTbGVl'
    'cFN0YXR1cxI5Cgx1c2VyUHJlc2VuY2UYBCABKA4yFS5WQ1NFQy5Vc2VyUHJlc2VuY2VfRVIMdX'
    'NlclByZXNlbmNlElIKFWRldGFpbGVkQ2xvc3VyZVN0YXR1cxgFIAEoCzIcLlZDU0VDLkRldGFp'
    'bGVkQ2xvc3VyZVN0YXR1c1IVZGV0YWlsZWRDbG9zdXJlU3RhdHVz');

@$core.Deprecated('Use fromVCSECMessageDescriptor instead')
const FromVCSECMessage$json = {
  '1': 'FromVCSECMessage',
  '2': [
    {
      '1': 'vehicleStatus',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.VCSEC.VehicleStatus',
      '9': 0,
      '10': 'vehicleStatus'
    },
    {
      '1': 'commandStatus',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.VCSEC.CommandStatus',
      '9': 0,
      '10': 'commandStatus'
    },
    {
      '1': 'whitelistInfo',
      '3': 16,
      '4': 1,
      '5': 11,
      '6': '.VCSEC.WhitelistInfo',
      '9': 0,
      '10': 'whitelistInfo'
    },
    {
      '1': 'whitelistEntryInfo',
      '3': 17,
      '4': 1,
      '5': 11,
      '6': '.VCSEC.WhitelistEntryInfo',
      '9': 0,
      '10': 'whitelistEntryInfo'
    },
    {
      '1': 'nominalError',
      '3': 46,
      '4': 1,
      '5': 11,
      '6': '.Errors.NominalError',
      '9': 0,
      '10': 'nominalError'
    },
  ],
  '8': [
    {'1': 'sub_message'},
  ],
  '9': [
    {'1': 6, '2': 11},
  ],
};

/// Descriptor for `FromVCSECMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fromVCSECMessageDescriptor = $convert.base64Decode(
    'ChBGcm9tVkNTRUNNZXNzYWdlEjwKDXZlaGljbGVTdGF0dXMYASABKAsyFC5WQ1NFQy5WZWhpY2'
    'xlU3RhdHVzSABSDXZlaGljbGVTdGF0dXMSPAoNY29tbWFuZFN0YXR1cxgEIAEoCzIULlZDU0VD'
    'LkNvbW1hbmRTdGF0dXNIAFINY29tbWFuZFN0YXR1cxI8Cg13aGl0ZWxpc3RJbmZvGBAgASgLMh'
    'QuVkNTRUMuV2hpdGVsaXN0SW5mb0gAUg13aGl0ZWxpc3RJbmZvEksKEndoaXRlbGlzdEVudHJ5'
    'SW5mbxgRIAEoCzIZLlZDU0VDLldoaXRlbGlzdEVudHJ5SW5mb0gAUhJ3aGl0ZWxpc3RFbnRyeU'
    'luZm8SOgoMbm9taW5hbEVycm9yGC4gASgLMhQuRXJyb3JzLk5vbWluYWxFcnJvckgAUgxub21p'
    'bmFsRXJyb3JCDQoLc3ViX21lc3NhZ2VKBAgGEAs=');

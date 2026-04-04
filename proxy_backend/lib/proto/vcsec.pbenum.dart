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

class SignatureType extends $pb.ProtobufEnum {
  static const SignatureType SIGNATURE_TYPE_NONE =
      SignatureType._(0, _omitEnumNames ? '' : 'SIGNATURE_TYPE_NONE');
  static const SignatureType SIGNATURE_TYPE_PRESENT_KEY =
      SignatureType._(2, _omitEnumNames ? '' : 'SIGNATURE_TYPE_PRESENT_KEY');

  static const $core.List<SignatureType> values = <SignatureType>[
    SIGNATURE_TYPE_NONE,
    SIGNATURE_TYPE_PRESENT_KEY,
  ];

  static final $core.Map<$core.int, SignatureType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static SignatureType? valueOf($core.int value) => _byValue[value];

  const SignatureType._(super.value, super.name);
}

class KeyFormFactor extends $pb.ProtobufEnum {
  static const KeyFormFactor KEY_FORM_FACTOR_UNKNOWN =
      KeyFormFactor._(0, _omitEnumNames ? '' : 'KEY_FORM_FACTOR_UNKNOWN');
  static const KeyFormFactor KEY_FORM_FACTOR_NFC_CARD =
      KeyFormFactor._(1, _omitEnumNames ? '' : 'KEY_FORM_FACTOR_NFC_CARD');
  static const KeyFormFactor KEY_FORM_FACTOR_3_BUTTON_BLE_CAR_KEYFOB =
      KeyFormFactor._(
          2, _omitEnumNames ? '' : 'KEY_FORM_FACTOR_3_BUTTON_BLE_CAR_KEYFOB');
  static const KeyFormFactor KEY_FORM_FACTOR_BLE_DEVICE =
      KeyFormFactor._(3, _omitEnumNames ? '' : 'KEY_FORM_FACTOR_BLE_DEVICE');
  static const KeyFormFactor KEY_FORM_FACTOR_NFC_DEVICE =
      KeyFormFactor._(4, _omitEnumNames ? '' : 'KEY_FORM_FACTOR_NFC_DEVICE');
  static const KeyFormFactor KEY_FORM_FACTOR_BLE_AND_NFC_DEVICE =
      KeyFormFactor._(
          5, _omitEnumNames ? '' : 'KEY_FORM_FACTOR_BLE_AND_NFC_DEVICE');
  static const KeyFormFactor KEY_FORM_FACTOR_IOS_DEVICE =
      KeyFormFactor._(6, _omitEnumNames ? '' : 'KEY_FORM_FACTOR_IOS_DEVICE');
  static const KeyFormFactor KEY_FORM_FACTOR_ANDROID_DEVICE = KeyFormFactor._(
      7, _omitEnumNames ? '' : 'KEY_FORM_FACTOR_ANDROID_DEVICE');
  static const KeyFormFactor KEY_FORM_FACTOR_3_BUTTON_BLE_CAR_KEYFOB_P60 =
      KeyFormFactor._(8,
          _omitEnumNames ? '' : 'KEY_FORM_FACTOR_3_BUTTON_BLE_CAR_KEYFOB_P60');
  static const KeyFormFactor KEY_FORM_FACTOR_CLOUD_KEY =
      KeyFormFactor._(9, _omitEnumNames ? '' : 'KEY_FORM_FACTOR_CLOUD_KEY');
  static const KeyFormFactor KEY_FORM_FACTOR_3_BUTTON_GEN2_CAR_KEYFOB_P60 =
      KeyFormFactor._(10,
          _omitEnumNames ? '' : 'KEY_FORM_FACTOR_3_BUTTON_GEN2_CAR_KEYFOB_P60');
  static const KeyFormFactor KEY_FORM_FACTOR_5_BUTTON_GEN2_CAR_KEYFOB_P60 =
      KeyFormFactor._(11,
          _omitEnumNames ? '' : 'KEY_FORM_FACTOR_5_BUTTON_GEN2_CAR_KEYFOB_P60');
  static const KeyFormFactor KEY_FORM_FACTOR_3_BUTTON_GEN2_CAR_KEYFOB_P60_V2 =
      KeyFormFactor._(
          12,
          _omitEnumNames
              ? ''
              : 'KEY_FORM_FACTOR_3_BUTTON_GEN2_CAR_KEYFOB_P60_V2');
  static const KeyFormFactor KEY_FORM_FACTOR_3_BUTTON_GEN2_CAR_KEYFOB_P60_V3 =
      KeyFormFactor._(
          13,
          _omitEnumNames
              ? ''
              : 'KEY_FORM_FACTOR_3_BUTTON_GEN2_CAR_KEYFOB_P60_V3');
  static const KeyFormFactor KEY_FORM_FACTOR_NFC_CARD_P71 =
      KeyFormFactor._(14, _omitEnumNames ? '' : 'KEY_FORM_FACTOR_NFC_CARD_P71');
  static const KeyFormFactor KEY_FORM_FACTOR_NFC_CARD_METAL_CARD =
      KeyFormFactor._(
          15, _omitEnumNames ? '' : 'KEY_FORM_FACTOR_NFC_CARD_METAL_CARD');
  static const KeyFormFactor KEY_FORM_FACTOR_NFC_CARD_PLASTIC_CARD =
      KeyFormFactor._(
          16, _omitEnumNames ? '' : 'KEY_FORM_FACTOR_NFC_CARD_PLASTIC_CARD');
  static const KeyFormFactor KEY_FORM_FACTOR_APPLE_WATCH =
      KeyFormFactor._(17, _omitEnumNames ? '' : 'KEY_FORM_FACTOR_APPLE_WATCH');

  static const $core.List<KeyFormFactor> values = <KeyFormFactor>[
    KEY_FORM_FACTOR_UNKNOWN,
    KEY_FORM_FACTOR_NFC_CARD,
    KEY_FORM_FACTOR_3_BUTTON_BLE_CAR_KEYFOB,
    KEY_FORM_FACTOR_BLE_DEVICE,
    KEY_FORM_FACTOR_NFC_DEVICE,
    KEY_FORM_FACTOR_BLE_AND_NFC_DEVICE,
    KEY_FORM_FACTOR_IOS_DEVICE,
    KEY_FORM_FACTOR_ANDROID_DEVICE,
    KEY_FORM_FACTOR_3_BUTTON_BLE_CAR_KEYFOB_P60,
    KEY_FORM_FACTOR_CLOUD_KEY,
    KEY_FORM_FACTOR_3_BUTTON_GEN2_CAR_KEYFOB_P60,
    KEY_FORM_FACTOR_5_BUTTON_GEN2_CAR_KEYFOB_P60,
    KEY_FORM_FACTOR_3_BUTTON_GEN2_CAR_KEYFOB_P60_V2,
    KEY_FORM_FACTOR_3_BUTTON_GEN2_CAR_KEYFOB_P60_V3,
    KEY_FORM_FACTOR_NFC_CARD_P71,
    KEY_FORM_FACTOR_NFC_CARD_METAL_CARD,
    KEY_FORM_FACTOR_NFC_CARD_PLASTIC_CARD,
    KEY_FORM_FACTOR_APPLE_WATCH,
  ];

  static final $core.List<KeyFormFactor?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 17);
  static KeyFormFactor? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const KeyFormFactor._(super.value, super.name);
}

class InformationRequestType extends $pb.ProtobufEnum {
  static const InformationRequestType INFORMATION_REQUEST_TYPE_GET_STATUS =
      InformationRequestType._(
          0, _omitEnumNames ? '' : 'INFORMATION_REQUEST_TYPE_GET_STATUS');
  static const InformationRequestType
      INFORMATION_REQUEST_TYPE_GET_WHITELIST_INFO = InformationRequestType._(5,
          _omitEnumNames ? '' : 'INFORMATION_REQUEST_TYPE_GET_WHITELIST_INFO');
  static const InformationRequestType
      INFORMATION_REQUEST_TYPE_GET_WHITELIST_ENTRY_INFO =
      InformationRequestType._(
          6,
          _omitEnumNames
              ? ''
              : 'INFORMATION_REQUEST_TYPE_GET_WHITELIST_ENTRY_INFO');

  static const $core.List<InformationRequestType> values =
      <InformationRequestType>[
    INFORMATION_REQUEST_TYPE_GET_STATUS,
    INFORMATION_REQUEST_TYPE_GET_WHITELIST_INFO,
    INFORMATION_REQUEST_TYPE_GET_WHITELIST_ENTRY_INFO,
  ];

  static final $core.Map<$core.int, InformationRequestType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static InformationRequestType? valueOf($core.int value) => _byValue[value];

  const InformationRequestType._(super.value, super.name);
}

class RKEAction_E extends $pb.ProtobufEnum {
  static const RKEAction_E RKE_ACTION_UNLOCK =
      RKEAction_E._(0, _omitEnumNames ? '' : 'RKE_ACTION_UNLOCK');
  static const RKEAction_E RKE_ACTION_LOCK =
      RKEAction_E._(1, _omitEnumNames ? '' : 'RKE_ACTION_LOCK');
  static const RKEAction_E RKE_ACTION_OPEN_TRUNK =
      RKEAction_E._(2, _omitEnumNames ? '' : 'RKE_ACTION_OPEN_TRUNK');
  static const RKEAction_E RKE_ACTION_OPEN_FRUNK =
      RKEAction_E._(3, _omitEnumNames ? '' : 'RKE_ACTION_OPEN_FRUNK');
  static const RKEAction_E RKE_ACTION_OPEN_CHARGE_PORT =
      RKEAction_E._(4, _omitEnumNames ? '' : 'RKE_ACTION_OPEN_CHARGE_PORT');
  static const RKEAction_E RKE_ACTION_CLOSE_CHARGE_PORT =
      RKEAction_E._(5, _omitEnumNames ? '' : 'RKE_ACTION_CLOSE_CHARGE_PORT');
  static const RKEAction_E RKE_ACTION_CANCEL_EXTERNAL_AUTHENTICATE =
      RKEAction_E._(
          6, _omitEnumNames ? '' : 'RKE_ACTION_CANCEL_EXTERNAL_AUTHENTICATE');
  static const RKEAction_E RKE_ACTION_UNKNOWN =
      RKEAction_E._(19, _omitEnumNames ? '' : 'RKE_ACTION_UNKNOWN');
  static const RKEAction_E RKE_ACTION_REMOTE_DRIVE =
      RKEAction_E._(20, _omitEnumNames ? '' : 'RKE_ACTION_REMOTE_DRIVE');
  static const RKEAction_E RKE_ACTION_AUTO_SECURE_VEHICLE =
      RKEAction_E._(29, _omitEnumNames ? '' : 'RKE_ACTION_AUTO_SECURE_VEHICLE');
  static const RKEAction_E RKE_ACTION_WAKE_VEHICLE =
      RKEAction_E._(30, _omitEnumNames ? '' : 'RKE_ACTION_WAKE_VEHICLE');

  static const $core.List<RKEAction_E> values = <RKEAction_E>[
    RKE_ACTION_UNLOCK,
    RKE_ACTION_LOCK,
    RKE_ACTION_OPEN_TRUNK,
    RKE_ACTION_OPEN_FRUNK,
    RKE_ACTION_OPEN_CHARGE_PORT,
    RKE_ACTION_CLOSE_CHARGE_PORT,
    RKE_ACTION_CANCEL_EXTERNAL_AUTHENTICATE,
    RKE_ACTION_UNKNOWN,
    RKE_ACTION_REMOTE_DRIVE,
    RKE_ACTION_AUTO_SECURE_VEHICLE,
    RKE_ACTION_WAKE_VEHICLE,
  ];

  static final $core.Map<$core.int, RKEAction_E> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static RKEAction_E? valueOf($core.int value) => _byValue[value];

  const RKEAction_E._(super.value, super.name);
}

class ClosureMoveType_E extends $pb.ProtobufEnum {
  static const ClosureMoveType_E CLOSURE_MOVE_TYPE_NONE =
      ClosureMoveType_E._(0, _omitEnumNames ? '' : 'CLOSURE_MOVE_TYPE_NONE');
  static const ClosureMoveType_E CLOSURE_MOVE_TYPE_MOVE =
      ClosureMoveType_E._(1, _omitEnumNames ? '' : 'CLOSURE_MOVE_TYPE_MOVE');
  static const ClosureMoveType_E CLOSURE_MOVE_TYPE_STOP =
      ClosureMoveType_E._(2, _omitEnumNames ? '' : 'CLOSURE_MOVE_TYPE_STOP');
  static const ClosureMoveType_E CLOSURE_MOVE_TYPE_OPEN =
      ClosureMoveType_E._(3, _omitEnumNames ? '' : 'CLOSURE_MOVE_TYPE_OPEN');
  static const ClosureMoveType_E CLOSURE_MOVE_TYPE_CLOSE =
      ClosureMoveType_E._(4, _omitEnumNames ? '' : 'CLOSURE_MOVE_TYPE_CLOSE');

  static const $core.List<ClosureMoveType_E> values = <ClosureMoveType_E>[
    CLOSURE_MOVE_TYPE_NONE,
    CLOSURE_MOVE_TYPE_MOVE,
    CLOSURE_MOVE_TYPE_STOP,
    CLOSURE_MOVE_TYPE_OPEN,
    CLOSURE_MOVE_TYPE_CLOSE,
  ];

  static final $core.List<ClosureMoveType_E?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static ClosureMoveType_E? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ClosureMoveType_E._(super.value, super.name);
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

class SignedMessage_information_E extends $pb.ProtobufEnum {
  static const SignedMessage_information_E SIGNEDMESSAGE_INFORMATION_NONE =
      SignedMessage_information_E._(
          0, _omitEnumNames ? '' : 'SIGNEDMESSAGE_INFORMATION_NONE');
  static const SignedMessage_information_E
      SIGNEDMESSAGE_INFORMATION_FAULT_UNKNOWN = SignedMessage_information_E._(
          1, _omitEnumNames ? '' : 'SIGNEDMESSAGE_INFORMATION_FAULT_UNKNOWN');
  static const SignedMessage_information_E
      SIGNEDMESSAGE_INFORMATION_FAULT_NOT_ON_WHITELIST =
      SignedMessage_information_E._(
          2,
          _omitEnumNames
              ? ''
              : 'SIGNEDMESSAGE_INFORMATION_FAULT_NOT_ON_WHITELIST');
  static const SignedMessage_information_E
      SIGNEDMESSAGE_INFORMATION_FAULT_IV_SMALLER_THAN_EXPECTED =
      SignedMessage_information_E._(
          3,
          _omitEnumNames
              ? ''
              : 'SIGNEDMESSAGE_INFORMATION_FAULT_IV_SMALLER_THAN_EXPECTED');
  static const SignedMessage_information_E
      SIGNEDMESSAGE_INFORMATION_FAULT_INVALID_TOKEN =
      SignedMessage_information_E._(
          4,
          _omitEnumNames
              ? ''
              : 'SIGNEDMESSAGE_INFORMATION_FAULT_INVALID_TOKEN');
  static const SignedMessage_information_E
      SIGNEDMESSAGE_INFORMATION_FAULT_TOKEN_AND_COUNTER_INVALID =
      SignedMessage_information_E._(
          5,
          _omitEnumNames
              ? ''
              : 'SIGNEDMESSAGE_INFORMATION_FAULT_TOKEN_AND_COUNTER_INVALID');
  static const SignedMessage_information_E
      SIGNEDMESSAGE_INFORMATION_FAULT_AES_DECRYPT_AUTH =
      SignedMessage_information_E._(
          6,
          _omitEnumNames
              ? ''
              : 'SIGNEDMESSAGE_INFORMATION_FAULT_AES_DECRYPT_AUTH');
  static const SignedMessage_information_E
      SIGNEDMESSAGE_INFORMATION_FAULT_ECDSA_INPUT =
      SignedMessage_information_E._(7,
          _omitEnumNames ? '' : 'SIGNEDMESSAGE_INFORMATION_FAULT_ECDSA_INPUT');
  static const SignedMessage_information_E
      SIGNEDMESSAGE_INFORMATION_FAULT_ECDSA_SIGNATURE =
      SignedMessage_information_E._(
          8,
          _omitEnumNames
              ? ''
              : 'SIGNEDMESSAGE_INFORMATION_FAULT_ECDSA_SIGNATURE');
  static const SignedMessage_information_E
      SIGNEDMESSAGE_INFORMATION_FAULT_LOCAL_ENTITY_START =
      SignedMessage_information_E._(
          9,
          _omitEnumNames
              ? ''
              : 'SIGNEDMESSAGE_INFORMATION_FAULT_LOCAL_ENTITY_START');
  static const SignedMessage_information_E
      SIGNEDMESSAGE_INFORMATION_FAULT_LOCAL_ENTITY_RESULT =
      SignedMessage_information_E._(
          10,
          _omitEnumNames
              ? ''
              : 'SIGNEDMESSAGE_INFORMATION_FAULT_LOCAL_ENTITY_RESULT');
  static const SignedMessage_information_E
      SIGNEDMESSAGE_INFORMATION_FAULT_COULD_NOT_RETRIEVE_KEY =
      SignedMessage_information_E._(
          11,
          _omitEnumNames
              ? ''
              : 'SIGNEDMESSAGE_INFORMATION_FAULT_COULD_NOT_RETRIEVE_KEY');
  static const SignedMessage_information_E
      SIGNEDMESSAGE_INFORMATION_FAULT_COULD_NOT_RETRIEVE_TOKEN =
      SignedMessage_information_E._(
          12,
          _omitEnumNames
              ? ''
              : 'SIGNEDMESSAGE_INFORMATION_FAULT_COULD_NOT_RETRIEVE_TOKEN');
  static const SignedMessage_information_E
      SIGNEDMESSAGE_INFORMATION_FAULT_SIGNATURE_TOO_SHORT =
      SignedMessage_information_E._(
          13,
          _omitEnumNames
              ? ''
              : 'SIGNEDMESSAGE_INFORMATION_FAULT_SIGNATURE_TOO_SHORT');
  static const SignedMessage_information_E
      SIGNEDMESSAGE_INFORMATION_FAULT_TOKEN_IS_INCORRECT_LENGTH =
      SignedMessage_information_E._(
          14,
          _omitEnumNames
              ? ''
              : 'SIGNEDMESSAGE_INFORMATION_FAULT_TOKEN_IS_INCORRECT_LENGTH');
  static const SignedMessage_information_E
      SIGNEDMESSAGE_INFORMATION_FAULT_INCORRECT_EPOCH =
      SignedMessage_information_E._(
          15,
          _omitEnumNames
              ? ''
              : 'SIGNEDMESSAGE_INFORMATION_FAULT_INCORRECT_EPOCH');
  static const SignedMessage_information_E
      SIGNEDMESSAGE_INFORMATION_FAULT_IV_INCORRECT_LENGTH =
      SignedMessage_information_E._(
          16,
          _omitEnumNames
              ? ''
              : 'SIGNEDMESSAGE_INFORMATION_FAULT_IV_INCORRECT_LENGTH');
  static const SignedMessage_information_E
      SIGNEDMESSAGE_INFORMATION_FAULT_TIME_EXPIRED =
      SignedMessage_information_E._(17,
          _omitEnumNames ? '' : 'SIGNEDMESSAGE_INFORMATION_FAULT_TIME_EXPIRED');
  static const SignedMessage_information_E
      SIGNEDMESSAGE_INFORMATION_FAULT_NOT_PROVISIONED_WITH_IDENTITY =
      SignedMessage_information_E._(
          18,
          _omitEnumNames
              ? ''
              : 'SIGNEDMESSAGE_INFORMATION_FAULT_NOT_PROVISIONED_WITH_IDENTITY');
  static const SignedMessage_information_E
      SIGNEDMESSAGE_INFORMATION_FAULT_COULD_NOT_HASH_METADATA =
      SignedMessage_information_E._(
          19,
          _omitEnumNames
              ? ''
              : 'SIGNEDMESSAGE_INFORMATION_FAULT_COULD_NOT_HASH_METADATA');

  static const $core.List<SignedMessage_information_E> values =
      <SignedMessage_information_E>[
    SIGNEDMESSAGE_INFORMATION_NONE,
    SIGNEDMESSAGE_INFORMATION_FAULT_UNKNOWN,
    SIGNEDMESSAGE_INFORMATION_FAULT_NOT_ON_WHITELIST,
    SIGNEDMESSAGE_INFORMATION_FAULT_IV_SMALLER_THAN_EXPECTED,
    SIGNEDMESSAGE_INFORMATION_FAULT_INVALID_TOKEN,
    SIGNEDMESSAGE_INFORMATION_FAULT_TOKEN_AND_COUNTER_INVALID,
    SIGNEDMESSAGE_INFORMATION_FAULT_AES_DECRYPT_AUTH,
    SIGNEDMESSAGE_INFORMATION_FAULT_ECDSA_INPUT,
    SIGNEDMESSAGE_INFORMATION_FAULT_ECDSA_SIGNATURE,
    SIGNEDMESSAGE_INFORMATION_FAULT_LOCAL_ENTITY_START,
    SIGNEDMESSAGE_INFORMATION_FAULT_LOCAL_ENTITY_RESULT,
    SIGNEDMESSAGE_INFORMATION_FAULT_COULD_NOT_RETRIEVE_KEY,
    SIGNEDMESSAGE_INFORMATION_FAULT_COULD_NOT_RETRIEVE_TOKEN,
    SIGNEDMESSAGE_INFORMATION_FAULT_SIGNATURE_TOO_SHORT,
    SIGNEDMESSAGE_INFORMATION_FAULT_TOKEN_IS_INCORRECT_LENGTH,
    SIGNEDMESSAGE_INFORMATION_FAULT_INCORRECT_EPOCH,
    SIGNEDMESSAGE_INFORMATION_FAULT_IV_INCORRECT_LENGTH,
    SIGNEDMESSAGE_INFORMATION_FAULT_TIME_EXPIRED,
    SIGNEDMESSAGE_INFORMATION_FAULT_NOT_PROVISIONED_WITH_IDENTITY,
    SIGNEDMESSAGE_INFORMATION_FAULT_COULD_NOT_HASH_METADATA,
  ];

  static final $core.List<SignedMessage_information_E?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 19);
  static SignedMessage_information_E? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SignedMessage_information_E._(super.value, super.name);
}

class WhitelistOperation_information_E extends $pb.ProtobufEnum {
  static const WhitelistOperation_information_E
      WHITELISTOPERATION_INFORMATION_NONE = WhitelistOperation_information_E._(
          0, _omitEnumNames ? '' : 'WHITELISTOPERATION_INFORMATION_NONE');
  static const WhitelistOperation_information_E
      WHITELISTOPERATION_INFORMATION_UNDOCUMENTED_ERROR =
      WhitelistOperation_information_E._(
          1,
          _omitEnumNames
              ? ''
              : 'WHITELISTOPERATION_INFORMATION_UNDOCUMENTED_ERROR');
  static const WhitelistOperation_information_E
      WHITELISTOPERATION_INFORMATION_NO_PERMISSION_TO_REMOVE_ONESELF =
      WhitelistOperation_information_E._(
          2,
          _omitEnumNames
              ? ''
              : 'WHITELISTOPERATION_INFORMATION_NO_PERMISSION_TO_REMOVE_ONESELF');
  static const WhitelistOperation_information_E
      WHITELISTOPERATION_INFORMATION_KEYFOB_SLOTS_FULL =
      WhitelistOperation_information_E._(
          3,
          _omitEnumNames
              ? ''
              : 'WHITELISTOPERATION_INFORMATION_KEYFOB_SLOTS_FULL');
  static const WhitelistOperation_information_E
      WHITELISTOPERATION_INFORMATION_WHITELIST_FULL =
      WhitelistOperation_information_E._(
          4,
          _omitEnumNames
              ? ''
              : 'WHITELISTOPERATION_INFORMATION_WHITELIST_FULL');
  static const WhitelistOperation_information_E
      WHITELISTOPERATION_INFORMATION_NO_PERMISSION_TO_ADD =
      WhitelistOperation_information_E._(
          5,
          _omitEnumNames
              ? ''
              : 'WHITELISTOPERATION_INFORMATION_NO_PERMISSION_TO_ADD');
  static const WhitelistOperation_information_E
      WHITELISTOPERATION_INFORMATION_INVALID_PUBLIC_KEY =
      WhitelistOperation_information_E._(
          6,
          _omitEnumNames
              ? ''
              : 'WHITELISTOPERATION_INFORMATION_INVALID_PUBLIC_KEY');
  static const WhitelistOperation_information_E
      WHITELISTOPERATION_INFORMATION_NO_PERMISSION_TO_REMOVE =
      WhitelistOperation_information_E._(
          7,
          _omitEnumNames
              ? ''
              : 'WHITELISTOPERATION_INFORMATION_NO_PERMISSION_TO_REMOVE');
  static const WhitelistOperation_information_E
      WHITELISTOPERATION_INFORMATION_NO_PERMISSION_TO_CHANGE_PERMISSIONS =
      WhitelistOperation_information_E._(
          8,
          _omitEnumNames
              ? ''
              : 'WHITELISTOPERATION_INFORMATION_NO_PERMISSION_TO_CHANGE_PERMISSIONS');
  static const WhitelistOperation_information_E
      WHITELISTOPERATION_INFORMATION_ATTEMPTING_TO_ELEVATE_OTHER_ABOVE_ONESELF =
      WhitelistOperation_information_E._(
          9,
          _omitEnumNames
              ? ''
              : 'WHITELISTOPERATION_INFORMATION_ATTEMPTING_TO_ELEVATE_OTHER_ABOVE_ONESELF');
  static const WhitelistOperation_information_E
      WHITELISTOPERATION_INFORMATION_ATTEMPTING_TO_DEMOTE_SUPERIOR_TO_ONESELF =
      WhitelistOperation_information_E._(
          10,
          _omitEnumNames
              ? ''
              : 'WHITELISTOPERATION_INFORMATION_ATTEMPTING_TO_DEMOTE_SUPERIOR_TO_ONESELF');
  static const WhitelistOperation_information_E
      WHITELISTOPERATION_INFORMATION_ATTEMPTING_TO_REMOVE_OWN_PERMISSIONS =
      WhitelistOperation_information_E._(
          11,
          _omitEnumNames
              ? ''
              : 'WHITELISTOPERATION_INFORMATION_ATTEMPTING_TO_REMOVE_OWN_PERMISSIONS');
  static const WhitelistOperation_information_E
      WHITELISTOPERATION_INFORMATION_PUBLIC_KEY_NOT_ON_WHITELIST =
      WhitelistOperation_information_E._(
          12,
          _omitEnumNames
              ? ''
              : 'WHITELISTOPERATION_INFORMATION_PUBLIC_KEY_NOT_ON_WHITELIST');
  static const WhitelistOperation_information_E
      WHITELISTOPERATION_INFORMATION_ATTEMPTING_TO_ADD_KEY_THAT_IS_ALREADY_ON_THE_WHITELIST =
      WhitelistOperation_information_E._(
          13,
          _omitEnumNames
              ? ''
              : 'WHITELISTOPERATION_INFORMATION_ATTEMPTING_TO_ADD_KEY_THAT_IS_ALREADY_ON_THE_WHITELIST');
  static const WhitelistOperation_information_E
      WHITELISTOPERATION_INFORMATION_NOT_ALLOWED_TO_ADD_UNLESS_ON_READER =
      WhitelistOperation_information_E._(
          14,
          _omitEnumNames
              ? ''
              : 'WHITELISTOPERATION_INFORMATION_NOT_ALLOWED_TO_ADD_UNLESS_ON_READER');
  static const WhitelistOperation_information_E
      WHITELISTOPERATION_INFORMATION_FM_MODIFYING_OUTSIDE_OF_F_MODE =
      WhitelistOperation_information_E._(
          15,
          _omitEnumNames
              ? ''
              : 'WHITELISTOPERATION_INFORMATION_FM_MODIFYING_OUTSIDE_OF_F_MODE');
  static const WhitelistOperation_information_E
      WHITELISTOPERATION_INFORMATION_FM_ATTEMPTING_TO_ADD_PERMANENT_KEY =
      WhitelistOperation_information_E._(
          16,
          _omitEnumNames
              ? ''
              : 'WHITELISTOPERATION_INFORMATION_FM_ATTEMPTING_TO_ADD_PERMANENT_KEY');
  static const WhitelistOperation_information_E
      WHITELISTOPERATION_INFORMATION_FM_ATTEMPTING_TO_REMOVE_PERMANENT_KEY =
      WhitelistOperation_information_E._(
          17,
          _omitEnumNames
              ? ''
              : 'WHITELISTOPERATION_INFORMATION_FM_ATTEMPTING_TO_REMOVE_PERMANENT_KEY');
  static const WhitelistOperation_information_E
      WHITELISTOPERATION_INFORMATION_KEYCHAIN_WHILE_FS_FULL =
      WhitelistOperation_information_E._(
          18,
          _omitEnumNames
              ? ''
              : 'WHITELISTOPERATION_INFORMATION_KEYCHAIN_WHILE_FS_FULL');
  static const WhitelistOperation_information_E
      WHITELISTOPERATION_INFORMATION_ATTEMPTING_TO_ADD_KEY_WITHOUT_ROLE =
      WhitelistOperation_information_E._(
          19,
          _omitEnumNames
              ? ''
              : 'WHITELISTOPERATION_INFORMATION_ATTEMPTING_TO_ADD_KEY_WITHOUT_ROLE');
  static const WhitelistOperation_information_E
      WHITELISTOPERATION_INFORMATION_ATTEMPTING_TO_ADD_KEY_WITH_SERVICE_ROLE =
      WhitelistOperation_information_E._(
          20,
          _omitEnumNames
              ? ''
              : 'WHITELISTOPERATION_INFORMATION_ATTEMPTING_TO_ADD_KEY_WITH_SERVICE_ROLE');
  static const WhitelistOperation_information_E
      WHITELISTOPERATION_INFORMATION_NON_SERVICE_KEY_ATTEMPTING_TO_ADD_SERVICE_TECH =
      WhitelistOperation_information_E._(
          21,
          _omitEnumNames
              ? ''
              : 'WHITELISTOPERATION_INFORMATION_NON_SERVICE_KEY_ATTEMPTING_TO_ADD_SERVICE_TECH');
  static const WhitelistOperation_information_E
      WHITELISTOPERATION_INFORMATION_SERVICE_KEY_ATTEMPTING_TO_ADD_SERVICE_TECH_OUTSIDE_SERVICE_MODE =
      WhitelistOperation_information_E._(
          22,
          _omitEnumNames
              ? ''
              : 'WHITELISTOPERATION_INFORMATION_SERVICE_KEY_ATTEMPTING_TO_ADD_SERVICE_TECH_OUTSIDE_SERVICE_MODE');
  static const WhitelistOperation_information_E
      WHITELISTOPERATION_INFORMATION_COULD_NOT_START_LOCAL_ENTITY_AUTH =
      WhitelistOperation_information_E._(
          23,
          _omitEnumNames
              ? ''
              : 'WHITELISTOPERATION_INFORMATION_COULD_NOT_START_LOCAL_ENTITY_AUTH');
  static const WhitelistOperation_information_E
      WHITELISTOPERATION_INFORMATION_LOCAL_ENTITY_AUTH_FAILED_UI_DENIED =
      WhitelistOperation_information_E._(
          24,
          _omitEnumNames
              ? ''
              : 'WHITELISTOPERATION_INFORMATION_LOCAL_ENTITY_AUTH_FAILED_UI_DENIED');
  static const WhitelistOperation_information_E
      WHITELISTOPERATION_INFORMATION_LOCAL_ENTITY_AUTH_FAILED_TIMED_OUT_WAITING_FOR_TAP =
      WhitelistOperation_information_E._(
          25,
          _omitEnumNames
              ? ''
              : 'WHITELISTOPERATION_INFORMATION_LOCAL_ENTITY_AUTH_FAILED_TIMED_OUT_WAITING_FOR_TAP');
  static const WhitelistOperation_information_E
      WHITELISTOPERATION_INFORMATION_LOCAL_ENTITY_AUTH_FAILED_TIMED_OUT_WAITING_FOR_UI_ACK =
      WhitelistOperation_information_E._(
          26,
          _omitEnumNames
              ? ''
              : 'WHITELISTOPERATION_INFORMATION_LOCAL_ENTITY_AUTH_FAILED_TIMED_OUT_WAITING_FOR_UI_ACK');
  static const WhitelistOperation_information_E
      WHITELISTOPERATION_INFORMATION_LOCAL_ENTITY_AUTH_FAILED_VALET_MODE =
      WhitelistOperation_information_E._(
          27,
          _omitEnumNames
              ? ''
              : 'WHITELISTOPERATION_INFORMATION_LOCAL_ENTITY_AUTH_FAILED_VALET_MODE');
  static const WhitelistOperation_information_E
      WHITELISTOPERATION_INFORMATION_LOCAL_ENTITY_AUTH_FAILED_CANCELLED =
      WhitelistOperation_information_E._(
          28,
          _omitEnumNames
              ? ''
              : 'WHITELISTOPERATION_INFORMATION_LOCAL_ENTITY_AUTH_FAILED_CANCELLED');

  static const $core.List<WhitelistOperation_information_E> values =
      <WhitelistOperation_information_E>[
    WHITELISTOPERATION_INFORMATION_NONE,
    WHITELISTOPERATION_INFORMATION_UNDOCUMENTED_ERROR,
    WHITELISTOPERATION_INFORMATION_NO_PERMISSION_TO_REMOVE_ONESELF,
    WHITELISTOPERATION_INFORMATION_KEYFOB_SLOTS_FULL,
    WHITELISTOPERATION_INFORMATION_WHITELIST_FULL,
    WHITELISTOPERATION_INFORMATION_NO_PERMISSION_TO_ADD,
    WHITELISTOPERATION_INFORMATION_INVALID_PUBLIC_KEY,
    WHITELISTOPERATION_INFORMATION_NO_PERMISSION_TO_REMOVE,
    WHITELISTOPERATION_INFORMATION_NO_PERMISSION_TO_CHANGE_PERMISSIONS,
    WHITELISTOPERATION_INFORMATION_ATTEMPTING_TO_ELEVATE_OTHER_ABOVE_ONESELF,
    WHITELISTOPERATION_INFORMATION_ATTEMPTING_TO_DEMOTE_SUPERIOR_TO_ONESELF,
    WHITELISTOPERATION_INFORMATION_ATTEMPTING_TO_REMOVE_OWN_PERMISSIONS,
    WHITELISTOPERATION_INFORMATION_PUBLIC_KEY_NOT_ON_WHITELIST,
    WHITELISTOPERATION_INFORMATION_ATTEMPTING_TO_ADD_KEY_THAT_IS_ALREADY_ON_THE_WHITELIST,
    WHITELISTOPERATION_INFORMATION_NOT_ALLOWED_TO_ADD_UNLESS_ON_READER,
    WHITELISTOPERATION_INFORMATION_FM_MODIFYING_OUTSIDE_OF_F_MODE,
    WHITELISTOPERATION_INFORMATION_FM_ATTEMPTING_TO_ADD_PERMANENT_KEY,
    WHITELISTOPERATION_INFORMATION_FM_ATTEMPTING_TO_REMOVE_PERMANENT_KEY,
    WHITELISTOPERATION_INFORMATION_KEYCHAIN_WHILE_FS_FULL,
    WHITELISTOPERATION_INFORMATION_ATTEMPTING_TO_ADD_KEY_WITHOUT_ROLE,
    WHITELISTOPERATION_INFORMATION_ATTEMPTING_TO_ADD_KEY_WITH_SERVICE_ROLE,
    WHITELISTOPERATION_INFORMATION_NON_SERVICE_KEY_ATTEMPTING_TO_ADD_SERVICE_TECH,
    WHITELISTOPERATION_INFORMATION_SERVICE_KEY_ATTEMPTING_TO_ADD_SERVICE_TECH_OUTSIDE_SERVICE_MODE,
    WHITELISTOPERATION_INFORMATION_COULD_NOT_START_LOCAL_ENTITY_AUTH,
    WHITELISTOPERATION_INFORMATION_LOCAL_ENTITY_AUTH_FAILED_UI_DENIED,
    WHITELISTOPERATION_INFORMATION_LOCAL_ENTITY_AUTH_FAILED_TIMED_OUT_WAITING_FOR_TAP,
    WHITELISTOPERATION_INFORMATION_LOCAL_ENTITY_AUTH_FAILED_TIMED_OUT_WAITING_FOR_UI_ACK,
    WHITELISTOPERATION_INFORMATION_LOCAL_ENTITY_AUTH_FAILED_VALET_MODE,
    WHITELISTOPERATION_INFORMATION_LOCAL_ENTITY_AUTH_FAILED_CANCELLED,
  ];

  static final $core.List<WhitelistOperation_information_E?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 28);
  static WhitelistOperation_information_E? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const WhitelistOperation_information_E._(super.value, super.name);
}

class ClosureState_E extends $pb.ProtobufEnum {
  static const ClosureState_E CLOSURESTATE_CLOSED =
      ClosureState_E._(0, _omitEnumNames ? '' : 'CLOSURESTATE_CLOSED');
  static const ClosureState_E CLOSURESTATE_OPEN =
      ClosureState_E._(1, _omitEnumNames ? '' : 'CLOSURESTATE_OPEN');
  static const ClosureState_E CLOSURESTATE_AJAR =
      ClosureState_E._(2, _omitEnumNames ? '' : 'CLOSURESTATE_AJAR');
  static const ClosureState_E CLOSURESTATE_UNKNOWN =
      ClosureState_E._(3, _omitEnumNames ? '' : 'CLOSURESTATE_UNKNOWN');
  static const ClosureState_E CLOSURESTATE_FAILED_UNLATCH =
      ClosureState_E._(4, _omitEnumNames ? '' : 'CLOSURESTATE_FAILED_UNLATCH');
  static const ClosureState_E CLOSURESTATE_OPENING =
      ClosureState_E._(5, _omitEnumNames ? '' : 'CLOSURESTATE_OPENING');
  static const ClosureState_E CLOSURESTATE_CLOSING =
      ClosureState_E._(6, _omitEnumNames ? '' : 'CLOSURESTATE_CLOSING');

  static const $core.List<ClosureState_E> values = <ClosureState_E>[
    CLOSURESTATE_CLOSED,
    CLOSURESTATE_OPEN,
    CLOSURESTATE_AJAR,
    CLOSURESTATE_UNKNOWN,
    CLOSURESTATE_FAILED_UNLATCH,
    CLOSURESTATE_OPENING,
    CLOSURESTATE_CLOSING,
  ];

  static final $core.List<ClosureState_E?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 6);
  static ClosureState_E? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ClosureState_E._(super.value, super.name);
}

class VehicleLockState_E extends $pb.ProtobufEnum {
  static const VehicleLockState_E VEHICLELOCKSTATE_UNLOCKED =
      VehicleLockState_E._(
          0, _omitEnumNames ? '' : 'VEHICLELOCKSTATE_UNLOCKED');
  static const VehicleLockState_E VEHICLELOCKSTATE_LOCKED =
      VehicleLockState_E._(1, _omitEnumNames ? '' : 'VEHICLELOCKSTATE_LOCKED');
  static const VehicleLockState_E VEHICLELOCKSTATE_INTERNAL_LOCKED =
      VehicleLockState_E._(
          2, _omitEnumNames ? '' : 'VEHICLELOCKSTATE_INTERNAL_LOCKED');
  static const VehicleLockState_E VEHICLELOCKSTATE_SELECTIVE_UNLOCKED =
      VehicleLockState_E._(
          3, _omitEnumNames ? '' : 'VEHICLELOCKSTATE_SELECTIVE_UNLOCKED');

  static const $core.List<VehicleLockState_E> values = <VehicleLockState_E>[
    VEHICLELOCKSTATE_UNLOCKED,
    VEHICLELOCKSTATE_LOCKED,
    VEHICLELOCKSTATE_INTERNAL_LOCKED,
    VEHICLELOCKSTATE_SELECTIVE_UNLOCKED,
  ];

  static final $core.List<VehicleLockState_E?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static VehicleLockState_E? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const VehicleLockState_E._(super.value, super.name);
}

class VehicleSleepStatus_E extends $pb.ProtobufEnum {
  static const VehicleSleepStatus_E VEHICLE_SLEEP_STATUS_UNKNOWN =
      VehicleSleepStatus_E._(
          0, _omitEnumNames ? '' : 'VEHICLE_SLEEP_STATUS_UNKNOWN');
  static const VehicleSleepStatus_E VEHICLE_SLEEP_STATUS_AWAKE =
      VehicleSleepStatus_E._(
          1, _omitEnumNames ? '' : 'VEHICLE_SLEEP_STATUS_AWAKE');
  static const VehicleSleepStatus_E VEHICLE_SLEEP_STATUS_ASLEEP =
      VehicleSleepStatus_E._(
          2, _omitEnumNames ? '' : 'VEHICLE_SLEEP_STATUS_ASLEEP');

  static const $core.List<VehicleSleepStatus_E> values = <VehicleSleepStatus_E>[
    VEHICLE_SLEEP_STATUS_UNKNOWN,
    VEHICLE_SLEEP_STATUS_AWAKE,
    VEHICLE_SLEEP_STATUS_ASLEEP,
  ];

  static final $core.List<VehicleSleepStatus_E?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static VehicleSleepStatus_E? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const VehicleSleepStatus_E._(super.value, super.name);
}

class UserPresence_E extends $pb.ProtobufEnum {
  static const UserPresence_E VEHICLE_USER_PRESENCE_UNKNOWN = UserPresence_E._(
      0, _omitEnumNames ? '' : 'VEHICLE_USER_PRESENCE_UNKNOWN');
  static const UserPresence_E VEHICLE_USER_PRESENCE_NOT_PRESENT =
      UserPresence_E._(
          1, _omitEnumNames ? '' : 'VEHICLE_USER_PRESENCE_NOT_PRESENT');
  static const UserPresence_E VEHICLE_USER_PRESENCE_PRESENT = UserPresence_E._(
      2, _omitEnumNames ? '' : 'VEHICLE_USER_PRESENCE_PRESENT');

  static const $core.List<UserPresence_E> values = <UserPresence_E>[
    VEHICLE_USER_PRESENCE_UNKNOWN,
    VEHICLE_USER_PRESENCE_NOT_PRESENT,
    VEHICLE_USER_PRESENCE_PRESENT,
  ];

  static final $core.List<UserPresence_E?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static UserPresence_E? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const UserPresence_E._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

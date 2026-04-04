// This is a generated file - do not edit.
//
// Generated from errors.proto.

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

@$core.Deprecated('Use genericError_EDescriptor instead')
const GenericError_E$json = {
  '1': 'GenericError_E',
  '2': [
    {'1': 'GENERICERROR_NONE', '2': 0},
    {'1': 'GENERICERROR_UNKNOWN', '2': 1},
    {'1': 'GENERICERROR_CLOSURES_OPEN', '2': 2},
    {'1': 'GENERICERROR_ALREADY_ON', '2': 3},
    {'1': 'GENERICERROR_DISABLED_FOR_USER_COMMAND', '2': 4},
    {'1': 'GENERICERROR_VEHICLE_NOT_IN_PARK', '2': 5},
    {'1': 'GENERICERROR_UNAUTHORIZED', '2': 6},
    {'1': 'GENERICERROR_NOT_ALLOWED_OVER_TRANSPORT', '2': 7},
  ],
};

/// Descriptor for `GenericError_E`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List genericError_EDescriptor = $convert.base64Decode(
    'Cg5HZW5lcmljRXJyb3JfRRIVChFHRU5FUklDRVJST1JfTk9ORRAAEhgKFEdFTkVSSUNFUlJPUl'
    '9VTktOT1dOEAESHgoaR0VORVJJQ0VSUk9SX0NMT1NVUkVTX09QRU4QAhIbChdHRU5FUklDRVJS'
    'T1JfQUxSRUFEWV9PThADEioKJkdFTkVSSUNFUlJPUl9ESVNBQkxFRF9GT1JfVVNFUl9DT01NQU'
    '5EEAQSJAogR0VORVJJQ0VSUk9SX1ZFSElDTEVfTk9UX0lOX1BBUksQBRIdChlHRU5FUklDRVJS'
    'T1JfVU5BVVRIT1JJWkVEEAYSKwonR0VORVJJQ0VSUk9SX05PVF9BTExPV0VEX09WRVJfVFJBTl'
    'NQT1JUEAc=');

@$core.Deprecated('Use nominalErrorDescriptor instead')
const NominalError$json = {
  '1': 'NominalError',
  '2': [
    {
      '1': 'genericError',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.Errors.GenericError_E',
      '10': 'genericError'
    },
  ],
};

/// Descriptor for `NominalError`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nominalErrorDescriptor = $convert.base64Decode(
    'CgxOb21pbmFsRXJyb3ISOgoMZ2VuZXJpY0Vycm9yGAEgASgOMhYuRXJyb3JzLkdlbmVyaWNFcn'
    'Jvcl9FUgxnZW5lcmljRXJyb3I=');

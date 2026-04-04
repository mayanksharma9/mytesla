// This is a generated file - do not edit.
//
// Generated from common.proto.

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

@$core.Deprecated('Use invalidDescriptor instead')
const Invalid$json = {
  '1': 'Invalid',
  '2': [
    {'1': 'INVALID', '2': 0},
  ],
};

/// Descriptor for `Invalid`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List invalidDescriptor =
    $convert.base64Decode('CgdJbnZhbGlkEgsKB0lOVkFMSUQQAA==');

@$core.Deprecated('Use mediaPlaybackStatusDescriptor instead')
const MediaPlaybackStatus$json = {
  '1': 'MediaPlaybackStatus',
  '2': [
    {'1': 'Stopped', '2': 0},
    {'1': 'Playing', '2': 1},
    {'1': 'Paused', '2': 2},
  ],
};

/// Descriptor for `MediaPlaybackStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List mediaPlaybackStatusDescriptor = $convert.base64Decode(
    'ChNNZWRpYVBsYXliYWNrU3RhdHVzEgsKB1N0b3BwZWQQABILCgdQbGF5aW5nEAESCgoGUGF1c2'
    'VkEAI=');

@$core.Deprecated('Use stwHeatLevelDescriptor instead')
const StwHeatLevel$json = {
  '1': 'StwHeatLevel',
  '2': [
    {'1': 'StwHeatLevel_Unknown', '2': 0},
    {'1': 'StwHeatLevel_Off', '2': 1},
    {'1': 'StwHeatLevel_Low', '2': 2},
    {'1': 'StwHeatLevel_High', '2': 3},
  ],
};

/// Descriptor for `StwHeatLevel`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List stwHeatLevelDescriptor = $convert.base64Decode(
    'CgxTdHdIZWF0TGV2ZWwSGAoUU3R3SGVhdExldmVsX1Vua25vd24QABIUChBTdHdIZWF0TGV2ZW'
    'xfT2ZmEAESFAoQU3R3SGVhdExldmVsX0xvdxACEhUKEVN0d0hlYXRMZXZlbF9IaWdoEAM=');

@$core.Deprecated('Use voidDescriptor instead')
const Void$json = {
  '1': 'Void',
};

/// Descriptor for `Void`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List voidDescriptor = $convert.base64Decode('CgRWb2lk');

@$core.Deprecated('Use latLongDescriptor instead')
const LatLong$json = {
  '1': 'LatLong',
  '2': [
    {'1': 'latitude', '3': 1, '4': 1, '5': 2, '10': 'latitude'},
    {'1': 'longitude', '3': 2, '4': 1, '5': 2, '10': 'longitude'},
  ],
};

/// Descriptor for `LatLong`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List latLongDescriptor = $convert.base64Decode(
    'CgdMYXRMb25nEhoKCGxhdGl0dWRlGAEgASgCUghsYXRpdHVkZRIcCglsb25naXR1ZGUYAiABKA'
    'JSCWxvbmdpdHVkZQ==');

@$core.Deprecated('Use chargePortLatchStateDescriptor instead')
const ChargePortLatchState$json = {
  '1': 'ChargePortLatchState',
  '2': [
    {
      '1': 'SNA',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'SNA'
    },
    {
      '1': 'Disengaged',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Disengaged'
    },
    {
      '1': 'Engaged',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Engaged'
    },
    {
      '1': 'Blocking',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Blocking'
    },
  ],
  '8': [
    {'1': 'type'},
  ],
};

/// Descriptor for `ChargePortLatchState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chargePortLatchStateDescriptor = $convert.base64Decode(
    'ChRDaGFyZ2VQb3J0TGF0Y2hTdGF0ZRIjCgNTTkEYASABKAsyDy5DYXJTZXJ2ZXIuVm9pZEgAUg'
    'NTTkESMQoKRGlzZW5nYWdlZBgCIAEoCzIPLkNhclNlcnZlci5Wb2lkSABSCkRpc2VuZ2FnZWQS'
    'KwoHRW5nYWdlZBgDIAEoCzIPLkNhclNlcnZlci5Wb2lkSABSB0VuZ2FnZWQSLQoIQmxvY2tpbm'
    'cYBCABKAsyDy5DYXJTZXJ2ZXIuVm9pZEgAUghCbG9ja2luZ0IGCgR0eXBl');

@$core.Deprecated('Use preconditioningTimesDescriptor instead')
const PreconditioningTimes$json = {
  '1': 'PreconditioningTimes',
  '2': [
    {
      '1': 'all_week',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'allWeek'
    },
    {
      '1': 'weekdays',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'weekdays'
    },
  ],
  '8': [
    {'1': 'times'},
  ],
};

/// Descriptor for `PreconditioningTimes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List preconditioningTimesDescriptor = $convert.base64Decode(
    'ChRQcmVjb25kaXRpb25pbmdUaW1lcxIsCghhbGxfd2VlaxgBIAEoCzIPLkNhclNlcnZlci5Wb2'
    'lkSABSB2FsbFdlZWsSLQoId2Vla2RheXMYAiABKAsyDy5DYXJTZXJ2ZXIuVm9pZEgAUgh3ZWVr'
    'ZGF5c0IHCgV0aW1lcw==');

@$core.Deprecated('Use offPeakChargingTimesDescriptor instead')
const OffPeakChargingTimes$json = {
  '1': 'OffPeakChargingTimes',
  '2': [
    {
      '1': 'all_week',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'allWeek'
    },
    {
      '1': 'weekdays',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'weekdays'
    },
  ],
  '8': [
    {'1': 'times'},
  ],
};

/// Descriptor for `OffPeakChargingTimes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List offPeakChargingTimesDescriptor = $convert.base64Decode(
    'ChRPZmZQZWFrQ2hhcmdpbmdUaW1lcxIsCghhbGxfd2VlaxgBIAEoCzIPLkNhclNlcnZlci5Wb2'
    'lkSABSB2FsbFdlZWsSLQoId2Vla2RheXMYAiABKAsyDy5DYXJTZXJ2ZXIuVm9pZEgAUgh3ZWVr'
    'ZGF5c0IHCgV0aW1lcw==');

@$core.Deprecated('Use chargeScheduleDescriptor instead')
const ChargeSchedule$json = {
  '1': 'ChargeSchedule',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 4, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'days_of_week', '3': 3, '4': 1, '5': 5, '10': 'daysOfWeek'},
    {'1': 'start_enabled', '3': 4, '4': 1, '5': 8, '10': 'startEnabled'},
    {'1': 'start_time', '3': 5, '4': 1, '5': 5, '10': 'startTime'},
    {'1': 'end_enabled', '3': 6, '4': 1, '5': 8, '10': 'endEnabled'},
    {'1': 'end_time', '3': 7, '4': 1, '5': 5, '10': 'endTime'},
    {'1': 'one_time', '3': 8, '4': 1, '5': 8, '10': 'oneTime'},
    {'1': 'enabled', '3': 9, '4': 1, '5': 8, '10': 'enabled'},
    {'1': 'latitude', '3': 10, '4': 1, '5': 2, '10': 'latitude'},
    {'1': 'longitude', '3': 11, '4': 1, '5': 2, '10': 'longitude'},
  ],
};

/// Descriptor for `ChargeSchedule`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chargeScheduleDescriptor = $convert.base64Decode(
    'Cg5DaGFyZ2VTY2hlZHVsZRIOCgJpZBgBIAEoBFICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIgCg'
    'xkYXlzX29mX3dlZWsYAyABKAVSCmRheXNPZldlZWsSIwoNc3RhcnRfZW5hYmxlZBgEIAEoCFIM'
    'c3RhcnRFbmFibGVkEh0KCnN0YXJ0X3RpbWUYBSABKAVSCXN0YXJ0VGltZRIfCgtlbmRfZW5hYm'
    'xlZBgGIAEoCFIKZW5kRW5hYmxlZBIZCghlbmRfdGltZRgHIAEoBVIHZW5kVGltZRIZCghvbmVf'
    'dGltZRgIIAEoCFIHb25lVGltZRIYCgdlbmFibGVkGAkgASgIUgdlbmFibGVkEhoKCGxhdGl0dW'
    'RlGAogASgCUghsYXRpdHVkZRIcCglsb25naXR1ZGUYCyABKAJSCWxvbmdpdHVkZQ==');

@$core.Deprecated('Use preconditionScheduleDescriptor instead')
const PreconditionSchedule$json = {
  '1': 'PreconditionSchedule',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 4, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'days_of_week', '3': 3, '4': 1, '5': 5, '10': 'daysOfWeek'},
    {
      '1': 'precondition_time',
      '3': 4,
      '4': 1,
      '5': 5,
      '10': 'preconditionTime'
    },
    {'1': 'one_time', '3': 5, '4': 1, '5': 8, '10': 'oneTime'},
    {'1': 'enabled', '3': 6, '4': 1, '5': 8, '10': 'enabled'},
    {'1': 'latitude', '3': 7, '4': 1, '5': 2, '10': 'latitude'},
    {'1': 'longitude', '3': 8, '4': 1, '5': 2, '10': 'longitude'},
  ],
};

/// Descriptor for `PreconditionSchedule`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List preconditionScheduleDescriptor = $convert.base64Decode(
    'ChRQcmVjb25kaXRpb25TY2hlZHVsZRIOCgJpZBgBIAEoBFICaWQSEgoEbmFtZRgCIAEoCVIEbm'
    'FtZRIgCgxkYXlzX29mX3dlZWsYAyABKAVSCmRheXNPZldlZWsSKwoRcHJlY29uZGl0aW9uX3Rp'
    'bWUYBCABKAVSEHByZWNvbmRpdGlvblRpbWUSGQoIb25lX3RpbWUYBSABKAhSB29uZVRpbWUSGA'
    'oHZW5hYmxlZBgGIAEoCFIHZW5hYmxlZBIaCghsYXRpdHVkZRgHIAEoAlIIbGF0aXR1ZGUSHAoJ'
    'bG9uZ2l0dWRlGAggASgCUglsb25naXR1ZGU=');

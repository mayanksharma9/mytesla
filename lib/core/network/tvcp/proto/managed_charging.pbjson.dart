// This is a generated file - do not edit.
//
// Generated from managed_charging.proto.

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

@$core.Deprecated('Use chargeOnSolarNoChargeReasonDescriptor instead')
const ChargeOnSolarNoChargeReason$json = {
  '1': 'ChargeOnSolarNoChargeReason',
  '2': [
    {'1': 'CHARGE_ON_SOLAR_NO_CHARGE_REASON_INVALID', '2': 0},
    {'1': 'CHARGE_ON_SOLAR_NO_CHARGE_REASON_POWERWALL_CHARGE_PRIORITY', '2': 1},
    {'1': 'CHARGE_ON_SOLAR_NO_CHARGE_REASON_INSUFFICIENT_SOLAR', '2': 2},
    {'1': 'CHARGE_ON_SOLAR_NO_CHARGE_REASON_GRID_EXPORT_PRIORITY', '2': 3},
    {
      '1': 'CHARGE_ON_SOLAR_NO_CHARGE_REASON_ALTERNATE_VEHICLE_CHARGE_PRIORITY',
      '2': 4
    },
  ],
};

/// Descriptor for `ChargeOnSolarNoChargeReason`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List chargeOnSolarNoChargeReasonDescriptor = $convert.base64Decode(
    'ChtDaGFyZ2VPblNvbGFyTm9DaGFyZ2VSZWFzb24SLAooQ0hBUkdFX09OX1NPTEFSX05PX0NIQV'
    'JHRV9SRUFTT05fSU5WQUxJRBAAEj4KOkNIQVJHRV9PTl9TT0xBUl9OT19DSEFSR0VfUkVBU09O'
    'X1BPV0VSV0FMTF9DSEFSR0VfUFJJT1JJVFkQARI3CjNDSEFSR0VfT05fU09MQVJfTk9fQ0hBUk'
    'dFX1JFQVNPTl9JTlNVRkZJQ0lFTlRfU09MQVIQAhI5CjVDSEFSR0VfT05fU09MQVJfTk9fQ0hB'
    'UkdFX1JFQVNPTl9HUklEX0VYUE9SVF9QUklPUklUWRADEkYKQkNIQVJHRV9PTl9TT0xBUl9OT1'
    '9DSEFSR0VfUkVBU09OX0FMVEVSTkFURV9WRUhJQ0xFX0NIQVJHRV9QUklPUklUWRAE');

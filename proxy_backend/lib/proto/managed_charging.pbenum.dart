// This is a generated file - do not edit.
//
// Generated from managed_charging.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// The reasons why the site controller may recommend no charge.
/// The site controller will only return the highest priority reason to the vehicle.
class ChargeOnSolarNoChargeReason extends $pb.ProtobufEnum {
  static const ChargeOnSolarNoChargeReason
      CHARGE_ON_SOLAR_NO_CHARGE_REASON_INVALID = ChargeOnSolarNoChargeReason._(
          0, _omitEnumNames ? '' : 'CHARGE_ON_SOLAR_NO_CHARGE_REASON_INVALID');

  /// The Powerwall is being prioritized over the vehicle to charge.
  static const ChargeOnSolarNoChargeReason
      CHARGE_ON_SOLAR_NO_CHARGE_REASON_POWERWALL_CHARGE_PRIORITY =
      ChargeOnSolarNoChargeReason._(
          1,
          _omitEnumNames
              ? ''
              : 'CHARGE_ON_SOLAR_NO_CHARGE_REASON_POWERWALL_CHARGE_PRIORITY');

  /// There is not enough solar for the vehicle to charge effectively.
  static const ChargeOnSolarNoChargeReason
      CHARGE_ON_SOLAR_NO_CHARGE_REASON_INSUFFICIENT_SOLAR =
      ChargeOnSolarNoChargeReason._(
          2,
          _omitEnumNames
              ? ''
              : 'CHARGE_ON_SOLAR_NO_CHARGE_REASON_INSUFFICIENT_SOLAR');

  /// The site controller is prioritizing export to the grid. This can
  /// happen when the site controller is in autonomous mode and it is
  /// most economical to export excess solar to the grid, or during a
  /// virtual power plant event.
  static const ChargeOnSolarNoChargeReason
      CHARGE_ON_SOLAR_NO_CHARGE_REASON_GRID_EXPORT_PRIORITY =
      ChargeOnSolarNoChargeReason._(
          3,
          _omitEnumNames
              ? ''
              : 'CHARGE_ON_SOLAR_NO_CHARGE_REASON_GRID_EXPORT_PRIORITY');

  /// Another vehicle is charging on solar at this location and has priority.
  static const ChargeOnSolarNoChargeReason
      CHARGE_ON_SOLAR_NO_CHARGE_REASON_ALTERNATE_VEHICLE_CHARGE_PRIORITY =
      ChargeOnSolarNoChargeReason._(
          4,
          _omitEnumNames
              ? ''
              : 'CHARGE_ON_SOLAR_NO_CHARGE_REASON_ALTERNATE_VEHICLE_CHARGE_PRIORITY');

  static const $core.List<ChargeOnSolarNoChargeReason> values =
      <ChargeOnSolarNoChargeReason>[
    CHARGE_ON_SOLAR_NO_CHARGE_REASON_INVALID,
    CHARGE_ON_SOLAR_NO_CHARGE_REASON_POWERWALL_CHARGE_PRIORITY,
    CHARGE_ON_SOLAR_NO_CHARGE_REASON_INSUFFICIENT_SOLAR,
    CHARGE_ON_SOLAR_NO_CHARGE_REASON_GRID_EXPORT_PRIORITY,
    CHARGE_ON_SOLAR_NO_CHARGE_REASON_ALTERNATE_VEHICLE_CHARGE_PRIORITY,
  ];

  static final $core.List<ChargeOnSolarNoChargeReason?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static ChargeOnSolarNoChargeReason? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ChargeOnSolarNoChargeReason._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

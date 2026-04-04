// This is a generated file - do not edit.
//
// Generated from vehicle.proto.

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

@$core.Deprecated('Use mediaSourceTypeDescriptor instead')
const MediaSourceType$json = {
  '1': 'MediaSourceType',
  '2': [
    {'1': 'MediaSourceType_None', '2': 0},
    {'1': 'MediaSourceType_AM', '2': 1},
    {'1': 'MediaSourceType_FM', '2': 2},
    {'1': 'MediaSourceType_XM', '2': 3},
    {'1': 'MediaSourceType_Slacker', '2': 5},
    {'1': 'MediaSourceType_LocalFiles', '2': 6},
    {'1': 'MediaSourceType_iPod', '2': 7},
    {'1': 'MediaSourceType_Bluetooth', '2': 8},
    {'1': 'MediaSourceType_AuxIn', '2': 9},
    {'1': 'MediaSourceType_DAB', '2': 10},
    {'1': 'MediaSourceType_Rdio', '2': 11},
    {'1': 'MediaSourceType_Spotify', '2': 12},
    {'1': 'MediaSourceType_USRadio', '2': 13},
    {'1': 'MediaSourceType_EURadio', '2': 14},
    {'1': 'MediaSourceType_MediaFile', '2': 16},
    {'1': 'MediaSourceType_TuneIn', '2': 17},
    {'1': 'MediaSourceType_Stingray', '2': 18},
    {'1': 'MediaSourceType_SiriusXM', '2': 19},
    {'1': 'MediaSourceType_Tidal', '2': 20},
    {'1': 'MediaSourceType_QQMusic', '2': 21},
    {'1': 'MediaSourceType_QQMusic2', '2': 22},
    {'1': 'MediaSourceType_Ximalaya', '2': 23},
    {'1': 'MediaSourceType_OnlineRadio', '2': 24},
    {'1': 'MediaSourceType_OnlineRadio2', '2': 25},
    {'1': 'MediaSourceType_NetEaseMusic', '2': 26},
    {'1': 'MediaSourceType_Browser', '2': 28},
    {'1': 'MediaSourceType_Theater', '2': 29},
    {'1': 'MediaSourceType_Game', '2': 30},
    {'1': 'MediaSourceType_Tutorial', '2': 31},
    {'1': 'MediaSourceType_Toybox', '2': 32},
    {'1': 'MediaSourceType_RecentsFavorites', '2': 33},
    {'1': 'MediaSourceType_HomeApps', '2': 34},
    {'1': 'MediaSourceType_Search', '2': 35},
  ],
};

/// Descriptor for `MediaSourceType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List mediaSourceTypeDescriptor = $convert.base64Decode(
    'Cg9NZWRpYVNvdXJjZVR5cGUSGAoUTWVkaWFTb3VyY2VUeXBlX05vbmUQABIWChJNZWRpYVNvdX'
    'JjZVR5cGVfQU0QARIWChJNZWRpYVNvdXJjZVR5cGVfRk0QAhIWChJNZWRpYVNvdXJjZVR5cGVf'
    'WE0QAxIbChdNZWRpYVNvdXJjZVR5cGVfU2xhY2tlchAFEh4KGk1lZGlhU291cmNlVHlwZV9Mb2'
    'NhbEZpbGVzEAYSGAoUTWVkaWFTb3VyY2VUeXBlX2lQb2QQBxIdChlNZWRpYVNvdXJjZVR5cGVf'
    'Qmx1ZXRvb3RoEAgSGQoVTWVkaWFTb3VyY2VUeXBlX0F1eEluEAkSFwoTTWVkaWFTb3VyY2VUeX'
    'BlX0RBQhAKEhgKFE1lZGlhU291cmNlVHlwZV9SZGlvEAsSGwoXTWVkaWFTb3VyY2VUeXBlX1Nw'
    'b3RpZnkQDBIbChdNZWRpYVNvdXJjZVR5cGVfVVNSYWRpbxANEhsKF01lZGlhU291cmNlVHlwZV'
    '9FVVJhZGlvEA4SHQoZTWVkaWFTb3VyY2VUeXBlX01lZGlhRmlsZRAQEhoKFk1lZGlhU291cmNl'
    'VHlwZV9UdW5lSW4QERIcChhNZWRpYVNvdXJjZVR5cGVfU3RpbmdyYXkQEhIcChhNZWRpYVNvdX'
    'JjZVR5cGVfU2lyaXVzWE0QExIZChVNZWRpYVNvdXJjZVR5cGVfVGlkYWwQFBIbChdNZWRpYVNv'
    'dXJjZVR5cGVfUVFNdXNpYxAVEhwKGE1lZGlhU291cmNlVHlwZV9RUU11c2ljMhAWEhwKGE1lZG'
    'lhU291cmNlVHlwZV9YaW1hbGF5YRAXEh8KG01lZGlhU291cmNlVHlwZV9PbmxpbmVSYWRpbxAY'
    'EiAKHE1lZGlhU291cmNlVHlwZV9PbmxpbmVSYWRpbzIQGRIgChxNZWRpYVNvdXJjZVR5cGVfTm'
    'V0RWFzZU11c2ljEBoSGwoXTWVkaWFTb3VyY2VUeXBlX0Jyb3dzZXIQHBIbChdNZWRpYVNvdXJj'
    'ZVR5cGVfVGhlYXRlchAdEhgKFE1lZGlhU291cmNlVHlwZV9HYW1lEB4SHAoYTWVkaWFTb3VyY2'
    'VUeXBlX1R1dG9yaWFsEB8SGgoWTWVkaWFTb3VyY2VUeXBlX1RveWJveBAgEiQKIE1lZGlhU291'
    'cmNlVHlwZV9SZWNlbnRzRmF2b3JpdGVzECESHAoYTWVkaWFTb3VyY2VUeXBlX0hvbWVBcHBzEC'
    'ISGgoWTWVkaWFTb3VyY2VUeXBlX1NlYXJjaBAj');

@$core.Deprecated('Use vehicleDataDescriptor instead')
const VehicleData$json = {
  '1': 'VehicleData',
  '2': [
    {
      '1': 'charge_state',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.CarServer.ChargeState',
      '10': 'chargeState'
    },
    {
      '1': 'climate_state',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.CarServer.ClimateState',
      '10': 'climateState'
    },
    {
      '1': 'drive_state',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.CarServer.DriveState',
      '10': 'driveState'
    },
    {
      '1': 'location_state',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.CarServer.LocationState',
      '10': 'locationState'
    },
    {
      '1': 'closures_state',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.CarServer.ClosuresState',
      '10': 'closuresState'
    },
    {
      '1': 'charge_schedule_state',
      '3': 15,
      '4': 1,
      '5': 11,
      '6': '.CarServer.ChargeScheduleState',
      '10': 'chargeScheduleState'
    },
    {
      '1': 'preconditioning_schedule_state',
      '3': 16,
      '4': 1,
      '5': 11,
      '6': '.CarServer.PreconditioningScheduleState',
      '10': 'preconditioningScheduleState'
    },
    {
      '1': 'tire_pressure_state',
      '3': 19,
      '4': 1,
      '5': 11,
      '6': '.CarServer.TirePressureState',
      '10': 'tirePressureState'
    },
    {
      '1': 'media_state',
      '3': 20,
      '4': 1,
      '5': 11,
      '6': '.CarServer.MediaState',
      '10': 'mediaState'
    },
    {
      '1': 'media_detail_state',
      '3': 21,
      '4': 1,
      '5': 11,
      '6': '.CarServer.MediaDetailState',
      '10': 'mediaDetailState'
    },
    {
      '1': 'software_update_state',
      '3': 23,
      '4': 1,
      '5': 11,
      '6': '.CarServer.SoftwareUpdateState',
      '10': 'softwareUpdateState'
    },
    {
      '1': 'parental_controls_state',
      '3': 24,
      '4': 1,
      '5': 11,
      '6': '.CarServer.ParentalControlsState',
      '10': 'parentalControlsState'
    },
  ],
};

/// Descriptor for `VehicleData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List vehicleDataDescriptor = $convert.base64Decode(
    'CgtWZWhpY2xlRGF0YRI5CgxjaGFyZ2Vfc3RhdGUYAyABKAsyFi5DYXJTZXJ2ZXIuQ2hhcmdlU3'
    'RhdGVSC2NoYXJnZVN0YXRlEjwKDWNsaW1hdGVfc3RhdGUYBCABKAsyFy5DYXJTZXJ2ZXIuQ2xp'
    'bWF0ZVN0YXRlUgxjbGltYXRlU3RhdGUSNgoLZHJpdmVfc3RhdGUYBSABKAsyFS5DYXJTZXJ2ZX'
    'IuRHJpdmVTdGF0ZVIKZHJpdmVTdGF0ZRI/Cg5sb2NhdGlvbl9zdGF0ZRgIIAEoCzIYLkNhclNl'
    'cnZlci5Mb2NhdGlvblN0YXRlUg1sb2NhdGlvblN0YXRlEj8KDmNsb3N1cmVzX3N0YXRlGAkgAS'
    'gLMhguQ2FyU2VydmVyLkNsb3N1cmVzU3RhdGVSDWNsb3N1cmVzU3RhdGUSUgoVY2hhcmdlX3Nj'
    'aGVkdWxlX3N0YXRlGA8gASgLMh4uQ2FyU2VydmVyLkNoYXJnZVNjaGVkdWxlU3RhdGVSE2NoYX'
    'JnZVNjaGVkdWxlU3RhdGUSbQoecHJlY29uZGl0aW9uaW5nX3NjaGVkdWxlX3N0YXRlGBAgASgL'
    'MicuQ2FyU2VydmVyLlByZWNvbmRpdGlvbmluZ1NjaGVkdWxlU3RhdGVSHHByZWNvbmRpdGlvbm'
    'luZ1NjaGVkdWxlU3RhdGUSTAoTdGlyZV9wcmVzc3VyZV9zdGF0ZRgTIAEoCzIcLkNhclNlcnZl'
    'ci5UaXJlUHJlc3N1cmVTdGF0ZVIRdGlyZVByZXNzdXJlU3RhdGUSNgoLbWVkaWFfc3RhdGUYFC'
    'ABKAsyFS5DYXJTZXJ2ZXIuTWVkaWFTdGF0ZVIKbWVkaWFTdGF0ZRJJChJtZWRpYV9kZXRhaWxf'
    'c3RhdGUYFSABKAsyGy5DYXJTZXJ2ZXIuTWVkaWFEZXRhaWxTdGF0ZVIQbWVkaWFEZXRhaWxTdG'
    'F0ZRJSChVzb2Z0d2FyZV91cGRhdGVfc3RhdGUYFyABKAsyHi5DYXJTZXJ2ZXIuU29mdHdhcmVV'
    'cGRhdGVTdGF0ZVITc29mdHdhcmVVcGRhdGVTdGF0ZRJYChdwYXJlbnRhbF9jb250cm9sc19zdG'
    'F0ZRgYIAEoCzIgLkNhclNlcnZlci5QYXJlbnRhbENvbnRyb2xzU3RhdGVSFXBhcmVudGFsQ29u'
    'dHJvbHNTdGF0ZQ==');

@$core.Deprecated('Use closuresStateDescriptor instead')
const ClosuresState$json = {
  '1': 'ClosuresState',
  '2': [
    {
      '1': 'door_open_driver_front',
      '3': 101,
      '4': 1,
      '5': 8,
      '9': 0,
      '10': 'doorOpenDriverFront'
    },
    {
      '1': 'door_open_driver_rear',
      '3': 102,
      '4': 1,
      '5': 8,
      '9': 1,
      '10': 'doorOpenDriverRear'
    },
    {
      '1': 'door_open_passenger_front',
      '3': 103,
      '4': 1,
      '5': 8,
      '9': 2,
      '10': 'doorOpenPassengerFront'
    },
    {
      '1': 'door_open_passenger_rear',
      '3': 104,
      '4': 1,
      '5': 8,
      '9': 3,
      '10': 'doorOpenPassengerRear'
    },
    {
      '1': 'door_open_trunk_front',
      '3': 105,
      '4': 1,
      '5': 8,
      '9': 4,
      '10': 'doorOpenTrunkFront'
    },
    {
      '1': 'door_open_trunk_rear',
      '3': 106,
      '4': 1,
      '5': 8,
      '9': 5,
      '10': 'doorOpenTrunkRear'
    },
    {
      '1': 'window_open_driver_front',
      '3': 107,
      '4': 1,
      '5': 8,
      '9': 6,
      '10': 'windowOpenDriverFront'
    },
    {
      '1': 'window_open_passenger_front',
      '3': 108,
      '4': 1,
      '5': 8,
      '9': 7,
      '10': 'windowOpenPassengerFront'
    },
    {
      '1': 'window_open_driver_rear',
      '3': 109,
      '4': 1,
      '5': 8,
      '9': 8,
      '10': 'windowOpenDriverRear'
    },
    {
      '1': 'window_open_passenger_rear',
      '3': 110,
      '4': 1,
      '5': 8,
      '9': 9,
      '10': 'windowOpenPassengerRear'
    },
    {
      '1': 'sun_roof_state',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.CarServer.ClosuresState.SunRoofState',
      '10': 'sunRoofState'
    },
    {
      '1': 'sun_roof_percent_open',
      '3': 112,
      '4': 1,
      '5': 5,
      '9': 10,
      '10': 'sunRoofPercentOpen'
    },
    {'1': 'locked', '3': 113, '4': 1, '5': 8, '9': 11, '10': 'locked'},
    {
      '1': 'is_user_present',
      '3': 114,
      '4': 1,
      '5': 8,
      '9': 12,
      '10': 'isUserPresent'
    },
    {
      '1': 'center_display_state',
      '3': 15,
      '4': 1,
      '5': 11,
      '6': '.CarServer.ClosuresState.DisplayState',
      '10': 'centerDisplayState'
    },
    {
      '1': 'remote_start',
      '3': 116,
      '4': 1,
      '5': 8,
      '9': 13,
      '10': 'remoteStart'
    },
    {'1': 'valet_mode', '3': 117, '4': 1, '5': 8, '9': 14, '10': 'valetMode'},
    {
      '1': 'valet_pin_needed',
      '3': 118,
      '4': 1,
      '5': 8,
      '9': 15,
      '10': 'valetPinNeeded'
    },
    {
      '1': 'sentry_mode_state',
      '3': 19,
      '4': 1,
      '5': 11,
      '6': '.CarServer.ClosuresState.SentryModeState',
      '10': 'sentryModeState'
    },
    {
      '1': 'sentry_mode_available',
      '3': 120,
      '4': 1,
      '5': 8,
      '9': 16,
      '10': 'sentryModeAvailable'
    },
    {
      '1': 'speed_limit_mode',
      '3': 22,
      '4': 1,
      '5': 11,
      '6': '.CarServer.SpeedLimitMode',
      '10': 'speedLimitMode'
    },
    {
      '1': 'tonneau_state',
      '3': 23,
      '4': 1,
      '5': 14,
      '6': '.VCSEC.ClosureState_E',
      '9': 17,
      '10': 'tonneauState'
    },
    {
      '1': 'tonneau_percent_open',
      '3': 24,
      '4': 1,
      '5': 13,
      '9': 18,
      '10': 'tonneauPercentOpen'
    },
    {
      '1': 'tonneau_in_motion',
      '3': 25,
      '4': 1,
      '5': 8,
      '9': 19,
      '10': 'tonneauInMotion'
    },
    {
      '1': 'timestamp',
      '3': 2000,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'timestamp'
    },
  ],
  '3': [
    ClosuresState_SunRoofState$json,
    ClosuresState_DisplayState$json,
    ClosuresState_SentryModeState$json
  ],
  '8': [
    {'1': 'optional_door_open_driver_front'},
    {'1': 'optional_door_open_driver_rear'},
    {'1': 'optional_door_open_passenger_front'},
    {'1': 'optional_door_open_passenger_rear'},
    {'1': 'optional_door_open_trunk_front'},
    {'1': 'optional_door_open_trunk_rear'},
    {'1': 'optional_window_open_driver_front'},
    {'1': 'optional_window_open_passenger_front'},
    {'1': 'optional_window_open_driver_rear'},
    {'1': 'optional_window_open_passenger_rear'},
    {'1': 'optional_sun_roof_percent_open'},
    {'1': 'optional_locked'},
    {'1': 'optional_is_user_present'},
    {'1': 'optional_remote_start'},
    {'1': 'optional_valet_mode'},
    {'1': 'optional_valet_pin_needed'},
    {'1': 'optional_sentry_mode_available'},
    {'1': 'optional_tonneau_state'},
    {'1': 'optional_tonneau_percent_open'},
    {'1': 'optional_tonneau_in_motion'},
  ],
};

@$core.Deprecated('Use closuresStateDescriptor instead')
const ClosuresState_SunRoofState$json = {
  '1': 'SunRoofState',
  '2': [
    {
      '1': 'Unknown',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Unknown'
    },
    {
      '1': 'Calibrating',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Calibrating'
    },
    {
      '1': 'Closed',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Closed'
    },
    {
      '1': 'Open',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Open'
    },
    {
      '1': 'Moving',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Moving'
    },
    {
      '1': 'Vent',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Vent'
    },
  ],
  '8': [
    {'1': 'type'},
  ],
};

@$core.Deprecated('Use closuresStateDescriptor instead')
const ClosuresState_DisplayState$json = {
  '1': 'DisplayState',
  '2': [
    {
      '1': 'Off',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Off'
    },
    {
      '1': 'Dim',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Dim'
    },
    {
      '1': 'Accessory',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Accessory'
    },
    {
      '1': 'On',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'On'
    },
    {
      '1': 'Driving',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Driving'
    },
    {
      '1': 'Charging',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Charging'
    },
    {
      '1': 'Lock',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Lock'
    },
    {
      '1': 'Sentry',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Sentry'
    },
    {
      '1': 'Dog',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Dog'
    },
    {
      '1': 'Entertainment',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Entertainment'
    },
  ],
  '8': [
    {'1': 'type'},
  ],
};

@$core.Deprecated('Use closuresStateDescriptor instead')
const ClosuresState_SentryModeState$json = {
  '1': 'SentryModeState',
  '2': [
    {
      '1': 'Off',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Off'
    },
    {
      '1': 'Idle',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Idle'
    },
    {
      '1': 'Armed',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Armed'
    },
    {
      '1': 'Aware',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Aware'
    },
    {
      '1': 'Panic',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Panic'
    },
    {
      '1': 'Quiet',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Quiet'
    },
  ],
  '8': [
    {'1': 'type'},
  ],
};

/// Descriptor for `ClosuresState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List closuresStateDescriptor = $convert.base64Decode(
    'Cg1DbG9zdXJlc1N0YXRlEjUKFmRvb3Jfb3Blbl9kcml2ZXJfZnJvbnQYZSABKAhIAFITZG9vck'
    '9wZW5Ecml2ZXJGcm9udBIzChVkb29yX29wZW5fZHJpdmVyX3JlYXIYZiABKAhIAVISZG9vck9w'
    'ZW5Ecml2ZXJSZWFyEjsKGWRvb3Jfb3Blbl9wYXNzZW5nZXJfZnJvbnQYZyABKAhIAlIWZG9vck'
    '9wZW5QYXNzZW5nZXJGcm9udBI5Chhkb29yX29wZW5fcGFzc2VuZ2VyX3JlYXIYaCABKAhIA1IV'
    'ZG9vck9wZW5QYXNzZW5nZXJSZWFyEjMKFWRvb3Jfb3Blbl90cnVua19mcm9udBhpIAEoCEgEUh'
    'Jkb29yT3BlblRydW5rRnJvbnQSMQoUZG9vcl9vcGVuX3RydW5rX3JlYXIYaiABKAhIBVIRZG9v'
    'ck9wZW5UcnVua1JlYXISOQoYd2luZG93X29wZW5fZHJpdmVyX2Zyb250GGsgASgISAZSFXdpbm'
    'Rvd09wZW5Ecml2ZXJGcm9udBI/Cht3aW5kb3dfb3Blbl9wYXNzZW5nZXJfZnJvbnQYbCABKAhI'
    'B1IYd2luZG93T3BlblBhc3NlbmdlckZyb250EjcKF3dpbmRvd19vcGVuX2RyaXZlcl9yZWFyGG'
    '0gASgISAhSFHdpbmRvd09wZW5Ecml2ZXJSZWFyEj0KGndpbmRvd19vcGVuX3Bhc3Nlbmdlcl9y'
    'ZWFyGG4gASgISAlSF3dpbmRvd09wZW5QYXNzZW5nZXJSZWFyEksKDnN1bl9yb29mX3N0YXRlGA'
    'sgASgLMiUuQ2FyU2VydmVyLkNsb3N1cmVzU3RhdGUuU3VuUm9vZlN0YXRlUgxzdW5Sb29mU3Rh'
    'dGUSMwoVc3VuX3Jvb2ZfcGVyY2VudF9vcGVuGHAgASgFSApSEnN1blJvb2ZQZXJjZW50T3Blbh'
    'IYCgZsb2NrZWQYcSABKAhIC1IGbG9ja2VkEigKD2lzX3VzZXJfcHJlc2VudBhyIAEoCEgMUg1p'
    'c1VzZXJQcmVzZW50ElcKFGNlbnRlcl9kaXNwbGF5X3N0YXRlGA8gASgLMiUuQ2FyU2VydmVyLk'
    'Nsb3N1cmVzU3RhdGUuRGlzcGxheVN0YXRlUhJjZW50ZXJEaXNwbGF5U3RhdGUSIwoMcmVtb3Rl'
    'X3N0YXJ0GHQgASgISA1SC3JlbW90ZVN0YXJ0Eh8KCnZhbGV0X21vZGUYdSABKAhIDlIJdmFsZX'
    'RNb2RlEioKEHZhbGV0X3Bpbl9uZWVkZWQYdiABKAhID1IOdmFsZXRQaW5OZWVkZWQSVAoRc2Vu'
    'dHJ5X21vZGVfc3RhdGUYEyABKAsyKC5DYXJTZXJ2ZXIuQ2xvc3VyZXNTdGF0ZS5TZW50cnlNb2'
    'RlU3RhdGVSD3NlbnRyeU1vZGVTdGF0ZRI0ChVzZW50cnlfbW9kZV9hdmFpbGFibGUYeCABKAhI'
    'EFITc2VudHJ5TW9kZUF2YWlsYWJsZRJDChBzcGVlZF9saW1pdF9tb2RlGBYgASgLMhkuQ2FyU2'
    'VydmVyLlNwZWVkTGltaXRNb2RlUg5zcGVlZExpbWl0TW9kZRI8Cg10b25uZWF1X3N0YXRlGBcg'
    'ASgOMhUuVkNTRUMuQ2xvc3VyZVN0YXRlX0VIEVIMdG9ubmVhdVN0YXRlEjIKFHRvbm5lYXVfcG'
    'VyY2VudF9vcGVuGBggASgNSBJSEnRvbm5lYXVQZXJjZW50T3BlbhIsChF0b25uZWF1X2luX21v'
    'dGlvbhgZIAEoCEgTUg90b25uZWF1SW5Nb3Rpb24SOQoJdGltZXN0YW1wGNAPIAEoCzIaLmdvb2'
    'dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXRpbWVzdGFtcBqcAgoMU3VuUm9vZlN0YXRlEisKB1Vu'
    'a25vd24YASABKAsyDy5DYXJTZXJ2ZXIuVm9pZEgAUgdVbmtub3duEjMKC0NhbGlicmF0aW5nGA'
    'IgASgLMg8uQ2FyU2VydmVyLlZvaWRIAFILQ2FsaWJyYXRpbmcSKQoGQ2xvc2VkGAMgASgLMg8u'
    'Q2FyU2VydmVyLlZvaWRIAFIGQ2xvc2VkEiUKBE9wZW4YBCABKAsyDy5DYXJTZXJ2ZXIuVm9pZE'
    'gAUgRPcGVuEikKBk1vdmluZxgFIAEoCzIPLkNhclNlcnZlci5Wb2lkSABSBk1vdmluZxIlCgRW'
    'ZW50GAYgASgLMg8uQ2FyU2VydmVyLlZvaWRIAFIEVmVudEIGCgR0eXBlGsADCgxEaXNwbGF5U3'
    'RhdGUSIwoDT2ZmGAEgASgLMg8uQ2FyU2VydmVyLlZvaWRIAFIDT2ZmEiMKA0RpbRgCIAEoCzIP'
    'LkNhclNlcnZlci5Wb2lkSABSA0RpbRIvCglBY2Nlc3NvcnkYAyABKAsyDy5DYXJTZXJ2ZXIuVm'
    '9pZEgAUglBY2Nlc3NvcnkSIQoCT24YBCABKAsyDy5DYXJTZXJ2ZXIuVm9pZEgAUgJPbhIrCgdE'
    'cml2aW5nGAUgASgLMg8uQ2FyU2VydmVyLlZvaWRIAFIHRHJpdmluZxItCghDaGFyZ2luZxgGIA'
    'EoCzIPLkNhclNlcnZlci5Wb2lkSABSCENoYXJnaW5nEiUKBExvY2sYByABKAsyDy5DYXJTZXJ2'
    'ZXIuVm9pZEgAUgRMb2NrEikKBlNlbnRyeRgIIAEoCzIPLkNhclNlcnZlci5Wb2lkSABSBlNlbn'
    'RyeRIjCgNEb2cYCSABKAsyDy5DYXJTZXJ2ZXIuVm9pZEgAUgNEb2cSNwoNRW50ZXJ0YWlubWVu'
    'dBgKIAEoCzIPLkNhclNlcnZlci5Wb2lkSABSDUVudGVydGFpbm1lbnRCBgoEdHlwZRqJAgoPU2'
    'VudHJ5TW9kZVN0YXRlEiMKA09mZhgBIAEoCzIPLkNhclNlcnZlci5Wb2lkSABSA09mZhIlCgRJ'
    'ZGxlGAIgASgLMg8uQ2FyU2VydmVyLlZvaWRIAFIESWRsZRInCgVBcm1lZBgDIAEoCzIPLkNhcl'
    'NlcnZlci5Wb2lkSABSBUFybWVkEicKBUF3YXJlGAQgASgLMg8uQ2FyU2VydmVyLlZvaWRIAFIF'
    'QXdhcmUSJwoFUGFuaWMYBSABKAsyDy5DYXJTZXJ2ZXIuVm9pZEgAUgVQYW5pYxInCgVRdWlldB'
    'gGIAEoCzIPLkNhclNlcnZlci5Wb2lkSABSBVF1aWV0QgYKBHR5cGVCIQofb3B0aW9uYWxfZG9v'
    'cl9vcGVuX2RyaXZlcl9mcm9udEIgCh5vcHRpb25hbF9kb29yX29wZW5fZHJpdmVyX3JlYXJCJA'
    'oib3B0aW9uYWxfZG9vcl9vcGVuX3Bhc3Nlbmdlcl9mcm9udEIjCiFvcHRpb25hbF9kb29yX29w'
    'ZW5fcGFzc2VuZ2VyX3JlYXJCIAoeb3B0aW9uYWxfZG9vcl9vcGVuX3RydW5rX2Zyb250Qh8KHW'
    '9wdGlvbmFsX2Rvb3Jfb3Blbl90cnVua19yZWFyQiMKIW9wdGlvbmFsX3dpbmRvd19vcGVuX2Ry'
    'aXZlcl9mcm9udEImCiRvcHRpb25hbF93aW5kb3dfb3Blbl9wYXNzZW5nZXJfZnJvbnRCIgogb3'
    'B0aW9uYWxfd2luZG93X29wZW5fZHJpdmVyX3JlYXJCJQojb3B0aW9uYWxfd2luZG93X29wZW5f'
    'cGFzc2VuZ2VyX3JlYXJCIAoeb3B0aW9uYWxfc3VuX3Jvb2ZfcGVyY2VudF9vcGVuQhEKD29wdG'
    'lvbmFsX2xvY2tlZEIaChhvcHRpb25hbF9pc191c2VyX3ByZXNlbnRCFwoVb3B0aW9uYWxfcmVt'
    'b3RlX3N0YXJ0QhUKE29wdGlvbmFsX3ZhbGV0X21vZGVCGwoZb3B0aW9uYWxfdmFsZXRfcGluX2'
    '5lZWRlZEIgCh5vcHRpb25hbF9zZW50cnlfbW9kZV9hdmFpbGFibGVCGAoWb3B0aW9uYWxfdG9u'
    'bmVhdV9zdGF0ZUIfCh1vcHRpb25hbF90b25uZWF1X3BlcmNlbnRfb3BlbkIcChpvcHRpb25hbF'
    '90b25uZWF1X2luX21vdGlvbg==');

@$core.Deprecated('Use chargeScheduleStateDescriptor instead')
const ChargeScheduleState$json = {
  '1': 'ChargeScheduleState',
  '2': [
    {
      '1': 'charge_schedules',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.CarServer.ChargeSchedule',
      '10': 'chargeSchedules'
    },
    {
      '1': 'charge_schedule_window',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.CarServer.ChargeSchedule',
      '9': 0,
      '10': 'chargeScheduleWindow'
    },
    {
      '1': 'charge_buffer',
      '3': 3,
      '4': 1,
      '5': 5,
      '9': 1,
      '10': 'chargeBuffer'
    },
    {
      '1': 'max_num_charge_schedules',
      '3': 4,
      '4': 1,
      '5': 13,
      '9': 2,
      '10': 'maxNumChargeSchedules'
    },
    {
      '1': 'next_schedule',
      '3': 5,
      '4': 1,
      '5': 8,
      '9': 3,
      '10': 'nextSchedule'
    },
    {
      '1': 'show_schedule_complete_state',
      '3': 6,
      '4': 1,
      '5': 8,
      '9': 4,
      '10': 'showScheduleCompleteState'
    },
    {
      '1': 'timestamp',
      '3': 2000,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'timestamp'
    },
  ],
  '8': [
    {'1': 'optional_charge_schedule_window'},
    {'1': 'optional_charge_buffer'},
    {'1': 'optional_max_num_charge_schedules'},
    {'1': 'optional_next_schedule'},
    {'1': 'optional_show_schedule_complete_state'},
  ],
};

/// Descriptor for `ChargeScheduleState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chargeScheduleStateDescriptor = $convert.base64Decode(
    'ChNDaGFyZ2VTY2hlZHVsZVN0YXRlEkQKEGNoYXJnZV9zY2hlZHVsZXMYASADKAsyGS5DYXJTZX'
    'J2ZXIuQ2hhcmdlU2NoZWR1bGVSD2NoYXJnZVNjaGVkdWxlcxJRChZjaGFyZ2Vfc2NoZWR1bGVf'
    'd2luZG93GAIgASgLMhkuQ2FyU2VydmVyLkNoYXJnZVNjaGVkdWxlSABSFGNoYXJnZVNjaGVkdW'
    'xlV2luZG93EiUKDWNoYXJnZV9idWZmZXIYAyABKAVIAVIMY2hhcmdlQnVmZmVyEjkKGG1heF9u'
    'dW1fY2hhcmdlX3NjaGVkdWxlcxgEIAEoDUgCUhVtYXhOdW1DaGFyZ2VTY2hlZHVsZXMSJQoNbm'
    'V4dF9zY2hlZHVsZRgFIAEoCEgDUgxuZXh0U2NoZWR1bGUSQQocc2hvd19zY2hlZHVsZV9jb21w'
    'bGV0ZV9zdGF0ZRgGIAEoCEgEUhlzaG93U2NoZWR1bGVDb21wbGV0ZVN0YXRlEjkKCXRpbWVzdG'
    'FtcBjQDyABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgl0aW1lc3RhbXBCIQofb3B0'
    'aW9uYWxfY2hhcmdlX3NjaGVkdWxlX3dpbmRvd0IYChZvcHRpb25hbF9jaGFyZ2VfYnVmZmVyQi'
    'MKIW9wdGlvbmFsX21heF9udW1fY2hhcmdlX3NjaGVkdWxlc0IYChZvcHRpb25hbF9uZXh0X3Nj'
    'aGVkdWxlQicKJW9wdGlvbmFsX3Nob3dfc2NoZWR1bGVfY29tcGxldGVfc3RhdGU=');

@$core.Deprecated('Use preconditioningScheduleStateDescriptor instead')
const PreconditioningScheduleState$json = {
  '1': 'PreconditioningScheduleState',
  '2': [
    {
      '1': 'precondition_schedules',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.CarServer.PreconditionSchedule',
      '10': 'preconditionSchedules'
    },
    {
      '1': 'preconditioning_schedule_window',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.CarServer.PreconditionSchedule',
      '9': 0,
      '10': 'preconditioningScheduleWindow'
    },
    {
      '1': 'max_num_precondition_schedules',
      '3': 3,
      '4': 1,
      '5': 13,
      '9': 1,
      '10': 'maxNumPreconditionSchedules'
    },
    {
      '1': 'next_schedule',
      '3': 4,
      '4': 1,
      '5': 8,
      '9': 2,
      '10': 'nextSchedule'
    },
    {
      '1': 'timestamp',
      '3': 2000,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'timestamp'
    },
  ],
  '8': [
    {'1': 'optional_preconditioning_schedule_window'},
    {'1': 'optional_max_num_precondition_schedules'},
    {'1': 'optional_next_schedule'},
  ],
};

/// Descriptor for `PreconditioningScheduleState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List preconditioningScheduleStateDescriptor = $convert.base64Decode(
    'ChxQcmVjb25kaXRpb25pbmdTY2hlZHVsZVN0YXRlElYKFnByZWNvbmRpdGlvbl9zY2hlZHVsZX'
    'MYASADKAsyHy5DYXJTZXJ2ZXIuUHJlY29uZGl0aW9uU2NoZWR1bGVSFXByZWNvbmRpdGlvblNj'
    'aGVkdWxlcxJpCh9wcmVjb25kaXRpb25pbmdfc2NoZWR1bGVfd2luZG93GAIgASgLMh8uQ2FyU2'
    'VydmVyLlByZWNvbmRpdGlvblNjaGVkdWxlSABSHXByZWNvbmRpdGlvbmluZ1NjaGVkdWxlV2lu'
    'ZG93EkUKHm1heF9udW1fcHJlY29uZGl0aW9uX3NjaGVkdWxlcxgDIAEoDUgBUhttYXhOdW1Qcm'
    'Vjb25kaXRpb25TY2hlZHVsZXMSJQoNbmV4dF9zY2hlZHVsZRgEIAEoCEgCUgxuZXh0U2NoZWR1'
    'bGUSOQoJdGltZXN0YW1wGNAPIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXRpbW'
    'VzdGFtcEIqCihvcHRpb25hbF9wcmVjb25kaXRpb25pbmdfc2NoZWR1bGVfd2luZG93QikKJ29w'
    'dGlvbmFsX21heF9udW1fcHJlY29uZGl0aW9uX3NjaGVkdWxlc0IYChZvcHRpb25hbF9uZXh0X3'
    'NjaGVkdWxl');

@$core.Deprecated('Use speedLimitModeDescriptor instead')
const SpeedLimitMode$json = {
  '1': 'SpeedLimitMode',
  '2': [
    {'1': 'active', '3': 103, '4': 1, '5': 8, '9': 0, '10': 'active'},
    {'1': 'pin_code_set', '3': 104, '4': 1, '5': 8, '9': 1, '10': 'pinCodeSet'},
    {
      '1': 'max_limit_mph',
      '3': 106,
      '4': 1,
      '5': 2,
      '9': 2,
      '10': 'maxLimitMph'
    },
    {
      '1': 'min_limit_mph',
      '3': 107,
      '4': 1,
      '5': 2,
      '9': 3,
      '10': 'minLimitMph'
    },
    {
      '1': 'current_limit_mph',
      '3': 108,
      '4': 1,
      '5': 2,
      '9': 4,
      '10': 'currentLimitMph'
    },
  ],
  '8': [
    {'1': 'optional_active'},
    {'1': 'optional_pin_code_set'},
    {'1': 'optional_max_limit_mph'},
    {'1': 'optional_min_limit_mph'},
    {'1': 'optional_current_limit_mph'},
  ],
};

/// Descriptor for `SpeedLimitMode`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List speedLimitModeDescriptor = $convert.base64Decode(
    'Cg5TcGVlZExpbWl0TW9kZRIYCgZhY3RpdmUYZyABKAhIAFIGYWN0aXZlEiIKDHBpbl9jb2RlX3'
    'NldBhoIAEoCEgBUgpwaW5Db2RlU2V0EiQKDW1heF9saW1pdF9tcGgYaiABKAJIAlILbWF4TGlt'
    'aXRNcGgSJAoNbWluX2xpbWl0X21waBhrIAEoAkgDUgttaW5MaW1pdE1waBIsChFjdXJyZW50X2'
    'xpbWl0X21waBhsIAEoAkgEUg9jdXJyZW50TGltaXRNcGhCEQoPb3B0aW9uYWxfYWN0aXZlQhcK'
    'FW9wdGlvbmFsX3Bpbl9jb2RlX3NldEIYChZvcHRpb25hbF9tYXhfbGltaXRfbXBoQhgKFm9wdG'
    'lvbmFsX21pbl9saW1pdF9tcGhCHAoab3B0aW9uYWxfY3VycmVudF9saW1pdF9tcGg=');

@$core.Deprecated('Use parentalControlsSettingsDescriptor instead')
const ParentalControlsSettings$json = {
  '1': 'ParentalControlsSettings',
  '2': [
    {
      '1': 'speed_limit_enabled',
      '3': 1,
      '4': 1,
      '5': 8,
      '9': 0,
      '10': 'speedLimitEnabled'
    },
    {'1': 'max_limit_mph', '3': 2, '4': 1, '5': 2, '9': 1, '10': 'maxLimitMph'},
    {'1': 'min_limit_mph', '3': 3, '4': 1, '5': 2, '9': 2, '10': 'minLimitMph'},
    {
      '1': 'current_limit_mph',
      '3': 4,
      '4': 1,
      '5': 2,
      '9': 3,
      '10': 'currentLimitMph'
    },
    {
      '1': 'chill_acceleration_enabled',
      '3': 5,
      '4': 1,
      '5': 8,
      '9': 4,
      '10': 'chillAccelerationEnabled'
    },
    {
      '1': 'require_safety_settings_enabled',
      '3': 6,
      '4': 1,
      '5': 8,
      '9': 5,
      '10': 'requireSafetySettingsEnabled'
    },
    {
      '1': 'curfew_enabled',
      '3': 7,
      '4': 1,
      '5': 8,
      '9': 6,
      '10': 'curfewEnabled'
    },
    {
      '1': 'curfew_start_time',
      '3': 8,
      '4': 1,
      '5': 5,
      '9': 7,
      '10': 'curfewStartTime'
    },
    {
      '1': 'curfew_end_time',
      '3': 9,
      '4': 1,
      '5': 5,
      '9': 8,
      '10': 'curfewEndTime'
    },
  ],
  '8': [
    {'1': 'optional_speed_limit_enabled'},
    {'1': 'optional_max_limit_mph'},
    {'1': 'optional_min_limit_mph'},
    {'1': 'optional_current_limit_mph'},
    {'1': 'optional_chill_acceleration_enabled'},
    {'1': 'optional_require_safety_settings_enabled'},
    {'1': 'optional_curfew_enabled'},
    {'1': 'optional_curfew_start_time'},
    {'1': 'optional_curfew_end_time'},
  ],
};

/// Descriptor for `ParentalControlsSettings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List parentalControlsSettingsDescriptor = $convert.base64Decode(
    'ChhQYXJlbnRhbENvbnRyb2xzU2V0dGluZ3MSMAoTc3BlZWRfbGltaXRfZW5hYmxlZBgBIAEoCE'
    'gAUhFzcGVlZExpbWl0RW5hYmxlZBIkCg1tYXhfbGltaXRfbXBoGAIgASgCSAFSC21heExpbWl0'
    'TXBoEiQKDW1pbl9saW1pdF9tcGgYAyABKAJIAlILbWluTGltaXRNcGgSLAoRY3VycmVudF9saW'
    '1pdF9tcGgYBCABKAJIA1IPY3VycmVudExpbWl0TXBoEj4KGmNoaWxsX2FjY2VsZXJhdGlvbl9l'
    'bmFibGVkGAUgASgISARSGGNoaWxsQWNjZWxlcmF0aW9uRW5hYmxlZBJHCh9yZXF1aXJlX3NhZm'
    'V0eV9zZXR0aW5nc19lbmFibGVkGAYgASgISAVSHHJlcXVpcmVTYWZldHlTZXR0aW5nc0VuYWJs'
    'ZWQSJwoOY3VyZmV3X2VuYWJsZWQYByABKAhIBlINY3VyZmV3RW5hYmxlZBIsChFjdXJmZXdfc3'
    'RhcnRfdGltZRgIIAEoBUgHUg9jdXJmZXdTdGFydFRpbWUSKAoPY3VyZmV3X2VuZF90aW1lGAkg'
    'ASgFSAhSDWN1cmZld0VuZFRpbWVCHgocb3B0aW9uYWxfc3BlZWRfbGltaXRfZW5hYmxlZEIYCh'
    'ZvcHRpb25hbF9tYXhfbGltaXRfbXBoQhgKFm9wdGlvbmFsX21pbl9saW1pdF9tcGhCHAoab3B0'
    'aW9uYWxfY3VycmVudF9saW1pdF9tcGhCJQojb3B0aW9uYWxfY2hpbGxfYWNjZWxlcmF0aW9uX2'
    'VuYWJsZWRCKgoob3B0aW9uYWxfcmVxdWlyZV9zYWZldHlfc2V0dGluZ3NfZW5hYmxlZEIZChdv'
    'cHRpb25hbF9jdXJmZXdfZW5hYmxlZEIcChpvcHRpb25hbF9jdXJmZXdfc3RhcnRfdGltZUIaCh'
    'hvcHRpb25hbF9jdXJmZXdfZW5kX3RpbWU=');

@$core.Deprecated('Use parentalControlsStateDescriptor instead')
const ParentalControlsState$json = {
  '1': 'ParentalControlsState',
  '2': [
    {
      '1': 'timestamp',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'timestamp'
    },
    {
      '1': 'parental_controls_active',
      '3': 2,
      '4': 1,
      '5': 8,
      '9': 0,
      '10': 'parentalControlsActive'
    },
    {
      '1': 'parental_controls_pin_set',
      '3': 3,
      '4': 1,
      '5': 8,
      '9': 1,
      '10': 'parentalControlsPinSet'
    },
    {
      '1': 'parental_controls_settings',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.CarServer.ParentalControlsSettings',
      '10': 'parentalControlsSettings'
    },
  ],
  '8': [
    {'1': 'optional_parental_controls_active'},
    {'1': 'optional_parental_controls_pin_set'},
  ],
};

/// Descriptor for `ParentalControlsState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List parentalControlsStateDescriptor = $convert.base64Decode(
    'ChVQYXJlbnRhbENvbnRyb2xzU3RhdGUSOAoJdGltZXN0YW1wGAEgASgLMhouZ29vZ2xlLnByb3'
    'RvYnVmLlRpbWVzdGFtcFIJdGltZXN0YW1wEjoKGHBhcmVudGFsX2NvbnRyb2xzX2FjdGl2ZRgC'
    'IAEoCEgAUhZwYXJlbnRhbENvbnRyb2xzQWN0aXZlEjsKGXBhcmVudGFsX2NvbnRyb2xzX3Bpbl'
    '9zZXQYAyABKAhIAVIWcGFyZW50YWxDb250cm9sc1BpblNldBJhChpwYXJlbnRhbF9jb250cm9s'
    'c19zZXR0aW5ncxgEIAEoCzIjLkNhclNlcnZlci5QYXJlbnRhbENvbnRyb2xzU2V0dGluZ3NSGH'
    'BhcmVudGFsQ29udHJvbHNTZXR0aW5nc0IjCiFvcHRpb25hbF9wYXJlbnRhbF9jb250cm9sc19h'
    'Y3RpdmVCJAoib3B0aW9uYWxfcGFyZW50YWxfY29udHJvbHNfcGluX3NldA==');

@$core.Deprecated('Use softwareUpdateStateDescriptor instead')
const SoftwareUpdateState$json = {
  '1': 'SoftwareUpdateState',
  '2': [
    {
      '1': 'status',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.CarServer.SoftwareUpdateState.SoftwareUpdateStatus',
      '10': 'status'
    },
    {
      '1': 'scheduled_time_ms',
      '3': 102,
      '4': 1,
      '5': 4,
      '9': 0,
      '10': 'scheduledTimeMs'
    },
    {
      '1': 'warning_time_remaining_ms',
      '3': 103,
      '4': 1,
      '5': 4,
      '9': 1,
      '10': 'warningTimeRemainingMs'
    },
    {
      '1': 'expected_duration_sec',
      '3': 104,
      '4': 1,
      '5': 13,
      '9': 2,
      '10': 'expectedDurationSec'
    },
    {
      '1': 'download_perc',
      '3': 105,
      '4': 1,
      '5': 13,
      '9': 3,
      '10': 'downloadPerc'
    },
    {
      '1': 'install_perc',
      '3': 106,
      '4': 1,
      '5': 13,
      '9': 4,
      '10': 'installPerc'
    },
    {'1': 'version', '3': 107, '4': 1, '5': 9, '9': 5, '10': 'version'},
    {
      '1': 'timestamp',
      '3': 108,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'timestamp'
    },
  ],
  '3': [SoftwareUpdateState_SoftwareUpdateStatus$json],
  '8': [
    {'1': 'optional_scheduled_time_ms'},
    {'1': 'optional_warning_time_remaining_ms'},
    {'1': 'optional_expected_duration_sec'},
    {'1': 'optional_download_perc'},
    {'1': 'optional_install_perc'},
    {'1': 'optional_version'},
  ],
};

@$core.Deprecated('Use softwareUpdateStateDescriptor instead')
const SoftwareUpdateState_SoftwareUpdateStatus$json = {
  '1': 'SoftwareUpdateStatus',
  '2': [
    {
      '1': 'Unknown',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Unknown'
    },
    {
      '1': 'Installing',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Installing'
    },
    {
      '1': 'Scheduled',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Scheduled'
    },
    {
      '1': 'Available',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Available'
    },
    {
      '1': 'DownloadingWifiWait',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'DownloadingWifiWait'
    },
    {
      '1': 'Downloading',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Downloading'
    },
  ],
  '8': [
    {'1': 'type'},
  ],
};

/// Descriptor for `SoftwareUpdateState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List softwareUpdateStateDescriptor = $convert.base64Decode(
    'ChNTb2Z0d2FyZVVwZGF0ZVN0YXRlEksKBnN0YXR1cxgBIAEoCzIzLkNhclNlcnZlci5Tb2Z0d2'
    'FyZVVwZGF0ZVN0YXRlLlNvZnR3YXJlVXBkYXRlU3RhdHVzUgZzdGF0dXMSLAoRc2NoZWR1bGVk'
    'X3RpbWVfbXMYZiABKARIAFIPc2NoZWR1bGVkVGltZU1zEjsKGXdhcm5pbmdfdGltZV9yZW1haW'
    '5pbmdfbXMYZyABKARIAVIWd2FybmluZ1RpbWVSZW1haW5pbmdNcxI0ChVleHBlY3RlZF9kdXJh'
    'dGlvbl9zZWMYaCABKA1IAlITZXhwZWN0ZWREdXJhdGlvblNlYxIlCg1kb3dubG9hZF9wZXJjGG'
    'kgASgNSANSDGRvd25sb2FkUGVyYxIjCgxpbnN0YWxsX3BlcmMYaiABKA1IBFILaW5zdGFsbFBl'
    'cmMSGgoHdmVyc2lvbhhrIAEoCUgFUgd2ZXJzaW9uEjgKCXRpbWVzdGFtcBhsIAEoCzIaLmdvb2'
    'dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXRpbWVzdGFtcBraAgoUU29mdHdhcmVVcGRhdGVTdGF0'
    'dXMSKwoHVW5rbm93bhgBIAEoCzIPLkNhclNlcnZlci5Wb2lkSABSB1Vua25vd24SMQoKSW5zdG'
    'FsbGluZxgCIAEoCzIPLkNhclNlcnZlci5Wb2lkSABSCkluc3RhbGxpbmcSLwoJU2NoZWR1bGVk'
    'GAMgASgLMg8uQ2FyU2VydmVyLlZvaWRIAFIJU2NoZWR1bGVkEi8KCUF2YWlsYWJsZRgEIAEoCz'
    'IPLkNhclNlcnZlci5Wb2lkSABSCUF2YWlsYWJsZRJDChNEb3dubG9hZGluZ1dpZmlXYWl0GAUg'
    'ASgLMg8uQ2FyU2VydmVyLlZvaWRIAFITRG93bmxvYWRpbmdXaWZpV2FpdBIzCgtEb3dubG9hZG'
    'luZxgGIAEoCzIPLkNhclNlcnZlci5Wb2lkSABSC0Rvd25sb2FkaW5nQgYKBHR5cGVCHAoab3B0'
    'aW9uYWxfc2NoZWR1bGVkX3RpbWVfbXNCJAoib3B0aW9uYWxfd2FybmluZ190aW1lX3JlbWFpbm'
    'luZ19tc0IgCh5vcHRpb25hbF9leHBlY3RlZF9kdXJhdGlvbl9zZWNCGAoWb3B0aW9uYWxfZG93'
    'bmxvYWRfcGVyY0IXChVvcHRpb25hbF9pbnN0YWxsX3BlcmNCEgoQb3B0aW9uYWxfdmVyc2lvbg'
    '==');

@$core.Deprecated('Use driveStateDescriptor instead')
const DriveState$json = {
  '1': 'DriveState',
  '2': [
    {
      '1': 'shift_state',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.CarServer.ShiftState',
      '10': 'shiftState'
    },
    {'1': 'speed', '3': 102, '4': 1, '5': 13, '9': 0, '10': 'speed'},
    {'1': 'power', '3': 103, '4': 1, '5': 5, '9': 1, '10': 'power'},
    {
      '1': 'timestamp',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'timestamp'
    },
    {
      '1': 'odometer_in_hundredths_of_a_mile',
      '3': 105,
      '4': 1,
      '5': 5,
      '9': 2,
      '10': 'odometerInHundredthsOfAMile'
    },
    {'1': 'speed_float', '3': 106, '4': 1, '5': 2, '9': 3, '10': 'speedFloat'},
    {
      '1': 'active_route_destination',
      '3': 7,
      '4': 1,
      '5': 9,
      '9': 4,
      '10': 'activeRouteDestination'
    },
    {
      '1': 'active_route_minutes_to_arrival',
      '3': 8,
      '4': 1,
      '5': 2,
      '9': 5,
      '10': 'activeRouteMinutesToArrival'
    },
    {
      '1': 'active_route_miles_to_arrival',
      '3': 9,
      '4': 1,
      '5': 2,
      '9': 6,
      '10': 'activeRouteMilesToArrival'
    },
    {
      '1': 'active_route_traffic_minutes_delay',
      '3': 10,
      '4': 1,
      '5': 2,
      '9': 7,
      '10': 'activeRouteTrafficMinutesDelay'
    },
    {
      '1': 'active_route_energy_at_arrival',
      '3': 11,
      '4': 1,
      '5': 2,
      '9': 8,
      '10': 'activeRouteEnergyAtArrival'
    },
    {
      '1': 'last_route_update',
      '3': 14,
      '4': 1,
      '5': 13,
      '9': 9,
      '10': 'lastRouteUpdate'
    },
    {
      '1': 'last_traffic_update',
      '3': 15,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'lastTrafficUpdate'
    },
    {
      '1': 'active_route_coordinates',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.CarServer.LatLong',
      '10': 'activeRouteCoordinates'
    },
  ],
  '8': [
    {'1': 'optional_speed'},
    {'1': 'optional_power'},
    {'1': 'optional_odometer_in_hundredths_of_a_mile'},
    {'1': 'optional_speed_float'},
    {'1': 'optional_active_route_destination'},
    {'1': 'optional_active_route_minutes_to_arrival'},
    {'1': 'optional_active_route_miles_to_arrival'},
    {'1': 'optional_active_route_traffic_minutes_delay'},
    {'1': 'optional_active_route_energy_at_arrival'},
    {'1': 'optional_last_route_update'},
  ],
};

/// Descriptor for `DriveState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List driveStateDescriptor = $convert.base64Decode(
    'CgpEcml2ZVN0YXRlEjYKC3NoaWZ0X3N0YXRlGAEgASgLMhUuQ2FyU2VydmVyLlNoaWZ0U3RhdG'
    'VSCnNoaWZ0U3RhdGUSFgoFc3BlZWQYZiABKA1IAFIFc3BlZWQSFgoFcG93ZXIYZyABKAVIAVIF'
    'cG93ZXISOAoJdGltZXN0YW1wGAQgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJdG'
    'ltZXN0YW1wEkcKIG9kb21ldGVyX2luX2h1bmRyZWR0aHNfb2ZfYV9taWxlGGkgASgFSAJSG29k'
    'b21ldGVySW5IdW5kcmVkdGhzT2ZBTWlsZRIhCgtzcGVlZF9mbG9hdBhqIAEoAkgDUgpzcGVlZE'
    'Zsb2F0EjoKGGFjdGl2ZV9yb3V0ZV9kZXN0aW5hdGlvbhgHIAEoCUgEUhZhY3RpdmVSb3V0ZURl'
    'c3RpbmF0aW9uEkYKH2FjdGl2ZV9yb3V0ZV9taW51dGVzX3RvX2Fycml2YWwYCCABKAJIBVIbYW'
    'N0aXZlUm91dGVNaW51dGVzVG9BcnJpdmFsEkIKHWFjdGl2ZV9yb3V0ZV9taWxlc190b19hcnJp'
    'dmFsGAkgASgCSAZSGWFjdGl2ZVJvdXRlTWlsZXNUb0Fycml2YWwSTAoiYWN0aXZlX3JvdXRlX3'
    'RyYWZmaWNfbWludXRlc19kZWxheRgKIAEoAkgHUh5hY3RpdmVSb3V0ZVRyYWZmaWNNaW51dGVz'
    'RGVsYXkSRAoeYWN0aXZlX3JvdXRlX2VuZXJneV9hdF9hcnJpdmFsGAsgASgCSAhSGmFjdGl2ZV'
    'JvdXRlRW5lcmd5QXRBcnJpdmFsEiwKEWxhc3Rfcm91dGVfdXBkYXRlGA4gASgNSAlSD2xhc3RS'
    'b3V0ZVVwZGF0ZRJKChNsYXN0X3RyYWZmaWNfdXBkYXRlGA8gASgLMhouZ29vZ2xlLnByb3RvYn'
    'VmLlRpbWVzdGFtcFIRbGFzdFRyYWZmaWNVcGRhdGUSTAoYYWN0aXZlX3JvdXRlX2Nvb3JkaW5h'
    'dGVzGAwgASgLMhIuQ2FyU2VydmVyLkxhdExvbmdSFmFjdGl2ZVJvdXRlQ29vcmRpbmF0ZXNCEA'
    'oOb3B0aW9uYWxfc3BlZWRCEAoOb3B0aW9uYWxfcG93ZXJCKwopb3B0aW9uYWxfb2RvbWV0ZXJf'
    'aW5faHVuZHJlZHRoc19vZl9hX21pbGVCFgoUb3B0aW9uYWxfc3BlZWRfZmxvYXRCIwohb3B0aW'
    '9uYWxfYWN0aXZlX3JvdXRlX2Rlc3RpbmF0aW9uQioKKG9wdGlvbmFsX2FjdGl2ZV9yb3V0ZV9t'
    'aW51dGVzX3RvX2Fycml2YWxCKAomb3B0aW9uYWxfYWN0aXZlX3JvdXRlX21pbGVzX3RvX2Fycm'
    'l2YWxCLQorb3B0aW9uYWxfYWN0aXZlX3JvdXRlX3RyYWZmaWNfbWludXRlc19kZWxheUIpCidv'
    'cHRpb25hbF9hY3RpdmVfcm91dGVfZW5lcmd5X2F0X2Fycml2YWxCHAoab3B0aW9uYWxfbGFzdF'
    '9yb3V0ZV91cGRhdGU=');

@$core.Deprecated('Use chargeStateDescriptor instead')
const ChargeState$json = {
  '1': 'ChargeState',
  '2': [
    {
      '1': 'charging_state',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.CarServer.ChargeState.ChargingState',
      '10': 'chargingState'
    },
    {
      '1': 'fast_charger_type',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.CarServer.ChargeState.ChargerType',
      '10': 'fastChargerType'
    },
    {
      '1': 'fast_charger_brand',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.CarServer.ChargeState.ChargerBrand',
      '10': 'fastChargerBrand'
    },
    {
      '1': 'charge_limit_soc',
      '3': 104,
      '4': 1,
      '5': 5,
      '9': 0,
      '10': 'chargeLimitSoc'
    },
    {
      '1': 'charge_limit_soc_std',
      '3': 105,
      '4': 1,
      '5': 5,
      '9': 1,
      '10': 'chargeLimitSocStd'
    },
    {
      '1': 'charge_limit_soc_min',
      '3': 106,
      '4': 1,
      '5': 5,
      '9': 2,
      '10': 'chargeLimitSocMin'
    },
    {
      '1': 'charge_limit_soc_max',
      '3': 107,
      '4': 1,
      '5': 5,
      '9': 3,
      '10': 'chargeLimitSocMax'
    },
    {
      '1': 'max_range_charge_counter',
      '3': 109,
      '4': 1,
      '5': 5,
      '9': 4,
      '10': 'maxRangeChargeCounter'
    },
    {
      '1': 'fast_charger_present',
      '3': 110,
      '4': 1,
      '5': 8,
      '9': 5,
      '10': 'fastChargerPresent'
    },
    {
      '1': 'battery_range',
      '3': 111,
      '4': 1,
      '5': 2,
      '9': 6,
      '10': 'batteryRange'
    },
    {
      '1': 'est_battery_range',
      '3': 112,
      '4': 1,
      '5': 2,
      '9': 7,
      '10': 'estBatteryRange'
    },
    {
      '1': 'ideal_battery_range',
      '3': 113,
      '4': 1,
      '5': 2,
      '9': 8,
      '10': 'idealBatteryRange'
    },
    {
      '1': 'battery_level',
      '3': 114,
      '4': 1,
      '5': 5,
      '9': 9,
      '10': 'batteryLevel'
    },
    {
      '1': 'usable_battery_level',
      '3': 115,
      '4': 1,
      '5': 5,
      '9': 10,
      '10': 'usableBatteryLevel'
    },
    {
      '1': 'charge_energy_added',
      '3': 116,
      '4': 1,
      '5': 2,
      '9': 11,
      '10': 'chargeEnergyAdded'
    },
    {
      '1': 'charge_miles_added_rated',
      '3': 117,
      '4': 1,
      '5': 2,
      '9': 12,
      '10': 'chargeMilesAddedRated'
    },
    {
      '1': 'charge_miles_added_ideal',
      '3': 118,
      '4': 1,
      '5': 2,
      '9': 13,
      '10': 'chargeMilesAddedIdeal'
    },
    {
      '1': 'charger_voltage',
      '3': 119,
      '4': 1,
      '5': 5,
      '9': 14,
      '10': 'chargerVoltage'
    },
    {
      '1': 'charger_pilot_current',
      '3': 120,
      '4': 1,
      '5': 5,
      '9': 15,
      '10': 'chargerPilotCurrent'
    },
    {
      '1': 'charger_actual_current',
      '3': 121,
      '4': 1,
      '5': 5,
      '9': 16,
      '10': 'chargerActualCurrent'
    },
    {
      '1': 'charger_power',
      '3': 122,
      '4': 1,
      '5': 5,
      '9': 17,
      '10': 'chargerPower'
    },
    {
      '1': 'minutes_to_full_charge',
      '3': 123,
      '4': 1,
      '5': 5,
      '9': 18,
      '10': 'minutesToFullCharge'
    },
    {
      '1': 'minutes_to_charge_limit',
      '3': 142,
      '4': 1,
      '5': 5,
      '9': 19,
      '10': 'minutesToChargeLimit'
    },
    {
      '1': 'trip_charging',
      '3': 125,
      '4': 1,
      '5': 8,
      '9': 20,
      '10': 'tripCharging'
    },
    {
      '1': 'charge_rate_mph',
      '3': 126,
      '4': 1,
      '5': 5,
      '9': 21,
      '10': 'chargeRateMph'
    },
    {
      '1': 'charge_port_door_open',
      '3': 127,
      '4': 1,
      '5': 8,
      '9': 22,
      '10': 'chargePortDoorOpen'
    },
    {
      '1': 'conn_charge_cable',
      '3': 28,
      '4': 1,
      '5': 11,
      '6': '.CarServer.ChargeState.CableType',
      '10': 'connChargeCable'
    },
    {
      '1': 'scheduled_charging_start_time',
      '3': 129,
      '4': 1,
      '5': 4,
      '9': 23,
      '10': 'scheduledChargingStartTime'
    },
    {
      '1': 'scheduled_charging_pending',
      '3': 130,
      '4': 1,
      '5': 8,
      '9': 24,
      '10': 'scheduledChargingPending'
    },
    {
      '1': 'scheduled_departure_time',
      '3': 31,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'scheduledDepartureTime'
    },
    {
      '1': 'user_charge_enable_request',
      '3': 132,
      '4': 1,
      '5': 8,
      '9': 25,
      '10': 'userChargeEnableRequest'
    },
    {
      '1': 'charge_enable_request',
      '3': 133,
      '4': 1,
      '5': 8,
      '9': 26,
      '10': 'chargeEnableRequest'
    },
    {
      '1': 'charger_phases',
      '3': 134,
      '4': 1,
      '5': 5,
      '9': 27,
      '10': 'chargerPhases'
    },
    {
      '1': 'charge_port_latch',
      '3': 35,
      '4': 1,
      '5': 11,
      '6': '.CarServer.ChargePortLatchState',
      '10': 'chargePortLatch'
    },
    {
      '1': 'charge_port_cold_weather_mode',
      '3': 136,
      '4': 1,
      '5': 8,
      '9': 28,
      '10': 'chargePortColdWeatherMode'
    },
    {
      '1': 'charge_current_request',
      '3': 137,
      '4': 1,
      '5': 5,
      '9': 29,
      '10': 'chargeCurrentRequest'
    },
    {
      '1': 'charge_current_request_max',
      '3': 138,
      '4': 1,
      '5': 5,
      '9': 30,
      '10': 'chargeCurrentRequestMax'
    },
    {
      '1': 'managed_charging_active',
      '3': 139,
      '4': 1,
      '5': 8,
      '9': 31,
      '10': 'managedChargingActive'
    },
    {
      '1': 'managed_charging_user_canceled',
      '3': 140,
      '4': 1,
      '5': 8,
      '9': 32,
      '10': 'managedChargingUserCanceled'
    },
    {
      '1': 'managed_charging_start_time',
      '3': 141,
      '4': 1,
      '5': 4,
      '9': 33,
      '10': 'managedChargingStartTime'
    },
    {
      '1': 'timestamp',
      '3': 44,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'timestamp'
    },
    {
      '1': 'preconditioning_times',
      '3': 45,
      '4': 1,
      '5': 11,
      '6': '.CarServer.PreconditioningTimes',
      '10': 'preconditioningTimes'
    },
    {
      '1': 'off_peak_charging_times',
      '3': 46,
      '4': 1,
      '5': 11,
      '6': '.CarServer.OffPeakChargingTimes',
      '10': 'offPeakChargingTimes'
    },
    {
      '1': 'off_peak_hours_end_time',
      '3': 147,
      '4': 1,
      '5': 13,
      '9': 34,
      '10': 'offPeakHoursEndTime'
    },
    {
      '1': 'scheduled_charging_mode',
      '3': 148,
      '4': 1,
      '5': 14,
      '6': '.CarServer.ChargeState.ScheduledChargingMode',
      '9': 35,
      '10': 'scheduledChargingMode'
    },
    {
      '1': 'charging_amps',
      '3': 149,
      '4': 1,
      '5': 5,
      '9': 36,
      '10': 'chargingAmps'
    },
    {
      '1': 'scheduled_charging_start_time_minutes',
      '3': 150,
      '4': 1,
      '5': 13,
      '9': 37,
      '10': 'scheduledChargingStartTimeMinutes'
    },
    {
      '1': 'scheduled_departure_time_minutes',
      '3': 151,
      '4': 1,
      '5': 13,
      '9': 38,
      '10': 'scheduledDepartureTimeMinutes'
    },
    {
      '1': 'preconditioning_enabled',
      '3': 152,
      '4': 1,
      '5': 8,
      '9': 39,
      '10': 'preconditioningEnabled'
    },
    {
      '1': 'scheduled_charging_start_time_app',
      '3': 153,
      '4': 1,
      '5': 17,
      '9': 40,
      '10': 'scheduledChargingStartTimeApp'
    },
    {
      '1': 'supercharger_session_trip_planner',
      '3': 154,
      '4': 1,
      '5': 8,
      '9': 41,
      '10': 'superchargerSessionTripPlanner'
    },
    {
      '1': 'charge_port_color',
      '3': 155,
      '4': 1,
      '5': 14,
      '6': '.CarServer.ChargeState.ChargePortColor_E',
      '9': 42,
      '10': 'chargePortColor'
    },
    {
      '1': 'charge_rate_mph_float',
      '3': 156,
      '4': 1,
      '5': 2,
      '9': 43,
      '10': 'chargeRateMphFloat'
    },
    {
      '1': 'charge_limit_reason',
      '3': 157,
      '4': 1,
      '5': 14,
      '6': '.CarServer.ChargeState.ChargeLimitReason',
      '9': 44,
      '10': 'chargeLimitReason'
    },
    {
      '1': 'managed_charging_state',
      '3': 158,
      '4': 1,
      '5': 11,
      '6': '.CarServer.ManagedChargingState',
      '10': 'managedChargingState'
    },
    {
      '1': 'charge_cable_unlatched',
      '3': 159,
      '4': 1,
      '5': 8,
      '9': 45,
      '10': 'chargeCableUnlatched'
    },
    {
      '1': 'outlet_state',
      '3': 160,
      '4': 1,
      '5': 14,
      '6': '.CarServer.ChargeState.OutletState',
      '9': 46,
      '10': 'outletState'
    },
    {
      '1': 'power_feed_state',
      '3': 161,
      '4': 1,
      '5': 14,
      '6': '.CarServer.ChargeState.PowerFeedState',
      '9': 47,
      '10': 'powerFeedState'
    },
    {
      '1': 'outlet_soc_limit',
      '3': 162,
      '4': 1,
      '5': 5,
      '9': 48,
      '10': 'outletSocLimit'
    },
    {
      '1': 'power_feed_soc_limit',
      '3': 163,
      '4': 1,
      '5': 5,
      '9': 49,
      '10': 'powerFeedSocLimit'
    },
    {
      '1': 'outlet_time_remaining',
      '3': 164,
      '4': 1,
      '5': 3,
      '9': 50,
      '10': 'outletTimeRemaining'
    },
    {
      '1': 'power_feed_time_remaining',
      '3': 165,
      '4': 1,
      '5': 3,
      '9': 51,
      '10': 'powerFeedTimeRemaining'
    },
    {
      '1': 'powershare_feature_allowed',
      '3': 166,
      '4': 1,
      '5': 8,
      '9': 52,
      '10': 'powershareFeatureAllowed'
    },
    {
      '1': 'powershare_feature_enabled',
      '3': 167,
      '4': 1,
      '5': 8,
      '9': 53,
      '10': 'powershareFeatureEnabled'
    },
    {
      '1': 'powershare_request',
      '3': 168,
      '4': 1,
      '5': 8,
      '9': 54,
      '10': 'powershareRequest'
    },
    {
      '1': 'powershare_type',
      '3': 169,
      '4': 1,
      '5': 14,
      '6': '.CarServer.ChargeState.PowershareType',
      '9': 55,
      '10': 'powershareType'
    },
    {
      '1': 'powershare_status',
      '3': 170,
      '4': 1,
      '5': 14,
      '6': '.CarServer.ChargeState.PowershareStatus',
      '9': 56,
      '10': 'powershareStatus'
    },
    {
      '1': 'powershare_stop_reason',
      '3': 171,
      '4': 1,
      '5': 14,
      '6': '.CarServer.ChargeState.PowershareStopReason',
      '9': 57,
      '10': 'powershareStopReason'
    },
    {
      '1': 'powershare_instantaneous_load_kw',
      '3': 172,
      '4': 1,
      '5': 2,
      '9': 58,
      '10': 'powershareInstantaneousLoadKw'
    },
    {
      '1': 'powershare_vehicle_energy_left_hr',
      '3': 173,
      '4': 1,
      '5': 5,
      '9': 59,
      '10': 'powershareVehicleEnergyLeftHr'
    },
    {
      '1': 'powershare_soc_limit',
      '3': 174,
      '4': 1,
      '5': 5,
      '9': 60,
      '10': 'powershareSocLimit'
    },
    {
      '1': 'one_time_soc_limit',
      '3': 175,
      '4': 1,
      '5': 5,
      '9': 61,
      '10': 'oneTimeSocLimit'
    },
    {
      '1': 'home_location',
      '3': 176,
      '4': 1,
      '5': 11,
      '6': '.CarServer.LatLong',
      '9': 62,
      '10': 'homeLocation'
    },
    {
      '1': 'work_location',
      '3': 177,
      '4': 1,
      '5': 11,
      '6': '.CarServer.LatLong',
      '9': 63,
      '10': 'workLocation'
    },
    {
      '1': 'outlet_max_timer_minutes',
      '3': 178,
      '4': 1,
      '5': 5,
      '9': 64,
      '10': 'outletMaxTimerMinutes'
    },
  ],
  '3': [
    ChargeState_CableType$json,
    ChargeState_ChargerType$json,
    ChargeState_ChargingState$json,
    ChargeState_ChargerBrand$json
  ],
  '4': [
    ChargeState_ScheduledChargingMode$json,
    ChargeState_ChargePortColor_E$json,
    ChargeState_ChargeLimitReason$json,
    ChargeState_OutletState$json,
    ChargeState_PowerFeedState$json,
    ChargeState_PowershareStatus$json,
    ChargeState_PowershareType$json,
    ChargeState_PowershareStopReason$json
  ],
  '8': [
    {'1': 'optional_charge_limit_soc'},
    {'1': 'optional_charge_limit_soc_std'},
    {'1': 'optional_charge_limit_soc_min'},
    {'1': 'optional_charge_limit_soc_max'},
    {'1': 'optional_max_range_charge_counter'},
    {'1': 'optional_fast_charger_present'},
    {'1': 'optional_battery_range'},
    {'1': 'optional_est_battery_range'},
    {'1': 'optional_ideal_battery_range'},
    {'1': 'optional_battery_level'},
    {'1': 'optional_usable_battery_level'},
    {'1': 'optional_charge_energy_added'},
    {'1': 'optional_charge_miles_added_rated'},
    {'1': 'optional_charge_miles_added_ideal'},
    {'1': 'optional_charger_voltage'},
    {'1': 'optional_charger_pilot_current'},
    {'1': 'optional_charger_actual_current'},
    {'1': 'optional_charger_power'},
    {'1': 'optional_minutes_to_full_charge'},
    {'1': 'optional_minutes_to_charge_limit'},
    {'1': 'optional_trip_charging'},
    {'1': 'optional_charge_rate_mph'},
    {'1': 'optional_charge_port_door_open'},
    {'1': 'optional_scheduled_charging_start_time'},
    {'1': 'optional_scheduled_charging_pending'},
    {'1': 'optional_user_charge_enable_request'},
    {'1': 'optional_charge_enable_request'},
    {'1': 'optional_charger_phases'},
    {'1': 'optional_charge_port_cold_weather_mode'},
    {'1': 'optional_charge_current_request'},
    {'1': 'optional_charge_current_request_max'},
    {'1': 'optional_managed_charging_active'},
    {'1': 'optional_managed_charging_user_canceled'},
    {'1': 'optional_managed_charging_start_time'},
    {'1': 'optional_off_peak_hours_end_time'},
    {'1': 'optional_scheduled_charging_mode'},
    {'1': 'optional_charging_amps'},
    {'1': 'optional_scheduled_charging_start_time_minutes'},
    {'1': 'optional_scheduled_departure_time_minutes'},
    {'1': 'optional_preconditioning_enabled'},
    {'1': 'optional_scheduled_charging_start_time_app'},
    {'1': 'optional_supercharger_session_trip_planner'},
    {'1': 'optional_charge_port_color'},
    {'1': 'optional_charge_rate_mph_float'},
    {'1': 'optional_charge_limit_reason'},
    {'1': 'optional_charge_cable_unlatched'},
    {'1': 'optional_outlet_state'},
    {'1': 'optional_power_feed_state'},
    {'1': 'option_outlet_soc_limit'},
    {'1': 'option_power_feed_soc_limit'},
    {'1': 'option_outlet_time_remaining'},
    {'1': 'option_power_feed_time_remaining'},
    {'1': 'optional_powershare_feature_allowed'},
    {'1': 'optional_powershare_feature_enabled'},
    {'1': 'optional_powershare_request'},
    {'1': 'optional_powershare_type'},
    {'1': 'optional_powershare_status'},
    {'1': 'optional_powershare_stop_reason'},
    {'1': 'optional_powershare_instantaneous_load_kw'},
    {'1': 'optional_powershare_vehicle_energy_left_hr'},
    {'1': 'optional_powershare_soc_limit'},
    {'1': 'optional_one_time_soc_limit'},
    {'1': 'optional_home_location'},
    {'1': 'optional_work_location'},
    {'1': 'optional_outlet_max_timer_minutes'},
  ],
  '9': [
    {'1': 8, '2': 9},
    {'1': 42, '2': 43},
    {'1': 43, '2': 44},
  ],
};

@$core.Deprecated('Use chargeStateDescriptor instead')
const ChargeState_CableType$json = {
  '1': 'CableType',
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
      '1': 'IEC',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'IEC'
    },
    {
      '1': 'SAE',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'SAE'
    },
    {
      '1': 'GB_AC',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'GBAC'
    },
    {
      '1': 'GB_DC',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'GBDC'
    },
  ],
  '8': [
    {'1': 'type'},
  ],
};

@$core.Deprecated('Use chargeStateDescriptor instead')
const ChargeState_ChargerType$json = {
  '1': 'ChargerType',
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
      '1': 'Supercharger',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Supercharger'
    },
    {
      '1': 'Chademo',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Chademo'
    },
    {
      '1': 'Gb',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Gb'
    },
    {
      '1': 'ACSingleWireCAN',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'ACSingleWireCAN'
    },
    {
      '1': 'Combo',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Combo'
    },
    {
      '1': 'MCSingleWireCAN',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'MCSingleWireCAN'
    },
    {
      '1': 'Other',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Other'
    },
    {
      '1': 'Tesla',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Tesla'
    },
  ],
  '8': [
    {'1': 'type'},
  ],
};

@$core.Deprecated('Use chargeStateDescriptor instead')
const ChargeState_ChargingState$json = {
  '1': 'ChargingState',
  '2': [
    {
      '1': 'Unknown',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Unknown'
    },
    {
      '1': 'Disconnected',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Disconnected'
    },
    {
      '1': 'NoPower',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'NoPower'
    },
    {
      '1': 'Starting',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Starting'
    },
    {
      '1': 'Charging',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Charging'
    },
    {
      '1': 'Complete',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Complete'
    },
    {
      '1': 'Stopped',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Stopped'
    },
    {
      '1': 'Calibrating',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Calibrating'
    },
  ],
  '8': [
    {'1': 'type'},
  ],
};

@$core.Deprecated('Use chargeStateDescriptor instead')
const ChargeState_ChargerBrand$json = {
  '1': 'ChargerBrand',
  '2': [
    {
      '1': 'Tesla',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Tesla'
    },
    {
      '1': 'SNA',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'SNA'
    },
  ],
  '8': [
    {'1': 'type'},
  ],
};

@$core.Deprecated('Use chargeStateDescriptor instead')
const ChargeState_ScheduledChargingMode$json = {
  '1': 'ScheduledChargingMode',
  '2': [
    {'1': 'ScheduledChargingModeOff', '2': 0},
    {'1': 'ScheduledChargingModeStartAt', '2': 1},
    {'1': 'ScheduledChargingModeDepartBy', '2': 2},
  ],
};

@$core.Deprecated('Use chargeStateDescriptor instead')
const ChargeState_ChargePortColor_E$json = {
  '1': 'ChargePortColor_E',
  '2': [
    {'1': 'ChargePortColorOff', '2': 0},
    {'1': 'ChargePortColorRed', '2': 1},
    {'1': 'ChargePortColorGreen', '2': 2},
    {'1': 'ChargePortColorBlue', '2': 3},
    {'1': 'ChargePortColorWhite', '2': 4},
    {'1': 'ChargePortColorFlashingGreen', '2': 5},
    {'1': 'ChargePortColorFlashingAmber', '2': 6},
    {'1': 'ChargePortColorAmber', '2': 7},
    {'1': 'ChargePortColorRave', '2': 8},
    {'1': 'ChargePortColorDebug', '2': 9},
    {'1': 'ChargePortColorFlashingBlue', '2': 10},
  ],
};

@$core.Deprecated('Use chargeStateDescriptor instead')
const ChargeState_ChargeLimitReason$json = {
  '1': 'ChargeLimitReason',
  '2': [
    {'1': 'ChargeLimitReasonUnknown', '2': 0},
    {'1': 'ChargeLimitReasonNone', '2': 1},
    {'1': 'ChargeLimitReasonEvse', '2': 2},
    {'1': 'ChargeLimitReasonBattTempLow', '2': 3},
    {'1': 'ChargeLimitReasonHighSoc', '2': 4},
    {'1': 'ChargeLimitReasonCabin', '2': 5},
  ],
};

@$core.Deprecated('Use chargeStateDescriptor instead')
const ChargeState_OutletState$json = {
  '1': 'OutletState',
  '2': [
    {'1': 'OutletStateOff', '2': 0},
    {'1': 'OutletStateCabinAndBed', '2': 1},
    {'1': 'OutletStateCabin', '2': 2},
  ],
};

@$core.Deprecated('Use chargeStateDescriptor instead')
const ChargeState_PowerFeedState$json = {
  '1': 'PowerFeedState',
  '2': [
    {'1': 'PowerFeedStateOff', '2': 0},
    {'1': 'PowerFeedStateCabinAndBed', '2': 1},
    {'1': 'PowerFeedStateCabin', '2': 2},
  ],
};

@$core.Deprecated('Use chargeStateDescriptor instead')
const ChargeState_PowershareStatus$json = {
  '1': 'PowershareStatus',
  '2': [
    {'1': 'PowershareStatusInactive', '2': 0},
    {'1': 'PowershareStatusInit', '2': 1},
    {'1': 'PowershareStatusActive', '2': 2},
    {'1': 'PowershareStatusStopped', '2': 3},
    {'1': 'PowershareStatusHandshaking', '2': 4},
    {'1': 'PowershareStatusActiveReconnectingSoon', '2': 5},
  ],
};

@$core.Deprecated('Use chargeStateDescriptor instead')
const ChargeState_PowershareType$json = {
  '1': 'PowershareType',
  '2': [
    {'1': 'PowershareTypeNone', '2': 0},
    {'1': 'PowershareTypeLoad', '2': 1},
    {'1': 'PowershareTypeHome', '2': 2},
  ],
};

@$core.Deprecated('Use chargeStateDescriptor instead')
const ChargeState_PowershareStopReason$json = {
  '1': 'PowershareStopReason',
  '2': [
    {'1': 'PowershareStopReasonNone', '2': 0},
    {'1': 'PowershareStopReasonSOCTooLow', '2': 1},
    {'1': 'PowershareStopReasonRetry', '2': 2},
    {'1': 'PowershareStopReasonFault', '2': 3},
    {'1': 'PowershareStopReasonUser', '2': 4},
    {'1': 'PowershareStopReasonReconnecting', '2': 5},
    {'1': 'PowershareStopReasonAuthentication', '2': 6},
  ],
};

/// Descriptor for `ChargeState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chargeStateDescriptor = $convert.base64Decode(
    'CgtDaGFyZ2VTdGF0ZRJLCg5jaGFyZ2luZ19zdGF0ZRgBIAEoCzIkLkNhclNlcnZlci5DaGFyZ2'
    'VTdGF0ZS5DaGFyZ2luZ1N0YXRlUg1jaGFyZ2luZ1N0YXRlEk4KEWZhc3RfY2hhcmdlcl90eXBl'
    'GAIgASgLMiIuQ2FyU2VydmVyLkNoYXJnZVN0YXRlLkNoYXJnZXJUeXBlUg9mYXN0Q2hhcmdlcl'
    'R5cGUSUQoSZmFzdF9jaGFyZ2VyX2JyYW5kGAMgASgLMiMuQ2FyU2VydmVyLkNoYXJnZVN0YXRl'
    'LkNoYXJnZXJCcmFuZFIQZmFzdENoYXJnZXJCcmFuZBIqChBjaGFyZ2VfbGltaXRfc29jGGggAS'
    'gFSABSDmNoYXJnZUxpbWl0U29jEjEKFGNoYXJnZV9saW1pdF9zb2Nfc3RkGGkgASgFSAFSEWNo'
    'YXJnZUxpbWl0U29jU3RkEjEKFGNoYXJnZV9saW1pdF9zb2NfbWluGGogASgFSAJSEWNoYXJnZU'
    'xpbWl0U29jTWluEjEKFGNoYXJnZV9saW1pdF9zb2NfbWF4GGsgASgFSANSEWNoYXJnZUxpbWl0'
    'U29jTWF4EjkKGG1heF9yYW5nZV9jaGFyZ2VfY291bnRlchhtIAEoBUgEUhVtYXhSYW5nZUNoYX'
    'JnZUNvdW50ZXISMgoUZmFzdF9jaGFyZ2VyX3ByZXNlbnQYbiABKAhIBVISZmFzdENoYXJnZXJQ'
    'cmVzZW50EiUKDWJhdHRlcnlfcmFuZ2UYbyABKAJIBlIMYmF0dGVyeVJhbmdlEiwKEWVzdF9iYX'
    'R0ZXJ5X3JhbmdlGHAgASgCSAdSD2VzdEJhdHRlcnlSYW5nZRIwChNpZGVhbF9iYXR0ZXJ5X3Jh'
    'bmdlGHEgASgCSAhSEWlkZWFsQmF0dGVyeVJhbmdlEiUKDWJhdHRlcnlfbGV2ZWwYciABKAVICV'
    'IMYmF0dGVyeUxldmVsEjIKFHVzYWJsZV9iYXR0ZXJ5X2xldmVsGHMgASgFSApSEnVzYWJsZUJh'
    'dHRlcnlMZXZlbBIwChNjaGFyZ2VfZW5lcmd5X2FkZGVkGHQgASgCSAtSEWNoYXJnZUVuZXJneU'
    'FkZGVkEjkKGGNoYXJnZV9taWxlc19hZGRlZF9yYXRlZBh1IAEoAkgMUhVjaGFyZ2VNaWxlc0Fk'
    'ZGVkUmF0ZWQSOQoYY2hhcmdlX21pbGVzX2FkZGVkX2lkZWFsGHYgASgCSA1SFWNoYXJnZU1pbG'
    'VzQWRkZWRJZGVhbBIpCg9jaGFyZ2VyX3ZvbHRhZ2UYdyABKAVIDlIOY2hhcmdlclZvbHRhZ2US'
    'NAoVY2hhcmdlcl9waWxvdF9jdXJyZW50GHggASgFSA9SE2NoYXJnZXJQaWxvdEN1cnJlbnQSNg'
    'oWY2hhcmdlcl9hY3R1YWxfY3VycmVudBh5IAEoBUgQUhRjaGFyZ2VyQWN0dWFsQ3VycmVudBIl'
    'Cg1jaGFyZ2VyX3Bvd2VyGHogASgFSBFSDGNoYXJnZXJQb3dlchI1ChZtaW51dGVzX3RvX2Z1bG'
    'xfY2hhcmdlGHsgASgFSBJSE21pbnV0ZXNUb0Z1bGxDaGFyZ2USOAoXbWludXRlc190b19jaGFy'
    'Z2VfbGltaXQYjgEgASgFSBNSFG1pbnV0ZXNUb0NoYXJnZUxpbWl0EiUKDXRyaXBfY2hhcmdpbm'
    'cYfSABKAhIFFIMdHJpcENoYXJnaW5nEigKD2NoYXJnZV9yYXRlX21waBh+IAEoBUgVUg1jaGFy'
    'Z2VSYXRlTXBoEjMKFWNoYXJnZV9wb3J0X2Rvb3Jfb3Blbhh/IAEoCEgWUhJjaGFyZ2VQb3J0RG'
    '9vck9wZW4STAoRY29ubl9jaGFyZ2VfY2FibGUYHCABKAsyIC5DYXJTZXJ2ZXIuQ2hhcmdlU3Rh'
    'dGUuQ2FibGVUeXBlUg9jb25uQ2hhcmdlQ2FibGUSRAodc2NoZWR1bGVkX2NoYXJnaW5nX3N0YX'
    'J0X3RpbWUYgQEgASgESBdSGnNjaGVkdWxlZENoYXJnaW5nU3RhcnRUaW1lEj8KGnNjaGVkdWxl'
    'ZF9jaGFyZ2luZ19wZW5kaW5nGIIBIAEoCEgYUhhzY2hlZHVsZWRDaGFyZ2luZ1BlbmRpbmcSVA'
    'oYc2NoZWR1bGVkX2RlcGFydHVyZV90aW1lGB8gASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVz'
    'dGFtcFIWc2NoZWR1bGVkRGVwYXJ0dXJlVGltZRI+Chp1c2VyX2NoYXJnZV9lbmFibGVfcmVxdW'
    'VzdBiEASABKAhIGVIXdXNlckNoYXJnZUVuYWJsZVJlcXVlc3QSNQoVY2hhcmdlX2VuYWJsZV9y'
    'ZXF1ZXN0GIUBIAEoCEgaUhNjaGFyZ2VFbmFibGVSZXF1ZXN0EigKDmNoYXJnZXJfcGhhc2VzGI'
    'YBIAEoBUgbUg1jaGFyZ2VyUGhhc2VzEksKEWNoYXJnZV9wb3J0X2xhdGNoGCMgASgLMh8uQ2Fy'
    'U2VydmVyLkNoYXJnZVBvcnRMYXRjaFN0YXRlUg9jaGFyZ2VQb3J0TGF0Y2gSQwodY2hhcmdlX3'
    'BvcnRfY29sZF93ZWF0aGVyX21vZGUYiAEgASgISBxSGWNoYXJnZVBvcnRDb2xkV2VhdGhlck1v'
    'ZGUSNwoWY2hhcmdlX2N1cnJlbnRfcmVxdWVzdBiJASABKAVIHVIUY2hhcmdlQ3VycmVudFJlcX'
    'Vlc3QSPgoaY2hhcmdlX2N1cnJlbnRfcmVxdWVzdF9tYXgYigEgASgFSB5SF2NoYXJnZUN1cnJl'
    'bnRSZXF1ZXN0TWF4EjkKF21hbmFnZWRfY2hhcmdpbmdfYWN0aXZlGIsBIAEoCEgfUhVtYW5hZ2'
    'VkQ2hhcmdpbmdBY3RpdmUSRgoebWFuYWdlZF9jaGFyZ2luZ191c2VyX2NhbmNlbGVkGIwBIAEo'
    'CEggUhttYW5hZ2VkQ2hhcmdpbmdVc2VyQ2FuY2VsZWQSQAobbWFuYWdlZF9jaGFyZ2luZ19zdG'
    'FydF90aW1lGI0BIAEoBEghUhhtYW5hZ2VkQ2hhcmdpbmdTdGFydFRpbWUSOAoJdGltZXN0YW1w'
    'GCwgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJdGltZXN0YW1wElQKFXByZWNvbm'
    'RpdGlvbmluZ190aW1lcxgtIAEoCzIfLkNhclNlcnZlci5QcmVjb25kaXRpb25pbmdUaW1lc1IU'
    'cHJlY29uZGl0aW9uaW5nVGltZXMSVgoXb2ZmX3BlYWtfY2hhcmdpbmdfdGltZXMYLiABKAsyHy'
    '5DYXJTZXJ2ZXIuT2ZmUGVha0NoYXJnaW5nVGltZXNSFG9mZlBlYWtDaGFyZ2luZ1RpbWVzEjcK'
    'F29mZl9wZWFrX2hvdXJzX2VuZF90aW1lGJMBIAEoDUgiUhNvZmZQZWFrSG91cnNFbmRUaW1lEm'
    'cKF3NjaGVkdWxlZF9jaGFyZ2luZ19tb2RlGJQBIAEoDjIsLkNhclNlcnZlci5DaGFyZ2VTdGF0'
    'ZS5TY2hlZHVsZWRDaGFyZ2luZ01vZGVII1IVc2NoZWR1bGVkQ2hhcmdpbmdNb2RlEiYKDWNoYX'
    'JnaW5nX2FtcHMYlQEgASgFSCRSDGNoYXJnaW5nQW1wcxJTCiVzY2hlZHVsZWRfY2hhcmdpbmdf'
    'c3RhcnRfdGltZV9taW51dGVzGJYBIAEoDUglUiFzY2hlZHVsZWRDaGFyZ2luZ1N0YXJ0VGltZU'
    '1pbnV0ZXMSSgogc2NoZWR1bGVkX2RlcGFydHVyZV90aW1lX21pbnV0ZXMYlwEgASgNSCZSHXNj'
    'aGVkdWxlZERlcGFydHVyZVRpbWVNaW51dGVzEjoKF3ByZWNvbmRpdGlvbmluZ19lbmFibGVkGJ'
    'gBIAEoCEgnUhZwcmVjb25kaXRpb25pbmdFbmFibGVkEksKIXNjaGVkdWxlZF9jaGFyZ2luZ19z'
    'dGFydF90aW1lX2FwcBiZASABKBFIKFIdc2NoZWR1bGVkQ2hhcmdpbmdTdGFydFRpbWVBcHASTA'
    'ohc3VwZXJjaGFyZ2VyX3Nlc3Npb25fdHJpcF9wbGFubmVyGJoBIAEoCEgpUh5zdXBlcmNoYXJn'
    'ZXJTZXNzaW9uVHJpcFBsYW5uZXISVwoRY2hhcmdlX3BvcnRfY29sb3IYmwEgASgOMiguQ2FyU2'
    'VydmVyLkNoYXJnZVN0YXRlLkNoYXJnZVBvcnRDb2xvcl9FSCpSD2NoYXJnZVBvcnRDb2xvchI0'
    'ChVjaGFyZ2VfcmF0ZV9tcGhfZmxvYXQYnAEgASgCSCtSEmNoYXJnZVJhdGVNcGhGbG9hdBJbCh'
    'NjaGFyZ2VfbGltaXRfcmVhc29uGJ0BIAEoDjIoLkNhclNlcnZlci5DaGFyZ2VTdGF0ZS5DaGFy'
    'Z2VMaW1pdFJlYXNvbkgsUhFjaGFyZ2VMaW1pdFJlYXNvbhJWChZtYW5hZ2VkX2NoYXJnaW5nX3'
    'N0YXRlGJ4BIAEoCzIfLkNhclNlcnZlci5NYW5hZ2VkQ2hhcmdpbmdTdGF0ZVIUbWFuYWdlZENo'
    'YXJnaW5nU3RhdGUSNwoWY2hhcmdlX2NhYmxlX3VubGF0Y2hlZBifASABKAhILVIUY2hhcmdlQ2'
    'FibGVVbmxhdGNoZWQSSAoMb3V0bGV0X3N0YXRlGKABIAEoDjIiLkNhclNlcnZlci5DaGFyZ2VT'
    'dGF0ZS5PdXRsZXRTdGF0ZUguUgtvdXRsZXRTdGF0ZRJSChBwb3dlcl9mZWVkX3N0YXRlGKEBIA'
    'EoDjIlLkNhclNlcnZlci5DaGFyZ2VTdGF0ZS5Qb3dlckZlZWRTdGF0ZUgvUg5wb3dlckZlZWRT'
    'dGF0ZRIrChBvdXRsZXRfc29jX2xpbWl0GKIBIAEoBUgwUg5vdXRsZXRTb2NMaW1pdBIyChRwb3'
    'dlcl9mZWVkX3NvY19saW1pdBijASABKAVIMVIRcG93ZXJGZWVkU29jTGltaXQSNQoVb3V0bGV0'
    'X3RpbWVfcmVtYWluaW5nGKQBIAEoA0gyUhNvdXRsZXRUaW1lUmVtYWluaW5nEjwKGXBvd2VyX2'
    'ZlZWRfdGltZV9yZW1haW5pbmcYpQEgASgDSDNSFnBvd2VyRmVlZFRpbWVSZW1haW5pbmcSPwoa'
    'cG93ZXJzaGFyZV9mZWF0dXJlX2FsbG93ZWQYpgEgASgISDRSGHBvd2Vyc2hhcmVGZWF0dXJlQW'
    'xsb3dlZBI/Chpwb3dlcnNoYXJlX2ZlYXR1cmVfZW5hYmxlZBinASABKAhINVIYcG93ZXJzaGFy'
    'ZUZlYXR1cmVFbmFibGVkEjAKEnBvd2Vyc2hhcmVfcmVxdWVzdBioASABKAhINlIRcG93ZXJzaG'
    'FyZVJlcXVlc3QSUQoPcG93ZXJzaGFyZV90eXBlGKkBIAEoDjIlLkNhclNlcnZlci5DaGFyZ2VT'
    'dGF0ZS5Qb3dlcnNoYXJlVHlwZUg3Ug5wb3dlcnNoYXJlVHlwZRJXChFwb3dlcnNoYXJlX3N0YX'
    'R1cxiqASABKA4yJy5DYXJTZXJ2ZXIuQ2hhcmdlU3RhdGUuUG93ZXJzaGFyZVN0YXR1c0g4UhBw'
    'b3dlcnNoYXJlU3RhdHVzEmQKFnBvd2Vyc2hhcmVfc3RvcF9yZWFzb24YqwEgASgOMisuQ2FyU2'
    'VydmVyLkNoYXJnZVN0YXRlLlBvd2Vyc2hhcmVTdG9wUmVhc29uSDlSFHBvd2Vyc2hhcmVTdG9w'
    'UmVhc29uEkoKIHBvd2Vyc2hhcmVfaW5zdGFudGFuZW91c19sb2FkX2t3GKwBIAEoAkg6Uh1wb3'
    'dlcnNoYXJlSW5zdGFudGFuZW91c0xvYWRLdxJLCiFwb3dlcnNoYXJlX3ZlaGljbGVfZW5lcmd5'
    'X2xlZnRfaHIYrQEgASgFSDtSHXBvd2Vyc2hhcmVWZWhpY2xlRW5lcmd5TGVmdEhyEjMKFHBvd2'
    'Vyc2hhcmVfc29jX2xpbWl0GK4BIAEoBUg8UhJwb3dlcnNoYXJlU29jTGltaXQSLgoSb25lX3Rp'
    'bWVfc29jX2xpbWl0GK8BIAEoBUg9Ug9vbmVUaW1lU29jTGltaXQSOgoNaG9tZV9sb2NhdGlvbh'
    'iwASABKAsyEi5DYXJTZXJ2ZXIuTGF0TG9uZ0g+Ugxob21lTG9jYXRpb24SOgoNd29ya19sb2Nh'
    'dGlvbhixASABKAsyEi5DYXJTZXJ2ZXIuTGF0TG9uZ0g/Ugx3b3JrTG9jYXRpb24SOgoYb3V0bG'
    'V0X21heF90aW1lcl9taW51dGVzGLIBIAEoBUhAUhVvdXRsZXRNYXhUaW1lck1pbnV0ZXMa0gEK'
    'CUNhYmxlVHlwZRIjCgNTTkEYASABKAsyDy5DYXJTZXJ2ZXIuVm9pZEgAUgNTTkESIwoDSUVDGA'
    'IgASgLMg8uQ2FyU2VydmVyLlZvaWRIAFIDSUVDEiMKA1NBRRgDIAEoCzIPLkNhclNlcnZlci5W'
    'b2lkSABSA1NBRRImCgVHQl9BQxgEIAEoCzIPLkNhclNlcnZlci5Wb2lkSABSBEdCQUMSJgoFR0'
    'JfREMYBSABKAsyDy5DYXJTZXJ2ZXIuVm9pZEgAUgRHQkRDQgYKBHR5cGUatgMKC0NoYXJnZXJU'
    'eXBlEiMKA1NOQRgBIAEoCzIPLkNhclNlcnZlci5Wb2lkSABSA1NOQRI1CgxTdXBlcmNoYXJnZX'
    'IYAiABKAsyDy5DYXJTZXJ2ZXIuVm9pZEgAUgxTdXBlcmNoYXJnZXISKwoHQ2hhZGVtbxgDIAEo'
    'CzIPLkNhclNlcnZlci5Wb2lkSABSB0NoYWRlbW8SIQoCR2IYBCABKAsyDy5DYXJTZXJ2ZXIuVm'
    '9pZEgAUgJHYhI7Cg9BQ1NpbmdsZVdpcmVDQU4YBSABKAsyDy5DYXJTZXJ2ZXIuVm9pZEgAUg9B'
    'Q1NpbmdsZVdpcmVDQU4SJwoFQ29tYm8YBiABKAsyDy5DYXJTZXJ2ZXIuVm9pZEgAUgVDb21ibx'
    'I7Cg9NQ1NpbmdsZVdpcmVDQU4YByABKAsyDy5DYXJTZXJ2ZXIuVm9pZEgAUg9NQ1NpbmdsZVdp'
    'cmVDQU4SJwoFT3RoZXIYCCABKAsyDy5DYXJTZXJ2ZXIuVm9pZEgAUgVPdGhlchInCgVUZXNsYR'
    'gJIAEoCzIPLkNhclNlcnZlci5Wb2lkSABSBVRlc2xhQgYKBHR5cGUalwMKDUNoYXJnaW5nU3Rh'
    'dGUSKwoHVW5rbm93bhgBIAEoCzIPLkNhclNlcnZlci5Wb2lkSABSB1Vua25vd24SNQoMRGlzY2'
    '9ubmVjdGVkGAIgASgLMg8uQ2FyU2VydmVyLlZvaWRIAFIMRGlzY29ubmVjdGVkEisKB05vUG93'
    'ZXIYAyABKAsyDy5DYXJTZXJ2ZXIuVm9pZEgAUgdOb1Bvd2VyEi0KCFN0YXJ0aW5nGAQgASgLMg'
    '8uQ2FyU2VydmVyLlZvaWRIAFIIU3RhcnRpbmcSLQoIQ2hhcmdpbmcYBSABKAsyDy5DYXJTZXJ2'
    'ZXIuVm9pZEgAUghDaGFyZ2luZxItCghDb21wbGV0ZRgGIAEoCzIPLkNhclNlcnZlci5Wb2lkSA'
    'BSCENvbXBsZXRlEisKB1N0b3BwZWQYByABKAsyDy5DYXJTZXJ2ZXIuVm9pZEgAUgdTdG9wcGVk'
    'EjMKC0NhbGlicmF0aW5nGAggASgLMg8uQ2FyU2VydmVyLlZvaWRIAFILQ2FsaWJyYXRpbmdCBg'
    'oEdHlwZRpkCgxDaGFyZ2VyQnJhbmQSJwoFVGVzbGEYASABKAsyDy5DYXJTZXJ2ZXIuVm9pZEgA'
    'UgVUZXNsYRIjCgNTTkEYAiABKAsyDy5DYXJTZXJ2ZXIuVm9pZEgAUgNTTkFCBgoEdHlwZSJ6Ch'
    'VTY2hlZHVsZWRDaGFyZ2luZ01vZGUSHAoYU2NoZWR1bGVkQ2hhcmdpbmdNb2RlT2ZmEAASIAoc'
    'U2NoZWR1bGVkQ2hhcmdpbmdNb2RlU3RhcnRBdBABEiEKHVNjaGVkdWxlZENoYXJnaW5nTW9kZU'
    'RlcGFydEJ5EAIiwgIKEUNoYXJnZVBvcnRDb2xvcl9FEhYKEkNoYXJnZVBvcnRDb2xvck9mZhAA'
    'EhYKEkNoYXJnZVBvcnRDb2xvclJlZBABEhgKFENoYXJnZVBvcnRDb2xvckdyZWVuEAISFwoTQ2'
    'hhcmdlUG9ydENvbG9yQmx1ZRADEhgKFENoYXJnZVBvcnRDb2xvcldoaXRlEAQSIAocQ2hhcmdl'
    'UG9ydENvbG9yRmxhc2hpbmdHcmVlbhAFEiAKHENoYXJnZVBvcnRDb2xvckZsYXNoaW5nQW1iZX'
    'IQBhIYChRDaGFyZ2VQb3J0Q29sb3JBbWJlchAHEhcKE0NoYXJnZVBvcnRDb2xvclJhdmUQCBIY'
    'ChRDaGFyZ2VQb3J0Q29sb3JEZWJ1ZxAJEh8KG0NoYXJnZVBvcnRDb2xvckZsYXNoaW5nQmx1ZR'
    'AKIsMBChFDaGFyZ2VMaW1pdFJlYXNvbhIcChhDaGFyZ2VMaW1pdFJlYXNvblVua25vd24QABIZ'
    'ChVDaGFyZ2VMaW1pdFJlYXNvbk5vbmUQARIZChVDaGFyZ2VMaW1pdFJlYXNvbkV2c2UQAhIgCh'
    'xDaGFyZ2VMaW1pdFJlYXNvbkJhdHRUZW1wTG93EAMSHAoYQ2hhcmdlTGltaXRSZWFzb25IaWdo'
    'U29jEAQSGgoWQ2hhcmdlTGltaXRSZWFzb25DYWJpbhAFIlMKC091dGxldFN0YXRlEhIKDk91dG'
    'xldFN0YXRlT2ZmEAASGgoWT3V0bGV0U3RhdGVDYWJpbkFuZEJlZBABEhQKEE91dGxldFN0YXRl'
    'Q2FiaW4QAiJfCg5Qb3dlckZlZWRTdGF0ZRIVChFQb3dlckZlZWRTdGF0ZU9mZhAAEh0KGVBvd2'
    'VyRmVlZFN0YXRlQ2FiaW5BbmRCZWQQARIXChNQb3dlckZlZWRTdGF0ZUNhYmluEAIi0AEKEFBv'
    'd2Vyc2hhcmVTdGF0dXMSHAoYUG93ZXJzaGFyZVN0YXR1c0luYWN0aXZlEAASGAoUUG93ZXJzaG'
    'FyZVN0YXR1c0luaXQQARIaChZQb3dlcnNoYXJlU3RhdHVzQWN0aXZlEAISGwoXUG93ZXJzaGFy'
    'ZVN0YXR1c1N0b3BwZWQQAxIfChtQb3dlcnNoYXJlU3RhdHVzSGFuZHNoYWtpbmcQBBIqCiZQb3'
    'dlcnNoYXJlU3RhdHVzQWN0aXZlUmVjb25uZWN0aW5nU29vbhAFIlgKDlBvd2Vyc2hhcmVUeXBl'
    'EhYKElBvd2Vyc2hhcmVUeXBlTm9uZRAAEhYKElBvd2Vyc2hhcmVUeXBlTG9hZBABEhYKElBvd2'
    'Vyc2hhcmVUeXBlSG9tZRACIoECChRQb3dlcnNoYXJlU3RvcFJlYXNvbhIcChhQb3dlcnNoYXJl'
    'U3RvcFJlYXNvbk5vbmUQABIhCh1Qb3dlcnNoYXJlU3RvcFJlYXNvblNPQ1Rvb0xvdxABEh0KGV'
    'Bvd2Vyc2hhcmVTdG9wUmVhc29uUmV0cnkQAhIdChlQb3dlcnNoYXJlU3RvcFJlYXNvbkZhdWx0'
    'EAMSHAoYUG93ZXJzaGFyZVN0b3BSZWFzb25Vc2VyEAQSJAogUG93ZXJzaGFyZVN0b3BSZWFzb2'
    '5SZWNvbm5lY3RpbmcQBRImCiJQb3dlcnNoYXJlU3RvcFJlYXNvbkF1dGhlbnRpY2F0aW9uEAZC'
    'GwoZb3B0aW9uYWxfY2hhcmdlX2xpbWl0X3NvY0IfCh1vcHRpb25hbF9jaGFyZ2VfbGltaXRfc2'
    '9jX3N0ZEIfCh1vcHRpb25hbF9jaGFyZ2VfbGltaXRfc29jX21pbkIfCh1vcHRpb25hbF9jaGFy'
    'Z2VfbGltaXRfc29jX21heEIjCiFvcHRpb25hbF9tYXhfcmFuZ2VfY2hhcmdlX2NvdW50ZXJCHw'
    'odb3B0aW9uYWxfZmFzdF9jaGFyZ2VyX3ByZXNlbnRCGAoWb3B0aW9uYWxfYmF0dGVyeV9yYW5n'
    'ZUIcChpvcHRpb25hbF9lc3RfYmF0dGVyeV9yYW5nZUIeChxvcHRpb25hbF9pZGVhbF9iYXR0ZX'
    'J5X3JhbmdlQhgKFm9wdGlvbmFsX2JhdHRlcnlfbGV2ZWxCHwodb3B0aW9uYWxfdXNhYmxlX2Jh'
    'dHRlcnlfbGV2ZWxCHgocb3B0aW9uYWxfY2hhcmdlX2VuZXJneV9hZGRlZEIjCiFvcHRpb25hbF'
    '9jaGFyZ2VfbWlsZXNfYWRkZWRfcmF0ZWRCIwohb3B0aW9uYWxfY2hhcmdlX21pbGVzX2FkZGVk'
    'X2lkZWFsQhoKGG9wdGlvbmFsX2NoYXJnZXJfdm9sdGFnZUIgCh5vcHRpb25hbF9jaGFyZ2VyX3'
    'BpbG90X2N1cnJlbnRCIQofb3B0aW9uYWxfY2hhcmdlcl9hY3R1YWxfY3VycmVudEIYChZvcHRp'
    'b25hbF9jaGFyZ2VyX3Bvd2VyQiEKH29wdGlvbmFsX21pbnV0ZXNfdG9fZnVsbF9jaGFyZ2VCIg'
    'ogb3B0aW9uYWxfbWludXRlc190b19jaGFyZ2VfbGltaXRCGAoWb3B0aW9uYWxfdHJpcF9jaGFy'
    'Z2luZ0IaChhvcHRpb25hbF9jaGFyZ2VfcmF0ZV9tcGhCIAoeb3B0aW9uYWxfY2hhcmdlX3Bvcn'
    'RfZG9vcl9vcGVuQigKJm9wdGlvbmFsX3NjaGVkdWxlZF9jaGFyZ2luZ19zdGFydF90aW1lQiUK'
    'I29wdGlvbmFsX3NjaGVkdWxlZF9jaGFyZ2luZ19wZW5kaW5nQiUKI29wdGlvbmFsX3VzZXJfY2'
    'hhcmdlX2VuYWJsZV9yZXF1ZXN0QiAKHm9wdGlvbmFsX2NoYXJnZV9lbmFibGVfcmVxdWVzdEIZ'
    'ChdvcHRpb25hbF9jaGFyZ2VyX3BoYXNlc0IoCiZvcHRpb25hbF9jaGFyZ2VfcG9ydF9jb2xkX3'
    'dlYXRoZXJfbW9kZUIhCh9vcHRpb25hbF9jaGFyZ2VfY3VycmVudF9yZXF1ZXN0QiUKI29wdGlv'
    'bmFsX2NoYXJnZV9jdXJyZW50X3JlcXVlc3RfbWF4QiIKIG9wdGlvbmFsX21hbmFnZWRfY2hhcm'
    'dpbmdfYWN0aXZlQikKJ29wdGlvbmFsX21hbmFnZWRfY2hhcmdpbmdfdXNlcl9jYW5jZWxlZEIm'
    'CiRvcHRpb25hbF9tYW5hZ2VkX2NoYXJnaW5nX3N0YXJ0X3RpbWVCIgogb3B0aW9uYWxfb2ZmX3'
    'BlYWtfaG91cnNfZW5kX3RpbWVCIgogb3B0aW9uYWxfc2NoZWR1bGVkX2NoYXJnaW5nX21vZGVC'
    'GAoWb3B0aW9uYWxfY2hhcmdpbmdfYW1wc0IwCi5vcHRpb25hbF9zY2hlZHVsZWRfY2hhcmdpbm'
    'dfc3RhcnRfdGltZV9taW51dGVzQisKKW9wdGlvbmFsX3NjaGVkdWxlZF9kZXBhcnR1cmVfdGlt'
    'ZV9taW51dGVzQiIKIG9wdGlvbmFsX3ByZWNvbmRpdGlvbmluZ19lbmFibGVkQiwKKm9wdGlvbm'
    'FsX3NjaGVkdWxlZF9jaGFyZ2luZ19zdGFydF90aW1lX2FwcEIsCipvcHRpb25hbF9zdXBlcmNo'
    'YXJnZXJfc2Vzc2lvbl90cmlwX3BsYW5uZXJCHAoab3B0aW9uYWxfY2hhcmdlX3BvcnRfY29sb3'
    'JCIAoeb3B0aW9uYWxfY2hhcmdlX3JhdGVfbXBoX2Zsb2F0Qh4KHG9wdGlvbmFsX2NoYXJnZV9s'
    'aW1pdF9yZWFzb25CIQofb3B0aW9uYWxfY2hhcmdlX2NhYmxlX3VubGF0Y2hlZEIXChVvcHRpb2'
    '5hbF9vdXRsZXRfc3RhdGVCGwoZb3B0aW9uYWxfcG93ZXJfZmVlZF9zdGF0ZUIZChdvcHRpb25f'
    'b3V0bGV0X3NvY19saW1pdEIdChtvcHRpb25fcG93ZXJfZmVlZF9zb2NfbGltaXRCHgocb3B0aW'
    '9uX291dGxldF90aW1lX3JlbWFpbmluZ0IiCiBvcHRpb25fcG93ZXJfZmVlZF90aW1lX3JlbWFp'
    'bmluZ0IlCiNvcHRpb25hbF9wb3dlcnNoYXJlX2ZlYXR1cmVfYWxsb3dlZEIlCiNvcHRpb25hbF'
    '9wb3dlcnNoYXJlX2ZlYXR1cmVfZW5hYmxlZEIdChtvcHRpb25hbF9wb3dlcnNoYXJlX3JlcXVl'
    'c3RCGgoYb3B0aW9uYWxfcG93ZXJzaGFyZV90eXBlQhwKGm9wdGlvbmFsX3Bvd2Vyc2hhcmVfc3'
    'RhdHVzQiEKH29wdGlvbmFsX3Bvd2Vyc2hhcmVfc3RvcF9yZWFzb25CKwopb3B0aW9uYWxfcG93'
    'ZXJzaGFyZV9pbnN0YW50YW5lb3VzX2xvYWRfa3dCLAoqb3B0aW9uYWxfcG93ZXJzaGFyZV92ZW'
    'hpY2xlX2VuZXJneV9sZWZ0X2hyQh8KHW9wdGlvbmFsX3Bvd2Vyc2hhcmVfc29jX2xpbWl0Qh0K'
    'G29wdGlvbmFsX29uZV90aW1lX3NvY19saW1pdEIYChZvcHRpb25hbF9ob21lX2xvY2F0aW9uQh'
    'gKFm9wdGlvbmFsX3dvcmtfbG9jYXRpb25CIwohb3B0aW9uYWxfb3V0bGV0X21heF90aW1lcl9t'
    'aW51dGVzSgQICBAJSgQIKhArSgQIKxAs');

@$core.Deprecated('Use managedChargingStateDescriptor instead')
const ManagedChargingState$json = {
  '1': 'ManagedChargingState',
  '2': [
    {
      '1': 'charge_on_solar_state',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.CarServer.ChargeOnSolarState',
      '10': 'chargeOnSolarState'
    },
    {
      '1': 'charge_on_solar_gateway_din',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'chargeOnSolarGatewayDin'
    },
    {
      '1': 'tesla_electric_asset_id',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'teslaElectricAssetId'
    },
    {
      '1': 'minutes_to_lower_limit',
      '3': 4,
      '4': 1,
      '5': 5,
      '9': 2,
      '10': 'minutesToLowerLimit'
    },
  ],
  '8': [
    {'1': 'optional_charge_on_solar_gateway_din'},
    {'1': 'optional_tesla_electric_asset_id'},
    {'1': 'optional_minutes_to_lower_limit'},
  ],
};

/// Descriptor for `ManagedChargingState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List managedChargingStateDescriptor = $convert.base64Decode(
    'ChRNYW5hZ2VkQ2hhcmdpbmdTdGF0ZRJQChVjaGFyZ2Vfb25fc29sYXJfc3RhdGUYASABKAsyHS'
    '5DYXJTZXJ2ZXIuQ2hhcmdlT25Tb2xhclN0YXRlUhJjaGFyZ2VPblNvbGFyU3RhdGUSPgobY2hh'
    'cmdlX29uX3NvbGFyX2dhdGV3YXlfZGluGAIgASgJSABSF2NoYXJnZU9uU29sYXJHYXRld2F5RG'
    'luEjcKF3Rlc2xhX2VsZWN0cmljX2Fzc2V0X2lkGAMgASgJSAFSFHRlc2xhRWxlY3RyaWNBc3Nl'
    'dElkEjUKFm1pbnV0ZXNfdG9fbG93ZXJfbGltaXQYBCABKAVIAlITbWludXRlc1RvTG93ZXJMaW'
    '1pdEImCiRvcHRpb25hbF9jaGFyZ2Vfb25fc29sYXJfZ2F0ZXdheV9kaW5CIgogb3B0aW9uYWxf'
    'dGVzbGFfZWxlY3RyaWNfYXNzZXRfaWRCIQofb3B0aW9uYWxfbWludXRlc190b19sb3dlcl9saW'
    '1pdA==');

@$core.Deprecated('Use chargeOnSolarStateDescriptor instead')
const ChargeOnSolarState$json = {
  '1': 'ChargeOnSolarState',
  '2': [
    {
      '1': 'not_allowed',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.CarServer.ChargeOnSolarStateNotAllowed',
      '9': 0,
      '10': 'notAllowed'
    },
    {
      '1': 'no_charge_recommended',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.CarServer.ChargeOnSolarStateNoChargeRecommended',
      '9': 0,
      '10': 'noChargeRecommended'
    },
    {
      '1': 'charging_on_excess_solar',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.CarServer.ChargeOnSolarStateChargingOnExcessSolar',
      '9': 0,
      '10': 'chargingOnExcessSolar'
    },
    {
      '1': 'charging_on_anything',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.CarServer.ChargeOnSolarStateChargingOnAnything',
      '9': 0,
      '10': 'chargingOnAnything'
    },
    {
      '1': 'user_disabled',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.CarServer.ChargeOnSolarStateUserDisabled',
      '9': 0,
      '10': 'userDisabled'
    },
    {
      '1': 'waiting_for_server',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.CarServer.ChargeOnSolarStateWaitingForServer',
      '9': 0,
      '10': 'waitingForServer'
    },
    {
      '1': 'error',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.CarServer.ChargeOnSolarStateError',
      '9': 0,
      '10': 'error'
    },
    {
      '1': 'user_stopped',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.CarServer.ChargeOnSolarStateUserStopped',
      '9': 0,
      '10': 'userStopped'
    },
  ],
  '8': [
    {'1': 'state'},
  ],
  '9': [
    {'1': 5, '2': 6},
  ],
};

/// Descriptor for `ChargeOnSolarState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chargeOnSolarStateDescriptor = $convert.base64Decode(
    'ChJDaGFyZ2VPblNvbGFyU3RhdGUSSgoLbm90X2FsbG93ZWQYASABKAsyJy5DYXJTZXJ2ZXIuQ2'
    'hhcmdlT25Tb2xhclN0YXRlTm90QWxsb3dlZEgAUgpub3RBbGxvd2VkEmYKFW5vX2NoYXJnZV9y'
    'ZWNvbW1lbmRlZBgCIAEoCzIwLkNhclNlcnZlci5DaGFyZ2VPblNvbGFyU3RhdGVOb0NoYXJnZV'
    'JlY29tbWVuZGVkSABSE25vQ2hhcmdlUmVjb21tZW5kZWQSbQoYY2hhcmdpbmdfb25fZXhjZXNz'
    'X3NvbGFyGAMgASgLMjIuQ2FyU2VydmVyLkNoYXJnZU9uU29sYXJTdGF0ZUNoYXJnaW5nT25FeG'
    'Nlc3NTb2xhckgAUhVjaGFyZ2luZ09uRXhjZXNzU29sYXISYwoUY2hhcmdpbmdfb25fYW55dGhp'
    'bmcYBCABKAsyLy5DYXJTZXJ2ZXIuQ2hhcmdlT25Tb2xhclN0YXRlQ2hhcmdpbmdPbkFueXRoaW'
    '5nSABSEmNoYXJnaW5nT25Bbnl0aGluZxJQCg11c2VyX2Rpc2FibGVkGAYgASgLMikuQ2FyU2Vy'
    'dmVyLkNoYXJnZU9uU29sYXJTdGF0ZVVzZXJEaXNhYmxlZEgAUgx1c2VyRGlzYWJsZWQSXQoSd2'
    'FpdGluZ19mb3Jfc2VydmVyGAcgASgLMi0uQ2FyU2VydmVyLkNoYXJnZU9uU29sYXJTdGF0ZVdh'
    'aXRpbmdGb3JTZXJ2ZXJIAFIQd2FpdGluZ0ZvclNlcnZlchI6CgVlcnJvchgIIAEoCzIiLkNhcl'
    'NlcnZlci5DaGFyZ2VPblNvbGFyU3RhdGVFcnJvckgAUgVlcnJvchJNCgx1c2VyX3N0b3BwZWQY'
    'CSABKAsyKC5DYXJTZXJ2ZXIuQ2hhcmdlT25Tb2xhclN0YXRlVXNlclN0b3BwZWRIAFILdXNlcl'
    'N0b3BwZWRCBwoFc3RhdGVKBAgFEAY=');

@$core.Deprecated('Use chargeOnSolarStateNotAllowedDescriptor instead')
const ChargeOnSolarStateNotAllowed$json = {
  '1': 'ChargeOnSolarStateNotAllowed',
};

/// Descriptor for `ChargeOnSolarStateNotAllowed`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chargeOnSolarStateNotAllowedDescriptor =
    $convert.base64Decode('ChxDaGFyZ2VPblNvbGFyU3RhdGVOb3RBbGxvd2Vk');

@$core.Deprecated('Use chargeOnSolarStateNoChargeRecommendedDescriptor instead')
const ChargeOnSolarStateNoChargeRecommended$json = {
  '1': 'ChargeOnSolarStateNoChargeRecommended',
  '2': [
    {
      '1': 'reason',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.ManagedCharging.ChargeOnSolarNoChargeReason',
      '10': 'reason'
    },
  ],
};

/// Descriptor for `ChargeOnSolarStateNoChargeRecommended`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chargeOnSolarStateNoChargeRecommendedDescriptor =
    $convert.base64Decode(
        'CiVDaGFyZ2VPblNvbGFyU3RhdGVOb0NoYXJnZVJlY29tbWVuZGVkEkQKBnJlYXNvbhgBIAEoDj'
        'IsLk1hbmFnZWRDaGFyZ2luZy5DaGFyZ2VPblNvbGFyTm9DaGFyZ2VSZWFzb25SBnJlYXNvbg==');

@$core
    .Deprecated('Use chargeOnSolarStateChargingOnExcessSolarDescriptor instead')
const ChargeOnSolarStateChargingOnExcessSolar$json = {
  '1': 'ChargeOnSolarStateChargingOnExcessSolar',
};

/// Descriptor for `ChargeOnSolarStateChargingOnExcessSolar`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chargeOnSolarStateChargingOnExcessSolarDescriptor =
    $convert.base64Decode(
        'CidDaGFyZ2VPblNvbGFyU3RhdGVDaGFyZ2luZ09uRXhjZXNzU29sYXI=');

@$core.Deprecated('Use chargeOnSolarStateChargingOnAnythingDescriptor instead')
const ChargeOnSolarStateChargingOnAnything$json = {
  '1': 'ChargeOnSolarStateChargingOnAnything',
};

/// Descriptor for `ChargeOnSolarStateChargingOnAnything`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chargeOnSolarStateChargingOnAnythingDescriptor =
    $convert
        .base64Decode('CiRDaGFyZ2VPblNvbGFyU3RhdGVDaGFyZ2luZ09uQW55dGhpbmc=');

@$core.Deprecated('Use chargeOnSolarStateUserDisabledDescriptor instead')
const ChargeOnSolarStateUserDisabled$json = {
  '1': 'ChargeOnSolarStateUserDisabled',
};

/// Descriptor for `ChargeOnSolarStateUserDisabled`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chargeOnSolarStateUserDisabledDescriptor =
    $convert.base64Decode('Ch5DaGFyZ2VPblNvbGFyU3RhdGVVc2VyRGlzYWJsZWQ=');

@$core.Deprecated('Use chargeOnSolarStateWaitingForServerDescriptor instead')
const ChargeOnSolarStateWaitingForServer$json = {
  '1': 'ChargeOnSolarStateWaitingForServer',
};

/// Descriptor for `ChargeOnSolarStateWaitingForServer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chargeOnSolarStateWaitingForServerDescriptor =
    $convert.base64Decode('CiJDaGFyZ2VPblNvbGFyU3RhdGVXYWl0aW5nRm9yU2VydmVy');

@$core.Deprecated('Use chargeOnSolarStateErrorDescriptor instead')
const ChargeOnSolarStateError$json = {
  '1': 'ChargeOnSolarStateError',
};

/// Descriptor for `ChargeOnSolarStateError`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chargeOnSolarStateErrorDescriptor =
    $convert.base64Decode('ChdDaGFyZ2VPblNvbGFyU3RhdGVFcnJvcg==');

@$core.Deprecated('Use chargeOnSolarStateUserStoppedDescriptor instead')
const ChargeOnSolarStateUserStopped$json = {
  '1': 'ChargeOnSolarStateUserStopped',
};

/// Descriptor for `ChargeOnSolarStateUserStopped`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chargeOnSolarStateUserStoppedDescriptor =
    $convert.base64Decode('Ch1DaGFyZ2VPblNvbGFyU3RhdGVVc2VyU3RvcHBlZA==');

@$core.Deprecated('Use locationStateDescriptor instead')
const LocationState$json = {
  '1': 'LocationState',
  '2': [
    {'1': 'latitude', '3': 101, '4': 1, '5': 2, '9': 0, '10': 'latitude'},
    {'1': 'longitude', '3': 102, '4': 1, '5': 2, '9': 1, '10': 'longitude'},
    {'1': 'heading', '3': 103, '4': 1, '5': 13, '9': 2, '10': 'heading'},
    {'1': 'gps_as_of', '3': 104, '4': 1, '5': 4, '9': 3, '10': 'gpsAsOf'},
    {
      '1': 'native_location_supported',
      '3': 105,
      '4': 1,
      '5': 8,
      '9': 4,
      '10': 'nativeLocationSupported'
    },
    {
      '1': 'native_latitude',
      '3': 106,
      '4': 1,
      '5': 2,
      '9': 5,
      '10': 'nativeLatitude'
    },
    {
      '1': 'native_longitude',
      '3': 107,
      '4': 1,
      '5': 2,
      '9': 6,
      '10': 'nativeLongitude'
    },
    {
      '1': 'native_type',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.CarServer.LocationState.GPSCoordinateType',
      '10': 'nativeType'
    },
    {
      '1': 'corrected_latitude',
      '3': 109,
      '4': 1,
      '5': 2,
      '9': 7,
      '10': 'correctedLatitude'
    },
    {
      '1': 'corrected_longitude',
      '3': 110,
      '4': 1,
      '5': 2,
      '9': 8,
      '10': 'correctedLongitude'
    },
    {
      '1': 'timestamp',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'timestamp'
    },
    {
      '1': 'homelink_nearby',
      '3': 112,
      '4': 1,
      '5': 8,
      '9': 9,
      '10': 'homelinkNearby'
    },
    {
      '1': 'location_name',
      '3': 113,
      '4': 1,
      '5': 9,
      '9': 10,
      '10': 'locationName'
    },
    {
      '1': 'geo_latitude',
      '3': 114,
      '4': 1,
      '5': 2,
      '9': 11,
      '10': 'geoLatitude'
    },
    {
      '1': 'geo_longitude',
      '3': 115,
      '4': 1,
      '5': 2,
      '9': 12,
      '10': 'geoLongitude'
    },
    {'1': 'geo_heading', '3': 116, '4': 1, '5': 2, '9': 13, '10': 'geoHeading'},
    {
      '1': 'geo_elevation',
      '3': 117,
      '4': 1,
      '5': 2,
      '9': 14,
      '10': 'geoElevation'
    },
    {
      '1': 'geo_accuracy',
      '3': 118,
      '4': 1,
      '5': 2,
      '9': 15,
      '10': 'geoAccuracy'
    },
    {
      '1': 'estimated_gps_valid',
      '3': 119,
      '4': 1,
      '5': 8,
      '9': 16,
      '10': 'estimatedGpsValid'
    },
    {
      '1': 'estimated_to_raw_distance',
      '3': 120,
      '4': 1,
      '5': 2,
      '9': 17,
      '10': 'estimatedToRawDistance'
    },
  ],
  '3': [LocationState_GPSCoordinateType$json],
  '8': [
    {'1': 'optional_latitude'},
    {'1': 'optional_longitude'},
    {'1': 'optional_heading'},
    {'1': 'optional_gps_as_of'},
    {'1': 'optional_native_location_supported'},
    {'1': 'optional_native_latitude'},
    {'1': 'optional_native_longitude'},
    {'1': 'optional_corrected_latitude'},
    {'1': 'optional_corrected_longitude'},
    {'1': 'optional_homelink_nearby'},
    {'1': 'optional_location_name'},
    {'1': 'optional_geo_latitude'},
    {'1': 'optional_geo_longitude'},
    {'1': 'optional_geo_heading'},
    {'1': 'optional_geo_elevation'},
    {'1': 'optional_geo_accuracy'},
    {'1': 'optional_estimated_gps_valid'},
    {'1': 'optional_estimated_to_raw_distance'},
  ],
  '9': [
    {'1': 12, '2': 13},
  ],
};

@$core.Deprecated('Use locationStateDescriptor instead')
const LocationState_GPSCoordinateType$json = {
  '1': 'GPSCoordinateType',
  '2': [
    {
      '1': 'GCJ',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'GCJ'
    },
    {
      '1': 'WGS',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'WGS'
    },
  ],
  '8': [
    {'1': 'type'},
  ],
};

/// Descriptor for `LocationState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List locationStateDescriptor = $convert.base64Decode(
    'Cg1Mb2NhdGlvblN0YXRlEhwKCGxhdGl0dWRlGGUgASgCSABSCGxhdGl0dWRlEh4KCWxvbmdpdH'
    'VkZRhmIAEoAkgBUglsb25naXR1ZGUSGgoHaGVhZGluZxhnIAEoDUgCUgdoZWFkaW5nEhwKCWdw'
    'c19hc19vZhhoIAEoBEgDUgdncHNBc09mEjwKGW5hdGl2ZV9sb2NhdGlvbl9zdXBwb3J0ZWQYaS'
    'ABKAhIBFIXbmF0aXZlTG9jYXRpb25TdXBwb3J0ZWQSKQoPbmF0aXZlX2xhdGl0dWRlGGogASgC'
    'SAVSDm5hdGl2ZUxhdGl0dWRlEisKEG5hdGl2ZV9sb25naXR1ZGUYayABKAJIBlIPbmF0aXZlTG'
    '9uZ2l0dWRlEksKC25hdGl2ZV90eXBlGAggASgLMiouQ2FyU2VydmVyLkxvY2F0aW9uU3RhdGUu'
    'R1BTQ29vcmRpbmF0ZVR5cGVSCm5hdGl2ZVR5cGUSLwoSY29ycmVjdGVkX2xhdGl0dWRlGG0gAS'
    'gCSAdSEWNvcnJlY3RlZExhdGl0dWRlEjEKE2NvcnJlY3RlZF9sb25naXR1ZGUYbiABKAJICFIS'
    'Y29ycmVjdGVkTG9uZ2l0dWRlEjgKCXRpbWVzdGFtcBgLIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi'
    '5UaW1lc3RhbXBSCXRpbWVzdGFtcBIpCg9ob21lbGlua19uZWFyYnkYcCABKAhICVIOaG9tZWxp'
    'bmtOZWFyYnkSJQoNbG9jYXRpb25fbmFtZRhxIAEoCUgKUgxsb2NhdGlvbk5hbWUSIwoMZ2VvX2'
    'xhdGl0dWRlGHIgASgCSAtSC2dlb0xhdGl0dWRlEiUKDWdlb19sb25naXR1ZGUYcyABKAJIDFIM'
    'Z2VvTG9uZ2l0dWRlEiEKC2dlb19oZWFkaW5nGHQgASgCSA1SCmdlb0hlYWRpbmcSJQoNZ2VvX2'
    'VsZXZhdGlvbhh1IAEoAkgOUgxnZW9FbGV2YXRpb24SIwoMZ2VvX2FjY3VyYWN5GHYgASgCSA9S'
    'C2dlb0FjY3VyYWN5EjAKE2VzdGltYXRlZF9ncHNfdmFsaWQYdyABKAhIEFIRZXN0aW1hdGVkR3'
    'BzVmFsaWQSOwoZZXN0aW1hdGVkX3RvX3Jhd19kaXN0YW5jZRh4IAEoAkgRUhZlc3RpbWF0ZWRU'
    'b1Jhd0Rpc3RhbmNlGmUKEUdQU0Nvb3JkaW5hdGVUeXBlEiMKA0dDShgBIAEoCzIPLkNhclNlcn'
    'Zlci5Wb2lkSABSA0dDShIjCgNXR1MYAiABKAsyDy5DYXJTZXJ2ZXIuVm9pZEgAUgNXR1NCBgoE'
    'dHlwZUITChFvcHRpb25hbF9sYXRpdHVkZUIUChJvcHRpb25hbF9sb25naXR1ZGVCEgoQb3B0aW'
    '9uYWxfaGVhZGluZ0IUChJvcHRpb25hbF9ncHNfYXNfb2ZCJAoib3B0aW9uYWxfbmF0aXZlX2xv'
    'Y2F0aW9uX3N1cHBvcnRlZEIaChhvcHRpb25hbF9uYXRpdmVfbGF0aXR1ZGVCGwoZb3B0aW9uYW'
    'xfbmF0aXZlX2xvbmdpdHVkZUIdChtvcHRpb25hbF9jb3JyZWN0ZWRfbGF0aXR1ZGVCHgocb3B0'
    'aW9uYWxfY29ycmVjdGVkX2xvbmdpdHVkZUIaChhvcHRpb25hbF9ob21lbGlua19uZWFyYnlCGA'
    'oWb3B0aW9uYWxfbG9jYXRpb25fbmFtZUIXChVvcHRpb25hbF9nZW9fbGF0aXR1ZGVCGAoWb3B0'
    'aW9uYWxfZ2VvX2xvbmdpdHVkZUIWChRvcHRpb25hbF9nZW9faGVhZGluZ0IYChZvcHRpb25hbF'
    '9nZW9fZWxldmF0aW9uQhcKFW9wdGlvbmFsX2dlb19hY2N1cmFjeUIeChxvcHRpb25hbF9lc3Rp'
    'bWF0ZWRfZ3BzX3ZhbGlkQiQKIm9wdGlvbmFsX2VzdGltYXRlZF90b19yYXdfZGlzdGFuY2VKBA'
    'gMEA0=');

@$core.Deprecated('Use vehicleStateDescriptor instead')
const VehicleState$json = {
  '1': 'VehicleState',
  '2': [
    {
      '1': 'guestMode',
      '3': 74,
      '4': 1,
      '5': 11,
      '6': '.CarServer.VehicleState.GuestMode',
      '10': 'guestMode'
    },
  ],
  '3': [VehicleState_GuestMode$json],
};

@$core.Deprecated('Use vehicleStateDescriptor instead')
const VehicleState_GuestMode$json = {
  '1': 'GuestMode',
  '2': [
    {'1': 'GuestModeActive', '3': 1, '4': 1, '5': 8, '10': 'GuestModeActive'},
  ],
};

/// Descriptor for `VehicleState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List vehicleStateDescriptor = $convert.base64Decode(
    'CgxWZWhpY2xlU3RhdGUSPwoJZ3Vlc3RNb2RlGEogASgLMiEuQ2FyU2VydmVyLlZlaGljbGVTdG'
    'F0ZS5HdWVzdE1vZGVSCWd1ZXN0TW9kZRo1CglHdWVzdE1vZGUSKAoPR3Vlc3RNb2RlQWN0aXZl'
    'GAEgASgIUg9HdWVzdE1vZGVBY3RpdmU=');

@$core.Deprecated('Use climateStateDescriptor instead')
const ClimateState$json = {
  '1': 'ClimateState',
  '2': [
    {
      '1': 'inside_temp_celsius',
      '3': 101,
      '4': 1,
      '5': 2,
      '9': 0,
      '10': 'insideTempCelsius'
    },
    {
      '1': 'outside_temp_celsius',
      '3': 102,
      '4': 1,
      '5': 2,
      '9': 1,
      '10': 'outsideTempCelsius'
    },
    {
      '1': 'driver_temp_setting',
      '3': 103,
      '4': 1,
      '5': 2,
      '9': 2,
      '10': 'driverTempSetting'
    },
    {
      '1': 'passenger_temp_setting',
      '3': 104,
      '4': 1,
      '5': 2,
      '9': 3,
      '10': 'passengerTempSetting'
    },
    {
      '1': 'left_temp_direction',
      '3': 105,
      '4': 1,
      '5': 5,
      '9': 4,
      '10': 'leftTempDirection'
    },
    {
      '1': 'right_temp_direction',
      '3': 106,
      '4': 1,
      '5': 5,
      '9': 5,
      '10': 'rightTempDirection'
    },
    {
      '1': 'is_front_defroster_on',
      '3': 107,
      '4': 1,
      '5': 8,
      '9': 6,
      '10': 'isFrontDefrosterOn'
    },
    {
      '1': 'is_rear_defroster_on',
      '3': 108,
      '4': 1,
      '5': 8,
      '9': 7,
      '10': 'isRearDefrosterOn'
    },
    {'1': 'fan_status', '3': 109, '4': 1, '5': 5, '9': 8, '10': 'fanStatus'},
    {
      '1': 'is_climate_on',
      '3': 110,
      '4': 1,
      '5': 8,
      '9': 9,
      '10': 'isClimateOn'
    },
    {
      '1': 'min_avail_temp_celsius',
      '3': 111,
      '4': 1,
      '5': 2,
      '9': 10,
      '10': 'minAvailTempCelsius'
    },
    {
      '1': 'max_avail_temp_celsius',
      '3': 112,
      '4': 1,
      '5': 2,
      '9': 11,
      '10': 'maxAvailTempCelsius'
    },
    {
      '1': 'seat_heater_left',
      '3': 113,
      '4': 1,
      '5': 5,
      '9': 12,
      '10': 'seatHeaterLeft'
    },
    {
      '1': 'seat_heater_right',
      '3': 114,
      '4': 1,
      '5': 5,
      '9': 13,
      '10': 'seatHeaterRight'
    },
    {
      '1': 'seat_heater_rear_left',
      '3': 115,
      '4': 1,
      '5': 5,
      '9': 14,
      '10': 'seatHeaterRearLeft'
    },
    {
      '1': 'seat_heater_rear_right',
      '3': 116,
      '4': 1,
      '5': 5,
      '9': 15,
      '10': 'seatHeaterRearRight'
    },
    {
      '1': 'seat_heater_rear_center',
      '3': 117,
      '4': 1,
      '5': 5,
      '9': 16,
      '10': 'seatHeaterRearCenter'
    },
    {
      '1': 'seat_heater_rear_right_back',
      '3': 118,
      '4': 1,
      '5': 5,
      '9': 17,
      '10': 'seatHeaterRearRightBack'
    },
    {
      '1': 'seat_heater_rear_left_back',
      '3': 119,
      '4': 1,
      '5': 5,
      '9': 18,
      '10': 'seatHeaterRearLeftBack'
    },
    {
      '1': 'seat_heater_third_row_right',
      '3': 120,
      '4': 1,
      '5': 5,
      '9': 19,
      '10': 'seatHeaterThirdRowRight'
    },
    {
      '1': 'seat_heater_third_row_left',
      '3': 121,
      '4': 1,
      '5': 5,
      '9': 20,
      '10': 'seatHeaterThirdRowLeft'
    },
    {
      '1': 'battery_heater',
      '3': 122,
      '4': 1,
      '5': 8,
      '9': 21,
      '10': 'batteryHeater'
    },
    {
      '1': 'battery_heater_no_power',
      '3': 123,
      '4': 1,
      '5': 8,
      '9': 22,
      '10': 'batteryHeaterNoPower'
    },
    {
      '1': 'steering_wheel_heater',
      '3': 125,
      '4': 1,
      '5': 8,
      '9': 23,
      '10': 'steeringWheelHeater'
    },
    {
      '1': 'wiper_blade_heater',
      '3': 126,
      '4': 1,
      '5': 8,
      '9': 24,
      '10': 'wiperBladeHeater'
    },
    {
      '1': 'side_mirror_heaters',
      '3': 127,
      '4': 1,
      '5': 8,
      '9': 25,
      '10': 'sideMirrorHeaters'
    },
    {
      '1': 'is_preconditioning',
      '3': 128,
      '4': 1,
      '5': 8,
      '9': 26,
      '10': 'isPreconditioning'
    },
    {
      '1': 'remote_heater_control_enabled',
      '3': 129,
      '4': 1,
      '5': 8,
      '9': 27,
      '10': 'remoteHeaterControlEnabled'
    },
    {
      '1': 'climate_keeper_mode',
      '3': 30,
      '4': 1,
      '5': 11,
      '6': '.CarServer.ClimateState.ClimateKeeperMode',
      '10': 'climateKeeperMode'
    },
    {
      '1': 'timestamp',
      '3': 33,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'timestamp'
    },
    {
      '1': 'bioweapon_mode_on',
      '3': 134,
      '4': 1,
      '5': 8,
      '9': 28,
      '10': 'bioweaponModeOn'
    },
    {
      '1': 'defrost_mode',
      '3': 35,
      '4': 1,
      '5': 11,
      '6': '.CarServer.ClimateState.DefrostMode',
      '10': 'defrostMode'
    },
    {
      '1': 'is_auto_conditioning_on',
      '3': 136,
      '4': 1,
      '5': 8,
      '9': 29,
      '10': 'isAutoConditioningOn'
    },
    {
      '1': 'auto_seat_climate_left',
      '3': 137,
      '4': 1,
      '5': 8,
      '9': 30,
      '10': 'autoSeatClimateLeft'
    },
    {
      '1': 'auto_seat_climate_right',
      '3': 138,
      '4': 1,
      '5': 8,
      '9': 31,
      '10': 'autoSeatClimateRight'
    },
    {
      '1': 'seat_fan_front_left',
      '3': 139,
      '4': 1,
      '5': 5,
      '9': 32,
      '10': 'seatFanFrontLeft'
    },
    {
      '1': 'seat_fan_front_right',
      '3': 140,
      '4': 1,
      '5': 5,
      '9': 33,
      '10': 'seatFanFrontRight'
    },
    {
      '1': 'allow_cabin_overheat_protection',
      '3': 141,
      '4': 1,
      '5': 8,
      '9': 34,
      '10': 'allowCabinOverheatProtection'
    },
    {
      '1': 'supports_fan_only_cabin_overheat_protection',
      '3': 142,
      '4': 1,
      '5': 8,
      '9': 35,
      '10': 'supportsFanOnlyCabinOverheatProtection'
    },
    {
      '1': 'cabin_overheat_protection',
      '3': 143,
      '4': 1,
      '5': 14,
      '6': '.CarServer.ClimateState.CabinOverheatProtection_E',
      '9': 36,
      '10': 'cabinOverheatProtection'
    },
    {
      '1': 'cabin_overheat_protection_actively_cooling',
      '3': 144,
      '4': 1,
      '5': 8,
      '9': 37,
      '10': 'cabinOverheatProtectionActivelyCooling'
    },
    {
      '1': 'cop_activation_temperature',
      '3': 146,
      '4': 1,
      '5': 14,
      '6': '.CarServer.ClimateState.CopActivationTemp',
      '9': 38,
      '10': 'copActivationTemperature'
    },
    {
      '1': 'auto_steering_wheel_heat',
      '3': 147,
      '4': 1,
      '5': 8,
      '9': 39,
      '10': 'autoSteeringWheelHeat'
    },
    {
      '1': 'steering_wheel_heat_level',
      '3': 148,
      '4': 1,
      '5': 14,
      '6': '.CarServer.StwHeatLevel',
      '9': 40,
      '10': 'steeringWheelHeatLevel'
    },
    {
      '1': 'hvac_auto_request',
      '3': 150,
      '4': 1,
      '5': 14,
      '6': '.CarServer.ClimateState.HvacAutoRequest',
      '9': 41,
      '10': 'hvacAutoRequest'
    },
    {
      '1': 'cop_not_running_reason',
      '3': 151,
      '4': 1,
      '5': 14,
      '6': '.CarServer.ClimateState.COPNotRunningReason',
      '9': 42,
      '10': 'copNotRunningReason'
    },
  ],
  '3': [ClimateState_ClimateKeeperMode$json, ClimateState_DefrostMode$json],
  '4': [
    ClimateState_HvacAutoRequest$json,
    ClimateState_CabinOverheatProtection_E$json,
    ClimateState_SeatHeaterLevel_E$json,
    ClimateState_SeatCoolingLevel_E$json,
    ClimateState_CopActivationTemp$json,
    ClimateState_COPNotRunningReason$json
  ],
  '8': [
    {'1': 'optional_inside_temp_celsius'},
    {'1': 'optional_outside_temp_celsius'},
    {'1': 'optional_driver_temp_setting'},
    {'1': 'optional_passenger_temp_setting'},
    {'1': 'optional_left_temp_direction'},
    {'1': 'optional_right_temp_direction'},
    {'1': 'optional_is_front_defroster_on'},
    {'1': 'optional_is_rear_defroster_on'},
    {'1': 'optional_fan_status'},
    {'1': 'optional_is_climate_on'},
    {'1': 'optional_min_avail_temp_celsius'},
    {'1': 'optional_max_avail_temp_celsius'},
    {'1': 'optional_seat_heater_left'},
    {'1': 'optional_seat_heater_right'},
    {'1': 'optional_seat_heater_rear_left'},
    {'1': 'optional_seat_heater_rear_right'},
    {'1': 'optional_seat_heater_rear_center'},
    {'1': 'optional_seat_heater_rear_right_back'},
    {'1': 'optional_seat_heater_rear_left_back'},
    {'1': 'optional_seat_heater_third_row_right'},
    {'1': 'optional_seat_heater_third_row_left'},
    {'1': 'optional_battery_heater'},
    {'1': 'optional_battery_heater_no_power'},
    {'1': 'optional_steering_wheel_heater'},
    {'1': 'optional_wiper_blade_heater'},
    {'1': 'optional_side_mirror_heaters'},
    {'1': 'optional_is_preconditioning'},
    {'1': 'optional_remote_heater_control_enabled'},
    {'1': 'optional_bioweapon_mode_on'},
    {'1': 'optional_is_auto_conditioning_on'},
    {'1': 'optional_auto_seat_climate_left'},
    {'1': 'optional_auto_seat_climate_right'},
    {'1': 'optional_seat_fan_front_left'},
    {'1': 'optional_seat_fan_front_right'},
    {'1': 'optional_allow_cabin_overheat_protection'},
    {'1': 'optional_supports_fan_only_cabin_overheat_protection'},
    {'1': 'optional_cabin_overheat_protection'},
    {'1': 'optional_cabin_overheat_protection_actively_cooling'},
    {'1': 'optional_cop_activation_temperature'},
    {'1': 'optional_auto_steering_wheel_heat'},
    {'1': 'optional_steering_wheel_heat_level'},
    {'1': 'optional_hvac_auto_request'},
    {'1': 'optional_cop_not_running_reason'},
  ],
  '9': [
    {'1': 145, '2': 146},
  ],
};

@$core.Deprecated('Use climateStateDescriptor instead')
const ClimateState_ClimateKeeperMode$json = {
  '1': 'ClimateKeeperMode',
  '2': [
    {
      '1': 'Unknown',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Unknown'
    },
    {
      '1': 'Off',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Off'
    },
    {
      '1': 'On',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'On'
    },
    {
      '1': 'Dog',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Dog'
    },
    {
      '1': 'Party',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Party'
    },
  ],
  '8': [
    {'1': 'type'},
  ],
};

@$core.Deprecated('Use climateStateDescriptor instead')
const ClimateState_DefrostMode$json = {
  '1': 'DefrostMode',
  '2': [
    {
      '1': 'Off',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Off'
    },
    {
      '1': 'Normal',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Normal'
    },
    {
      '1': 'Max',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Max'
    },
  ],
  '8': [
    {'1': 'type'},
  ],
};

@$core.Deprecated('Use climateStateDescriptor instead')
const ClimateState_HvacAutoRequest$json = {
  '1': 'HvacAutoRequest',
  '2': [
    {'1': 'HvacAutoRequestOn', '2': 0},
    {'1': 'HvacAutoRequestOverride', '2': 1},
  ],
};

@$core.Deprecated('Use climateStateDescriptor instead')
const ClimateState_CabinOverheatProtection_E$json = {
  '1': 'CabinOverheatProtection_E',
  '2': [
    {'1': 'CabinOverheatProtectionOff', '2': 0},
    {'1': 'CabinOverheatProtectionOn', '2': 1},
    {'1': 'CabinOverheatProtectionFanOnly', '2': 2},
  ],
};

@$core.Deprecated('Use climateStateDescriptor instead')
const ClimateState_SeatHeaterLevel_E$json = {
  '1': 'SeatHeaterLevel_E',
  '2': [
    {'1': 'SeatHeaterLevelOff', '2': 0},
    {'1': 'SeatHeaterLevelLow', '2': 1},
    {'1': 'SeatHeaterLevelMed', '2': 2},
    {'1': 'SeatHeaterLevelHigh', '2': 3},
  ],
};

@$core.Deprecated('Use climateStateDescriptor instead')
const ClimateState_SeatCoolingLevel_E$json = {
  '1': 'SeatCoolingLevel_E',
  '2': [
    {'1': 'SeatCoolingLevelOff', '2': 0},
    {'1': 'SeatCoolingLevelLow', '2': 1},
    {'1': 'SeatCoolingLevelMed', '2': 2},
    {'1': 'SeatCoolingLevelHigh', '2': 3},
  ],
};

@$core.Deprecated('Use climateStateDescriptor instead')
const ClimateState_CopActivationTemp$json = {
  '1': 'CopActivationTemp',
  '2': [
    {'1': 'CopActivationTempUnspecified', '2': 0},
    {'1': 'CopActivationTempLow', '2': 1},
    {'1': 'CopActivationTempMedium', '2': 2},
    {'1': 'CopActivationTempHigh', '2': 3},
  ],
};

@$core.Deprecated('Use climateStateDescriptor instead')
const ClimateState_COPNotRunningReason$json = {
  '1': 'COPNotRunningReason',
  '2': [
    {'1': 'COPNotRunningReasonNoReason', '2': 0},
    {'1': 'COPNotRunningReasonUserInteraction', '2': 1},
    {'1': 'COPNotRunningReasonEnergyConsumptionReached', '2': 2},
    {'1': 'COPNotRunningReasonTimeout', '2': 3},
    {'1': 'COPNotRunningReasonLowSolarLoad', '2': 4},
    {'1': 'COPNotRunningReasonFault', '2': 5},
    {'1': 'COPNotRunningReasonCabinBelowThreshold', '2': 6},
  ],
};

/// Descriptor for `ClimateState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List climateStateDescriptor = $convert.base64Decode(
    'CgxDbGltYXRlU3RhdGUSMAoTaW5zaWRlX3RlbXBfY2Vsc2l1cxhlIAEoAkgAUhFpbnNpZGVUZW'
    '1wQ2Vsc2l1cxIyChRvdXRzaWRlX3RlbXBfY2Vsc2l1cxhmIAEoAkgBUhJvdXRzaWRlVGVtcENl'
    'bHNpdXMSMAoTZHJpdmVyX3RlbXBfc2V0dGluZxhnIAEoAkgCUhFkcml2ZXJUZW1wU2V0dGluZx'
    'I2ChZwYXNzZW5nZXJfdGVtcF9zZXR0aW5nGGggASgCSANSFHBhc3NlbmdlclRlbXBTZXR0aW5n'
    'EjAKE2xlZnRfdGVtcF9kaXJlY3Rpb24YaSABKAVIBFIRbGVmdFRlbXBEaXJlY3Rpb24SMgoUcm'
    'lnaHRfdGVtcF9kaXJlY3Rpb24YaiABKAVIBVIScmlnaHRUZW1wRGlyZWN0aW9uEjMKFWlzX2Zy'
    'b250X2RlZnJvc3Rlcl9vbhhrIAEoCEgGUhJpc0Zyb250RGVmcm9zdGVyT24SMQoUaXNfcmVhcl'
    '9kZWZyb3N0ZXJfb24YbCABKAhIB1IRaXNSZWFyRGVmcm9zdGVyT24SHwoKZmFuX3N0YXR1cxht'
    'IAEoBUgIUglmYW5TdGF0dXMSJAoNaXNfY2xpbWF0ZV9vbhhuIAEoCEgJUgtpc0NsaW1hdGVPbh'
    'I1ChZtaW5fYXZhaWxfdGVtcF9jZWxzaXVzGG8gASgCSApSE21pbkF2YWlsVGVtcENlbHNpdXMS'
    'NQoWbWF4X2F2YWlsX3RlbXBfY2Vsc2l1cxhwIAEoAkgLUhNtYXhBdmFpbFRlbXBDZWxzaXVzEi'
    'oKEHNlYXRfaGVhdGVyX2xlZnQYcSABKAVIDFIOc2VhdEhlYXRlckxlZnQSLAoRc2VhdF9oZWF0'
    'ZXJfcmlnaHQYciABKAVIDVIPc2VhdEhlYXRlclJpZ2h0EjMKFXNlYXRfaGVhdGVyX3JlYXJfbG'
    'VmdBhzIAEoBUgOUhJzZWF0SGVhdGVyUmVhckxlZnQSNQoWc2VhdF9oZWF0ZXJfcmVhcl9yaWdo'
    'dBh0IAEoBUgPUhNzZWF0SGVhdGVyUmVhclJpZ2h0EjcKF3NlYXRfaGVhdGVyX3JlYXJfY2VudG'
    'VyGHUgASgFSBBSFHNlYXRIZWF0ZXJSZWFyQ2VudGVyEj4KG3NlYXRfaGVhdGVyX3JlYXJfcmln'
    'aHRfYmFjaxh2IAEoBUgRUhdzZWF0SGVhdGVyUmVhclJpZ2h0QmFjaxI8ChpzZWF0X2hlYXRlcl'
    '9yZWFyX2xlZnRfYmFjaxh3IAEoBUgSUhZzZWF0SGVhdGVyUmVhckxlZnRCYWNrEj4KG3NlYXRf'
    'aGVhdGVyX3RoaXJkX3Jvd19yaWdodBh4IAEoBUgTUhdzZWF0SGVhdGVyVGhpcmRSb3dSaWdodB'
    'I8ChpzZWF0X2hlYXRlcl90aGlyZF9yb3dfbGVmdBh5IAEoBUgUUhZzZWF0SGVhdGVyVGhpcmRS'
    'b3dMZWZ0EicKDmJhdHRlcnlfaGVhdGVyGHogASgISBVSDWJhdHRlcnlIZWF0ZXISNwoXYmF0dG'
    'VyeV9oZWF0ZXJfbm9fcG93ZXIYeyABKAhIFlIUYmF0dGVyeUhlYXRlck5vUG93ZXISNAoVc3Rl'
    'ZXJpbmdfd2hlZWxfaGVhdGVyGH0gASgISBdSE3N0ZWVyaW5nV2hlZWxIZWF0ZXISLgoSd2lwZX'
    'JfYmxhZGVfaGVhdGVyGH4gASgISBhSEHdpcGVyQmxhZGVIZWF0ZXISMAoTc2lkZV9taXJyb3Jf'
    'aGVhdGVycxh/IAEoCEgZUhFzaWRlTWlycm9ySGVhdGVycxIwChJpc19wcmVjb25kaXRpb25pbm'
    'cYgAEgASgISBpSEWlzUHJlY29uZGl0aW9uaW5nEkQKHXJlbW90ZV9oZWF0ZXJfY29udHJvbF9l'
    'bmFibGVkGIEBIAEoCEgbUhpyZW1vdGVIZWF0ZXJDb250cm9sRW5hYmxlZBJZChNjbGltYXRlX2'
    'tlZXBlcl9tb2RlGB4gASgLMikuQ2FyU2VydmVyLkNsaW1hdGVTdGF0ZS5DbGltYXRlS2VlcGVy'
    'TW9kZVIRY2xpbWF0ZUtlZXBlck1vZGUSOAoJdGltZXN0YW1wGCEgASgLMhouZ29vZ2xlLnByb3'
    'RvYnVmLlRpbWVzdGFtcFIJdGltZXN0YW1wEi0KEWJpb3dlYXBvbl9tb2RlX29uGIYBIAEoCEgc'
    'Ug9iaW93ZWFwb25Nb2RlT24SRgoMZGVmcm9zdF9tb2RlGCMgASgLMiMuQ2FyU2VydmVyLkNsaW'
    '1hdGVTdGF0ZS5EZWZyb3N0TW9kZVILZGVmcm9zdE1vZGUSOAoXaXNfYXV0b19jb25kaXRpb25p'
    'bmdfb24YiAEgASgISB1SFGlzQXV0b0NvbmRpdGlvbmluZ09uEjYKFmF1dG9fc2VhdF9jbGltYX'
    'RlX2xlZnQYiQEgASgISB5SE2F1dG9TZWF0Q2xpbWF0ZUxlZnQSOAoXYXV0b19zZWF0X2NsaW1h'
    'dGVfcmlnaHQYigEgASgISB9SFGF1dG9TZWF0Q2xpbWF0ZVJpZ2h0EjAKE3NlYXRfZmFuX2Zyb2'
    '50X2xlZnQYiwEgASgFSCBSEHNlYXRGYW5Gcm9udExlZnQSMgoUc2VhdF9mYW5fZnJvbnRfcmln'
    'aHQYjAEgASgFSCFSEXNlYXRGYW5Gcm9udFJpZ2h0EkgKH2FsbG93X2NhYmluX292ZXJoZWF0X3'
    'Byb3RlY3Rpb24YjQEgASgISCJSHGFsbG93Q2FiaW5PdmVyaGVhdFByb3RlY3Rpb24SXgorc3Vw'
    'cG9ydHNfZmFuX29ubHlfY2FiaW5fb3ZlcmhlYXRfcHJvdGVjdGlvbhiOASABKAhII1Imc3VwcG'
    '9ydHNGYW5Pbmx5Q2FiaW5PdmVyaGVhdFByb3RlY3Rpb24ScAoZY2FiaW5fb3ZlcmhlYXRfcHJv'
    'dGVjdGlvbhiPASABKA4yMS5DYXJTZXJ2ZXIuQ2xpbWF0ZVN0YXRlLkNhYmluT3ZlcmhlYXRQcm'
    '90ZWN0aW9uX0VIJFIXY2FiaW5PdmVyaGVhdFByb3RlY3Rpb24SXQoqY2FiaW5fb3ZlcmhlYXRf'
    'cHJvdGVjdGlvbl9hY3RpdmVseV9jb29saW5nGJABIAEoCEglUiZjYWJpbk92ZXJoZWF0UHJvdG'
    'VjdGlvbkFjdGl2ZWx5Q29vbGluZxJqChpjb3BfYWN0aXZhdGlvbl90ZW1wZXJhdHVyZRiSASAB'
    'KA4yKS5DYXJTZXJ2ZXIuQ2xpbWF0ZVN0YXRlLkNvcEFjdGl2YXRpb25UZW1wSCZSGGNvcEFjdG'
    'l2YXRpb25UZW1wZXJhdHVyZRI6ChhhdXRvX3N0ZWVyaW5nX3doZWVsX2hlYXQYkwEgASgISCdS'
    'FWF1dG9TdGVlcmluZ1doZWVsSGVhdBJVChlzdGVlcmluZ193aGVlbF9oZWF0X2xldmVsGJQBIA'
    'EoDjIXLkNhclNlcnZlci5TdHdIZWF0TGV2ZWxIKFIWc3RlZXJpbmdXaGVlbEhlYXRMZXZlbBJW'
    'ChFodmFjX2F1dG9fcmVxdWVzdBiWASABKA4yJy5DYXJTZXJ2ZXIuQ2xpbWF0ZVN0YXRlLkh2YW'
    'NBdXRvUmVxdWVzdEgpUg9odmFjQXV0b1JlcXVlc3QSYwoWY29wX25vdF9ydW5uaW5nX3JlYXNv'
    'bhiXASABKA4yKy5DYXJTZXJ2ZXIuQ2xpbWF0ZVN0YXRlLkNPUE5vdFJ1bm5pbmdSZWFzb25IKl'
    'ITY29wTm90UnVubmluZ1JlYXNvbhreAQoRQ2xpbWF0ZUtlZXBlck1vZGUSKwoHVW5rbm93bhgB'
    'IAEoCzIPLkNhclNlcnZlci5Wb2lkSABSB1Vua25vd24SIwoDT2ZmGAIgASgLMg8uQ2FyU2Vydm'
    'VyLlZvaWRIAFIDT2ZmEiEKAk9uGAMgASgLMg8uQ2FyU2VydmVyLlZvaWRIAFICT24SIwoDRG9n'
    'GAQgASgLMg8uQ2FyU2VydmVyLlZvaWRIAFIDRG9nEicKBVBhcnR5GAUgASgLMg8uQ2FyU2Vydm'
    'VyLlZvaWRIAFIFUGFydHlCBgoEdHlwZRqKAQoLRGVmcm9zdE1vZGUSIwoDT2ZmGAEgASgLMg8u'
    'Q2FyU2VydmVyLlZvaWRIAFIDT2ZmEikKBk5vcm1hbBgCIAEoCzIPLkNhclNlcnZlci5Wb2lkSA'
    'BSBk5vcm1hbBIjCgNNYXgYAyABKAsyDy5DYXJTZXJ2ZXIuVm9pZEgAUgNNYXhCBgoEdHlwZSJF'
    'Cg9IdmFjQXV0b1JlcXVlc3QSFQoRSHZhY0F1dG9SZXF1ZXN0T24QABIbChdIdmFjQXV0b1JlcX'
    'Vlc3RPdmVycmlkZRABIn4KGUNhYmluT3ZlcmhlYXRQcm90ZWN0aW9uX0USHgoaQ2FiaW5PdmVy'
    'aGVhdFByb3RlY3Rpb25PZmYQABIdChlDYWJpbk92ZXJoZWF0UHJvdGVjdGlvbk9uEAESIgoeQ2'
    'FiaW5PdmVyaGVhdFByb3RlY3Rpb25GYW5Pbmx5EAIidAoRU2VhdEhlYXRlckxldmVsX0USFgoS'
    'U2VhdEhlYXRlckxldmVsT2ZmEAASFgoSU2VhdEhlYXRlckxldmVsTG93EAESFgoSU2VhdEhlYX'
    'RlckxldmVsTWVkEAISFwoTU2VhdEhlYXRlckxldmVsSGlnaBADInkKElNlYXRDb29saW5nTGV2'
    'ZWxfRRIXChNTZWF0Q29vbGluZ0xldmVsT2ZmEAASFwoTU2VhdENvb2xpbmdMZXZlbExvdxABEh'
    'cKE1NlYXRDb29saW5nTGV2ZWxNZWQQAhIYChRTZWF0Q29vbGluZ0xldmVsSGlnaBADIocBChFD'
    'b3BBY3RpdmF0aW9uVGVtcBIgChxDb3BBY3RpdmF0aW9uVGVtcFVuc3BlY2lmaWVkEAASGAoUQ2'
    '9wQWN0aXZhdGlvblRlbXBMb3cQARIbChdDb3BBY3RpdmF0aW9uVGVtcE1lZGl1bRACEhkKFUNv'
    'cEFjdGl2YXRpb25UZW1wSGlnaBADIp4CChNDT1BOb3RSdW5uaW5nUmVhc29uEh8KG0NPUE5vdF'
    'J1bm5pbmdSZWFzb25Ob1JlYXNvbhAAEiYKIkNPUE5vdFJ1bm5pbmdSZWFzb25Vc2VySW50ZXJh'
    'Y3Rpb24QARIvCitDT1BOb3RSdW5uaW5nUmVhc29uRW5lcmd5Q29uc3VtcHRpb25SZWFjaGVkEA'
    'ISHgoaQ09QTm90UnVubmluZ1JlYXNvblRpbWVvdXQQAxIjCh9DT1BOb3RSdW5uaW5nUmVhc29u'
    'TG93U29sYXJMb2FkEAQSHAoYQ09QTm90UnVubmluZ1JlYXNvbkZhdWx0EAUSKgomQ09QTm90Un'
    'VubmluZ1JlYXNvbkNhYmluQmVsb3dUaHJlc2hvbGQQBkIeChxvcHRpb25hbF9pbnNpZGVfdGVt'
    'cF9jZWxzaXVzQh8KHW9wdGlvbmFsX291dHNpZGVfdGVtcF9jZWxzaXVzQh4KHG9wdGlvbmFsX2'
    'RyaXZlcl90ZW1wX3NldHRpbmdCIQofb3B0aW9uYWxfcGFzc2VuZ2VyX3RlbXBfc2V0dGluZ0Ie'
    'ChxvcHRpb25hbF9sZWZ0X3RlbXBfZGlyZWN0aW9uQh8KHW9wdGlvbmFsX3JpZ2h0X3RlbXBfZG'
    'lyZWN0aW9uQiAKHm9wdGlvbmFsX2lzX2Zyb250X2RlZnJvc3Rlcl9vbkIfCh1vcHRpb25hbF9p'
    'c19yZWFyX2RlZnJvc3Rlcl9vbkIVChNvcHRpb25hbF9mYW5fc3RhdHVzQhgKFm9wdGlvbmFsX2'
    'lzX2NsaW1hdGVfb25CIQofb3B0aW9uYWxfbWluX2F2YWlsX3RlbXBfY2Vsc2l1c0IhCh9vcHRp'
    'b25hbF9tYXhfYXZhaWxfdGVtcF9jZWxzaXVzQhsKGW9wdGlvbmFsX3NlYXRfaGVhdGVyX2xlZn'
    'RCHAoab3B0aW9uYWxfc2VhdF9oZWF0ZXJfcmlnaHRCIAoeb3B0aW9uYWxfc2VhdF9oZWF0ZXJf'
    'cmVhcl9sZWZ0QiEKH29wdGlvbmFsX3NlYXRfaGVhdGVyX3JlYXJfcmlnaHRCIgogb3B0aW9uYW'
    'xfc2VhdF9oZWF0ZXJfcmVhcl9jZW50ZXJCJgokb3B0aW9uYWxfc2VhdF9oZWF0ZXJfcmVhcl9y'
    'aWdodF9iYWNrQiUKI29wdGlvbmFsX3NlYXRfaGVhdGVyX3JlYXJfbGVmdF9iYWNrQiYKJG9wdG'
    'lvbmFsX3NlYXRfaGVhdGVyX3RoaXJkX3Jvd19yaWdodEIlCiNvcHRpb25hbF9zZWF0X2hlYXRl'
    'cl90aGlyZF9yb3dfbGVmdEIZChdvcHRpb25hbF9iYXR0ZXJ5X2hlYXRlckIiCiBvcHRpb25hbF'
    '9iYXR0ZXJ5X2hlYXRlcl9ub19wb3dlckIgCh5vcHRpb25hbF9zdGVlcmluZ193aGVlbF9oZWF0'
    'ZXJCHQobb3B0aW9uYWxfd2lwZXJfYmxhZGVfaGVhdGVyQh4KHG9wdGlvbmFsX3NpZGVfbWlycm'
    '9yX2hlYXRlcnNCHQobb3B0aW9uYWxfaXNfcHJlY29uZGl0aW9uaW5nQigKJm9wdGlvbmFsX3Jl'
    'bW90ZV9oZWF0ZXJfY29udHJvbF9lbmFibGVkQhwKGm9wdGlvbmFsX2Jpb3dlYXBvbl9tb2RlX2'
    '9uQiIKIG9wdGlvbmFsX2lzX2F1dG9fY29uZGl0aW9uaW5nX29uQiEKH29wdGlvbmFsX2F1dG9f'
    'c2VhdF9jbGltYXRlX2xlZnRCIgogb3B0aW9uYWxfYXV0b19zZWF0X2NsaW1hdGVfcmlnaHRCHg'
    'ocb3B0aW9uYWxfc2VhdF9mYW5fZnJvbnRfbGVmdEIfCh1vcHRpb25hbF9zZWF0X2Zhbl9mcm9u'
    'dF9yaWdodEIqCihvcHRpb25hbF9hbGxvd19jYWJpbl9vdmVyaGVhdF9wcm90ZWN0aW9uQjYKNG'
    '9wdGlvbmFsX3N1cHBvcnRzX2Zhbl9vbmx5X2NhYmluX292ZXJoZWF0X3Byb3RlY3Rpb25CJAoi'
    'b3B0aW9uYWxfY2FiaW5fb3ZlcmhlYXRfcHJvdGVjdGlvbkI1CjNvcHRpb25hbF9jYWJpbl9vdm'
    'VyaGVhdF9wcm90ZWN0aW9uX2FjdGl2ZWx5X2Nvb2xpbmdCJQojb3B0aW9uYWxfY29wX2FjdGl2'
    'YXRpb25fdGVtcGVyYXR1cmVCIwohb3B0aW9uYWxfYXV0b19zdGVlcmluZ193aGVlbF9oZWF0Qi'
    'QKIm9wdGlvbmFsX3N0ZWVyaW5nX3doZWVsX2hlYXRfbGV2ZWxCHAoab3B0aW9uYWxfaHZhY19h'
    'dXRvX3JlcXVlc3RCIQofb3B0aW9uYWxfY29wX25vdF9ydW5uaW5nX3JlYXNvbkoGCJEBEJIB');

@$core.Deprecated('Use tirePressureStateDescriptor instead')
const TirePressureState$json = {
  '1': 'TirePressureState',
  '2': [
    {
      '1': 'timestamp',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'timestamp'
    },
    {
      '1': 'tpms_pressure_fl',
      '3': 2,
      '4': 1,
      '5': 2,
      '9': 0,
      '10': 'tpmsPressureFl'
    },
    {
      '1': 'tpms_pressure_fr',
      '3': 3,
      '4': 1,
      '5': 2,
      '9': 1,
      '10': 'tpmsPressureFr'
    },
    {
      '1': 'tpms_pressure_rl',
      '3': 4,
      '4': 1,
      '5': 2,
      '9': 2,
      '10': 'tpmsPressureRl'
    },
    {
      '1': 'tpms_pressure_rr',
      '3': 5,
      '4': 1,
      '5': 2,
      '9': 3,
      '10': 'tpmsPressureRr'
    },
    {
      '1': 'tpms_last_seen_pressure_time_fl',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'tpmsLastSeenPressureTimeFl'
    },
    {
      '1': 'tpms_last_seen_pressure_time_fr',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'tpmsLastSeenPressureTimeFr'
    },
    {
      '1': 'tpms_last_seen_pressure_time_rl',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'tpmsLastSeenPressureTimeRl'
    },
    {
      '1': 'tpms_last_seen_pressure_time_rr',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'tpmsLastSeenPressureTimeRr'
    },
    {
      '1': 'tpms_hard_warning_fl',
      '3': 10,
      '4': 1,
      '5': 8,
      '9': 4,
      '10': 'tpmsHardWarningFl'
    },
    {
      '1': 'tpms_hard_warning_fr',
      '3': 11,
      '4': 1,
      '5': 8,
      '9': 5,
      '10': 'tpmsHardWarningFr'
    },
    {
      '1': 'tpms_hard_warning_rl',
      '3': 12,
      '4': 1,
      '5': 8,
      '9': 6,
      '10': 'tpmsHardWarningRl'
    },
    {
      '1': 'tpms_hard_warning_rr',
      '3': 13,
      '4': 1,
      '5': 8,
      '9': 7,
      '10': 'tpmsHardWarningRr'
    },
    {
      '1': 'tpms_soft_warning_fl',
      '3': 14,
      '4': 1,
      '5': 8,
      '9': 8,
      '10': 'tpmsSoftWarningFl'
    },
    {
      '1': 'tpms_soft_warning_fr',
      '3': 15,
      '4': 1,
      '5': 8,
      '9': 9,
      '10': 'tpmsSoftWarningFr'
    },
    {
      '1': 'tpms_soft_warning_rl',
      '3': 16,
      '4': 1,
      '5': 8,
      '9': 10,
      '10': 'tpmsSoftWarningRl'
    },
    {
      '1': 'tpms_soft_warning_rr',
      '3': 17,
      '4': 1,
      '5': 8,
      '9': 11,
      '10': 'tpmsSoftWarningRr'
    },
    {
      '1': 'tpms_rcp_front_value',
      '3': 18,
      '4': 1,
      '5': 2,
      '9': 12,
      '10': 'tpmsRcpFrontValue'
    },
    {
      '1': 'tpms_rcp_rear_value',
      '3': 19,
      '4': 1,
      '5': 2,
      '9': 13,
      '10': 'tpmsRcpRearValue'
    },
  ],
  '8': [
    {'1': 'optional_tpms_pressure_fl'},
    {'1': 'optional_tpms_pressure_fr'},
    {'1': 'optional_tpms_pressure_rl'},
    {'1': 'optional_tpms_pressure_rr'},
    {'1': 'optional_tpms_hard_warning_fl'},
    {'1': 'optional_tpms_hard_warning_fr'},
    {'1': 'optional_tpms_hard_warning_rl'},
    {'1': 'optional_tpms_hard_warning_rr'},
    {'1': 'optional_tpms_soft_warning_fl'},
    {'1': 'optional_tpms_soft_warning_fr'},
    {'1': 'optional_tpms_soft_warning_rl'},
    {'1': 'optional_tpms_soft_warning_rr'},
    {'1': 'optional_tpms_rcp_front_value'},
    {'1': 'optional_tpms_rcp_rear_value'},
  ],
};

/// Descriptor for `TirePressureState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tirePressureStateDescriptor = $convert.base64Decode(
    'ChFUaXJlUHJlc3N1cmVTdGF0ZRI4Cgl0aW1lc3RhbXAYASABKAsyGi5nb29nbGUucHJvdG9idW'
    'YuVGltZXN0YW1wUgl0aW1lc3RhbXASKgoQdHBtc19wcmVzc3VyZV9mbBgCIAEoAkgAUg50cG1z'
    'UHJlc3N1cmVGbBIqChB0cG1zX3ByZXNzdXJlX2ZyGAMgASgCSAFSDnRwbXNQcmVzc3VyZUZyEi'
    'oKEHRwbXNfcHJlc3N1cmVfcmwYBCABKAJIAlIOdHBtc1ByZXNzdXJlUmwSKgoQdHBtc19wcmVz'
    'c3VyZV9ychgFIAEoAkgDUg50cG1zUHJlc3N1cmVSchJfCh90cG1zX2xhc3Rfc2Vlbl9wcmVzc3'
    'VyZV90aW1lX2ZsGAYgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIadHBtc0xhc3RT'
    'ZWVuUHJlc3N1cmVUaW1lRmwSXwofdHBtc19sYXN0X3NlZW5fcHJlc3N1cmVfdGltZV9mchgHIA'
    'EoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSGnRwbXNMYXN0U2VlblByZXNzdXJlVGlt'
    'ZUZyEl8KH3RwbXNfbGFzdF9zZWVuX3ByZXNzdXJlX3RpbWVfcmwYCCABKAsyGi5nb29nbGUucH'
    'JvdG9idWYuVGltZXN0YW1wUhp0cG1zTGFzdFNlZW5QcmVzc3VyZVRpbWVSbBJfCh90cG1zX2xh'
    'c3Rfc2Vlbl9wcmVzc3VyZV90aW1lX3JyGAkgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdG'
    'FtcFIadHBtc0xhc3RTZWVuUHJlc3N1cmVUaW1lUnISMQoUdHBtc19oYXJkX3dhcm5pbmdfZmwY'
    'CiABKAhIBFIRdHBtc0hhcmRXYXJuaW5nRmwSMQoUdHBtc19oYXJkX3dhcm5pbmdfZnIYCyABKA'
    'hIBVIRdHBtc0hhcmRXYXJuaW5nRnISMQoUdHBtc19oYXJkX3dhcm5pbmdfcmwYDCABKAhIBlIR'
    'dHBtc0hhcmRXYXJuaW5nUmwSMQoUdHBtc19oYXJkX3dhcm5pbmdfcnIYDSABKAhIB1IRdHBtc0'
    'hhcmRXYXJuaW5nUnISMQoUdHBtc19zb2Z0X3dhcm5pbmdfZmwYDiABKAhICFIRdHBtc1NvZnRX'
    'YXJuaW5nRmwSMQoUdHBtc19zb2Z0X3dhcm5pbmdfZnIYDyABKAhICVIRdHBtc1NvZnRXYXJuaW'
    '5nRnISMQoUdHBtc19zb2Z0X3dhcm5pbmdfcmwYECABKAhIClIRdHBtc1NvZnRXYXJuaW5nUmwS'
    'MQoUdHBtc19zb2Z0X3dhcm5pbmdfcnIYESABKAhIC1IRdHBtc1NvZnRXYXJuaW5nUnISMQoUdH'
    'Btc19yY3BfZnJvbnRfdmFsdWUYEiABKAJIDFIRdHBtc1JjcEZyb250VmFsdWUSLwoTdHBtc19y'
    'Y3BfcmVhcl92YWx1ZRgTIAEoAkgNUhB0cG1zUmNwUmVhclZhbHVlQhsKGW9wdGlvbmFsX3RwbX'
    'NfcHJlc3N1cmVfZmxCGwoZb3B0aW9uYWxfdHBtc19wcmVzc3VyZV9mckIbChlvcHRpb25hbF90'
    'cG1zX3ByZXNzdXJlX3JsQhsKGW9wdGlvbmFsX3RwbXNfcHJlc3N1cmVfcnJCHwodb3B0aW9uYW'
    'xfdHBtc19oYXJkX3dhcm5pbmdfZmxCHwodb3B0aW9uYWxfdHBtc19oYXJkX3dhcm5pbmdfZnJC'
    'Hwodb3B0aW9uYWxfdHBtc19oYXJkX3dhcm5pbmdfcmxCHwodb3B0aW9uYWxfdHBtc19oYXJkX3'
    'dhcm5pbmdfcnJCHwodb3B0aW9uYWxfdHBtc19zb2Z0X3dhcm5pbmdfZmxCHwodb3B0aW9uYWxf'
    'dHBtc19zb2Z0X3dhcm5pbmdfZnJCHwodb3B0aW9uYWxfdHBtc19zb2Z0X3dhcm5pbmdfcmxCHw'
    'odb3B0aW9uYWxfdHBtc19zb2Z0X3dhcm5pbmdfcnJCHwodb3B0aW9uYWxfdHBtc19yY3BfZnJv'
    'bnRfdmFsdWVCHgocb3B0aW9uYWxfdHBtc19yY3BfcmVhcl92YWx1ZQ==');

@$core.Deprecated('Use mediaStateDescriptor instead')
const MediaState$json = {
  '1': 'MediaState',
  '2': [
    {
      '1': 'timestamp',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'timestamp'
    },
    {
      '1': 'remote_control_enabled',
      '3': 2,
      '4': 1,
      '5': 8,
      '9': 0,
      '10': 'remoteControlEnabled'
    },
    {
      '1': 'now_playing_artist',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'nowPlayingArtist'
    },
    {
      '1': 'now_playing_title',
      '3': 4,
      '4': 1,
      '5': 9,
      '9': 2,
      '10': 'nowPlayingTitle'
    },
    {'1': 'audio_volume', '3': 5, '4': 1, '5': 2, '9': 3, '10': 'audioVolume'},
    {
      '1': 'audio_volume_increment',
      '3': 6,
      '4': 1,
      '5': 2,
      '9': 4,
      '10': 'audioVolumeIncrement'
    },
    {
      '1': 'audio_volume_max',
      '3': 7,
      '4': 1,
      '5': 2,
      '9': 5,
      '10': 'audioVolumeMax'
    },
    {
      '1': 'now_playing_source',
      '3': 8,
      '4': 1,
      '5': 14,
      '6': '.CarServer.MediaSourceType',
      '9': 6,
      '10': 'nowPlayingSource'
    },
    {
      '1': 'media_playback_status',
      '3': 9,
      '4': 1,
      '5': 14,
      '6': '.CarServer.MediaPlaybackStatus',
      '9': 7,
      '10': 'mediaPlaybackStatus'
    },
  ],
  '8': [
    {'1': 'optional_remote_control_enabled'},
    {'1': 'optional_now_playing_artist'},
    {'1': 'optional_now_playing_title'},
    {'1': 'optional_audio_volume'},
    {'1': 'optional_audio_volume_increment'},
    {'1': 'optional_audio_volume_max'},
    {'1': 'optional_now_playing_source'},
    {'1': 'optional_media_playback_status'},
  ],
};

/// Descriptor for `MediaState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mediaStateDescriptor = $convert.base64Decode(
    'CgpNZWRpYVN0YXRlEjgKCXRpbWVzdGFtcBgBIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3'
    'RhbXBSCXRpbWVzdGFtcBI2ChZyZW1vdGVfY29udHJvbF9lbmFibGVkGAIgASgISABSFHJlbW90'
    'ZUNvbnRyb2xFbmFibGVkEi4KEm5vd19wbGF5aW5nX2FydGlzdBgDIAEoCUgBUhBub3dQbGF5aW'
    '5nQXJ0aXN0EiwKEW5vd19wbGF5aW5nX3RpdGxlGAQgASgJSAJSD25vd1BsYXlpbmdUaXRsZRIj'
    'CgxhdWRpb192b2x1bWUYBSABKAJIA1ILYXVkaW9Wb2x1bWUSNgoWYXVkaW9fdm9sdW1lX2luY3'
    'JlbWVudBgGIAEoAkgEUhRhdWRpb1ZvbHVtZUluY3JlbWVudBIqChBhdWRpb192b2x1bWVfbWF4'
    'GAcgASgCSAVSDmF1ZGlvVm9sdW1lTWF4EkoKEm5vd19wbGF5aW5nX3NvdXJjZRgIIAEoDjIaLk'
    'NhclNlcnZlci5NZWRpYVNvdXJjZVR5cGVIBlIQbm93UGxheWluZ1NvdXJjZRJUChVtZWRpYV9w'
    'bGF5YmFja19zdGF0dXMYCSABKA4yHi5DYXJTZXJ2ZXIuTWVkaWFQbGF5YmFja1N0YXR1c0gHUh'
    'NtZWRpYVBsYXliYWNrU3RhdHVzQiEKH29wdGlvbmFsX3JlbW90ZV9jb250cm9sX2VuYWJsZWRC'
    'HQobb3B0aW9uYWxfbm93X3BsYXlpbmdfYXJ0aXN0QhwKGm9wdGlvbmFsX25vd19wbGF5aW5nX3'
    'RpdGxlQhcKFW9wdGlvbmFsX2F1ZGlvX3ZvbHVtZUIhCh9vcHRpb25hbF9hdWRpb192b2x1bWVf'
    'aW5jcmVtZW50QhsKGW9wdGlvbmFsX2F1ZGlvX3ZvbHVtZV9tYXhCHQobb3B0aW9uYWxfbm93X3'
    'BsYXlpbmdfc291cmNlQiAKHm9wdGlvbmFsX21lZGlhX3BsYXliYWNrX3N0YXR1cw==');

@$core.Deprecated('Use mediaDetailStateDescriptor instead')
const MediaDetailState$json = {
  '1': 'MediaDetailState',
  '2': [
    {
      '1': 'timestamp',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'timestamp'
    },
    {
      '1': 'now_playing_duration',
      '3': 2,
      '4': 1,
      '5': 5,
      '9': 0,
      '10': 'nowPlayingDuration'
    },
    {
      '1': 'now_playing_elapsed',
      '3': 3,
      '4': 1,
      '5': 5,
      '9': 1,
      '10': 'nowPlayingElapsed'
    },
    {
      '1': 'now_playing_source_string',
      '3': 4,
      '4': 1,
      '5': 9,
      '9': 2,
      '10': 'nowPlayingSourceString'
    },
    {
      '1': 'now_playing_album',
      '3': 5,
      '4': 1,
      '5': 9,
      '9': 3,
      '10': 'nowPlayingAlbum'
    },
    {
      '1': 'now_playing_station',
      '3': 6,
      '4': 1,
      '5': 9,
      '9': 4,
      '10': 'nowPlayingStation'
    },
    {
      '1': 'a2dp_source_name',
      '3': 7,
      '4': 1,
      '5': 9,
      '9': 5,
      '10': 'a2dpSourceName'
    },
  ],
  '8': [
    {'1': 'optional_now_playing_duration'},
    {'1': 'optional_now_playing_elapsed'},
    {'1': 'optional_now_playing_source_string'},
    {'1': 'optional_now_playing_album'},
    {'1': 'optional_now_playing_station'},
    {'1': 'optional_a2dp_source_name'},
  ],
};

/// Descriptor for `MediaDetailState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mediaDetailStateDescriptor = $convert.base64Decode(
    'ChBNZWRpYURldGFpbFN0YXRlEjgKCXRpbWVzdGFtcBgBIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi'
    '5UaW1lc3RhbXBSCXRpbWVzdGFtcBIyChRub3dfcGxheWluZ19kdXJhdGlvbhgCIAEoBUgAUhJu'
    'b3dQbGF5aW5nRHVyYXRpb24SMAoTbm93X3BsYXlpbmdfZWxhcHNlZBgDIAEoBUgBUhFub3dQbG'
    'F5aW5nRWxhcHNlZBI7Chlub3dfcGxheWluZ19zb3VyY2Vfc3RyaW5nGAQgASgJSAJSFm5vd1Bs'
    'YXlpbmdTb3VyY2VTdHJpbmcSLAoRbm93X3BsYXlpbmdfYWxidW0YBSABKAlIA1IPbm93UGxheW'
    'luZ0FsYnVtEjAKE25vd19wbGF5aW5nX3N0YXRpb24YBiABKAlIBFIRbm93UGxheWluZ1N0YXRp'
    'b24SKgoQYTJkcF9zb3VyY2VfbmFtZRgHIAEoCUgFUg5hMmRwU291cmNlTmFtZUIfCh1vcHRpb2'
    '5hbF9ub3dfcGxheWluZ19kdXJhdGlvbkIeChxvcHRpb25hbF9ub3dfcGxheWluZ19lbGFwc2Vk'
    'QiQKIm9wdGlvbmFsX25vd19wbGF5aW5nX3NvdXJjZV9zdHJpbmdCHAoab3B0aW9uYWxfbm93X3'
    'BsYXlpbmdfYWxidW1CHgocb3B0aW9uYWxfbm93X3BsYXlpbmdfc3RhdGlvbkIbChlvcHRpb25h'
    'bF9hMmRwX3NvdXJjZV9uYW1l');

@$core.Deprecated('Use shiftStateDescriptor instead')
const ShiftState$json = {
  '1': 'ShiftState',
  '2': [
    {
      '1': 'Invalid',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'Invalid'
    },
    {
      '1': 'P',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'P'
    },
    {
      '1': 'R',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'R'
    },
    {
      '1': 'N',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'N'
    },
    {
      '1': 'D',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'D'
    },
    {
      '1': 'SNA',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.CarServer.Void',
      '9': 0,
      '10': 'SNA'
    },
  ],
  '8': [
    {'1': 'type'},
  ],
};

/// Descriptor for `ShiftState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List shiftStateDescriptor = $convert.base64Decode(
    'CgpTaGlmdFN0YXRlEisKB0ludmFsaWQYASABKAsyDy5DYXJTZXJ2ZXIuVm9pZEgAUgdJbnZhbG'
    'lkEh8KAVAYAiABKAsyDy5DYXJTZXJ2ZXIuVm9pZEgAUgFQEh8KAVIYAyABKAsyDy5DYXJTZXJ2'
    'ZXIuVm9pZEgAUgFSEh8KAU4YBCABKAsyDy5DYXJTZXJ2ZXIuVm9pZEgAUgFOEh8KAUQYBSABKA'
    'syDy5DYXJTZXJ2ZXIuVm9pZEgAUgFEEiMKA1NOQRgGIAEoCzIPLkNhclNlcnZlci5Wb2lkSABS'
    'A1NOQUIGCgR0eXBl');

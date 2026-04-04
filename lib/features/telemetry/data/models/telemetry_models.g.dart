// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'telemetry_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TelemetryFieldConfig _$TelemetryFieldConfigFromJson(
        Map<String, dynamic> json) =>
    TelemetryFieldConfig(
      intervalSeconds: (json['intervalSeconds'] as num).toInt(),
      minimumDelta: (json['minimumDelta'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TelemetryFieldConfigToJson(
        TelemetryFieldConfig instance) =>
    <String, dynamic>{
      'intervalSeconds': instance.intervalSeconds,
      'minimumDelta': instance.minimumDelta,
    };

TelemetryConfig _$TelemetryConfigFromJson(Map<String, dynamic> json) =>
    TelemetryConfig(
      hostname: json['hostname'] as String,
      fields: (json['fields'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
                k, TelemetryFieldConfig.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
      ca: json['ca'] as String?,
      deliveryPolicy: json['deliveryPolicy'] as String?,
    );

Map<String, dynamic> _$TelemetryConfigToJson(TelemetryConfig instance) =>
    <String, dynamic>{
      'hostname': instance.hostname,
      'ca': instance.ca,
      'fields': instance.fields,
      'deliveryPolicy': instance.deliveryPolicy,
    };

TelemetryConfigResponse _$TelemetryConfigResponseFromJson(
        Map<String, dynamic> json) =>
    TelemetryConfigResponse(
      updatedAt: json['updatedAt'] as String?,
      vin: json['vin'] as String?,
      activeKeys: (json['activeKeys'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$TelemetryConfigResponseToJson(
        TelemetryConfigResponse instance) =>
    <String, dynamic>{
      'updatedAt': instance.updatedAt,
      'vin': instance.vin,
      'activeKeys': instance.activeKeys,
    };

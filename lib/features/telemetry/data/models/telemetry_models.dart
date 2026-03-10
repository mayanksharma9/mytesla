import 'package:json_annotation/json_annotation.dart';

part 'telemetry_models.g.dart';

@JsonSerializable()
class TelemetryFieldConfig {
  final int intervalSeconds;
  final int? minimumDelta;

  const TelemetryFieldConfig({
    required this.intervalSeconds,
    this.minimumDelta,
  });

  factory TelemetryFieldConfig.fromJson(Map<String, dynamic> json) =>
      _$TelemetryFieldConfigFromJson(json);

  Map<String, dynamic> toJson() => _$TelemetryFieldConfigToJson(this);
}

@JsonSerializable()
class TelemetryConfig {
  final String hostname;
  final String? ca;
  final Map<String, TelemetryFieldConfig> fields;
  final String? deliveryPolicy;

  const TelemetryConfig({
    required this.hostname,
    this.fields = const {},
    this.ca,
    this.deliveryPolicy,
  });

  factory TelemetryConfig.fromJson(Map<String, dynamic> json) =>
      _$TelemetryConfigFromJson(json);

  Map<String, dynamic> toJson() => _$TelemetryConfigToJson(this);
}

@JsonSerializable()
class TelemetryConfigResponse {
  final String? updatedAt;
  final String? vin;
  final List<String>? activeKeys;

  const TelemetryConfigResponse({
    this.updatedAt,
    this.vin,
    this.activeKeys,
  });

  factory TelemetryConfigResponse.fromJson(Map<String, dynamic> json) =>
      _$TelemetryConfigResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TelemetryConfigResponseToJson(this);
}

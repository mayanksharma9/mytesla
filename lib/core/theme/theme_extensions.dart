import 'package:flutter/material.dart';
import 'volt_colors.dart';

class VoltThemeExtension extends ThemeExtension<VoltThemeExtension> {
  final Color batteryHigh;
  final Color batteryMid;
  final Color batteryLow;
  final Color charging;
  final Color online;
  final Color asleep;
  final Color offline;
  final Color locked;
  final Color unlocked;

  const VoltThemeExtension({
    required this.batteryHigh,
    required this.batteryMid,
    required this.batteryLow,
    required this.charging,
    required this.online,
    required this.asleep,
    required this.offline,
    required this.locked,
    required this.unlocked,
  });

  @override
  VoltThemeExtension copyWith({
    Color? batteryHigh,
    Color? batteryMid,
    Color? batteryLow,
    Color? charging,
    Color? online,
    Color? asleep,
    Color? offline,
    Color? locked,
    Color? unlocked,
  }) {
    return VoltThemeExtension(
      batteryHigh: batteryHigh ?? this.batteryHigh,
      batteryMid: batteryMid ?? this.batteryMid,
      batteryLow: batteryLow ?? this.batteryLow,
      charging: charging ?? this.charging,
      online: online ?? this.online,
      asleep: asleep ?? this.asleep,
      offline: offline ?? this.offline,
      locked: locked ?? this.locked,
      unlocked: unlocked ?? this.unlocked,
    );
  }

  @override
  VoltThemeExtension lerp(ThemeExtension<VoltThemeExtension>? other, double t) {
    if (other is! VoltThemeExtension) return this;
    return VoltThemeExtension(
      batteryHigh: Color.lerp(batteryHigh, other.batteryHigh, t)!,
      batteryMid: Color.lerp(batteryMid, other.batteryMid, t)!,
      batteryLow: Color.lerp(batteryLow, other.batteryLow, t)!,
      charging: Color.lerp(charging, other.charging, t)!,
      online: Color.lerp(online, other.online, t)!,
      asleep: Color.lerp(asleep, other.asleep, t)!,
      offline: Color.lerp(offline, other.offline, t)!,
      locked: Color.lerp(locked, other.locked, t)!,
      unlocked: Color.lerp(unlocked, other.unlocked, t)!,
    );
  }

  static const dark = VoltThemeExtension(
    batteryHigh: VoltColors.success,
    batteryMid: VoltColors.warning,
    batteryLow: VoltColors.error,
    charging: VoltColors.info,
    online: VoltColors.success,
    asleep: Color(0xFF636366),
    offline: VoltColors.error,
    locked: VoltColors.success,
    unlocked: Color(0xFFFF9F0A),
  );

  static const light = VoltThemeExtension(
    batteryHigh: Color(0xFF34C759),
    batteryMid: Color(0xFFFF9F0A),
    batteryLow: Color(0xFFFF3B30),
    charging: Color(0xFF007AFF),
    online: Color(0xFF34C759),
    asleep: Color(0xFF8E8E93),
    offline: Color(0xFFFF3B30),
    locked: Color(0xFF34C759),
    unlocked: Color(0xFFFF9500),
  );
}

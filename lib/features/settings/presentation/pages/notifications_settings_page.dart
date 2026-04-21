import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:voltride/core/theme/volt_colors.dart';
import 'dart:ui';

class NotificationsSettingsPage extends StatefulWidget {
  const NotificationsSettingsPage({super.key});

  @override
  State<NotificationsSettingsPage> createState() => _NotificationsSettingsPageState();
}

class _NotificationsSettingsPageState extends State<NotificationsSettingsPage> {
  Box get _prefs => Hive.box('user_prefs');

  bool _notifyCharging = true;
  bool _notifyLowBattery = true;
  bool _notifySentry = true;
  bool _notifyFirmware = true;
  bool _notifyMaintenance = true;
  bool _notifyTpms = true;
  int _lowBatteryThreshold = 20;

  @override
  void initState() {
    super.initState();
    _notifyCharging = _prefs.get('notify_charging', defaultValue: true) as bool;
    _notifyLowBattery = _prefs.get('notify_low_battery', defaultValue: true) as bool;
    _notifySentry = _prefs.get('notify_sentry', defaultValue: true) as bool;
    _notifyFirmware = _prefs.get('notify_firmware', defaultValue: true) as bool;
    _notifyMaintenance = _prefs.get('notify_maintenance', defaultValue: true) as bool;
    _notifyTpms = _prefs.get('notify_tpms', defaultValue: true) as bool;
    _lowBatteryThreshold = _prefs.get('low_battery_threshold', defaultValue: 20) as int;
  }

  void _set(String key, dynamic value) {
    _prefs.put(key, value);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(72),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: AppBar(
              backgroundColor:
                  isDark ? Colors.black.withOpacity(0.6) : Colors.white.withOpacity(0.8),
              title: Text('Notifications',
                  style: theme.textTheme.headlineLarge
                      ?.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 100, left: 20, right: 20, bottom: 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SectionLabel('CHARGING'),
            const SizedBox(height: 12),
            _NotifCard(isDark: isDark, items: [
              _NotifItem(
                icon: Icons.battery_charging_full,
                iconColor: VoltColors.success,
                title: 'Charging Complete',
                subtitle: 'Alert when vehicle reaches charge limit',
                value: _notifyCharging,
                onChanged: (v) {
                  setState(() => _notifyCharging = v);
                  _set('notify_charging', v);
                },
              ),
              _NotifItem(
                icon: Icons.battery_alert,
                iconColor: VoltColors.error,
                title: 'Low Battery',
                subtitle: 'Alert when below threshold',
                value: _notifyLowBattery,
                onChanged: (v) {
                  setState(() => _notifyLowBattery = v);
                  _set('notify_low_battery', v);
                },
              ),
            ]),
            if (_notifyLowBattery) ...[
              const SizedBox(height: 12),
              _NotifCard(isDark: isDark, items: [
                _SliderItem(
                  icon: Icons.tune,
                  title: 'Low Battery Threshold',
                  value: _lowBatteryThreshold,
                  min: 5,
                  max: 40,
                  suffix: '%',
                  onChanged: (v) {
                    setState(() => _lowBatteryThreshold = v);
                    _set('low_battery_threshold', v);
                  },
                ),
              ]),
            ],
            const SizedBox(height: 28),
            _SectionLabel('SECURITY'),
            const SizedBox(height: 12),
            _NotifCard(isDark: isDark, items: [
              _NotifItem(
                icon: Icons.security,
                iconColor: VoltColors.warning,
                title: 'Sentry Alert',
                subtitle: 'Activity detected near vehicle',
                value: _notifySentry,
                onChanged: (v) {
                  setState(() => _notifySentry = v);
                  _set('notify_sentry', v);
                },
              ),
            ]),
            const SizedBox(height: 28),
            _SectionLabel('VEHICLE'),
            const SizedBox(height: 12),
            _NotifCard(isDark: isDark, items: [
              _NotifItem(
                icon: Icons.system_update,
                iconColor: VoltColors.info,
                title: 'Software Update',
                subtitle: 'New firmware version available',
                value: _notifyFirmware,
                onChanged: (v) {
                  setState(() => _notifyFirmware = v);
                  _set('notify_firmware', v);
                },
              ),
            ]),
            const SizedBox(height: 28),
            _SectionLabel('MAINTENANCE'),
            const SizedBox(height: 12),
            _NotifCard(isDark: isDark, items: [
              _NotifItem(
                icon: Icons.build,
                iconColor: VoltColors.primary,
                title: 'Maintenance Reminders',
                subtitle: 'Service intervals due soon or overdue',
                value: _notifyMaintenance,
                onChanged: (v) {
                  setState(() => _notifyMaintenance = v);
                  _set('notify_maintenance', v);
                },
              ),
              _NotifItem(
                icon: Icons.tire_repair,
                iconColor: VoltColors.primary,
                title: 'Tire Pressure Alert',
                subtitle: 'TPMS reading below safe threshold',
                value: _notifyTpms,
                onChanged: (v) {
                  setState(() => _notifyTpms = v);
                  _set('notify_tpms', v);
                },
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel(this.text);
  @override
  Widget build(BuildContext context) => Text(
        text,
        style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            color: VoltColors.outline),
      );
}

class _NotifCard extends StatelessWidget {
  final List<Widget> items;
  final bool isDark;
  const _NotifCard({required this.items, required this.isDark});
  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: isDark ? VoltColors.surfaceElevatedDark : VoltColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          separatorBuilder: (_, __) =>
              const Divider(height: 1, color: Colors.white10, indent: 64),
          itemBuilder: (_, i) => items[i],
        ),
      );
}

class _NotifItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;
  const _NotifItem({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });
  @override
  Widget build(BuildContext context) => SwitchListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        secondary: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: iconColor, size: 20),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        subtitle: Text(subtitle,
            style: const TextStyle(color: VoltColors.onSurfaceVariant, fontSize: 12)),
        value: value,
        onChanged: onChanged,
        activeColor: VoltColors.primary,
      );
}

class _SliderItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final int value;
  final int min;
  final int max;
  final String suffix;
  final ValueChanged<int> onChanged;
  const _SliderItem(
      {required this.icon,
      required this.title,
      required this.value,
      required this.min,
      required this.max,
      required this.suffix,
      required this.onChanged});
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: VoltColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: VoltColors.primary, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      Text('$value$suffix',
                          style: const TextStyle(
                              color: VoltColors.primary, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Slider(
                    value: value.toDouble(),
                    min: min.toDouble(),
                    max: max.toDouble(),
                    divisions: max - min,
                    activeColor: VoltColors.primary,
                    onChanged: (v) => onChanged(v.round()),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}

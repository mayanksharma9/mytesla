import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:voltride/core/services/notification_service.dart';
import 'package:voltride/core/theme/volt_colors.dart';
import 'package:voltride/features/dashboard/presentation/bloc/vehicle_bloc.dart';
import 'dart:ui';

/// Automations page — schedule charging limits, departure pre-conditioning,
/// and configure location-based automation rules.
class AutomationsPage extends StatefulWidget {
  const AutomationsPage({super.key});

  @override
  State<AutomationsPage> createState() => _AutomationsPageState();
}

class _AutomationsPageState extends State<AutomationsPage> {
  Box get _prefs => Hive.box('user_prefs');

  TimeOfDay? _departureTime;
  bool _autoClimate = false;
  bool _autoChargeLimit = false;
  int _homeChargeLimit = 80;
  int _awayChargeLimit = 90;
  bool _departureReminderEnabled = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() {
    final dt = _prefs.get('departure_time') as String?;
    if (dt != null) {
      final parts = dt.split(':');
      _departureTime = TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
    }
    _autoClimate = _prefs.get('auto_climate', defaultValue: false) as bool;
    _autoChargeLimit = _prefs.get('auto_charge_limit', defaultValue: false) as bool;
    _homeChargeLimit = _prefs.get('home_charge_limit', defaultValue: 80) as int;
    _awayChargeLimit = _prefs.get('away_charge_limit', defaultValue: 90) as int;
    _departureReminderEnabled = _prefs.get('departure_reminder', defaultValue: false) as bool;
  }

  void _save() {
    if (_departureTime != null) {
      _prefs.put('departure_time',
          '${_departureTime!.hour.toString().padLeft(2, '0')}:${_departureTime!.minute.toString().padLeft(2, '0')}');
    }
    _prefs.put('auto_climate', _autoClimate);
    _prefs.put('auto_charge_limit', _autoChargeLimit);
    _prefs.put('home_charge_limit', _homeChargeLimit);
    _prefs.put('away_charge_limit', _awayChargeLimit);
    _prefs.put('departure_reminder', _departureReminderEnabled);
    _scheduleNotifications();
  }

  void _scheduleNotifications() {
    final ns = NotificationService();
    ns.cancelScheduled();
    if (_departureTime == null) return;

    final now = DateTime.now();
    var departure = DateTime(
        now.year, now.month, now.day, _departureTime!.hour, _departureTime!.minute);
    if (departure.isBefore(now)) {
      departure = departure.add(const Duration(days: 1));
    }

    final vehicle = context.read<VehicleBloc>().state.selectedVehicle;
    final soc = vehicle?.batteryLevel ?? 0;

    if (_departureReminderEnabled) {
      ns.scheduleDepartureReminder(departure, soc);
    }
    if (_autoClimate) {
      ns.scheduleClimateReminder(departure);
    }
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
              title: Text('Automations',
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
            // Departure Time
            _SectionLabel('DEPARTURE SCHEDULE'),
            const SizedBox(height: 12),
            _AutomationCard(
              isDark: isDark,
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: _IconBadge(Icons.schedule, VoltColors.primary),
                    title: const Text('Departure Time',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(
                      _departureTime != null
                          ? _departureTime!.format(context)
                          : 'Not set',
                      style: TextStyle(color: VoltColors.onSurfaceVariant),
                    ),
                    trailing: TextButton(
                      onPressed: () async {
                        final t = await showTimePicker(
                            context: context,
                            initialTime: _departureTime ?? TimeOfDay.now());
                        if (t != null) {
                          setState(() => _departureTime = t);
                          _save();
                        }
                      },
                      child: const Text('Set'),
                    ),
                  ),
                  _Divider(),
                  _SwitchTile(
                    icon: Icons.notifications_active,
                    title: 'Departure Reminder',
                    subtitle: '30-min heads-up notification',
                    value: _departureReminderEnabled,
                    onChanged: (v) {
                      setState(() => _departureReminderEnabled = v);
                      _save();
                    },
                  ),
                  _Divider(),
                  _SwitchTile(
                    icon: Icons.thermostat,
                    title: 'Auto Pre-conditioning',
                    subtitle: 'Start climate 15 min before departure',
                    value: _autoClimate,
                    onChanged: (v) {
                      setState(() => _autoClimate = v);
                      _save();
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // Charge Limits
            _SectionLabel('SMART CHARGING'),
            const SizedBox(height: 12),
            _AutomationCard(
              isDark: isDark,
              child: Column(
                children: [
                  _SwitchTile(
                    icon: Icons.bolt,
                    title: 'Location-based Charge Limits',
                    subtitle: 'Different limits at home vs. away',
                    value: _autoChargeLimit,
                    onChanged: (v) {
                      setState(() => _autoChargeLimit = v);
                      _save();
                    },
                  ),
                  if (_autoChargeLimit) ...[
                    _Divider(),
                    _SliderTile(
                      icon: Icons.home,
                      title: 'Home Charge Limit',
                      value: _homeChargeLimit,
                      min: 50,
                      max: 100,
                      color: VoltColors.success,
                      onChanged: (v) {
                        setState(() => _homeChargeLimit = v);
                        _save();
                      },
                    ),
                    _Divider(),
                    _SliderTile(
                      icon: Icons.travel_explore,
                      title: 'Away Charge Limit',
                      value: _awayChargeLimit,
                      min: 50,
                      max: 100,
                      color: VoltColors.info,
                      onChanged: (v) {
                        setState(() => _awayChargeLimit = v);
                        _save();
                      },
                    ),
                  ],
                ],
              ),
            ),

            const SizedBox(height: 28),

            // Info card
            _InfoCard(
              isDark: isDark,
              text:
                  'Pre-conditioning requires your vehicle to be plugged in or have sufficient battery (>20%). '
                  'Charge limit automation applies the limit when charging is first detected after a location change.',
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Shared widgets
// ---------------------------------------------------------------------------

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

class _AutomationCard extends StatelessWidget {
  final Widget child;
  final bool isDark;
  const _AutomationCard({required this.child, required this.isDark});
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
          color: isDark ? VoltColors.surfaceElevatedDark : VoltColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(20),
        ),
        child: child,
      );
}

class _IconBadge extends StatelessWidget {
  final IconData icon;
  final Color color;
  const _IconBadge(this.icon, this.color);
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(8),
        decoration:
            BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
        child: Icon(icon, color: color, size: 20),
      );
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      const Divider(height: 1, color: Colors.white10, indent: 52);
}

class _SwitchTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;
  const _SwitchTile(
      {required this.icon,
      required this.title,
      required this.subtitle,
      required this.value,
      required this.onChanged});

  @override
  Widget build(BuildContext context) => SwitchListTile(
        contentPadding: EdgeInsets.zero,
        secondary: _IconBadge(icon, VoltColors.primary),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        subtitle: Text(subtitle,
            style: const TextStyle(color: VoltColors.onSurfaceVariant, fontSize: 12)),
        value: value,
        onChanged: onChanged,
        activeColor: VoltColors.primary,
      );
}

class _SliderTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final int value;
  final int min;
  final int max;
  final Color color;
  final ValueChanged<int> onChanged;
  const _SliderTile(
      {required this.icon,
      required this.title,
      required this.value,
      required this.min,
      required this.max,
      required this.color,
      required this.onChanged});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            _IconBadge(icon, color),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title,
                          style:
                              const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      Text('$value%',
                          style: TextStyle(
                              color: color, fontWeight: FontWeight.bold, fontSize: 14)),
                    ],
                  ),
                  Slider(
                    value: value.toDouble(),
                    min: min.toDouble(),
                    max: max.toDouble(),
                    divisions: (max - min) ~/ 5,
                    activeColor: color,
                    onChanged: (v) => onChanged(v.round()),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}

class _InfoCard extends StatelessWidget {
  final String text;
  final bool isDark;
  const _InfoCard({required this.text, required this.isDark});
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: VoltColors.info.withOpacity(0.08),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: VoltColors.info.withOpacity(0.2)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.info_outline, color: VoltColors.info, size: 18),
            const SizedBox(width: 12),
            Expanded(
              child: Text(text,
                  style:
                      const TextStyle(color: VoltColors.info, fontSize: 12, height: 1.5)),
            ),
          ],
        ),
      );
}

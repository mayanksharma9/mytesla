import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive/hive.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

/// Centralized notification service.
///
/// Handles both scheduled (departure/climate) and triggered (charging complete,
/// low battery, sentry, software update) notifications via flutter_local_notifications.
class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _plugin = FlutterLocalNotificationsPlugin();
  bool _initialized = false;

  // Notification IDs
  static const int _idChargingComplete = 1;
  static const int _idLowBattery = 2;
  static const int _idSentryAlert = 3;
  static const int _idSoftwareUpdate = 4;
  static const int _idDeparture = 5;
  static const int _idClimateSchedule = 6;
  static const int _idPhantomDrain = 7;
  static const int _idMaintenanceDue = 8;
  static const int _idTirePressure = 9;

  static const String _channelVehicle = 'vehicle_alerts';
  static const String _channelCharging = 'charging';
  static const String _channelSchedule = 'schedule';
  static const String _channelMaintenance = 'maintenance';

  Future<void> init() async {
    if (_initialized) return;
    tz.initializeTimeZones();

    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    await _plugin.initialize(
      const InitializationSettings(android: androidSettings, iOS: iosSettings),
      onDidReceiveNotificationResponse: _onNotificationTap,
    );

    if (Platform.isAndroid) {
      await _plugin
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
          ?.requestNotificationsPermission();
    }

    _initialized = true;
    debugPrint('NotificationService: initialized');
  }

  void _onNotificationTap(NotificationResponse response) {
    debugPrint('NotificationService: tapped id=${response.id}');
  }

  // ---------------------------------------------------------------------------
  // Prefs helpers
  // ---------------------------------------------------------------------------

  Box get _prefs => Hive.box('user_prefs');

  bool get _notifyCharging => _prefs.get('notify_charging', defaultValue: true) as bool;
  bool get _notifyLowBattery => _prefs.get('notify_low_battery', defaultValue: true) as bool;
  bool get _notifySentry => _prefs.get('notify_sentry', defaultValue: true) as bool;
  bool get _notifyFirmware => _prefs.get('notify_firmware', defaultValue: true) as bool;
  bool get _notifyMaintenance => _prefs.get('notify_maintenance', defaultValue: true) as bool;
  bool get _notifyTpms => _prefs.get('notify_tpms', defaultValue: true) as bool;
  int get _lowBatteryThreshold => _prefs.get('low_battery_threshold', defaultValue: 20) as int;

  // ---------------------------------------------------------------------------
  // Triggered notifications
  // ---------------------------------------------------------------------------

  Future<void> notifyChargingComplete(int finalSoc, double kwhAdded) async {
    if (!_notifyCharging) return;
    await _show(
      id: _idChargingComplete,
      channel: _channelCharging,
      channelName: 'Charging',
      title: 'Charging Complete',
      body: 'Battery at $finalSoc% · ${kwhAdded.toStringAsFixed(1)} kWh added',
      icon: '⚡',
    );
  }

  Future<void> notifyLowBattery(int soc) async {
    if (!_notifyLowBattery || soc > _lowBatteryThreshold) return;
    await _show(
      id: _idLowBattery,
      channel: _channelVehicle,
      channelName: 'Vehicle Alerts',
      title: 'Low Battery',
      body: 'Battery at $soc%. Plug in soon or range may be limited.',
      icon: '🔋',
    );
  }

  Future<void> notifySentryEvent() async {
    if (!_notifySentry) return;
    await _show(
      id: _idSentryAlert,
      channel: _channelVehicle,
      channelName: 'Vehicle Alerts',
      title: 'Sentry Alert',
      body: 'Activity detected near your vehicle.',
      icon: '🛡',
    );
  }

  Future<void> notifySoftwareUpdate(String newVersion, String currentVersion) async {
    if (!_notifyFirmware) return;
    await _show(
      id: _idSoftwareUpdate,
      channel: _channelVehicle,
      channelName: 'Vehicle Alerts',
      title: 'Software Update Available',
      body: 'Version $newVersion is available (current: $currentVersion)',
      icon: '🔄',
    );
  }

  Future<void> notifyPhantomDrain(double drainPercent) async {
    if (!_notifyLowBattery) return;
    await _show(
      id: _idPhantomDrain,
      channel: _channelVehicle,
      channelName: 'Vehicle Alerts',
      title: 'High Phantom Drain',
      body: 'Your vehicle lost ${drainPercent.toStringAsFixed(1)}% overnight while parked.',
      icon: '👻',
    );
  }

  Future<void> notifyMaintenanceDue(String item) async {
    if (!_notifyMaintenance) return;
    await _show(
      id: _idMaintenanceDue,
      channel: _channelMaintenance,
      channelName: 'Maintenance',
      title: 'Maintenance Due',
      body: '$item is due for service.',
      icon: '🔧',
    );
  }

  Future<void> notifyTirePressure(String tire, double psi) async {
    if (!_notifyTpms) return;
    await _show(
      id: _idTirePressure,
      channel: _channelMaintenance,
      channelName: 'Maintenance',
      title: 'Low Tire Pressure',
      body: '$tire is at ${psi.toStringAsFixed(1)} PSI. Check inflation.',
      icon: '🚗',
    );
  }

  // ---------------------------------------------------------------------------
  // Scheduled notifications
  // ---------------------------------------------------------------------------

  Future<void> scheduleDepartureReminder(DateTime departureTime, int batteryLevel) async {
    final reminderTime = departureTime.subtract(const Duration(minutes: 30));
    if (reminderTime.isBefore(DateTime.now())) return;
    await _showScheduled(
      id: _idDeparture,
      channel: _channelSchedule,
      channelName: 'Schedule',
      title: 'Departure in 30 minutes',
      body: 'Battery at $batteryLevel%. Vehicle is${batteryLevel >= 80 ? '' : ' not'} charged.',
      scheduledDate: tz.TZDateTime.from(reminderTime, tz.local),
    );
  }

  Future<void> scheduleClimateReminder(DateTime departureTime) async {
    final reminderTime = departureTime.subtract(const Duration(minutes: 15));
    if (reminderTime.isBefore(DateTime.now())) return;
    await _showScheduled(
      id: _idClimateSchedule,
      channel: _channelSchedule,
      channelName: 'Schedule',
      title: 'Pre-conditioning Started',
      body: 'Your vehicle is warming up for your 15-min departure.',
      scheduledDate: tz.TZDateTime.from(reminderTime, tz.local),
    );
  }

  Future<void> cancelScheduled() async {
    await _plugin.cancel(_idDeparture);
    await _plugin.cancel(_idClimateSchedule);
  }

  // ---------------------------------------------------------------------------
  // Internal helpers
  // ---------------------------------------------------------------------------

  Future<void> _show({
    required int id,
    required String channel,
    required String channelName,
    required String title,
    required String body,
    String icon = '',
  }) async {
    if (!_initialized) await init();
    final androidDetails = AndroidNotificationDetails(
      channel,
      channelName,
      importance: Importance.high,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
    );
    await _plugin.show(
      id,
      title,
      body,
      NotificationDetails(android: androidDetails, iOS: const DarwinNotificationDetails()),
    );
  }

  Future<void> _showScheduled({
    required int id,
    required String channel,
    required String channelName,
    required String title,
    required String body,
    required tz.TZDateTime scheduledDate,
  }) async {
    if (!_initialized) await init();
    final androidDetails = AndroidNotificationDetails(
      channel,
      channelName,
      importance: Importance.high,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
    );
    await _plugin.zonedSchedule(
      id,
      title,
      body,
      scheduledDate,
      NotificationDetails(android: androidDetails, iOS: const DarwinNotificationDetails()),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:voltride/core/theme/volt_colors.dart';
import 'package:voltride/features/dashboard/presentation/bloc/vehicle_bloc.dart';
import 'dart:ui';

// ---------------------------------------------------------------------------
// Data model stored in Hive box 'maintenance'
// ---------------------------------------------------------------------------

class MaintenanceItem {
  final String id;
  final String name;
  final String description;
  final int intervalMiles;
  final int intervalMonths;
  final double? lastServiceOdometer;
  final DateTime? lastServiceDate;
  final IconData icon;

  const MaintenanceItem({
    required this.id,
    required this.name,
    required this.description,
    required this.intervalMiles,
    required this.intervalMonths,
    required this.icon,
    this.lastServiceOdometer,
    this.lastServiceDate,
  });

  MaintenanceItem copyWith({
    double? lastServiceOdometer,
    DateTime? lastServiceDate,
  }) => MaintenanceItem(
    id: id,
    name: name,
    description: description,
    intervalMiles: intervalMiles,
    intervalMonths: intervalMonths,
    icon: icon,
    lastServiceOdometer: lastServiceOdometer ?? this.lastServiceOdometer,
    lastServiceDate: lastServiceDate ?? this.lastServiceDate,
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'lastServiceOdometer': lastServiceOdometer,
    'lastServiceDate': lastServiceDate?.toIso8601String(),
  };
}

// ---------------------------------------------------------------------------
// Default maintenance schedule (Tesla-specific intervals)
// ---------------------------------------------------------------------------

final List<MaintenanceItem> _defaultItems = [
  const MaintenanceItem(
    id: 'tire_rotation',
    name: 'Tire Rotation',
    description: 'Rotate tires for even wear and longevity',
    intervalMiles: 10000,
    intervalMonths: 12,
    icon: Icons.tire_repair,
  ),
  const MaintenanceItem(
    id: 'cabin_filter',
    name: 'Cabin Air Filter',
    description: 'Replace cabin HEPA/particulate filter',
    intervalMiles: 25000,
    intervalMonths: 24,
    icon: Icons.air,
  ),
  const MaintenanceItem(
    id: 'brake_fluid',
    name: 'Brake Fluid Test',
    description: 'Check brake fluid moisture content',
    intervalMiles: 999999,
    intervalMonths: 24,
    icon: Icons.water_drop,
  ),
  const MaintenanceItem(
    id: 'wiper_blades',
    name: 'Wiper Blades',
    description: 'Replace for clear visibility',
    intervalMiles: 999999,
    intervalMonths: 12,
    icon: Icons.water,
  ),
  const MaintenanceItem(
    id: 'ac_desiccant',
    name: 'A/C Desiccant Bag',
    description: 'Replace A/C desiccant to maintain system efficiency',
    intervalMiles: 999999,
    intervalMonths: 72,
    icon: Icons.ac_unit,
  ),
  const MaintenanceItem(
    id: 'tire_inspection',
    name: 'Tire Inspection',
    description: 'Check tread depth, sidewall condition, and pressure',
    intervalMiles: 6250,
    intervalMonths: 6,
    icon: Icons.search,
  ),
  const MaintenanceItem(
    id: 'annual_service',
    name: 'Annual Service Check',
    description: 'Full vehicle inspection by Tesla Service',
    intervalMiles: 12500,
    intervalMonths: 12,
    icon: Icons.build_circle,
  ),
];

// ---------------------------------------------------------------------------
// Page
// ---------------------------------------------------------------------------

class MaintenancePage extends StatefulWidget {
  const MaintenancePage({super.key});

  @override
  State<MaintenancePage> createState() => _MaintenancePageState();
}

class _MaintenancePageState extends State<MaintenancePage> {
  late List<MaintenanceItem> _items;
  Box get _box => Hive.box('maintenance');

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() {
    _items = _defaultItems.map((item) {
      final saved = _box.get(item.id);
      if (saved is Map) {
        return item.copyWith(
          lastServiceOdometer: (saved['lastServiceOdometer'] as num?)?.toDouble(),
          lastServiceDate: saved['lastServiceDate'] != null
              ? DateTime.tryParse(saved['lastServiceDate'] as String)
              : null,
        );
      }
      return item;
    }).toList();
  }

  _MaintenanceStatus _statusFor(MaintenanceItem item, double currentOdometer) {
    final monthsSince = item.lastServiceDate != null
        ? DateTime.now().difference(item.lastServiceDate!).inDays / 30.0
        : double.infinity;
    final milesSince = item.lastServiceOdometer != null
        ? currentOdometer - item.lastServiceOdometer!
        : double.infinity;

    final monthPct = monthsSince / item.intervalMonths;
    final milePct = milesSince / item.intervalMiles;
    final pct = [monthPct, milePct].reduce((a, b) => a > b ? a : b);

    if (pct >= 1.0) return _MaintenanceStatus.due;
    if (pct >= 0.8) return _MaintenanceStatus.soon;
    return _MaintenanceStatus.ok;
  }

  String _nextDueText(MaintenanceItem item, double currentOdometer) {
    if (item.lastServiceOdometer == null && item.lastServiceDate == null) {
      return 'Service history unknown — mark as done to track';
    }
    final milesDue = item.lastServiceOdometer != null
        ? item.lastServiceOdometer! + item.intervalMiles - currentOdometer
        : double.infinity;
    final monthsDue = item.lastServiceDate != null
        ? item.intervalMonths -
            DateTime.now().difference(item.lastServiceDate!).inDays / 30.0
        : double.infinity;

    final parts = <String>[];
    if (milesDue.isFinite && item.intervalMiles < 999000) {
      if (milesDue <= 0) {
        parts.add('${(-milesDue).round()} mi overdue');
      } else {
        parts.add('${milesDue.round()} mi remaining');
      }
    }
    if (monthsDue.isFinite) {
      if (monthsDue <= 0) {
        parts.add('${(-monthsDue).round()} mo overdue');
      } else {
        parts.add('${monthsDue.round()} mo remaining');
      }
    }
    return parts.isEmpty ? 'Due soon' : parts.join(' · ');
  }

  void _markDone(MaintenanceItem item, double odometer) {
    final updated = item.copyWith(
      lastServiceOdometer: odometer,
      lastServiceDate: DateTime.now(),
    );
    _box.put(item.id, updated.toMap());
    setState(() => _loadItems());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return BlocBuilder<VehicleBloc, VehicleBlocState>(
      builder: (context, vehicleState) {
        final odometer = vehicleState.selectedVehicle?.odometer ?? 0.0;

        final dueItems = _items.where((i) => _statusFor(i, odometer) == _MaintenanceStatus.due).toList();
        final soonItems = _items.where((i) => _statusFor(i, odometer) == _MaintenanceStatus.soon).toList();
        final okItems = _items.where((i) => _statusFor(i, odometer) == _MaintenanceStatus.ok).toList();

        return Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          extendBodyBehindAppBar: true,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(72),
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: AppBar(
                  backgroundColor: isDark
                      ? Colors.black.withOpacity(0.6)
                      : Colors.white.withOpacity(0.8),
                  title: Text('Maintenance',
                      style: theme.textTheme.headlineLarge?.copyWith(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 100, left: 20, right: 20, bottom: 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Odometer card
                _OdometerCard(odometer: odometer),
                const SizedBox(height: 28),

                if (dueItems.isNotEmpty) ...[
                  _SectionHeader('OVERDUE', VoltColors.error),
                  const SizedBox(height: 12),
                  ...dueItems.map((item) => _MaintenanceCard(
                        item: item,
                        status: _MaintenanceStatus.due,
                        dueText: _nextDueText(item, odometer),
                        onMarkDone: () => _markDone(item, odometer),
                      )),
                  const SizedBox(height: 24),
                ],

                if (soonItems.isNotEmpty) ...[
                  _SectionHeader('DUE SOON', VoltColors.warning),
                  const SizedBox(height: 12),
                  ...soonItems.map((item) => _MaintenanceCard(
                        item: item,
                        status: _MaintenanceStatus.soon,
                        dueText: _nextDueText(item, odometer),
                        onMarkDone: () => _markDone(item, odometer),
                      )),
                  const SizedBox(height: 24),
                ],

                _SectionHeader('UP TO DATE', VoltColors.success),
                const SizedBox(height: 12),
                ...okItems.map((item) => _MaintenanceCard(
                      item: item,
                      status: _MaintenanceStatus.ok,
                      dueText: _nextDueText(item, odometer),
                      onMarkDone: () => _markDone(item, odometer),
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}

enum _MaintenanceStatus { due, soon, ok }

class _OdometerCard extends StatelessWidget {
  final double odometer;
  const _OdometerCard({required this.odometer});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? VoltColors.surfaceElevatedDark : VoltColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: VoltColors.primary.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: VoltColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(Icons.speed, color: VoltColors.primary),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Current Odometer',
                  style: TextStyle(color: VoltColors.onSurfaceVariant, fontSize: 12)),
              Text(
                '${NumberFormat('#,###').format(odometer.round())} mi',
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String label;
  final Color color;
  const _SectionHeader(this.label, this.color);

  @override
  Widget build(BuildContext context) => Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
          color: color,
        ),
      );
}

class _MaintenanceCard extends StatelessWidget {
  final MaintenanceItem item;
  final _MaintenanceStatus status;
  final String dueText;
  final VoidCallback onMarkDone;

  const _MaintenanceCard({
    required this.item,
    required this.status,
    required this.dueText,
    required this.onMarkDone,
  });

  Color get _statusColor {
    switch (status) {
      case _MaintenanceStatus.due: return VoltColors.error;
      case _MaintenanceStatus.soon: return VoltColors.warning;
      case _MaintenanceStatus.ok: return VoltColors.success;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? VoltColors.surfaceElevatedDark : VoltColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: _statusColor.withOpacity(status == _MaintenanceStatus.ok ? 0 : 0.3)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: _statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(item.icon, color: _statusColor, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                const SizedBox(height: 2),
                Text(item.description,
                    style: TextStyle(color: VoltColors.onSurfaceVariant, fontSize: 12)),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(color: _statusColor, shape: BoxShape.circle),
                    ),
                    const SizedBox(width: 6),
                    Flexible(
                      child: Text(dueText,
                          style: TextStyle(color: _statusColor, fontSize: 11, fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          TextButton(
            onPressed: onMarkDone,
            style: TextButton.styleFrom(
              foregroundColor: VoltColors.success,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              backgroundColor: VoltColors.success.withOpacity(0.08),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Text('Done', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}

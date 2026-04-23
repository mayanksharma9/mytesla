import 'dart:ui';
import 'dart:math' as math;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:voltride/core/theme/volt_colors.dart';
import 'package:voltride/features/charging/domain/charging_analytics.dart';
import 'package:voltride/features/charging/presentation/bloc/charging_bloc.dart';
import 'package:voltride/features/dashboard/data/models/tesla_models.dart' as m;
import 'package:voltride/features/dashboard/presentation/bloc/vehicle_bloc.dart';
import 'charging_history_page.dart';

class ChargingPage extends StatefulWidget {
  const ChargingPage({super.key});

  @override
  State<ChargingPage> createState() => _ChargingPageState();
}

class _ChargingPageState extends State<ChargingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _anim;

  @override
  void initState() {
    super.initState();
    _anim = AnimationController(
        vsync: this, duration: const Duration(seconds: 2))
      ..repeat(reverse: true);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final vin = context.read<VehicleBloc>().state.selectedVehicle?.vin;
      context.read<ChargingBloc>().add(FetchChargingHistory(vin: vin, refresh: true));
      context.read<ChargingBloc>().add(FetchBusinessSessions(vin: vin));
      if (vin != null) context.read<ChargingBloc>().add(LoadLocalSessions(vin));
    });
  }

  @override
  void dispose() {
    _anim.dispose();
    super.dispose();
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
              backgroundColor: isDark
                  ? Colors.black.withOpacity(0.6)
                  : Colors.white.withOpacity(0.8),
              elevation: 0,
              centerTitle: true,
              title: Text('CHARGING',
                  style: theme.textTheme.titleMedium?.copyWith(
                      fontSize: 14, fontWeight: FontWeight.w900, letterSpacing: 2)),
            ),
          ),
        ),
      ),
      body: BlocBuilder<VehicleBloc, VehicleBlocState>(
        builder: (context, vehicleState) {
          final vehicle = vehicleState.selectedVehicle;
          if (vehicle == null) {
            return const Center(child: CircularProgressIndicator(color: VoltColors.primary));
          }
          return BlocBuilder<ChargingBloc, ChargingState>(
            builder: (context, cs) {
              return RefreshIndicator(
                color: VoltColors.primary,
                onRefresh: () async {
                  final vin = vehicle.vin;
                  context.read<ChargingBloc>().add(FetchChargingHistory(vin: vin, refresh: true));
                  context.read<VehicleBloc>().add(FetchHistory(vin));
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(20, 96, 20, 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _StatusHero(vehicle: vehicle, anim: _anim, isDark: isDark),
                      const SizedBox(height: 16),
                      _ChargeControls(vehicle: vehicle, isDark: isDark),
                      const SizedBox(height: 24),

                      // ---- Analytics ----
                      _LifetimeTotals(analytics: cs.analytics, isDark: isDark),
                      const SizedBox(height: 20),
                      _MonthlyChart(analytics: cs.analytics, isDark: isDark),
                      const SizedBox(height: 20),
                      _HeatmapCard(analytics: cs.analytics, isDark: isDark),
                      const SizedBox(height: 20),
                      if (cs.analytics.topStations.isNotEmpty) ...[
                        _TopStations(analytics: cs.analytics, isDark: isDark),
                        const SizedBox(height: 20),
                      ],

                      // ---- Scheduled charging ----
                      _ScheduledChargingCard(vehicle: vehicle, isDark: isDark),
                      const SizedBox(height: 24),

                      // ---- Recent sessions (last 5) ----
                      _SectionHeader(
                        title: 'RECENT SESSIONS',
                        action: 'VIEW ALL',
                        onAction: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ChargingHistoryPage()),
                        ),
                      ),
                      const SizedBox(height: 12),
                      _RecentSessions(
                        history: cs.history,
                        localSessions: cs.localSessions,
                        isLoading: cs.isHistoryLoading,
                        isDark: isDark,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// ============================================================================
// Status Hero
// ============================================================================

class _StatusHero extends StatelessWidget {
  final dynamic vehicle;
  final AnimationController anim;
  final bool isDark;
  const _StatusHero({required this.vehicle, required this.anim, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final isCharging = vehicle.chargingState == 'Charging';
    String formatTime(double h) {
      if (h <= 0) return '—';
      final hh = h.toInt();
      final mm = ((h - hh) * 60).toInt();
      return hh > 0 ? '${hh}h ${mm}m' : '${mm}m';
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1A1A) : Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(children: [
        AnimatedBuilder(
          animation: anim,
          builder: (_, __) {
            return Container(
              width: 72,
              height: 108,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white24, width: 2),
              ),
              child: Stack(children: [
                Positioned(
                  bottom: 2,
                  left: 2,
                  right: 2,
                  height: math.max(0, 100 * ((vehicle.batteryLevel ?? 0) / 100.0)).toDouble(),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isCharging
                          ? VoltColors.success.withOpacity(anim.value * 0.4 + 0.4)
                          : VoltColors.primary.withOpacity(0.7),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8)),
                    ),
                  ),
                ),
                if (isCharging)
                  const Center(child: Icon(Icons.bolt, color: Colors.white, size: 36)),
              ]),
            );
          },
        ),
        const SizedBox(height: 20),
        Text('${vehicle.batteryLevel}%',
            style: const TextStyle(fontSize: 46, fontWeight: FontWeight.w900)),
        Text(
          isCharging ? 'CURRENTLY CHARGING'
              : vehicle.chargingState == 'Complete' ? 'CHARGE COMPLETE'
              : vehicle.chargingState == 'Stopped' ? 'CHARGING STOPPED'
              : 'READY TO CHARGE',
          style: TextStyle(
            fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 2,
            color: isCharging ? VoltColors.success
                : vehicle.chargingState == 'Complete' ? VoltColors.info
                : VoltColors.onSurfaceVariant,
          ),
        ),
        if (isCharging) ...[
          const SizedBox(height: 20),
          const Divider(color: Colors.white10),
          const SizedBox(height: 12),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            _InfoChip(Icons.bolt, 'POWER', '${vehicle.chargerPower.toInt()} kW'),
            _InfoChip(Icons.timer_outlined, 'REMAINING',
                formatTime(vehicle.timeToFullCharge)),
            _InfoChip(Icons.battery_charging_full, 'ADDED',
                '${vehicle.chargeEnergyAdded.toStringAsFixed(1)} kWh'),
          ]),
        ],
      ]),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const _InfoChip(this.icon, this.label, this.value);

  @override
  Widget build(BuildContext context) => Column(children: [
        Icon(icon, size: 16, color: VoltColors.primary),
        const SizedBox(height: 4),
        Text(label,
            style: const TextStyle(
                fontSize: 9, fontWeight: FontWeight.w800,
                color: VoltColors.onSurfaceVariant, letterSpacing: 1)),
        Text(value,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w900)),
      ]);
}

// ============================================================================
// Charge Controls
// ============================================================================

class _ChargeControls extends StatelessWidget {
  final dynamic vehicle;
  final bool isDark;
  const _ChargeControls({required this.vehicle, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final isCharging = vehicle.chargingState == 'Charging';
    final portOpen = vehicle.chargePortOpen as bool? ?? false;
    final isChargeModeLoading =
        context.select<VehicleBloc, bool>((b) => b.state.loadingCommands.contains('${vehicle.id}_charge_mode'));

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1A1A) : Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(children: [
        Row(children: [
          _ControlBtn(
            icon: portOpen ? Icons.electrical_services : Icons.ev_station,
            label: portOpen ? 'CLOSE PORT' : 'OPEN PORT',
            active: portOpen,
            onTap: () {
              if (portOpen) {
                context.read<VehicleBloc>().add(CloseChargePort(vehicle.id as String));
              } else {
                context.read<VehicleBloc>().add(OpenChargePort(vehicle.id as String));
              }
            },
            isDark: isDark,
          ),
          const SizedBox(width: 12),
          _ControlBtn(
            icon: isCharging ? Icons.stop_circle_outlined : Icons.play_circle_outline,
            label: isCharging ? 'STOP' : 'START',
            active: isCharging,
            activeColor: isCharging ? VoltColors.error : VoltColors.success,
            onTap: () => context.read<VehicleBloc>().add(
                ToggleCharging(vehicle.id as String, !isCharging)),
            isDark: isDark,
          ),
        ]),
        const SizedBox(height: 12),
        // Max Range / Standard mode
        Row(children: [
          Expanded(child: GestureDetector(
            onTap: isChargeModeLoading ? null : () =>
                context.read<VehicleBloc>().add(ChargeStandard(vehicle.id as String)),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: isDark ? Colors.white10 : Colors.black.withValues(alpha: 0.04),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(Icons.battery_charging_full,
                    size: 16,
                    color: isChargeModeLoading ? VoltColors.outline : VoltColors.primary),
                const SizedBox(width: 6),
                Text('STANDARD',
                    style: TextStyle(
                        fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 1,
                        color: isChargeModeLoading ? VoltColors.outline : null)),
              ]),
            ),
          )),
          const SizedBox(width: 12),
          Expanded(child: GestureDetector(
            onTap: isChargeModeLoading ? null : () =>
                context.read<VehicleBloc>().add(ChargeMaxRange(vehicle.id as String)),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: VoltColors.warning.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: VoltColors.warning.withValues(alpha: 0.3)),
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                if (isChargeModeLoading)
                  const SizedBox(width: 16, height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2, color: VoltColors.warning))
                else
                  const Icon(Icons.battery_full, size: 16, color: VoltColors.warning),
                const SizedBox(width: 6),
                const Text('MAX RANGE',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800,
                        letterSpacing: 1, color: VoltColors.warning)),
              ]),
            ),
          )),
        ]),
        // Fast charger indicator
        if ((vehicle.fastChargerPresent as bool? ?? false) && isCharging) ...[
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              color: VoltColors.success.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(children: [
              Icon(Icons.bolt, color: VoltColors.success, size: 16),
              SizedBox(width: 6),
              Text('DC Fast Charging',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: VoltColors.success)),
            ]),
          ),
        ],
      ]),
    );
  }
}

class _ControlBtn extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;
  final Color activeColor;
  final VoidCallback onTap;
  final bool isDark;
  const _ControlBtn({
    required this.icon, required this.label, required this.active,
    this.activeColor = VoltColors.primary,
    required this.onTap, required this.isDark,
  });

  @override
  Widget build(BuildContext context) => Expanded(
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              color: active
                  ? activeColor.withOpacity(0.12)
                  : (isDark ? Colors.white10 : Colors.black.withOpacity(0.04)),
              borderRadius: BorderRadius.circular(16),
              border: active
                  ? Border.all(color: activeColor.withOpacity(0.3))
                  : null,
            ),
            child: Column(children: [
              Icon(icon, color: active ? activeColor : VoltColors.onSurfaceVariant, size: 22),
              const SizedBox(height: 6),
              Text(label,
                  style: TextStyle(
                      fontSize: 10, fontWeight: FontWeight.w800,
                      letterSpacing: 1,
                      color: active ? activeColor : VoltColors.onSurfaceVariant)),
            ]),
          ),
        ),
      );
}

// ============================================================================
// Analytics — Lifetime Totals
// ============================================================================

class _LifetimeTotals extends StatelessWidget {
  final ChargingAnalytics analytics;
  final bool isDark;
  const _LifetimeTotals({required this.analytics, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final sym = _currencySymbol(analytics.currencyCode);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const _Label('LIFETIME TOTALS'),
      const SizedBox(height: 12),
      Row(children: [
        _TotalCard(
            value: '${analytics.lifetimeSessions}',
            label: 'Sessions',
            icon: Icons.bolt,
            isDark: isDark),
        const SizedBox(width: 10),
        _TotalCard(
            value: '${analytics.lifetimeKwh.toStringAsFixed(0)} kWh',
            label: 'Energy Added',
            icon: Icons.electric_bolt,
            isDark: isDark),
        const SizedBox(width: 10),
        _TotalCard(
            value: '$sym${analytics.lifetimeCost.toStringAsFixed(0)}',
            label: 'Total Spent',
            icon: Icons.attach_money,
            isDark: isDark),
      ]),
      if (analytics.avgCostPerKwh > 0) ...[
        const SizedBox(height: 10),
        Row(children: [
          _TotalCard(
              value: '$sym${analytics.avgCostPerKwh.toStringAsFixed(2)}/kWh',
              label: 'Avg Rate',
              icon: Icons.speed,
              isDark: isDark),
          const SizedBox(width: 10),
          _TotalCard(
              value: '${analytics.avgKwhPerSession.toStringAsFixed(1)} kWh',
              label: 'Avg Session',
              icon: Icons.battery_charging_full,
              isDark: isDark),
          const SizedBox(width: 10),
          _TotalCard(
              value: '${analytics.avgDurationMinutes.toStringAsFixed(0)} min',
              label: 'Avg Duration',
              icon: Icons.timer,
              isDark: isDark),
        ]),
      ],
    ]);
  }
}

class _TotalCard extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;
  final bool isDark;
  const _TotalCard(
      {required this.value, required this.label, required this.icon, required this.isDark});

  @override
  Widget build(BuildContext context) => Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1A1A1A) : Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Icon(icon, color: VoltColors.primary, size: 18),
            const SizedBox(height: 8),
            Text(value,
                style: const TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w900),
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
            const SizedBox(height: 2),
            Text(label,
                style: const TextStyle(
                    fontSize: 10, color: VoltColors.onSurfaceVariant,
                    fontWeight: FontWeight.w600)),
          ]),
        ),
      );
}

// ============================================================================
// Analytics — Monthly Spending Chart
// ============================================================================

class _MonthlyChart extends StatelessWidget {
  final ChargingAnalytics analytics;
  final bool isDark;
  const _MonthlyChart({required this.analytics, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final months = analytics.monthlyStats;
    if (months.isEmpty) return const SizedBox.shrink();

    final sym = _currencySymbol(analytics.currencyCode);
    final maxCost = months.fold(0.0, (m, s) => math.max(m, s.cost));
    final maxKwh = months.fold(0.0, (m, s) => math.max(m, s.kwh));

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1A1A) : Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const _Label('MONTHLY SPENDING'),
        const SizedBox(height: 4),
        Text('Last 6 months',
            style: const TextStyle(
                fontSize: 11, color: VoltColors.onSurfaceVariant)),
        const SizedBox(height: 20),
        SizedBox(
          height: 160,
          child: BarChart(BarChartData(
            gridData: const FlGridData(show: false),
            borderData: FlBorderData(show: false),
            titlesData: FlTitlesData(
              topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (val, _) {
                    final i = val.toInt();
                    if (i < 0 || i >= months.length) return const SizedBox.shrink();
                    return Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        DateFormat('MMM').format(months[i].month),
                        style: const TextStyle(
                            fontSize: 10, color: VoltColors.onSurfaceVariant,
                            fontWeight: FontWeight.w600),
                      ),
                    );
                  },
                ),
              ),
            ),
            barGroups: List.generate(months.length, (i) {
              final s = months[i];
              final h = maxCost > 0 ? (s.cost / maxCost) * 140 : 0.0;
              return BarChartGroupData(x: i, barRods: [
                BarChartRodData(
                  toY: h,
                  color: VoltColors.primary,
                  width: 28,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(6), topRight: Radius.circular(6)),
                  backDrawRodData: BackgroundBarChartRodData(
                    show: true,
                    toY: 140,
                    color: Colors.white.withOpacity(0.04),
                  ),
                ),
              ]);
            }),
            barTouchData: BarTouchData(
              touchTooltipData: BarTouchTooltipData(
                getTooltipItem: (group, _, rod, __) {
                  final s = months[group.x];
                  return BarTooltipItem(
                    '$sym${s.cost.toStringAsFixed(2)}\n${s.kwh.toStringAsFixed(0)} kWh\n${s.sessions} session${s.sessions == 1 ? '' : 's'}',
                    const TextStyle(
                        color: Colors.white, fontSize: 11,
                        fontWeight: FontWeight.w700),
                  );
                },
              ),
            ),
          )),
        ),
        const SizedBox(height: 12),
        // kWh bar (secondary)
        if (maxKwh > 0) ...[
          const Divider(color: Colors.white10),
          const SizedBox(height: 12),
          Row(
            children: List.generate(months.length, (i) {
              final s = months[i];
              final frac = maxKwh > 0 ? s.kwh / maxKwh : 0.0;
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Column(children: [
                    Container(
                      height: 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: Colors.white.withOpacity(0.08),
                      ),
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: frac,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: VoltColors.info,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text('${s.kwh.toStringAsFixed(0)}',
                        style: const TextStyle(
                            fontSize: 9,
                            color: VoltColors.onSurfaceVariant)),
                  ]),
                ),
              );
            }),
          ),
          const SizedBox(height: 4),
          Row(children: [
            Container(width: 8, height: 3,
                decoration: BoxDecoration(
                    color: VoltColors.info,
                    borderRadius: BorderRadius.circular(2))),
            const SizedBox(width: 6),
            const Text('kWh added',
                style: TextStyle(fontSize: 10, color: VoltColors.onSurfaceVariant)),
          ]),
        ],
      ]),
    );
  }
}

// ============================================================================
// Analytics — Heatmap
// ============================================================================

class _HeatmapCard extends StatelessWidget {
  final ChargingAnalytics analytics;
  final bool isDark;
  const _HeatmapCard({required this.analytics, required this.isDark});

  static const _days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  static const _slots = ['Morning\n6–12', 'Afternoon\n12–17', 'Evening\n17–22', 'Night\n22–6'];

  @override
  Widget build(BuildContext context) {
    final heatmap = analytics.heatmap;
    int maxVal = 1;
    for (final row in heatmap) {
      for (final v in row) { if (v > maxVal) maxVal = v; }
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1A1A) : Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const _Label('CHARGING HABITS'),
        const SizedBox(height: 4),
        const Text('When you charge most',
            style: TextStyle(fontSize: 11, color: VoltColors.onSurfaceVariant)),
        const SizedBox(height: 16),
        // Slot labels
        Row(children: [
          const SizedBox(width: 36),
          ..._slots.asMap().entries.map((e) => Expanded(
                child: Text(e.value,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 8,
                        color: VoltColors.onSurfaceVariant,
                        fontWeight: FontWeight.w600)),
              )),
        ]),
        const SizedBox(height: 8),
        ...List.generate(7, (dayIdx) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(children: [
              SizedBox(
                width: 36,
                child: Text(_days[dayIdx],
                    style: const TextStyle(
                        fontSize: 10,
                        color: VoltColors.onSurfaceVariant,
                        fontWeight: FontWeight.w700)),
              ),
              ...List.generate(4, (slot) {
                final count = heatmap[dayIdx][slot];
                final intensity = count / maxVal;
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Tooltip(
                      message: '$count session${count == 1 ? '' : 's'}',
                      child: Container(
                        height: 28,
                        decoration: BoxDecoration(
                          color: count == 0
                              ? Colors.white.withOpacity(0.04)
                              : VoltColors.primary.withOpacity(0.15 + intensity * 0.75),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: count > 0
                            ? Center(
                                child: Text('$count',
                                    style: TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white.withOpacity(0.6 + intensity * 0.4))))
                            : null,
                      ),
                    ),
                  ),
                );
              }),
            ]),
          );
        }),
      ]),
    );
  }
}

// ============================================================================
// Analytics — Top Stations
// ============================================================================

class _TopStations extends StatelessWidget {
  final ChargingAnalytics analytics;
  final bool isDark;
  const _TopStations({required this.analytics, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final stations = analytics.topStations;
    final maxVisits = stations.isEmpty ? 1 : stations.first.visits;
    final sym = _currencySymbol(analytics.currencyCode);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1A1A) : Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const _Label('FAVORITE STATIONS'),
        const SizedBox(height: 16),
        ...stations.asMap().entries.map((entry) {
          final i = entry.key;
          final s = entry.value;
          final frac = s.visits / maxVisits;
          return Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  color: i == 0
                      ? VoltColors.primary.withOpacity(0.2)
                      : Colors.white.withOpacity(0.06),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text('${i + 1}',
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w900,
                          color: i == 0 ? VoltColors.primary : VoltColors.onSurfaceVariant)),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Expanded(
                      child: Text(s.name,
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w700),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                    ),
                    Text(
                      '${s.visits} visit${s.visits == 1 ? '' : 's'}',
                      style: const TextStyle(
                          fontSize: 11,
                          color: VoltColors.onSurfaceVariant,
                          fontWeight: FontWeight.w600),
                    ),
                  ]),
                  const SizedBox(height: 6),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: LinearProgressIndicator(
                      value: frac,
                      backgroundColor: Colors.white.withOpacity(0.08),
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(VoltColors.primary),
                      minHeight: 4,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(children: [
                    Text('${s.totalKwh.toStringAsFixed(0)} kWh',
                        style: const TextStyle(
                            fontSize: 10, color: VoltColors.onSurfaceVariant)),
                    const SizedBox(width: 10),
                    Text('$sym${s.totalCost.toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontSize: 10, color: VoltColors.onSurfaceVariant)),
                    if (s.avgCostPerKwh > 0) ...[
                      const SizedBox(width: 10),
                      Text('$sym${s.avgCostPerKwh.toStringAsFixed(2)}/kWh',
                          style: const TextStyle(
                              fontSize: 10, color: VoltColors.onSurfaceVariant)),
                    ],
                  ]),
                ]),
              ),
            ]),
          );
        }),
      ]),
    );
  }
}

// ============================================================================
// Scheduled Charging
// ============================================================================

class _ScheduledChargingCard extends StatelessWidget {
  final dynamic vehicle;
  final bool isDark;
  const _ScheduledChargingCard({required this.vehicle, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final scheduledMode = vehicle.scheduledChargingMode as String?;
    final isScheduled =
        scheduledMode != null && scheduledMode != 'Off' && scheduledMode.isNotEmpty;
    final startTime = vehicle.scheduledChargingStartTime as int?;
    String label = 'Set a time to start charging automatically.';
    if (isScheduled && startTime != null) {
      final dt = DateTime.fromMillisecondsSinceEpoch(startTime * 1000);
      label = 'Scheduled: ${DateFormat('h:mm a').format(dt)}  ·  $scheduledMode';
    }

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1A1A) : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isScheduled
                ? VoltColors.primary.withOpacity(0.12)
                : Colors.white.withOpacity(0.06),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.schedule,
              color: isScheduled ? VoltColors.primary : VoltColors.onSurfaceVariant,
              size: 18),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Scheduled Charging',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800)),
            const SizedBox(height: 2),
            Text(label,
                style: const TextStyle(
                    fontSize: 10,
                    color: VoltColors.onSurfaceVariant,
                    fontWeight: FontWeight.w600)),
          ]),
        ),
        Switch(
          value: isScheduled,
          onChanged: (val) =>
              context.read<VehicleBloc>().add(SetScheduledCharging(vehicle.id as String, val)),
          activeColor: VoltColors.primary,
        ),
      ]),
    );
  }
}

// ============================================================================
// Recent Sessions (last 5)
// ============================================================================

class _RecentSessions extends StatelessWidget {
  final List<m.ChargingHistoryEntry> history;
  final List<m.ChargeSession> localSessions;
  final bool isLoading;
  final bool isDark;
  const _RecentSessions({
    required this.history, required this.localSessions,
    required this.isLoading, required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading && history.isEmpty && localSessions.isEmpty) {
      return const Center(
          child: Padding(
              padding: EdgeInsets.all(24),
              child: CircularProgressIndicator(color: VoltColors.primary)));
    }

    if (history.isNotEmpty) {
      return Column(
        children: history.take(5).map((e) {
          final dt = e.chargeStartDateTime != null
              ? DateTime.tryParse(e.chargeStartDateTime!)?.toLocal()
              : null;
          final sym = _currencySymbol(e.currencyCode);
          return _SessionTile(
            dateStr: dt != null ? DateFormat('MMM d').format(dt) : '—',
            kwh: '${e.energyKwh.toStringAsFixed(1)} kWh',
            cost: e.totalCost > 0 ? '$sym${e.totalCost.toStringAsFixed(2)}' : 'Free',
            location: e.locationName,
            isDark: isDark,
          );
        }).toList(),
      );
    }

    if (localSessions.isNotEmpty) {
      return Column(
        children: localSessions.take(5).map((s) {
          final label = s.fastChargerType?.isNotEmpty == true
              ? s.fastChargerType!
              : s.chargerPower > 50 ? 'DC Fast Charge' : 'Level 2 AC';
          return _SessionTile(
            dateStr: DateFormat('MMM d').format(s.startTime),
            kwh: '${s.kwhAdded.toStringAsFixed(1)} kWh',
            cost: '—',
            location: label,
            badge: '${s.startSoc.toInt()}%→${s.endSoc.toInt()}%',
            isDark: isDark,
          );
        }).toList(),
      );
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1A1A) : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Center(
          child: Text('No sessions yet',
              style: TextStyle(
                  fontSize: 12,
                  color: VoltColors.onSurfaceVariant,
                  fontWeight: FontWeight.w600))),
    );
  }
}

class _SessionTile extends StatelessWidget {
  final String dateStr;
  final String kwh;
  final String cost;
  final String location;
  final String? badge;
  final bool isDark;
  const _SessionTile({
    required this.dateStr, required this.kwh, required this.cost,
    required this.location, this.badge, required this.isDark,
  });

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1A1A1A) : Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.06),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(dateStr,
                style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w900)),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(location,
                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w800),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
              const SizedBox(height: 2),
              Text('$kwh · $cost',
                  style: const TextStyle(
                      fontSize: 11,
                      color: VoltColors.onSurfaceVariant,
                      fontWeight: FontWeight.w600)),
              if (badge != null)
                Text(badge!,
                    style: const TextStyle(
                        fontSize: 10, color: VoltColors.primary,
                        fontWeight: FontWeight.w600)),
            ]),
          ),
          const Icon(Icons.chevron_right, color: VoltColors.onSurfaceVariant, size: 18),
        ]),
      );
}

// ============================================================================
// Shared helpers
// ============================================================================

/// Returns the symbol for a given ISO 4217 currency code.
/// Falls back to the code itself (e.g. "AUD") if not in the map.
String _currencySymbol(String? code) {
  const symbols = {
    'USD': r'$', 'CAD': r'CA$', 'AUD': r'A$', 'NZD': r'NZ$',
    'EUR': '€', 'GBP': '£', 'NOK': 'kr', 'SEK': 'kr', 'DKK': 'kr',
    'CHF': 'CHF', 'CNY': '¥', 'JPY': '¥', 'KRW': '₩',
    'SGD': r'S$', 'HKD': r'HK$', 'MXN': r'MX$',
    'BRL': r'R$', 'INR': '₹',
  };
  final c = (code ?? 'USD').toUpperCase();
  return symbols[c] ?? c;
}

class _Label extends StatelessWidget {
  final String text;
  const _Label(this.text);
  @override
  Widget build(BuildContext context) => Text(text,
      style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w900,
          letterSpacing: 1.5,
          color: VoltColors.onSurfaceVariant));
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final String action;
  final VoidCallback onAction;
  const _SectionHeader({required this.title, required this.action, required this.onAction});

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _Label(title),
          GestureDetector(
            onTap: onAction,
            child: Text(action,
                style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1,
                    color: VoltColors.primary)),
          ),
        ],
      );
}

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:voltride/features/dashboard/data/services/telemetry_analytics_service.dart';
import 'package:voltride/features/dashboard/data/services/intelligence_engine.dart';
import 'package:voltride/features/dashboard/data/models/tesla_models.dart';
import 'package:voltride/core/utils/injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:voltride/core/theme/volt_colors.dart';
import 'package:voltride/features/dashboard/presentation/bloc/vehicle_bloc.dart';

class EfficiencyPage extends StatelessWidget {
  const EfficiencyPage({super.key});

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
              title: Text(
                'DRIVE EFFICIENCY',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
        ),
      ),
      body: BlocBuilder<VehicleBloc, VehicleBlocState>(
        builder: (context, state) {
          final vehicle = state.selectedVehicle;
          if (vehicle == null) {
            return const Center(child: CircularProgressIndicator());
          }

          final analytics = di.sl<TelemetryAnalyticsService>();
          final tripHistory = state.tripHistory;

          // Is the car actively moving right now?
          final isDriving = vehicle.shiftState == 'D' || vehicle.shiftState == 'R';

          double currentDrive = 0;
          double lifetimeAvg = 0;
          bool hasHistoryData = false;

          if (tripHistory.isNotEmpty) {
            hasHistoryData = true;
            currentDrive = analytics.calculateEfficiencyWhPerMi(tripHistory.first);
            double totalWh = 0;
            double totalMi = 0;
            for (final trip in tripHistory) {
              final eff = analytics.calculateEfficiencyWhPerMi(trip);
              totalWh += eff * trip.distance;
              totalMi += trip.distance;
            }
            if (totalMi > 0) lifetimeAvg = totalWh / totalMi;
          }

          final trend = (hasHistoryData && lifetimeAvg > 0)
              ? ((currentDrive - lifetimeAvg) / lifetimeAvg * 100)
              : 0.0;

          return SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 100, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Live drive card takes priority when driving
                if (isDriving)
                  _buildLiveDriveBanner(isDark, vehicle.power, vehicle.speed, vehicle.useMiles)
                else if (!hasHistoryData)
                  _buildNoDataBanner(isDark)
                else
                  _buildComparisonRow(isDark, currentDrive, lifetimeAvg, trend),
                const SizedBox(height: 32),
                _buildSectionTitle('EFFICIENCY PER TRIP', isDark),
                const SizedBox(height: 16),
                _buildEfficiencyChart(isDark, tripHistory, analytics),
                const SizedBox(height: 32),
                _buildSectionTitle('INTELLIGENT INSIGHTS', isDark),
                const SizedBox(height: 16),
                _buildInsightsList(isDark, state.suggestions),
                const SizedBox(height: 100),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildLiveDriveBanner(bool isDark, double powerKw, double speedRaw, bool useMiles) {
    // power > 0 = consuming, < 0 = regenerating
    final isRegen = powerKw < 0;
    final absKw = powerKw.abs();

    // Live instantaneous efficiency — only meaningful when moving
    final speedUnit = useMiles ? 'mph' : 'km/h';
    final effUnit = useMiles ? 'Wh/mi' : 'Wh/km';
    String liveEffLabel;
    if (speedRaw > 2) {
      // power (kW) × 1000 / speed → Wh per distance-unit
      final liveEff = (absKw * 1000) / speedRaw;
      liveEffLabel = '${liveEff.toInt()} $effUnit';
    } else {
      liveEffLabel = isRegen ? 'Regenerating' : 'Stopped';
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isRegen
              ? [VoltColors.success.withOpacity(0.15), VoltColors.success.withOpacity(0.05)]
              : [VoltColors.primary.withOpacity(0.15), VoltColors.primary.withOpacity(0.05)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isRegen ? VoltColors.success.withOpacity(0.3) : VoltColors.primary.withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: isRegen ? VoltColors.success : VoltColors.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 6, height: 6,
                      decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      isRegen ? 'REGENERATING' : 'DRIVE IN PROGRESS',
                      style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w900, letterSpacing: 1),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _LiveStat(
                label: 'SPEED',
                value: '${speedRaw.toInt()}',
                unit: speedUnit,
                color: VoltColors.primary,
              ),
              _LiveStat(
                label: isRegen ? 'REGEN' : 'POWER',
                value: absKw.toStringAsFixed(1),
                unit: 'kW',
                color: isRegen ? VoltColors.success : VoltColors.warning,
              ),
              _LiveStat(
                label: 'LIVE EFF.',
                value: liveEffLabel.split(' ').first,
                unit: liveEffLabel.contains(' ') ? liveEffLabel.split(' ').skip(1).join(' ') : '',
                color: isRegen ? VoltColors.success : VoltColors.primary,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Trip will be saved automatically when you park.',
            style: TextStyle(fontSize: 11, color: VoltColors.onSurfaceVariant, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildNoDataBanner(bool isDark) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isDark ? VoltColors.surfaceElevatedDark : VoltColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Icon(Icons.drive_eta, size: 40, color: VoltColors.onSurfaceVariant.withOpacity(0.4)),
          const SizedBox(height: 12),
          const Text(
            'No drive sessions recorded yet',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: VoltColors.onSurfaceVariant),
          ),
          const SizedBox(height: 4),
          Text(
            'Efficiency data will appear after your first drive',
            style: TextStyle(fontSize: 12, color: VoltColors.onSurfaceVariant.withOpacity(0.7)),
          ),
        ],
      ),
    );
  }

  Widget _buildComparisonRow(bool isDark, double current, double lifetime, double trend) {
    return Row(
      children: [
        Expanded(
          child: _EfficiencyCard(
            label: 'CURRENT DRIVE',
            value: current.toInt().toString(),
            unit: 'Wh/mi',
            trend: trend,
            isDark: isDark,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _EfficiencyCard(
            label: 'LIFETIME AVG',
            value: lifetime.toInt().toString(),
            unit: 'Wh/mi',
            trend: 0,
            isDark: isDark,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title, bool isDark) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w900,
        letterSpacing: 1.5,
        color: VoltColors.onSurfaceVariant,
      ),
    );
  }

  Widget _buildEfficiencyChart(
    bool isDark,
    List<DriveSession> trips,
    TelemetryAnalyticsService analytics,
  ) {
    return Container(
      height: 220,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? VoltColors.surfaceElevatedDark : VoltColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(32),
      ),
      child: trips.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.bar_chart, size: 40, color: VoltColors.onSurfaceVariant.withOpacity(0.3)),
                  const SizedBox(height: 8),
                  Text(
                    'Drive to generate efficiency data',
                    style: TextStyle(fontSize: 11, color: VoltColors.onSurfaceVariant),
                  ),
                ],
              ),
            )
          : BarChart(
              BarChartData(
                gridData: const FlGridData(show: false),
                titlesData: FlTitlesData(
                  leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        final idx = value.toInt();
                        final label = '#${idx + 1}';
                        return Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(label, style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: VoltColors.onSurfaceVariant)),
                        );
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                barGroups: _buildBarGroups(trips, analytics),
              ),
            ),
    );
  }

  List<BarChartGroupData> _buildBarGroups(
    List<DriveSession> trips,
    TelemetryAnalyticsService analytics,
  ) {
    final recent = trips.length > 10 ? trips.sublist(0, 10) : trips;
    return recent.asMap().entries.map((e) {
      final eff = analytics.calculateEfficiencyWhPerMi(e.value);
      final color = eff < 250
          ? VoltColors.success
          : eff < 320
              ? VoltColors.warning
              : VoltColors.error;
      return BarChartGroupData(
        x: e.key,
        barRods: [
          BarChartRodData(
            toY: eff,
            color: color,
            width: 14,
            borderRadius: BorderRadius.circular(6),
          ),
        ],
      );
    }).toList();
  }

  Widget _buildInsightsList(bool isDark, List<SmartSuggestion> suggestions) {
    if (suggestions.isEmpty) {
      return Center(
        child: Text(
          'Calculating insights…',
          style: TextStyle(color: VoltColors.onSurfaceVariant, fontSize: 12),
        ),
      );
    }

    return Column(
      children: suggestions.take(3).map<Widget>((s) => _InsightTile(
            title: s.title,
            desc: s.description,
            icon: _getIconForSuggestion(s.icon),
            color: _getColorForSuggestion(s.title),
            isDark: isDark,
          )).toList(),
    );
  }

  IconData _getIconForSuggestion(String iconName) {
    switch (iconName) {
      case 'battery_charging_full':
        return Icons.bolt;
      case 'battery_saver':
        return Icons.battery_saver;
      case 'warning':
        return Icons.warning_amber;
      case 'speed':
        return Icons.speed;
      case 'wb_sunny_outlined':
        return Icons.wb_sunny_outlined;
      default:
        return Icons.insights;
    }
  }

  Color _getColorForSuggestion(String title) {
    if (title.contains('Warning')) return VoltColors.error;
    if (title.contains('Optimize')) return VoltColors.warning;
    return VoltColors.primary;
  }
}

class _EfficiencyCard extends StatelessWidget {
  final String label;
  final String value;
  final String unit;
  final double trend;
  final bool isDark;

  const _EfficiencyCard({
    required this.label,
    required this.value,
    required this.unit,
    required this.trend,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final isNegative = trend < 0; // Negative Wh/mi delta = more efficient
    final trendColor = isNegative ? VoltColors.success : VoltColors.warning;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? VoltColors.surfaceElevatedDark : VoltColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 9, fontWeight: FontWeight.w800, color: VoltColors.onSurfaceVariant),
              ),
              if (trend != 0)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  decoration: BoxDecoration(
                    color: trendColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '${isNegative ? '' : '+'}${trend.toInt()}%',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, color: trendColor),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          Text(value, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w900)),
          Text(
            unit,
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: VoltColors.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}

class _InsightTile extends StatelessWidget {
  final String title;
  final String desc;
  final IconData icon;
  final Color color;
  final bool isDark;

  const _InsightTile({
    required this.title,
    required this.desc,
    required this.icon,
    required this.color,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? VoltColors.surfaceElevatedDark : VoltColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.toUpperCase(),
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w900, letterSpacing: 1),
                ),
                const SizedBox(height: 4),
                Text(
                  desc,
                  style: TextStyle(fontSize: 13, height: 1.4, color: VoltColors.onSurfaceVariant, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LiveStat extends StatelessWidget {
  final String label;
  final String value;
  final String unit;
  final Color color;

  const _LiveStat({required this.label, required this.value, required this.unit, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: TextStyle(fontSize: 9, fontWeight: FontWeight.w800, color: VoltColors.onSurfaceVariant, letterSpacing: 1)),
        const SizedBox(height: 6),
        Text(value, style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: color, height: 1)),
        if (unit.isNotEmpty)
          Text(unit, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: VoltColors.onSurfaceVariant)),
      ],
    );
  }
}

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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'DRIVE EFFICIENCY',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900, letterSpacing: 2),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<VehicleBloc, VehicleBlocState>(
        builder: (context, state) {
          final vehicle = state.selectedVehicle;
          if (vehicle == null) {
            return const Center(child: CircularProgressIndicator());
          }

          final analytics = di.sl<TelemetryAnalyticsService>();
          final tripHistory = state.tripHistory;
          
          double currentDrive = 242.0; // Default fallback
          double lifetimeAvg = 284.0; // Default fallback
          
          if (tripHistory.isNotEmpty) {
            currentDrive = analytics.calculateEfficiencyWhPerMi(tripHistory.first);
            double totalWh = 0;
            double totalMi = 0;
            for (var trip in tripHistory) {
              totalWh += (analytics.calculateEfficiencyWhPerMi(trip) * trip.distance);
              totalMi += trip.distance;
            }
            if (totalMi > 0) {
              lifetimeAvg = totalWh / totalMi;
            }
          }

          final trend = lifetimeAvg > 0 ? ((currentDrive - lifetimeAvg) / lifetimeAvg * 100) : 0.0;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildComparisonRow(isDark, currentDrive, lifetimeAvg, trend),
                const SizedBox(height: 32),
                _buildSectionTitle('EFFICIENCY VS SPEED'),
                const SizedBox(height: 16),
                _buildScatterPlot(isDark),
                const SizedBox(height: 32),
                _buildSectionTitle('INTELLIGENT INSIGHTS'),
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
            trend: 0, // No trend for lifetime itself
            isDark: isDark,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w900, letterSpacing: 1.5, color: Colors.grey),
    );
  }

  Widget _buildScatterPlot(bool isDark) {
    return Container(
      height: 220,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(32),
      ),
      child: ScatterChart(
        ScatterChartData(
          gridData: const FlGridData(show: false),
          titlesData: const FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          scatterSpots: [
            ScatterSpot(20, 180, dotPainter: FlDotCirclePainter(color: VoltColors.primary, radius: 4)),
            ScatterSpot(30, 195, dotPainter: FlDotCirclePainter(color: VoltColors.primary, radius: 4)),
            ScatterSpot(45, 230, dotPainter: FlDotCirclePainter(color: VoltColors.primary, radius: 5)),
            ScatterSpot(55, 260, dotPainter: FlDotCirclePainter(color: VoltColors.primary, radius: 5)),
            ScatterSpot(65, 310, dotPainter: FlDotCirclePainter(color: Colors.orangeAccent, radius: 6)),
            ScatterSpot(75, 380, dotPainter: FlDotCirclePainter(color: Colors.redAccent, radius: 7)),
            ScatterSpot(80, 420, dotPainter: FlDotCirclePainter(color: Colors.redAccent, radius: 8)),
          ],
        ),
      ),
    );
  }

  Widget _buildInsightsList(bool isDark, List<SmartSuggestion> suggestions) {
    if (suggestions.isEmpty) {
      return const Center(child: Text('Calculating insights...', style: TextStyle(color: Colors.grey, fontSize: 12)));
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
      case 'battery_charging_full': return Icons.bolt;
      case 'battery_saver': return Icons.battery_saver;
      case 'warning': return Icons.warning_amber;
      case 'speed': return Icons.speed;
      case 'wb_sunny_outlined': return Icons.wb_sunny_outlined;
      default: return Icons.insights;
    }
  }

  Color _getColorForSuggestion(String title) {
    if (title.contains('Warning')) return Colors.redAccent;
    if (title.contains('Optimize')) return Colors.orangeAccent;
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
    final isNegative = trend < 0; // Negative Wh/mi is GOOD (efficiency)
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w800, color: Colors.grey)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                  color: (isNegative ? Colors.greenAccent : Colors.orangeAccent).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  '${isNegative ? '' : '+'}${trend.toInt()}%',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                    color: isNegative ? Colors.greenAccent : Colors.orangeAccent,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(value, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w900)),
          Text(unit, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: Colors.grey)),
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
        color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
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
                Text(title.toUpperCase(), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w900, letterSpacing: 1)),
                const SizedBox(height: 4),
                Text(desc, style: const TextStyle(fontSize: 13, height: 1.4, color: Colors.grey, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
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
      body: BlocBuilder<VehicleBloc, VehicleState>(
        builder: (context, state) {
          final vehicle = state.selectedVehicle;
          if (vehicle == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildComparisonRow(isDark),
                const SizedBox(height: 32),
                _buildSectionTitle('EFFICIENCY VS SPEED'),
                const SizedBox(height: 16),
                _buildScatterPlot(isDark),
                const SizedBox(height: 32),
                _buildSectionTitle('INTELLIGENT INSIGHTS'),
                const SizedBox(height: 16),
                _buildInsightsList(isDark),
                const SizedBox(height: 100),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildComparisonRow(bool isDark) {
    return Row(
      children: [
        Expanded(
          child: _EfficiencyCard(
            label: 'CURRENT DRIVE',
            value: '242',
            unit: 'Wh/mi',
            trend: -8,
            isDark: isDark,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _EfficiencyCard(
            label: 'LIFETIME AVG',
            value: '284',
            unit: 'Wh/mi',
            trend: 2,
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

  Widget _buildInsightsList(bool isDark) {
    final insights = [
      {
        'title': 'Heavy Acceleration',
        'desc': 'Your launch on Highway 101 reduced efficiency by 15% today.',
        'icon': Icons.speed,
        'color': Colors.orangeAccent,
      },
      {
        'title': 'Optimal Temperature',
        'desc': 'Mild weather contributed to 4.2% better range than last week.',
        'icon': Icons.wb_sunny_outlined,
        'color': Colors.greenAccent,
      },
      {
        'title': 'High Speed Cruise',
        'desc': 'Sustained 80mph driving used 22% more energy than 65mph.',
        'icon': Icons.trending_up,
        'color': Colors.redAccent,
      },
    ];

    return Column(
      children: insights.map((i) => _InsightTile(
        title: i['title'] as String,
        desc: i['desc'] as String,
        icon: i['icon'] as IconData,
        color: i['color'] as Color,
        isDark: isDark,
      )).toList(),
    );
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

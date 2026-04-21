import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:voltride/core/services/phantom_drain_service.dart';
import 'package:voltride/core/theme/volt_colors.dart';
import 'dart:ui';

class DrainAnalyticsPage extends StatelessWidget {
  const DrainAnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final service = PhantomDrainService();
    final history = service.getHistory(limit: 30);
    final avgRate = service.averageDrainPerHour();
    final drain24h = service.drainLast24h();

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
              title: Text('Phantom Drain',
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
            // Summary cards
            Row(
              children: [
                Expanded(
                  child: _StatCard(
                    isDark: isDark,
                    label: 'Last 24h Drain',
                    value: '${drain24h.toStringAsFixed(1)}%',
                    icon: Icons.battery_alert,
                    color: drain24h > 3 ? VoltColors.error : VoltColors.success,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _StatCard(
                    isDark: isDark,
                    label: 'Avg/Hour',
                    value: '${avgRate.toStringAsFixed(2)}%/h',
                    icon: Icons.av_timer,
                    color: avgRate > 0.5 ? VoltColors.warning : VoltColors.success,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _TipsCard(isDark: isDark, drainRate: avgRate),
            const SizedBox(height: 28),

            if (history.isNotEmpty) ...[
              _SectionLabel('DRAIN HISTORY (last 30 sessions)'),
              const SizedBox(height: 12),
              _DrainChart(isDark: isDark, history: history),
              const SizedBox(height: 24),
              _SectionLabel('SESSIONS'),
              const SizedBox(height: 12),
              ...history.map((r) => _DrainTile(isDark: isDark, record: r)),
            ] else
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(48),
                  child: Column(
                    children: [
                      Icon(Icons.battery_full, size: 64, color: VoltColors.success.withOpacity(0.4)),
                      const SizedBox(height: 16),
                      Text('No phantom drain data yet',
                          style: TextStyle(color: VoltColors.onSurfaceVariant)),
                      const SizedBox(height: 8),
                      const Text(
                        'Data is collected automatically when your\nvehicle parks and resumes.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: VoltColors.onSurfaceVariant, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
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
  Widget build(BuildContext context) => Text(text,
      style: const TextStyle(
          fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 2, color: VoltColors.outline));
}

class _StatCard extends StatelessWidget {
  final bool isDark;
  final String label;
  final String value;
  final IconData icon;
  final Color color;
  const _StatCard(
      {required this.isDark,
      required this.label,
      required this.value,
      required this.icon,
      required this.color});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDark ? VoltColors.surfaceElevatedDark : VoltColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(height: 8),
            Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: color)),
            Text(label,
                style: const TextStyle(
                    fontSize: 12, fontWeight: FontWeight.bold, color: VoltColors.onSurfaceVariant)),
          ],
        ),
      );
}

class _TipsCard extends StatelessWidget {
  final bool isDark;
  final double drainRate;
  const _TipsCard({required this.isDark, required this.drainRate});

  @override
  Widget build(BuildContext context) {
    final isHigh = drainRate > 0.5;
    final tips = isHigh
        ? [
            'Disable Sentry Mode when parked at home',
            'Enable Energy Saving mode in vehicle settings',
            'Keep the vehicle away from extreme temperatures',
            'Avoid long periods with Cabin Overheat Protection active',
          ]
        : [
            'Phantom drain is within normal range (<0.5%/h)',
            'Your battery management is efficient',
          ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: (isHigh ? VoltColors.warning : VoltColors.success).withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
            color: (isHigh ? VoltColors.warning : VoltColors.success).withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(isHigh ? Icons.warning_amber : Icons.check_circle,
                  color: isHigh ? VoltColors.warning : VoltColors.success, size: 18),
              const SizedBox(width: 8),
              Text(
                isHigh ? 'High Phantom Drain Detected' : 'Drain is Normal',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isHigh ? VoltColors.warning : VoltColors.success),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ...tips.map((t) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('• ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Expanded(child: Text(t, style: const TextStyle(fontSize: 12, height: 1.4))),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class _DrainChart extends StatelessWidget {
  final bool isDark;
  final List<PhantomDrainRecord> history;
  const _DrainChart({required this.isDark, required this.history});

  @override
  Widget build(BuildContext context) {
    final reversed = history.reversed.toList();
    final spots = reversed.asMap().entries.map((e) {
      final rate = e.value.drainPerHour ?? 0;
      return FlSpot(e.key.toDouble(), rate);
    }).toList();

    return Container(
      height: 160,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? VoltColors.surfaceElevatedDark : VoltColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(20),
      ),
      child: LineChart(
        LineChartData(
          minY: 0,
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              color: VoltColors.warning,
              barWidth: 2,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                color: VoltColors.warning.withOpacity(0.1),
              ),
            ),
          ],
          borderData: FlBorderData(show: false),
          gridData: FlGridData(
            drawVerticalLine: false,
            getDrawingHorizontalLine: (v) =>
                FlLine(color: Colors.white12, strokeWidth: 0.5),
          ),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 32,
                getTitlesWidget: (v, _) => Text('${v.toStringAsFixed(1)}%',
                    style: const TextStyle(fontSize: 9, color: VoltColors.onSurfaceVariant)),
              ),
            ),
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
        ),
      ),
    );
  }
}

class _DrainTile extends StatelessWidget {
  final bool isDark;
  final PhantomDrainRecord record;
  const _DrainTile({required this.isDark, required this.record});

  @override
  Widget build(BuildContext context) {
    final date = DateFormat('MMM d · h:mm a').format(record.parkedAt);
    final drain = record.drainPercent;
    final color = drain > 3 ? VoltColors.error : drain > 1 ? VoltColors.warning : VoltColors.success;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDark ? VoltColors.surfaceElevatedDark : VoltColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
            child: Icon(Icons.battery_alert, color: color, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(date, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                Text(
                  'Parked ${record.hoursParked.toStringAsFixed(1)}h · '
                  '${record.socAtPark}% → ${record.socAtResume ?? '?'}%',
                  style: const TextStyle(color: VoltColors.onSurfaceVariant, fontSize: 12),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('−${drain.toStringAsFixed(1)}%',
                  style: TextStyle(fontWeight: FontWeight.w800, color: color, fontSize: 16)),
              if (record.drainPerHour != null)
                Text('${record.drainPerHour!.toStringAsFixed(2)}%/h',
                    style: const TextStyle(fontSize: 11, color: VoltColors.onSurfaceVariant)),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:voltride/core/theme/volt_colors.dart';
import 'package:voltride/features/dashboard/presentation/bloc/vehicle_bloc.dart';
import 'package:voltride/features/dashboard/data/services/telemetry_analytics_service.dart';
import 'package:voltride/features/dashboard/domain/vehicle.dart';
import 'package:voltride/features/dashboard/data/models/tesla_models.dart' hide VehicleState;
import 'package:voltride/core/utils/injection_container.dart' as di;
import 'dart:math' as math;

class BatteryPage extends StatefulWidget {
  const BatteryPage({super.key});

  @override
  State<BatteryPage> createState() => _BatteryPageState();
}

class _BatteryPageState extends State<BatteryPage> {
  final _analyticsService = di.sl<TelemetryAnalyticsService>();

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
          'BATTERY HEALTH',
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
              children: [
                _buildMainGauge(vehicle),
                const SizedBox(height: 32),
                _buildHealthScoreCard(vehicle),
                const SizedBox(height: 24),
                _buildTrendSection(isDark, state.batteryHistory),
                const SizedBox(height: 24),
                _buildDegradationSection(isDark, state.batteryHistory),
                const SizedBox(height: 100), // Bottom nav padding
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildMainGauge(dynamic vehicle) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          width: 200,
          child: Stack(
            children: [
              Positioned.fill(
                child: CustomPaint(
                  painter: _CircularGaugePainter(
                    percentage: vehicle.batteryLevel / 100,
                    color: VoltColors.primary,
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${vehicle.batteryLevel}',
                      style: const TextStyle(fontSize: 48, fontWeight: FontWeight.w900, height: 1),
                    ),
                    const Text(
                      '% SOC',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          '${vehicle.batteryRange.toInt()} MI AVAILABLE',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w900, letterSpacing: 1),
        ),
      ],
    );
  }

  Widget _buildHealthScoreCard(Vehicle vehicle) {
    // Assume 310mi as factory for simplified demo logic
    // In a real app we'd get this from vehicle spec/model
    final currentMaxRange = vehicle.batteryLevel > 0 
        ? vehicle.batteryRange / (vehicle.batteryLevel / 100)
        : 310.0;
    final healthScore = _analyticsService.getHealthScore(currentMaxRange, 310.0);
    final loss = 100.0 - healthScore;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: VoltColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: VoltColors.primary.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'HEALTH SCORE',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900, letterSpacing: 1.5),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    healthScore > 90 ? 'EXCELLENT CONDITION' : 'GOOD CONDITION',
                    style: TextStyle(
                      fontSize: 10, 
                      fontWeight: FontWeight.w700, 
                      color: healthScore > 90 ? Colors.greenAccent : Colors.orangeAccent
                    ),
                  ),
                ],
              ),
              Text(
                '${healthScore.toStringAsFixed(1)}%',
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: VoltColors.primary),
              ),
            ],
          ),
          const SizedBox(height: 24),
          LinearProgressIndicator(
            value: healthScore / 100,
            backgroundColor: Colors.white10,
            valueColor: const AlwaysStoppedAnimation(VoltColors.primary),
            minHeight: 8,
            borderRadius: const BorderRadius.all(Radius.circular(4)),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildMetric('NEW', '310 MI'),
              _buildMetric('CURRENT', '${currentMaxRange.toInt()} MI'),
              _buildMetric('LOSS', '-${loss.toStringAsFixed(1)}%'),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildMetric(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w800, color: Colors.grey)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w900)),
      ],
    );
  }

  Widget _buildTrendSection(bool isDark, List<BatterySnapshot> history) {
    final dailyAverages = _analyticsService.getDailySocAverages(history);
    final sortedDates = dailyAverages.keys.toList()..sort();
    
    // Last 7 days or fill with dummy if empty
    final List<FlSpot> spots = [];
    if (sortedDates.isEmpty) {
        // Fallback to placeholder spots if no data yet
        spots.addAll([
          const FlSpot(0, 50),
          const FlSpot(6, 50),
        ]);
    } else {
        final last7 = sortedDates.length > 7 
            ? sortedDates.sublist(sortedDates.length - 7) 
            : sortedDates;
            
        for (int i = 0; i < last7.length; i++) {
            spots.add(FlSpot(i.toDouble(), dailyAverages[last7[i]]!));
        }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '7-DAY LEVEL TREND',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900, letterSpacing: 1.5, color: Colors.grey),
        ),
        const SizedBox(height: 16),
        Container(
          height: 180,
          padding: const EdgeInsets.only(top: 24, right: 16),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: LineChart(
            LineChartData(
              gridData: const FlGridData(show: false),
              titlesData: const FlTitlesData(show: false),
              borderData: FlBorderData(show: false),
              lineBarsData: [
                LineChartBarData(
                  spots: spots,
                  isCurved: true,
                  color: VoltColors.primary,
                  barWidth: 4,
                  isStrokeCapRound: true,
                  dotData: FlDotData(show: spots.length > 1),
                  belowBarData: BarAreaData(
                    show: true,
                    color: VoltColors.primary.withOpacity(0.1),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDegradationSection(bool isDark, List<BatterySnapshot> history) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'DEGRADATION TIMELINE',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900, letterSpacing: 1.5, color: Colors.grey),
        ),
        const SizedBox(height: 16),
        Container(
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: const Center(
            child: Text(
              'COLLECTING DATA...',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: Colors.white24),
            ),
          ),
        ),
      ],
    );
  }
}

class _CircularGaugePainter extends CustomPainter {
  final double percentage;
  final Color color;

  _CircularGaugePainter({required this.percentage, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    const startAngle = -math.pi / 2;
    final sweepAngle = 2 * math.pi;

    final backgroundPaint = Paint()
      ..color = Colors.white.withOpacity(0.05)
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    final progressPaint = Paint()
      ..color = color
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, backgroundPaint);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle * percentage,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

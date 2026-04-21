import 'dart:ui';
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
                'BATTERY HEALTH',
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

          return SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 100, 24, 24),
            child: Column(
              children: [
                _buildMainGauge(vehicle),
                const SizedBox(height: 32),
                _buildHealthScoreCard(vehicle),
                const SizedBox(height: 24),
                _buildTrendSection(isDark, state.batteryHistory),
                const SizedBox(height: 24),
                _buildDegradationSection(isDark, state.batteryHistory),
                const SizedBox(height: 100),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildMainGauge(Vehicle vehicle) {
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
                    Text(
                      '% SOC',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: VoltColors.onSurfaceVariant),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          '${vehicle.estBatteryRange > 0 ? vehicle.estBatteryRange.toInt() : vehicle.batteryRange.toInt()} ${vehicle.useMiles ? "MI" : "KM"} AVAILABLE',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w900, letterSpacing: 1),
        ),
      ],
    );
  }

  Widget _buildHealthScoreCard(Vehicle vehicle) {
    return BlocBuilder<VehicleBloc, VehicleBlocState>(
      builder: (context, state) {
        final originalRange = state.vehicleCache?.originalRangeRating ?? 310.0;
        final rangeUnit = vehicle.useMiles ? 'MI' : 'KM';

        final currentMaxRange = vehicle.batteryLevel > 0
            ? vehicle.batteryRange / (vehicle.batteryLevel / 100)
            : originalRange;
        final healthScore = _analyticsService.getHealthScore(currentMaxRange, originalRange);
        final loss = 100.0 - healthScore;

        final conditionColor = healthScore > 90 ? VoltColors.success : VoltColors.warning;
        final conditionLabel = healthScore > 95
            ? 'EXCELLENT CONDITION'
            : healthScore > 90
                ? 'VERY GOOD'
                : healthScore > 85
                    ? 'GOOD CONDITION'
                    : 'FAIR CONDITION';

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
                        conditionLabel,
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: conditionColor),
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
                backgroundColor: VoltColors.surfaceContainerHighest,
                valueColor: const AlwaysStoppedAnimation(VoltColors.primary),
                minHeight: 8,
                borderRadius: const BorderRadius.all(Radius.circular(4)),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildMetric('NEW', '${originalRange.toInt()} $rangeUnit'),
                  _buildMetric('CURRENT', '${currentMaxRange.toInt()} $rangeUnit'),
                  _buildMetric('LOSS', '-${loss.toStringAsFixed(1)}%'),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildMetric(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w800, color: VoltColors.onSurfaceVariant)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w900)),
      ],
    );
  }

  Widget _buildTrendSection(bool isDark, List<BatterySnapshot> history) {
    final dailyAverages = _analyticsService.getDailySocAverages(history);
    final sortedDates = dailyAverages.keys.toList()..sort((a, b) => a.compareTo(b));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '7-DAY LEVEL TREND',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900, letterSpacing: 1.5, color: VoltColors.onSurfaceVariant),
        ),
        const SizedBox(height: 16),
        Container(
          height: 180,
          padding: const EdgeInsets.only(top: 24, right: 16),
          decoration: BoxDecoration(
            color: isDark ? VoltColors.surfaceElevatedDark : VoltColors.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(24),
          ),
          child: sortedDates.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.show_chart, size: 32, color: VoltColors.onSurfaceVariant.withOpacity(0.4)),
                      const SizedBox(height: 8),
                      Text(
                        'Tracking starts after first drive',
                        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: VoltColors.onSurfaceVariant),
                      ),
                    ],
                  ),
                )
              : LineChart(
                  LineChartData(
                    gridData: const FlGridData(show: false),
                    titlesData: const FlTitlesData(show: false),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        spots: _buildSocSpots(sortedDates, dailyAverages),
                        isCurved: true,
                        color: VoltColors.primary,
                        barWidth: 4,
                        isStrokeCapRound: true,
                        dotData: const FlDotData(show: true),
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

  List<FlSpot> _buildSocSpots(List<DateTime> sortedDates, Map<DateTime, double> dailyAverages) {
    final last7 = sortedDates.length > 7
        ? sortedDates.sublist(sortedDates.length - 7)
        : sortedDates;
    return [
      for (int i = 0; i < last7.length; i++)
        FlSpot(i.toDouble(), dailyAverages[last7[i]]!),
    ];
  }

  Widget _buildDegradationSection(bool isDark, List<BatterySnapshot> history) {
    // Compute estimated max range per snapshot: range / (soc/100)
    // Filter out low-SOC readings to avoid noise (SOC < 10 gives unreliable extrapolation)
    final validSnapshots = history
        .where((s) => s.batteryLevel >= 10 && s.batteryRange > 0)
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'DEGRADATION TIMELINE',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900, letterSpacing: 1.5, color: VoltColors.onSurfaceVariant),
        ),
        const SizedBox(height: 16),
        Container(
          height: 160,
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
          decoration: BoxDecoration(
            color: isDark ? VoltColors.surfaceElevatedDark : VoltColors.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(24),
          ),
          child: validSnapshots.length < 3
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.battery_full, size: 32, color: VoltColors.onSurfaceVariant.withOpacity(0.4)),
                    const SizedBox(height: 8),
                    Text(
                      'Collecting degradation data…',
                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: VoltColors.onSurfaceVariant),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Needs more drive history to compute',
                      style: TextStyle(fontSize: 10, color: VoltColors.onSurfaceVariant.withOpacity(0.6)),
                    ),
                  ],
                )
              : _buildDegradationChart(validSnapshots),
        ),
      ],
    );
  }

  Widget _buildDegradationChart(List<BatterySnapshot> snapshots) {
    // Sample up to 20 evenly spaced snapshots for the chart
    final sampled = _sampleSnapshots(snapshots, 20);
    final spots = <FlSpot>[];
    double minRange = double.infinity;
    double maxRange = 0;

    for (int i = 0; i < sampled.length; i++) {
      final s = sampled[i];
      final estMax = s.batteryRange / (s.batteryLevel / 100);
      spots.add(FlSpot(i.toDouble(), estMax));
      if (estMax < minRange) minRange = estMax;
      if (estMax > maxRange) maxRange = estMax;
    }

    final padding = (maxRange - minRange) * 0.1 + 5;

    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: false),
        titlesData: const FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        minY: minRange - padding,
        maxY: maxRange + padding,
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            color: VoltColors.warning,
            barWidth: 2,
            isStrokeCapRound: true,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              color: VoltColors.warning.withOpacity(0.08),
            ),
          ),
        ],
      ),
    );
  }

  List<BatterySnapshot> _sampleSnapshots(List<BatterySnapshot> snapshots, int maxCount) {
    if (snapshots.length <= maxCount) return snapshots;
    final step = snapshots.length / maxCount;
    return [
      for (int i = 0; i < maxCount; i++)
        snapshots[(i * step).floor()],
    ];
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
      ..color = VoltColors.surfaceContainerHighest.withOpacity(0.3)
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voltride/features/charging/presentation/bloc/charging_bloc.dart';
import 'package:voltride/features/dashboard/presentation/bloc/vehicle_bloc.dart';
import 'package:voltride/core/theme/volt_colors.dart';
import 'package:voltride/features/dashboard/data/models/tesla_models.dart' as models;
import 'package:intl/intl.dart';
import 'dart:ui';
import 'dart:math' as math;
import 'package:fl_chart/fl_chart.dart';

class ChargingPage extends StatefulWidget {
  const ChargingPage({super.key});

  @override
  State<ChargingPage> createState() => _ChargingPageState();
}

class _ChargingPageState extends State<ChargingPage> with SingleTickerProviderStateMixin {
  late AnimationController _animController;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    
    // Fetch real history
    context.read<ChargingBloc>().add(FetchChargingHistory());
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

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
          'CHARGING INTEL',
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

          final isCharging = vehicle.state == 'charging';
          final chargingHistory = state.chargingHistory;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildStatusHero(vehicle, isCharging, isDark),
                const SizedBox(height: 32),
                _buildSectionTitle('CHARGING TRENDS'),
                const SizedBox(height: 16),
                _buildFrequencyChart(isDark, chargingHistory),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildSectionTitle('SESSION HISTORY'),
                    TextButton(
                      onPressed: () => context.read<VehicleBloc>().add(FetchHistory(vehicle.vin)),
                      child: const Text('REFRESH', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, color: VoltColors.primary)),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                _buildHistoryList(isDark, chargingHistory),
                const SizedBox(height: 100),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatusHero(dynamic vehicle, bool isCharging, bool isDark) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        children: [
          _ChargingIndicator(
            progress: vehicle.batteryLevel / 100.0,
            isCharging: isCharging,
            animation: _animController,
          ),
          const SizedBox(height: 24),
          Text(
            '${vehicle.batteryLevel}%',
            style: const TextStyle(fontSize: 48, fontWeight: FontWeight.w900),
          ),
          Text(
            isCharging ? 'CURRENTLY CHARGING' : 'READY TO CHARGE',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w900,
              letterSpacing: 2,
              color: isCharging ? Colors.greenAccent : Colors.grey,
            ),
          ),
          if (isCharging) ...[
            const SizedBox(height: 24),
            const Divider(color: Colors.white10),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildInfoRow(Icons.bolt, 'SPEED', '48A'),
                _buildInfoRow(Icons.timer_outlined, 'REMAINING', '45M'),
              ],
            ),
          ]
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 16, color: VoltColors.primary),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: Colors.grey)),
        const SizedBox(width: 8),
        Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w900)),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w900, letterSpacing: 1.5, color: Colors.grey),
    );
  }

  Widget _buildFrequencyChart(bool isDark, List<models.ChargingHistoryEntry> history) {
    final counts = List.filled(7, 0.0);
    for (final entry in history) {
        if (entry.chargeStartDateTime != null) {
          final date = DateTime.parse(entry.chargeStartDateTime!);
          counts[date.weekday % 7] += 1;
        }
    }

    return Container(
      height: 140,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: BarChart(
        BarChartData(
          gridData: const FlGridData(show: false),
          titlesData: const FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          barGroups: List.generate(7, (i) => _makeGroupData(i, counts[i])),
        ),
      ),
    );
  }

  BarChartGroupData _makeGroupData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: VoltColors.primary,
          width: 20,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(6), topRight: Radius.circular(6)),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 12,
            color: Colors.white.withOpacity(0.05),
          ),
        ),
      ],
    );
  }

  Widget _buildHistoryList(bool isDark, List<models.ChargingHistoryEntry> history) {
    if (history.isEmpty) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(32),
        child: const Center(
          child: Text('NO SESSIONS FOUND', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: Colors.grey)),
        ),
      );
    }

    return Column(
      children: history.take(10).map((s) {
        final dateStr = s.chargeStartDateTime ?? '';
        final displayDate = dateStr.isNotEmpty 
          ? DateFormat('MMM d').format(DateTime.parse(dateStr)).toUpperCase()
          : 'UNKNOWN';
        
        return _SessionTile(
          date: displayDate,
          energy: s.energyKwh.toStringAsFixed(1),
          cost: s.totalCost.toStringAsFixed(2),
          location: s.locationId ?? 'Tesla Station',
          isDark: isDark,
        );
      }).toList(),
    );
  }
}

class _ChargingIndicator extends StatelessWidget {
  final double progress;
  final bool isCharging;
  final Animation<double> animation;

  const _ChargingIndicator({
    required this.progress,
    required this.isCharging,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Container(
          width: 80,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white24, width: 2),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: 116 * progress,
                child: Container(
                  decoration: BoxDecoration(
                    color: isCharging 
                      ? Colors.greenAccent.withOpacity(animation.value * 0.5 + 0.3)
                      : VoltColors.primary.withOpacity(0.6),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                ),
              ),
              if (isCharging)
                const Center(
                  child: Icon(Icons.bolt, color: Colors.white, size: 40),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _SessionTile extends StatelessWidget {
  final String date;
  final String energy;
  final String cost;
  final String location;
  final bool isDark;

  const _SessionTile({
    required this.date,
    required this.energy,
    required this.cost,
    required this.location,
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
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(date, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w900)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(location, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w900)),
                const SizedBox(height: 4),
                Text('$energy kWh · $cost USD', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: Colors.grey)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.grey, size: 20),
        ],
      ),
    );
  }
}

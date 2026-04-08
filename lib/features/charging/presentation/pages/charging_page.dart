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
import 'charging_history_page.dart';

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
    
    // Initial fetch for charging-specific data
    context.read<ChargingBloc>().add(const FetchChargingHistory(refresh: true));
    context.read<ChargingBloc>().add(FetchBusinessSessions());
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
      body: MultiBlocListener(
        listeners: [
          BlocListener<ChargingBloc, ChargingState>(
            listener: (context, state) {
              if (state.error != null) {
                // We show business session errors as a note, not a disruptive snackbar
                // unless it's a critical fetch error.
              }
            },
          ),
        ],
        child: BlocBuilder<VehicleBloc, VehicleBlocState>(
          builder: (context, vehicleState) {
            final vehicle = vehicleState.selectedVehicle;
            if (vehicle == null) {
              return const Center(child: CircularProgressIndicator(color: VoltColors.primary));
            }

            final isCharging = vehicle.state == 'charging';

            return BlocBuilder<ChargingBloc, ChargingState>(
              builder: (context, chargingState) {
                return RefreshIndicator(
                  onRefresh: () async {
                    context.read<ChargingBloc>().add(const FetchChargingHistory(refresh: true));
                    if (vehicleState.selectedVehicle != null) {
                        context.read<VehicleBloc>().add(FetchHistory(vehicleState.selectedVehicle!.vin));
                    }
                  },
                  color: VoltColors.primary,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildStatusHero(vehicle, isCharging, isDark),
                        const SizedBox(height: 32),
                        
                        if (chargingState.businessSessions.isNotEmpty) ...[
                          _buildSectionTitle('BUSINESS FLEET SESSIONS'),
                          const SizedBox(height: 16),
                          _buildBusinessSessionsList(isDark, chargingState.businessSessions),
                          const SizedBox(height: 32),
                        ],

                        _buildSectionTitle('CHARGING TRENDS'),
                        const SizedBox(height: 16),
                        _buildFrequencyChart(isDark, chargingState.history),
                        const SizedBox(height: 32),
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildSectionTitle('SESSION HISTORY'),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const ChargingHistoryPage()),
                                );
                              },
                              child: const Text('VIEW FULL', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, color: VoltColors.primary)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        _buildHistoryList(isDark, chargingState.history, chargingState.isLoading),
                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
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
            progress: (vehicle.batteryLevel ?? 0) / 100.0,
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
                _buildInfoRow(Icons.bolt, 'SPEED', '${vehicle.chargeRate ?? 0} mi/hr'),
                _buildInfoRow(Icons.timer_outlined, 'REMAINING', '${vehicle.timeToFullCharge ?? 0}m'),
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
          final date = DateTime.tryParse(entry.chargeStartDateTime!);
          if (date != null) {
            counts[date.weekday % 7] += 1;
          }
        }
    }

    // Determine max for scaling
    double maxVal = 1.0;
    for (var c in counts) { if (c > maxVal) maxVal = c; }

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
          barGroups: List.generate(7, (i) => _makeGroupData(i, counts[i], maxVal + 1)),
        ),
      ),
    );
  }

  BarChartGroupData _makeGroupData(int x, double y, double maxY) {
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
            toY: maxY,
            color: Colors.white.withOpacity(0.05),
          ),
        ),
      ],
    );
  }

  Widget _buildHistoryList(bool isDark, List<models.ChargingHistoryEntry> history, bool isLoading) {
    if (isLoading && history.isEmpty) {
      return const Center(child: Padding(
        padding: EdgeInsets.all(32.0),
        child: CircularProgressIndicator(color: VoltColors.primary),
      ));
    }

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
      children: history.take(5).map((s) {
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
          onTap: () {
            // maybe show detail?
          },
        );
      }).toList(),
    );
  }

  Widget _buildBusinessSessionsList(bool isDark, List<models.ChargingSessionInfo> sessions) {
    return Column(
      children: sessions.take(3).map((s) {
        final start = s.startDateTime != null ? DateTime.tryParse(s.startDateTime!) : null;
        final date = start != null ? DateFormat('MMM d').format(start).toUpperCase() : 'N/A';
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isDark ? VoltColors.primary.withOpacity(0.05) : Colors.blue.withOpacity(0.05),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: VoltColors.primary.withOpacity(0.1)),
          ),
          child: Row(
            children: [
              const Icon(Icons.business_center, color: VoltColors.primary, size: 20),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Fleet Session: $date', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w900)),
                    Text('${s.energyKwh.toStringAsFixed(1)} kWh delivered', style: const TextStyle(fontSize: 10, color: Colors.grey)),
                  ],
                ),
              ),
              Text('\$${s.totalCost.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold, color: VoltColors.primary)),
            ],
          ),
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
                bottom: 2,
                left: 2,
                right: 2,
                height: math.max(0, 112 * progress),
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
  final VoidCallback? onTap;

  const _SessionTile({
    required this.date,
    required this.energy,
    required this.cost,
    required this.location,
    required this.isDark,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
                  Text(location, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w900), overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 4),
                  Text('$energy kWh · $cost USD', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: Colors.grey)),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey, size: 20),
          ],
        ),
      ),
    );
  }
}

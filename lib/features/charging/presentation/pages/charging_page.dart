import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voltride/features/charging/presentation/bloc/charging_bloc.dart';
import 'package:voltride/features/dashboard/presentation/bloc/vehicle_bloc.dart';
import 'package:voltride/core/theme/volt_colors.dart';
import 'package:voltride/features/dashboard/data/models/tesla_models.dart' as models;
import 'package:intl/intl.dart';
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

    // Fetch Tesla API charging history (Supercharger sessions for fleet accounts)
    context.read<ChargingBloc>().add(const FetchChargingHistory(refresh: true));
    context.read<ChargingBloc>().add(FetchBusinessSessions());

    // Local Hive sessions are loaded once we have the VIN from VehicleBloc.
    // They are loaded in the build method via the first VehicleBloc state emission.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final vin = context.read<VehicleBloc>().state.selectedVehicle?.vin;
      if (vin != null && vin.isNotEmpty) {
        context.read<ChargingBloc>().add(LoadLocalSessions(vin));
      }
    });
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
                'CHARGING INTEL',
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

            final isCharging = vehicle.chargingState == 'Charging';

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
                    padding: const EdgeInsets.fromLTRB(24, 100, 24, 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildStatusHero(vehicle, isCharging, isDark),
                        const SizedBox(height: 16),
                        _buildChargeControls(context, vehicle, isDark),
                        const SizedBox(height: 16),
                        _buildScheduledChargingCard(context, vehicle, isDark),
                        const SizedBox(height: 16),

                        if (chargingState.businessSessions.isNotEmpty) ...[
                          _buildSectionTitle('BUSINESS FLEET SESSIONS'),
                          const SizedBox(height: 16),
                          _buildBusinessSessionsList(isDark, chargingState.businessSessions),
                          const SizedBox(height: 32),
                        ],

                        _buildSectionTitle('CHARGING TRENDS'),
                        const SizedBox(height: 16),
                        _buildFrequencyChart(isDark, chargingState.history, chargingState.localSessions),
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
                        _buildCombinedHistoryList(isDark, chargingState.history, chargingState.localSessions, chargingState.isLoading),
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
    // Format time remaining: hours → "Xh Ym"
    String formatTimeRemaining(double hours) {
      if (hours <= 0) return '0m';
      final h = hours.toInt();
      final m = ((hours - h) * 60).toInt();
      if (h > 0) return '${h}h ${m}m';
      return '${m}m';
    }

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
            isCharging ? 'CURRENTLY CHARGING' : 
            vehicle.chargingState == 'Complete' ? 'CHARGE COMPLETE' :
            vehicle.chargingState == 'Stopped' ? 'CHARGING STOPPED' :
            'READY TO CHARGE',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w900,
              letterSpacing: 2,
              color: isCharging ? VoltColors.success :
                     vehicle.chargingState == 'Complete' ? VoltColors.info : VoltColors.onSurfaceVariant,
            ),
          ),
          if (isCharging) ...[
            const SizedBox(height: 24),
            const Divider(color: Colors.white10),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildInfoRow(Icons.bolt, 'POWER', '${vehicle.chargerPower.toInt()} kW'),
                _buildInfoRow(Icons.timer_outlined, 'REMAINING', formatTimeRemaining(vehicle.timeToFullCharge)),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildInfoRow(Icons.battery_charging_full, 'ADDED', '${vehicle.chargeEnergyAdded.toStringAsFixed(1)} kWh'),
                _buildInfoRow(Icons.speed, 'RATE', '${vehicle.chargeRate.toInt()} ${vehicle.useMiles ? "mi" : "km"}/hr'),
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
        Text(label, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: VoltColors.onSurfaceVariant)),
        const SizedBox(width: 8),
        Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w900)),
      ],
    );
  }

  Widget _buildChargeControls(BuildContext context, dynamic vehicle, bool isDark) {
    final isChargePortLoading = context.read<VehicleBloc>().state.loadingCommands
        .contains('${vehicle.id}_chargeport');
    final portOpen = vehicle.chargePortOpen as bool? ?? false;
    final isCharging = vehicle.chargingState == 'Charging';

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          // Charge Port Button
          Expanded(
            child: GestureDetector(
              onTap: isChargePortLoading
                  ? null
                  : () {
                      if (portOpen) {
                        context.read<VehicleBloc>().add(CloseChargePort(vehicle.id as String));
                      } else {
                        context.read<VehicleBloc>().add(OpenChargePort(vehicle.id as String));
                      }
                    },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: portOpen ? VoltColors.primary.withOpacity(0.1) : (isDark ? Colors.white10 : Colors.black.withOpacity(0.04)),
                  borderRadius: BorderRadius.circular(16),
                  border: portOpen ? Border.all(color: VoltColors.primary.withOpacity(0.3)) : null,
                ),
                child: Column(
                  children: [
                    isChargePortLoading
                        ? const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(strokeWidth: 2, color: VoltColors.primary))
                        : Icon(
                            portOpen ? Icons.electrical_services : Icons.ev_station,
                            color: portOpen ? VoltColors.primary : VoltColors.onSurfaceVariant,
                            size: 22,
                          ),
                    const SizedBox(height: 6),
                    Text(
                      portOpen ? 'CLOSE PORT' : 'OPEN PORT',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1,
                        color: portOpen ? VoltColors.primary : VoltColors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Start / Stop Charging Button
          Expanded(
            child: GestureDetector(
              onTap: () {
                context.read<VehicleBloc>().add(ToggleCharging(vehicle.id as String, !isCharging));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: isCharging ? VoltColors.error.withOpacity(0.1) : VoltColors.success.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isCharging ? VoltColors.error.withOpacity(0.3) : VoltColors.success.withOpacity(0.3),
                  ),
                ),
                child: Column(
                  children: [
                    Icon(
                      isCharging ? Icons.stop_circle_outlined : Icons.play_circle_outline,
                      color: isCharging ? VoltColors.error : VoltColors.success,
                      size: 22,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      isCharging ? 'STOP' : 'START',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1,
                        color: isCharging ? VoltColors.error : VoltColors.success,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScheduledChargingCard(BuildContext context, dynamic vehicle, bool isDark) {
    final scheduledMode = vehicle.scheduledChargingMode as String?;
    final isScheduled = scheduledMode != null && scheduledMode != 'Off' && scheduledMode.isNotEmpty;
    final startTime = vehicle.scheduledChargingStartTime as int?;

    String scheduleLabel = 'Set a time to start charging automatically.';
    if (isScheduled && startTime != null) {
      final dt = DateTime.fromMillisecondsSinceEpoch(startTime * 1000);
      scheduleLabel = 'Scheduled: ${DateFormat('h:mm a').format(dt)}  ·  $scheduledMode';
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isScheduled ? VoltColors.primary.withOpacity(0.1) : (isDark ? Colors.white10 : Colors.black.withOpacity(0.04)),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.schedule, color: isScheduled ? VoltColors.primary : VoltColors.onSurfaceVariant, size: 18),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Scheduled Charging', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800)),
                const SizedBox(height: 2),
                Text(scheduleLabel, style: const TextStyle(fontSize: 10, color: VoltColors.onSurfaceVariant, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          Switch(
            value: isScheduled,
            onChanged: (val) {
              context.read<VehicleBloc>().add(SetScheduledCharging(vehicle.id as String, val));
            },
            activeThumbColor: VoltColors.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w900, letterSpacing: 1.5, color: VoltColors.onSurfaceVariant),
    );
  }

  Widget _buildFrequencyChart(bool isDark, List<models.ChargingHistoryEntry> history, List<models.ChargeSession> localSessions) {
    final counts = List.filled(7, 0.0);
    // Count from API history
    for (final entry in history) {
      if (entry.chargeStartDateTime != null) {
        final date = DateTime.tryParse(entry.chargeStartDateTime!);
        if (date != null) counts[date.weekday % 7] += 1;
      }
    }
    // Count from local sessions (de-duplicate by not double counting API history)
    if (history.isEmpty) {
      for (final s in localSessions) {
        counts[s.startTime.weekday % 7] += 1;
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

  Widget _buildCombinedHistoryList(
    bool isDark,
    List<models.ChargingHistoryEntry> apiHistory,
    List<models.ChargeSession> localSessions,
    bool isLoading,
  ) {
    if (isLoading && apiHistory.isEmpty && localSessions.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: CircularProgressIndicator(color: VoltColors.primary),
        ),
      );
    }

    // Prefer API history when available; fall back to local Hive sessions.
    if (apiHistory.isNotEmpty) {
      return Column(
        children: apiHistory.take(5).map((s) {
          final dateStr = s.chargeStartDateTime ?? '';
          final displayDate = dateStr.isNotEmpty
              ? DateFormat('MMM d').format(DateTime.parse(dateStr)).toUpperCase()
              : 'UNKNOWN';
          return _SessionTile(
            date: displayDate,
            energy: s.energyKwh.toStringAsFixed(1),
            cost: s.totalCost.toStringAsFixed(2),
            location: s.locationId ?? 'Tesla Supercharger',
            isDark: isDark,
          );
        }).toList(),
      );
    }

    if (localSessions.isNotEmpty) {
      return Column(
        children: localSessions.take(5).map((s) {
          final displayDate = DateFormat('MMM d').format(s.startTime).toUpperCase();
          final chargerLabel = s.fastChargerType != null && s.fastChargerType!.isNotEmpty
              ? s.fastChargerType!
              : s.chargerPower > 50 ? 'DC Fast Charge' : 'Level 2 AC';
          return _SessionTile(
            date: displayDate,
            energy: s.kwhAdded.toStringAsFixed(1),
            cost: '—',
            location: chargerLabel,
            isDark: isDark,
            badge: '${s.startSoc.toInt()}% → ${s.endSoc.toInt()}%',
          );
        }).toList(),
      );
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      child: const Center(
        child: Text(
          'NO SESSIONS YET\nSessions appear here after your first charge',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: VoltColors.onSurfaceVariant, height: 1.8),
        ),
      ),
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
            color: VoltColors.primary.withOpacity(0.05),
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
                    Text('${s.energyKwh.toStringAsFixed(1)} kWh delivered', style: const TextStyle(fontSize: 10, color: VoltColors.onSurfaceVariant)),
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
                      ? VoltColors.success.withOpacity(animation.value * 0.5 + 0.3)
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
  final String? badge; // e.g. "20% → 80%"

  const _SessionTile({
    required this.date,
    required this.energy,
    required this.cost,
    required this.location,
    required this.isDark,
    this.onTap,
    this.badge,
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
                  Text(
                    cost == '—' ? '$energy kWh' : '$energy kWh · \$$cost',
                    style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: VoltColors.onSurfaceVariant),
                  ),
                  if (badge != null) ...[
                    const SizedBox(height: 2),
                    Text(badge!, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: VoltColors.primary)),
                  ],
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: VoltColors.onSurfaceVariant, size: 20),
          ],
        ),
      ),
    );
  }
}

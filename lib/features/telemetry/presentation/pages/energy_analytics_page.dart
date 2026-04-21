import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voltride/core/theme/volt_colors.dart';
import 'package:voltride/features/dashboard/presentation/bloc/vehicle_bloc.dart';
import 'package:voltride/features/dashboard/data/services/telemetry_analytics_service.dart';
import 'package:voltride/features/telemetry/data/repositories/charge_session_repository.dart';
import 'package:voltride/features/dashboard/data/models/tesla_models.dart' show ChargeSession;
import 'package:voltride/core/utils/injection_container.dart' as di;
import 'dart:ui';

class EnergyAnalyticsPage extends StatelessWidget {
  const EnergyAnalyticsPage({super.key});

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
              centerTitle: false,
              title: Text(
                'Energy & Charging',
                style: theme.textTheme.headlineLarge?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
              ),
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {},
                color: isDark ? Colors.white70 : Colors.black87,
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.notifications_none),
                  onPressed: () {},
                  color: isDark ? Colors.white70 : Colors.black87,
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
        ),
      ),
      body: BlocBuilder<VehicleBloc, VehicleBlocState>(
        builder: (context, state) {
          final vehicle = state.selectedVehicle;
          if (vehicle == null) return const Center(child: CircularProgressIndicator());

          final analytics = di.sl<TelemetryAnalyticsService>();
          final referenceRange = state.vehicleCache?.originalRangeRating ?? 310.0;
          final currentMaxRange = vehicle.batteryLevel > 0
              ? vehicle.batteryRange / (vehicle.batteryLevel / 100)
              : referenceRange;
          final healthScore = analytics.getHealthScore(currentMaxRange, referenceRange);

          return SingleChildScrollView(
            padding: const EdgeInsets.only(top: 100, left: 24, right: 24, bottom: 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Bento-like Grid for Top Analytics
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left Column: Main Stats
                    Expanded(
                      flex: 4,
                      child: Column(
                        children: [
                          _RangeCard(batteryLevel: vehicle.batteryLevel.toDouble(), range: vehicle.batteryRange.toInt()),
                          const SizedBox(height: 16),
                          _BatteryHealthCard(health: healthScore.toInt(), comparison: '${(100 - healthScore).toStringAsFixed(1)}% degradation'),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Right Column: Charging Curve (on tablet it would be wider, on mobile we might stack)
                    // For now, let's stack or keep a 60/40 split if possible.
                    // Actually, on mobile, a vertical stack is better for readability.
                  ],
                ),
                
                const SizedBox(height: 16),
                FutureBuilder<ChargeSession?>(
                  future: di.sl<ChargeSessionRepository>().getLastSession(vehicle.vin),
                  builder: (context, snap) {
                    final session = snap.data;
                    final livePower = vehicle.chargerPower > 0 ? vehicle.chargerPower : null;
                    // Active charging: show live kW; otherwise show last session curve
                    final peakPower = livePower?.toInt()
                        ?? (session != null && session.powerCurve.isNotEmpty
                            ? session.powerCurve.reduce((a, b) => a > b ? a : b).toInt()
                            : (state.vehicleCache?.batteryCapacityKwh != null
                                ? (state.vehicleCache!.batteryCapacityKwh! > 90 ? 250 : 170)
                                : 170));
                    final chargerType = _resolveChargerType(
                      vehicle.chargingState == 'Charging'
                          ? vehicle.fastChargerType
                          : session?.fastChargerType,
                      vehicle.chargerPower > 0 ? vehicle.chargerPower : (session?.chargerPower ?? 0),
                    );
                    final powerCurve = vehicle.chargingState == 'Charging'
                        ? null  // live session not yet complete
                        : session?.powerCurve;
                    final socCurve = vehicle.chargingState == 'Charging'
                        ? null
                        : session?.socCurve;
                    return _ChargingCurveCard(
                      peakPower: peakPower,
                      chargerType: chargerType,
                      powerCurve: powerCurve,
                      socCurve: socCurve,
                    );
                  },
                ),
                const SizedBox(height: 24),
                
                Text(
                  'EFFICIENCY LOGS',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: VoltColors.outline,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                
                if (state.tripHistory.isEmpty)
                   const Center(
                     child: Padding(
                       padding: EdgeInsets.symmetric(vertical: 32),
                       child: Text('No driving sessions recorded yet.', style: TextStyle(color: VoltColors.onSurfaceVariant)),
                     ),
                   )
                else
                  ...state.tripHistory.map((trip) {
                    // Trip distance is stored in miles (Tesla API odometer is in miles)
                    final distanceMi = trip.distance;
                    final efficiencyWhPerMi = distanceMi > 0 ? (trip.energyUsedKwh / distanceMi * 1000) : 0.0;
                    // Convert to km if user prefers metric
                    final displayDistance = vehicle.useMiles ? distanceMi : distanceMi * 1.60934;
                    final distanceStr = vehicle.useMiles
                        ? '${distanceMi.toStringAsFixed(1)} mi'
                        : '${displayDistance.toStringAsFixed(1)} km';
                    final efficiencyStr = vehicle.useMiles
                        ? '${efficiencyWhPerMi.toInt()} Wh/mi'
                        : '${(efficiencyWhPerMi / 1.60934).toInt()} Wh/km';
                    final durationStr = '${trip.endTime.difference(trip.startTime).inMinutes} mins';
                    final isEfficient = efficiencyWhPerMi < 250;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _EfficiencyLogItem(
                        icon: Icons.commute,
                        title: 'Driving Session',
                        subtitle: '$distanceStr • $durationStr',
                        value: efficiencyStr,
                        trend: isEfficient ? 'EXCELLENT' : 'NORMAL',
                        isPositive: isEfficient,
                      ),
                    );
                  }),

                const SizedBox(height: 32),

                // Hero Branding Section
                _AnalyticsHero(),
              ],
            ),
          );
        },
      ),
    );
  }
}

/// Map Tesla API fastChargerType + chargerPower to a human-readable label.
String _resolveChargerType(String? fastChargerType, double chargerPower) {
  if (fastChargerType == null || fastChargerType.isEmpty) {
    if (chargerPower > 100) return 'DC Fast Charge';
    if (chargerPower > 0) return 'AC Level 2';
    return 'No Charger';
  }
  switch (fastChargerType) {
    case 'SuC':
      return chargerPower >= 200 ? 'Supercharging V3' : 'Supercharging V2';
    case 'MaxCharger':
      return 'Supercharging V3';
    case 'ACSingleWireCAN':
    case 'SAE':
      return 'AC Level 2';
    case 'CCS':
    case 'CCS2':
      return 'CCS DC Fast Charge';
    case 'CHAdeMO':
      return 'CHAdeMO DC';
    default:
      return fastChargerType;
  }
}

class _RangeCard extends StatelessWidget {
  final double batteryLevel;
  final int range;

  const _RangeCard({required this.batteryLevel, required this.range});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isDark ? VoltColors.surfaceElevatedDark : VoltColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Text(
            'CURRENT RANGE',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
              color: VoltColors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 20),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 140,
                height: 140,
                child: CircularProgressIndicator(
                  value: batteryLevel / 100,
                  strokeWidth: 8,
                  backgroundColor: isDark ? Colors.white10 : Colors.black12,
                  valueColor: const AlwaysStoppedAnimation<Color>(VoltColors.primary),
                  strokeCap: StrokeCap.round,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${batteryLevel.toInt()}%',
                    style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w800, letterSpacing: -1),
                  ),
                  Text(
                    '$range mi',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: VoltColors.onSurfaceVariant),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 8, height: 8, decoration: const BoxDecoration(color: VoltColors.primary, shape: BoxShape.circle)),
              const SizedBox(width: 8),
              const Text('Optimal Health', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
            ],
          )
        ],
      ),
    );
  }
}

class _BatteryHealthCard extends StatelessWidget {
  final int health;
  final String comparison;

  const _BatteryHealthCard({required this.health, required this.comparison});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(24),
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
              const Text('BATTERY HEALTH', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.5, color: VoltColors.onSurfaceVariant)),
              const Icon(Icons.verified_user, color: VoltColors.primary, size: 16),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text('$health%', style: theme.textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w800)),
              const SizedBox(width: 8),
              Text(comparison, style: theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold, color: VoltColors.primary)),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: health / 100,
              minHeight: 4,
              backgroundColor: isDark ? Colors.white10 : Colors.black12,
              valueColor: const AlwaysStoppedAnimation<Color>(VoltColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChargingCurveCard extends StatelessWidget {
  final int peakPower;
  final String chargerType;
  final List<double>? powerCurve;
  final List<double>? socCurve;

  const _ChargingCurveCard({
    required this.peakPower,
    this.chargerType = 'Supercharging',
    this.powerCurve,
    this.socCurve,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(24),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('LAST SESSION CURVE', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.5, color: VoltColors.onSurfaceVariant)),
                  Text(chargerType, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('$peakPower kW', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: VoltColors.primary)),
                  const Text('Peak Velocity', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: VoltColors.onSurfaceVariant)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),
          // Power curve — real data only; show placeholder if not yet available
          SizedBox(
            height: 120,
            child: powerCurve != null && powerCurve!.isNotEmpty
                ? _buildRealCurve(powerCurve!, peakPower)
                : _buildNoCurveState(),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ['0%', '25%', '50%', '75%', '100%'].map((e) => Text(e, style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: VoltColors.onSurfaceVariant))).toList(),
          )
        ],
      ),
    );
  }

  Widget _buildRealCurve(List<double> curve, int peak) {
    final maxPower = peak.toDouble().clamp(1.0, double.infinity);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: curve.map((kw) {
        final factor = (kw / maxPower).clamp(0.05, 1.0);
        return Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 1),
            height: 100 * factor,
            decoration: BoxDecoration(
              color: VoltColors.primary.withValues(alpha: (factor * 0.8 + 0.2).clamp(0.0, 1.0)),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildNoCurveState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.bolt_outlined, size: 32, color: VoltColors.onSurfaceVariant.withOpacity(0.3)),
        const SizedBox(height: 8),
        Text(
          'Curve captured after next charge session',
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: VoltColors.onSurfaceVariant),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _EfficiencyLogItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String value;
  final String trend;
  final bool isPositive;

  const _EfficiencyLogItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.trend,
    required this.isPositive,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? VoltColors.surfaceElevatedDark : VoltColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isDark ? VoltColors.backgroundDark : VoltColors.surfaceContainerLow,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: VoltColors.onSurfaceVariant, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                Text(subtitle, style: TextStyle(fontSize: 11, color: VoltColors.onSurfaceVariant, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800)),
              Row(
                children: [
                  Icon(isPositive ? Icons.trending_down : Icons.trending_flat, color: isPositive ? VoltColors.primary : VoltColors.onSurfaceVariant, size: 12),
                  const SizedBox(width: 4),
                  Text(trend, style: TextStyle(fontSize: 9, fontWeight: FontWeight.w800, color: isPositive ? VoltColors.primary : VoltColors.onSurfaceVariant)),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _AnalyticsHero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: const DecorationImage(
          image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuAP1Jv0djE_vvCiVhjb5iqjzzXPk-hFTfkvE_tvqqy62LWN8H1yqDcG4FK0LWPM7bzXxcIOj8Yqo777WCWiTbzURDdzf-88Rm7IH8qM1UwwP4FZ6RbEQQL9916FqvxtFPOpHDNznzOWiEp3JU1rZ1Yh2ojDktC3S7W9Ir1GV_LrG8hBpf9lSSXoXWU9fu6fSzdI3IT8aEfxiRNG7xtG4kQVJBXBljifgQoC6MFUpH3I1AplwCw7uv2YlBdR6afygPg4_fYDJOBxlzTf'),
          fit: BoxFit.cover,
        )
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.8),
                  Colors.black.withOpacity(0.2),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'INTELLIGENCE PREVIEW',
                  style: TextStyle(color: VoltColors.primary, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 2),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Predictive Range\nbased on Weather.',
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800, height: 1.1),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Advanced neural networks consider wind and elevation.',
                  style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: VoltColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: const Text('EXPLORE PREDICTIONS', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voltride/core/theme/volt_colors.dart';
import 'dart:ui';
import 'dart:math' as math;
import 'package:voltride/core/utils/injection_container.dart' as di;
import 'package:voltride/features/dashboard/data/services/telemetry_analytics_service.dart';
import 'package:voltride/features/dashboard/data/services/intelligence_engine.dart';
import 'package:voltride/features/dashboard/domain/vehicle.dart';
import 'package:voltride/features/dashboard/presentation/bloc/vehicle_bloc.dart';
import 'package:voltride/features/dashboard/data/models/tesla_models.dart' as models;
import 'package:voltride/core/utils/unit_converter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    context.read<VehicleBloc>().add(StartPolling());
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    context.read<VehicleBloc>().add(StopPolling());
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      context.read<VehicleBloc>().add(StartPolling());
    } else {
      context.read<VehicleBloc>().add(StopPolling());
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(context, isDark),
      body: BlocBuilder<VehicleBloc, VehicleBlocState>(
        builder: (context, state) {
          if (state.status == VehicleStatus.error) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, color: Colors.red, size: 60),
                  const SizedBox(height: 16),
                  Text('Failed to sync: ${state.error}', style: const TextStyle(color: Colors.red)),
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: () => context.read<VehicleBloc>().add(FetchVehicles()),
                    child: const Text('RETRY'),
                  ),
                ],
              ),
            );
          }

          final vehicle = state.selectedVehicle;
          if (vehicle == null) {
            if (state.status == VehicleStatus.loading) {
               return const Center(child: CircularProgressIndicator(color: VoltColors.primary));
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   const Icon(Icons.no_crash_outlined, size: 60, color: Colors.grey),
                   const SizedBox(height: 16),
                   const Text('No vehicles found in this account.', style: TextStyle(color: Colors.grey)),
                   const SizedBox(height: 24),
                   FilledButton(
                     onPressed: () => context.read<VehicleBloc>().add(FetchVehicles()),
                     child: const Text('RELOAD'),
                   ),
                ],
              ),
            );
          }

          final analytics = di.sl<TelemetryAnalyticsService>();

          return SingleChildScrollView(
            padding: const EdgeInsets.only(top: 120, left: 24, right: 24, bottom: 140),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildVehicleHeader(vehicle),
                const SizedBox(height: 24),
                _buildSuggestionBanner(vehicle),
                const SizedBox(height: 24),
                _MainStatusCard(
                  vehicle: vehicle,
                  batteryLevel: vehicle.batteryLevel.toDouble(),
                  range: vehicle.batteryRange.toInt(),
                  isCharging: vehicle.state == 'charging',
                  efficiencyScore: analytics.calculateEfficiencyScoreToday(state.batteryHistory, specs: state.vehicleCache),
                ),
                const SizedBox(height: 32),
                _buildInsightsHub(context, state),
                const SizedBox(height: 32),
                _buildSectionTitle(context, 'DRIVE SUMMARY', 'TODAY'),
                const SizedBox(height: 16),
                _statsGrid(vehicle, analytics, state),
                const SizedBox(height: 32),
                _buildSectionTitle(context, 'QUICK CONTROLS', 'ACTIVE'),
                const SizedBox(height: 16),
                _quickControls(context, state),
                const SizedBox(height: 40),
                _buildStatusFooter(vehicle),
              ],
            ),
          );
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, bool isDark) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(72),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: AppBar(
            backgroundColor: isDark 
              ? Colors.black.withOpacity(0.4) 
              : Colors.white.withOpacity(0.6),
            elevation: 0,
            title: BlocBuilder<VehicleBloc, VehicleBlocState>(
              builder: (context, state) {
                final selectedVehicle = state.selectedVehicle;
                final allVehicles = state.vehicles;

                return PopupMenuButton<String>(
                  offset: const Offset(0, 40),
                  onSelected: (vin) {
                    context.read<VehicleBloc>().add(SelectVehicle(vin));
                  },
                  itemBuilder: (context) => allVehicles.map((v) => PopupMenuItem<String>(
                    value: v.vin,
                    child: Row(
                      children: [
                        Icon(
                          Icons.directions_car_filled,
                          size: 18,
                          color: v.vin == selectedVehicle?.vin ? VoltColors.primary : Colors.grey,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          v.displayName ?? 'Tesla',
                          style: TextStyle(
                            color: v.vin == selectedVehicle?.vin ? VoltColors.primary : null,
                            fontWeight: v.vin == selectedVehicle?.vin ? FontWeight.bold : null,
                          ),
                        ),
                      ],
                    ),
                  )).toList(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: VoltColors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Text(
                              selectedVehicle?.displayName?.toUpperCase() ?? 'VOLTRIDE',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 2.0,
                                color: VoltColors.primary,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(Icons.keyboard_arrow_down, size: 16, color: VoltColors.primary),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications_none_outlined, size: 20),
                onPressed: () {},
              ),
              const SizedBox(width: 8),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVehicleHeader(dynamic vehicle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          vehicle.displayName?.toUpperCase() ?? 'MODEL 3',
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w900,
            letterSpacing: -1,
            height: 1,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: vehicle.state == 'online' ? Colors.greenAccent : Colors.orangeAccent,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: (vehicle.state == 'online' ? Colors.greenAccent : Colors.orangeAccent).withOpacity(0.4),
                    blurRadius: 8,
                    spreadRadius: 2,
                  )
                ],
              ),
            ),
            const SizedBox(width: 8),
            Text(
              vehicle.state?.toUpperCase() ?? 'DISCONNECTED',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.5,
                color: Colors.grey.shade500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title, String badge) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.5,
            color: Colors.grey,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: VoltColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            badge,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w900,
              color: VoltColors.primary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _statsGrid(Vehicle vehicle, TelemetryAnalyticsService analytics, VehicleBlocState state) {
    // Check if we actually have data for today in trip history
    final hasTripsToday = state.tripHistory.any((s) {
      final today = DateTime.now();
      return s.startTime.year == today.year && s.startTime.month == today.month && s.startTime.day == today.day;
    });

    // We still use batteryHistory for Vampire Drain as it's a real-time SOC-based calc
    final hasBatteryDataToday = state.batteryHistory.any((s) {
      final today = DateTime.now();
      return s.timestamp.year == today.year && s.timestamp.month == today.month && s.timestamp.day == today.day;
    });

    return Row(
      children: [
        Expanded(
          child: _StatTile(
            label: 'ENERGY',
            value: analytics.calculateEnergyUsedTodayFromTrips(state.tripHistory).toStringAsFixed(1),
            unit: 'kWh',
            icon: Icons.bolt_outlined,
            isCalculating: !hasTripsToday && state.status == VehicleStatus.loading,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _StatTile(
            label: 'DISTANCE',
            value: UnitConverter.formatDistance(
              analytics.calculateMilesDrivenTodayFromTrips(state.tripHistory), 
              useMiles: vehicle.useMiles
            ).split(' ')[0],
            unit: vehicle.useMiles ? 'mi' : 'km',
            icon: Icons.straighten_outlined,
            isCalculating: !hasTripsToday && state.status == VehicleStatus.loading,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _StatTile(
            label: 'VAMP DRAIN',
            value: analytics.calculateVampireDrain(state.batteryHistory, 24).toStringAsFixed(1),
            unit: '%',
            icon: Icons.nights_stay_outlined,
            isCalculating: !hasBatteryDataToday && state.status == VehicleStatus.loading,
          ),
        ),
      ],
    );
  }

  Widget _buildSuggestionBanner(Vehicle vehicle) {
    return BlocBuilder<VehicleBloc, VehicleBlocState>(
      builder: (context, state) {
        if (state.suggestions.isEmpty) return const SizedBox.shrink();

        // Show the priority suggestion (for now, just the first one)
        final suggestion = state.suggestions.first;
        final color = _getSuggestionColor(suggestion.title);
        final icon = _getSuggestionIcon(suggestion.icon);

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: color.withOpacity(0.2)),
          ),
          child: Row(
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      suggestion.title.toUpperCase(),
                      style: TextStyle(
                        color: color,
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      suggestion.description,
                      style: TextStyle(
                        color: color.withOpacity(0.8),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              if (suggestion.isActionable)
                TextButton(
                  onPressed: () {
                    // Logic to handle actions like "Set to 100%"
                    if (suggestion.actionLabel == 'Set to 100%') {
                      context.read<VehicleBloc>().add(SetChargeLimit(vehicle.id, 100));
                    } else if (suggestion.actionLabel == 'Set to 80%') {
                      context.read<VehicleBloc>().add(SetChargeLimit(vehicle.id, 80));
                    }
                  },
                  child: Text(
                    suggestion.actionLabel ?? 'ACTION',
                    style: TextStyle(color: color, fontWeight: FontWeight.bold),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Color _getSuggestionColor(String title) {
    if (title.contains('Warning') || title.contains('Low')) return Colors.redAccent;
    if (title.contains('Optimize') || title.contains('Calibration')) return Colors.orangeAccent;
    return VoltColors.primary;
  }

  IconData _getSuggestionIcon(String iconName) {
    switch (iconName) {
      case 'battery_charging_full': return Icons.battery_charging_full;
      case 'battery_saver': return Icons.battery_saver;
      case 'warning': return Icons.warning_amber;
      case 'verified': return Icons.verified_user_outlined;
      case 'tire_repair': return Icons.tire_repair;
      case 'visibility': return Icons.visibility_outlined;
      default: return Icons.info_outline;
    }
  }

  Widget _buildInsightsHub(BuildContext context, VehicleBlocState state) {
    final analytics = di.sl<TelemetryAnalyticsService>();
    
    // Only show if we have specs and at least one snapshot
    if (state.vehicleCache == null || state.batteryHistory.isEmpty) {
      return const SizedBox.shrink();
    }

    final report = analytics.generateBatteryHealthReport(state.vehicleCache!, state.batteryHistory.first);
    final healthGrade = report['grade'] as String? ?? 'N/A';
    final degradation = report['degradation'] as double? ?? 0.0;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(context, 'VEHICLE INSIGHTS', 'LIVE'),
        const SizedBox(height: 16),
        SizedBox(
          height: 140,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              // Battery Health Card
              _InsightCard(
                title: 'HEALTH GRADE',
                value: healthGrade,
                subtitle: '${degradation.toStringAsFixed(1)}% Degradation',
                icon: Icons.health_and_safety_outlined,
                color: _getGradeColor(healthGrade),
              ),
              const SizedBox(width: 16),
              // Warranty Card
              if (state.vehicleCache?.warrantyExpiryDate != null)
                _InsightCard(
                  title: 'WARRANTY EXPIRY',
                  value: state.vehicleCache!.warrantyExpiryDate!.year.toString(),
                  subtitle: '${state.vehicleCache!.warrantyExpiryDate!.difference(DateTime.now()).inDays ~/ 365} Years Left',
                  icon: Icons.shield_outlined,
                  color: Colors.blueAccent,
                ),
              const SizedBox(width: 16),
              // Battery Type Spec Card
              _InsightCard(
                title: 'BATTERY TYPE',
                value: state.vehicleCache?.batteryType?.toUpperCase() ?? 'NCA',
                subtitle: state.vehicleCache?.batteryType == 'LFP' ? 'Charge to 100%' : 'Charge to 80%',
                icon: Icons.settings_suggest_outlined,
                color: Colors.purpleAccent,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Color _getGradeColor(String grade) {
    switch (grade) {
      case 'A': return Colors.greenAccent;
      case 'B': return Colors.lightGreenAccent;
      case 'C': return Colors.orangeAccent;
      default: return Colors.redAccent;
    }
  }

  Widget _quickControls(BuildContext context, VehicleBlocState state) {
    final vehicle = state.selectedVehicle!;
    final isLocked = vehicle.isLocked;
    final isClimateOn = vehicle.isClimateOn;
    final driverTemp = vehicle.driverTemp ?? 21.0;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Premium Lock Toggle Card
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: VoltColors.primary.withOpacity(0.05),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: VoltColors.primary.withOpacity(0.1)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                   Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isLocked ? VoltColors.primary.withOpacity(0.1) : Colors.green.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isLocked ? Icons.lock_outline : Icons.lock_open_outlined,
                      color: isLocked ? VoltColors.primary : Colors.green,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isLocked ? 'VEHICLE LOCKED' : 'VEHICLE UNLOCKED',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1,
                        ),
                      ),
                      Text(
                        isLocked ? 'Tap to unlock' : 'Tap to lock',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey.withOpacity(0.7),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Switch.adaptive(
                value: !isLocked,
                activeColor: Colors.green,
                onChanged: (val) {
                   context.read<VehicleBloc>().add(ToggleLock(vehicle.id, !val));
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        
        // Climate Card with Temperature Slider
        _buildSectionTitle(context, 'CLIMATE CONTROL', isClimateOn ? 'ACTIVE' : 'OFF'),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark 
                ? const Color(0xFF1E1E1E) 
                : Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 20,
                offset: const Offset(0, 10),
              )
            ],
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
                        'TARGET TEMP',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.5,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        UnitConverter.formatTemperature(driverTemp, useFahrenheit: vehicle.useFahrenheit),
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  _ControlCircle(
                    icon: Icons.power_settings_new,
                    label: isClimateOn ? 'STOP' : 'START',
                    isActive: isClimateOn,
                    onTap: () => context.read<VehicleBloc>().add(ToggleClimate(vehicle.id, !isClimateOn)),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Temperature Slider Bar
              Row(
                children: [
                  const Icon(Icons.ac_unit, size: 16, color: Colors.blueAccent),
                  Expanded(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 12,
                        activeTrackColor: Colors.blueAccent,
                        inactiveTrackColor: Colors.grey.withOpacity(0.1),
                        thumbColor: Colors.white,
                        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
                        overlayColor: Colors.blueAccent.withOpacity(0.2),
                      ),
                      child: Slider(
                        value: driverTemp.clamp(15.0, 28.0),
                        min: 15.0,
                        max: 28.0,
                        divisions: 26, // 0.5 deg steps
                        onChanged: (val) {
                          // Note: Visual update only maybe? 
                          // The Bloc will handle the final commit.
                        },
                        onChangeEnd: (val) {
                           context.read<VehicleBloc>().add(SetTemperature(vehicle.id, val));
                        },
                      ),
                    ),
                  ),
                  const Icon(Icons.wb_sunny, size: 16, color: Colors.orangeAccent),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        
        // Minor Controls
        Row(
          children: [
            Expanded(
              child: _ControlCircle(
                icon: Icons.flash_on_outlined,
                label: 'FLASH',
                isActive: false,
                onTap: () => context.read<VehicleBloc>().add(FlashLights(vehicle.id)),
              ),
            ),
            Expanded(
              child: _ControlCircle(
                icon: Icons.campaign_outlined,
                label: 'HONK',
                isActive: false,
                onTap: () => context.read<VehicleBloc>().add(HonkHorn(vehicle.id)),
              ),
            ),
            Expanded(
              child: _ControlCircle(
                icon: Icons.minor_crash_outlined,
                label: 'SENTRY',
                isActive: vehicle.isSentryModeOn,
                onTap: () => context.read<VehicleBloc>().add(ToggleSentryMode(vehicle.id, !vehicle.isSentryModeOn)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatusFooter(dynamic vehicle) {
    return Center(
      child: Column(
        children: [
          Text(
            'LAST UPDATED: JUST NOW',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.0,
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'ODOMETER: ${UnitConverter.formatDistance(vehicle.odometer, useMiles: vehicle.useMiles, precision: 0).toUpperCase()}',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.0,
              color: Colors.grey.withOpacity(0.3),
            ),
          ),
        ],
      ),
    );
  }
}

class _MainStatusCard extends StatelessWidget {
  final Vehicle vehicle;
  final double batteryLevel;
  final int range;
  final bool isCharging;
  final double efficiencyScore;

  const _MainStatusCard({
    required this.vehicle,
    required this.batteryLevel,
    required this.range,
    required this.isCharging,
    required this.efficiencyScore,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: 380,
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1A1A) : Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 30,
            offset: const Offset(0, 15),
          )
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Background Glow
          Positioned(
            top: 60,
            left: 40,
            right: 40,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: VoltColors.primary.withOpacity(0.15),
                    blurRadius: 80,
                    spreadRadius: 20,
                  )
                ],
              ),
            ),
          ),

          // Arc Gauge
          Positioned.fill(
            top: 40,
            child: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: 280,
                height: 280,
                child: CustomPaint(
                  painter: _ArcPainter(
                    percentage: batteryLevel / 100,
                    color: VoltColors.primary,
                  ),
                ),
              ),
            ),
          ),

          // Vehicle Image (Model 3)
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: Center(
              child: Image.network(
                'https://static-assets.tesla.com/v1/compositor/?model=m3&view=STUD_3QTR&size=1440&bkba=1&options=MDL3,PPSW,PRM31,W39B,MT322&version=v0028d202111111626',
                height: 180,
                fit: BoxFit.contain,
                errorBuilder: (c, e, s) => const Icon(Icons.directions_car, size: 100, color: Colors.grey),
              ),
            ),
          ),

          // SOC Display
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '${batteryLevel.toInt()}',
                      style: const TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.w900,
                        height: 1,
                      ),
                    ),
                    const Text(
                      '%',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  '${UnitConverter.formatDistance(range.toDouble(), useMiles: vehicle.useMiles, precision: 0).toUpperCase()} ESTIMATED',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 2,
                    color: Colors.grey.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),

          // Efficiency Score Badge
          Positioned(
            top: 30,
            right: 30,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.greenAccent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.greenAccent.withOpacity(0.2)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.bolt, color: Colors.greenAccent, size: 14),
                  const SizedBox(width: 4),
                  Text(
                    efficiencyScore.toInt().toString(),
                    style: const TextStyle(
                      color: Colors.greenAccent,
                      fontWeight: FontWeight.w900,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ArcPainter extends CustomPainter {
  final double percentage;
  final Color color;

  _ArcPainter({required this.percentage, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    const startAngle = 0.75 * math.pi;
    const sweepAngle = 1.5 * math.pi;

    final backgroundPaint = Paint()
      ..color = Colors.grey.withOpacity(0.1)
      ..strokeWidth = 12
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final progressPaint = Paint()
      ..color = color
      ..strokeWidth = 12
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Draw background track
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      backgroundPaint,
    );

    // Draw progress
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

class _StatTile extends StatelessWidget {
  final String label;
  final String value;
  final String unit;
  final IconData icon;
  final bool isCalculating;

  const _StatTile({
    required this.label,
    required this.value,
    required this.unit,
    required this.icon,
    this.isCalculating = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF252525) : Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isDark ? Colors.white.withOpacity(0.05) : Colors.grey.withOpacity(0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: VoltColors.primary),
          const SizedBox(height: 12),
          Text(
            isCalculating ? 'CALC...' : value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            unit.toUpperCase(),
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w800,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w900,
              letterSpacing: 1,
              color: Colors.grey.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
}

class _ControlCircle extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _ControlCircle({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: isActive 
                ? VoltColors.primary 
                : (isDark ? const Color(0xFF252525) : Colors.white),
              shape: BoxShape.circle,
              border: Border.all(
                color: isActive 
                  ? VoltColors.primary 
                  : (isDark ? Colors.white.withOpacity(0.05) : Colors.grey.withOpacity(0.1)),
              ),
              boxShadow: isActive ? [
                BoxShadow(
                  color: VoltColors.primary.withOpacity(0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                )
              ] : null,
            ),
            child: Icon(
              icon,
              color: isActive ? Colors.white : (isDark ? Colors.white70 : Colors.black87),
              size: 28,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w900,
              letterSpacing: 1,
              color: isActive ? VoltColors.primary : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
class _InsightCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final IconData icon;
  final Color color;

  const _InsightCard({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: 160,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF252525) : Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isDark ? Colors.white.withOpacity(0.05) : Colors.grey.withOpacity(0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, size: 20, color: color),
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey.withOpacity(0.8),
                ),
              ),
            ],
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w900,
              letterSpacing: 1,
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}

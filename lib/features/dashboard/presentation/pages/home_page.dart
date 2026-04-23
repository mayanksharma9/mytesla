import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:voltride/core/theme/volt_colors.dart';
import 'dart:ui';
import 'dart:math' as math;
import 'package:voltride/core/utils/injection_container.dart' as di;
import 'package:voltride/features/dashboard/data/services/telemetry_analytics_service.dart';
import 'package:voltride/features/dashboard/domain/vehicle.dart';
import 'package:voltride/features/dashboard/presentation/bloc/vehicle_bloc.dart';
import 'package:voltride/core/utils/unit_converter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Fetch latest data and start periodic polling every time the home page opens.
    // Lifecycle (foreground wake) is handled globally by _LifecycleWatcher in main.dart.
    final bloc = context.read<VehicleBloc>();
    bloc.add(FetchVehicles());
    bloc.add(StartPolling());
  }

  @override
  void dispose() {
    // Do NOT stop polling here — we want data to stay fresh even when the user
    // navigates to other pages (battery, charging, climate, etc.).
    super.dispose();
  }

  void _handleCommandError(BuildContext context, String error) {
    _showCommandError(context, error);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(context, isDark),
      body: BlocConsumer<VehicleBloc, VehicleBlocState>(
        listenWhen: (prev, curr) =>
            curr.commandError != null && curr.commandError != prev.commandError,
        listener: (context, state) => _handleCommandError(context, state.commandError!),
        builder: (context, state) {
          if (state.status == VehicleStatus.error) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, color: VoltColors.error, size: 60),
                  const SizedBox(height: 16),
                  Text('Failed to sync: ${state.error}', style: const TextStyle(color: VoltColors.error)),
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
                   const Icon(Icons.no_crash_outlined, size: 60, color: VoltColors.onSurfaceVariant),
                   const SizedBox(height: 16),
                   const Text('No vehicles found in this account.', style: TextStyle(color: VoltColors.onSurfaceVariant)),
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
                  isCharging: vehicle.chargingState == 'Charging',
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
                const SizedBox(height: 32),
                _SoftwareUpdateBanner(vehicle: vehicle, state: state),
                _RecentAlertsBanner(vehicle: vehicle, state: state),
                const SizedBox(height: 40),
                _buildStatusFooter(vehicle, state.lastSyncTime),
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
                          color: v.vin == selectedVehicle?.vin ? VoltColors.primary : VoltColors.onSurfaceVariant,
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
                color: vehicle.state == 'online' ? VoltColors.success : VoltColors.warning,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: (vehicle.state == 'online' ? VoltColors.success : VoltColors.warning).withOpacity(0.4),
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
                color: VoltColors.onSurfaceVariant,
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
            color: VoltColors.onSurfaceVariant,
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
    if (title.contains('Warning') || title.contains('Low')) return VoltColors.error;
    if (title.contains('Optimize') || title.contains('Calibration')) return VoltColors.warning;
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
                  color: VoltColors.info,
                ),
              const SizedBox(width: 16),
              // Battery Type Spec Card
              _InsightCard(
                title: 'BATTERY TYPE',
                value: state.vehicleCache?.batteryType?.toUpperCase() ?? 'NCA',
                subtitle: state.vehicleCache?.batteryType == 'LFP' ? 'Charge to 100%' : 'Charge to 80%',
                icon: Icons.settings_suggest_outlined,
                color: VoltColors.tertiary,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Color _getGradeColor(String grade) {
    switch (grade) {
      case 'A': return VoltColors.success;
      case 'B': return VoltColors.success;
      case 'C': return VoltColors.warning;
      default: return VoltColors.error;
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
                      color: isLocked ? VoltColors.primary.withOpacity(0.1) : VoltColors.success.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isLocked ? Icons.lock_outline : Icons.lock_open_outlined,
                      color: isLocked ? VoltColors.primary : VoltColors.success,
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
                          color: VoltColors.onSurfaceVariant.withOpacity(0.7),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Switch.adaptive(
                value: !isLocked,
                activeColor: VoltColors.success,
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
                          color: VoltColors.onSurfaceVariant,
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
                        activeTrackColor: VoltColors.info,
                        inactiveTrackColor: VoltColors.onSurfaceVariant.withOpacity(0.1),
                        thumbColor: Colors.white,
                        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
                        overlayColor: VoltColors.info.withOpacity(0.2),
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

  Widget _buildStatusFooter(dynamic vehicle, DateTime? lastSyncTime) {
    String syncLabel;
    if (lastSyncTime == null) {
      syncLabel = 'NEVER SYNCED';
    } else {
      final diff = DateTime.now().difference(lastSyncTime);
      if (diff.inSeconds < 60) {
        syncLabel = 'JUST NOW';
      } else if (diff.inMinutes < 60) {
        syncLabel = '${diff.inMinutes}M AGO';
      } else {
        syncLabel = '${diff.inHours}H AGO';
      }
    }

    return Center(
      child: Column(
        children: [
          Text(
            'LAST UPDATED: $syncLabel',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.0,
              color: VoltColors.onSurfaceVariant.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'ODOMETER: ${UnitConverter.formatDistance(vehicle.odometer, useMiles: vehicle.useMiles, precision: 0).toUpperCase()}',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.0,
              color: VoltColors.onSurfaceVariant.withOpacity(0.3),
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

          // Vehicle Image — built from VIN + option codes
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: Center(
              child: Image.network(
                _buildVehicleImageUrl(vehicle),
                height: 180,
                fit: BoxFit.contain,
                errorBuilder: (c, e, s) => const Icon(Icons.directions_car, size: 100, color: VoltColors.onSurfaceVariant),
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
                        color: VoltColors.onSurfaceVariant,
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
                    color: VoltColors.onSurfaceVariant.withOpacity(0.8),
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
                color: VoltColors.success.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: VoltColors.success.withOpacity(0.2)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.bolt, color: VoltColors.success, size: 14),
                  const SizedBox(width: 4),
                  Text(
                    efficiencyScore.toInt().toString(),
                    style: const TextStyle(
                      color: VoltColors.success,
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

// ============================================================================
// Software Update Banner
// ============================================================================
class _SoftwareUpdateBanner extends StatelessWidget {
  final Vehicle vehicle;
  final VehicleBlocState state;
  const _SoftwareUpdateBanner({required this.vehicle, required this.state});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final hasUpdate = vehicle.softwareUpdateStatus == 'available' ||
        vehicle.softwareUpdateStatus == 'downloading';
    final isInstalling = vehicle.softwareUpdateStatus == 'installing';

    if (vehicle.softwareUpdateStatus == null || vehicle.softwareUpdateStatus!.isEmpty) {
      return const SizedBox.shrink();
    }

    final isLoading =
        state.loadingCommands.contains('${vehicle.id}_sw_update');

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1A1A1A) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isInstalling ? VoltColors.primary.withValues(alpha: 0.3) : VoltColors.warning.withValues(alpha: 0.3),
          ),
        ),
        child: Row(children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: (isInstalling ? VoltColors.primary : VoltColors.warning).withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              isInstalling ? Icons.system_update : Icons.system_update_alt,
              color: isInstalling ? VoltColors.primary : VoltColors.warning,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              isInstalling ? 'INSTALLING UPDATE' : 'SOFTWARE UPDATE AVAILABLE',
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 1.5),
            ),
            if (vehicle.softwareUpdateVersion != null) ...[
              const SizedBox(height: 2),
              Text(
                vehicle.softwareUpdateVersion!,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: VoltColors.primary),
              ),
            ],
            if (isInstalling && vehicle.softwareUpdateProgress > 0) ...[
              const SizedBox(height: 8),
              LinearProgressIndicator(
                value: vehicle.softwareUpdateProgress / 100,
                color: VoltColors.primary,
                backgroundColor: Colors.white10,
              ),
            ],
          ])),
          if (hasUpdate && !isInstalling) ...[
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: isLoading ? null : () {
                context.read<VehicleBloc>().add(ScheduleSoftwareUpdate(vehicle.id, 300));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: VoltColors.warning,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: isLoading
                  ? const SizedBox(width: 16, height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black))
                  : const Text('SCHEDULE', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900)),
            ),
          ],
        ]),
      ),
      const SizedBox(height: 16),
    ]);
  }
}

// ============================================================================
// Recent Alerts Banner
// ============================================================================
class _RecentAlertsBanner extends StatelessWidget {
  final Vehicle vehicle;
  final VehicleBlocState state;
  const _RecentAlertsBanner({required this.vehicle, required this.state});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final alerts = state.recentAlerts;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const Text('VEHICLE ALERTS',
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 2, color: VoltColors.outline)),
        TextButton(
          onPressed: () =>
              context.read<VehicleBloc>().add(FetchRecentAlerts(vehicle.vin)),
          style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero),
          child: const Text('REFRESH',
              style: TextStyle(fontSize: 9, fontWeight: FontWeight.w800, letterSpacing: 1, color: VoltColors.primary)),
        ),
      ]),
      const SizedBox(height: 8),
      if (alerts.isEmpty)
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1A1A1A) : Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Row(children: [
            Icon(Icons.check_circle_outline, color: VoltColors.success, size: 18),
            SizedBox(width: 10),
            Text('No recent alerts', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
          ]),
        )
      else
        ...alerts.take(3).map((alert) {
          final name = alert['name'] as String? ?? 'Alert';
          final audience = alert['audience'] as List?;
          final isDriver = audience?.contains('Driver') ?? true;
          return Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF1A1A1A) : Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: VoltColors.warning.withValues(alpha: 0.3)),
            ),
            child: Row(children: [
              Icon(isDriver ? Icons.warning_amber_rounded : Icons.info_outline,
                  color: VoltColors.warning, size: 18),
              const SizedBox(width: 10),
              Expanded(child: Text(name,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  maxLines: 2, overflow: TextOverflow.ellipsis)),
            ]),
          );
        }),
      const SizedBox(height: 16),
    ]);
  }
}

/// Resolve the Tesla compositor model code from the VIN.
/// VIN position 4 (index 3) encodes the model for Tesla vehicles.
String _buildVehicleImageUrl(Vehicle vehicle) {
  final vin = vehicle.vin;
  String model = 'm3'; // default fallback
  if (vin.length >= 8) {
    final modelChar = vin[3].toUpperCase();
    switch (modelChar) {
      case 'S': model = 'ms'; break;
      case 'X': model = 'mx'; break;
      case '3': model = 'm3'; break;
      case 'Y': model = 'my'; break;
      case 'C': model = 'ct'; break; // Cybertruck
    }
  }
  // Use actual option codes if available, else generic defaults per model
  final options = vehicle.optionCodes;
  if (options != null && options.isNotEmpty) {
    return 'https://static-assets.tesla.com/v1/compositor/?model=$model&view=STUD_3QTR&size=1440&bkba=1&options=${Uri.encodeComponent(options)}';
  }
  // Fallback per model with neutral color options
  switch (model) {
    case 'ms': return 'https://static-assets.tesla.com/v1/compositor/?model=ms&view=STUD_3QTR&size=1440&bkba=1&options=MDLS,PBSB,PMSS';
    case 'mx': return 'https://static-assets.tesla.com/v1/compositor/?model=mx&view=STUD_3QTR&size=1440&bkba=1&options=MDLX,PBSB,PMSS';
    case 'my': return 'https://static-assets.tesla.com/v1/compositor/?model=my&view=STUD_3QTR&size=1440&bkba=1&options=MDLY,PBSB,PMSS';
    case 'ct': return 'https://static-assets.tesla.com/v1/compositor/?model=ct&view=STUD_3QTR&size=1440&bkba=1&options=MDLCT';
    default:   return 'https://static-assets.tesla.com/v1/compositor/?model=m3&view=STUD_3QTR&size=1440&bkba=1&options=MDL3,PPSW,PRM31,W39B,MT322';
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
      ..color = VoltColors.onSurfaceVariant.withOpacity(0.1)
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
          color: isDark ? Colors.white.withOpacity(0.05) : VoltColors.onSurfaceVariant.withOpacity(0.1),
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
              color: VoltColors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w900,
              letterSpacing: 1,
              color: VoltColors.onSurfaceVariant.withOpacity(0.6),
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
                  : (isDark ? Colors.white.withOpacity(0.05) : VoltColors.onSurfaceVariant.withOpacity(0.1)),
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
              color: isActive ? VoltColors.primary : VoltColors.onSurfaceVariant,
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
          color: isDark ? Colors.white.withOpacity(0.05) : VoltColors.onSurfaceVariant.withOpacity(0.1),
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
                  color: VoltColors.onSurfaceVariant.withOpacity(0.8),
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
              color: VoltColors.onSurfaceVariant.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}

/// Bottom sheet shown when a command is rejected because the virtual key for
/// this app is not registered with the vehicle.
/// Central command-error dispatcher — call from any page's BlocListener.
void showCommandError(BuildContext context, String error) =>
    _showCommandError(context, error);

void _showCommandError(BuildContext context, String error) {
  if (error == 'VIRTUAL_KEY_NOT_ADDED') {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const VirtualKeySheet(),
    );
  } else if (error == 'PROXY_KEY_MISMATCH') {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const ProxyKeyMismatchSheet(),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(error),
        backgroundColor: VoltColors.error,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

// ============================================================================
// Proxy Key Mismatch Sheet
// ============================================================================
class ProxyKeyMismatchSheet extends StatelessWidget {
  const ProxyKeyMismatchSheet({super.key});

  static const _keyUrl = 'https://tesla.com/_ak/thedevelopersharma.com';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(24, 20, 24, 24 + bottomPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40, height: 4,
              decoration: BoxDecoration(
                color: theme.colorScheme.outlineVariant,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            const Icon(Icons.sync_problem_rounded, size: 44, color: VoltColors.warning),
            const SizedBox(height: 10),
            Text('Command Signing Key Mismatch',
                style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
                textAlign: TextAlign.center),
            const SizedBox(height: 8),
            Text(
              'Your vehicle is rejecting commands because the proxy server\'s signing key doesn\'t match the virtual key registered on the vehicle.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            ),
            const SizedBox(height: 16),
            // Root cause box
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: VoltColors.warning.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: VoltColors.warning.withValues(alpha: 0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    const Icon(Icons.info_outline_rounded, size: 16, color: VoltColors.warning),
                    const SizedBox(width: 6),
                    Text('If re-adding still doesn\'t fix it:',
                        style: theme.textTheme.labelMedium?.copyWith(
                            color: VoltColors.warning, fontWeight: FontWeight.w700)),
                  ]),
                  const SizedBox(height: 6),
                  Text(
                    'The proxy server (Cloud Run) may be running multiple instances, each with a different in-memory signing key. '
                    'The fix is server-side: the proxy private key must be stored in Google Secret Manager so all instances share the same key.',
                    style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _Step(number: '1', text: 'Open the Tesla app → tap your car → Security → Third-Party Apps → find VoltRide and tap Remove.'),
            const SizedBox(height: 8),
            _Step(number: '2', text: 'Tap the button below to re-add the virtual key with the proxy\'s current signing key.'),
            const SizedBox(height: 8),
            _Step(number: '3', text: 'Return here and retry the command. If it still fails, the proxy server needs to be redeployed with a persistent key.'),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: () => launchUrl(Uri.parse(_keyUrl), mode: LaunchMode.externalApplication),
              icon: const Icon(Icons.key_rounded, size: 18),
              label: const Text('Re-add Virtual Key'),
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
                backgroundColor: VoltColors.warning,
                foregroundColor: Colors.black,
              ),
            ),
            const SizedBox(height: 6),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Dismiss'),
            ),
          ],
        ),
      ),
    );
  }
}

class VirtualKeySheet extends StatelessWidget {
  const VirtualKeySheet({super.key});

  static const _keyUrl = 'https://tesla.com/_ak/thedevelopersharma.com';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(24, 20, 24, 24 + bottomPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: 40, height: 4,
                decoration: BoxDecoration(
                  color: theme.colorScheme.outlineVariant,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Center(child: Icon(Icons.key_off_rounded, size: 44, color: VoltColors.error)),
            const SizedBox(height: 10),
            Text(
              'Vehicle Command Rejected',
              style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            Text(
              'Your vehicle rejected the command. This happens when the VoltRide virtual key is not registered on your vehicle, or the proxy\'s signing key doesn\'t match.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            ),
            const SizedBox(height: 20),

            // Step 1 — check if key exists
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF1E1E1E) : const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('STEP 1 — Check if key is already added',
                      style: theme.textTheme.labelSmall?.copyWith(
                          letterSpacing: 1.5, fontWeight: FontWeight.w800, color: VoltColors.outline)),
                  const SizedBox(height: 8),
                  Text(
                    'In the Tesla app: tap your profile photo → Security → Keys.\n'
                    'Look for "VoltRide" or "thedevelopersharma.com".',
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Step 2 — add key
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF1E1E1E) : const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('STEP 2 — Add (or re-add) the virtual key',
                      style: theme.textTheme.labelSmall?.copyWith(
                          letterSpacing: 1.5, fontWeight: FontWeight.w800, color: VoltColors.outline)),
                  const SizedBox(height: 8),
                  Text(
                    'If the key is NOT in the list, tap the button below. The Tesla website will guide you to open the Tesla app and tap your car to register the key.\n\n'
                    'If the key IS already listed, remove it first (tap → Delete), then add it again using the button below.',
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            FilledButton.icon(
              onPressed: () => launchUrl(Uri.parse(_keyUrl), mode: LaunchMode.externalApplication),
              icon: const Icon(Icons.open_in_new_rounded, size: 18),
              label: const Text('Add Virtual Key'),
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
                backgroundColor: VoltColors.primary,
              ),
            ),

            const SizedBox(height: 16),

            // Proxy key mismatch note
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: VoltColors.warning.withValues(alpha: 0.07),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: VoltColors.warning.withValues(alpha: 0.25)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    const Icon(Icons.warning_amber_rounded, size: 15, color: VoltColors.warning),
                    const SizedBox(width: 6),
                    Text('Still failing after re-adding?',
                        style: theme.textTheme.labelSmall?.copyWith(
                            color: VoltColors.warning, fontWeight: FontWeight.w800, letterSpacing: 1)),
                  ]),
                  const SizedBox(height: 6),
                  Text(
                    'The proxy server\'s signing key doesn\'t match the public key at thedevelopersharma.com. '
                    'This is a server-side issue — the proxy must be redeployed with the private key that '
                    'corresponds to the domain\'s public key, stored persistently (e.g. Google Secret Manager).',
                    style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Dismiss'),
            ),
          ],
        ),
      ),
    );
  }
}

class _Step extends StatelessWidget {
  final String number;
  final String text;
  const _Step({required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: VoltColors.primary.withValues(alpha: 0.15),
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            number,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: VoltColors.primary),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(text, style: theme.textTheme.bodyMedium),
        ),
      ],
    );
  }
}

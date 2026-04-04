import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/volt_colors.dart';
import '../../../dashboard/presentation/bloc/vehicle_bloc.dart';
import 'dart:ui';

class ClimatePage extends StatelessWidget {
  const ClimatePage({super.key});

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
                'Climate & Controls',
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
      body: BlocBuilder<VehicleBloc, VehicleState>(
        builder: (context, vehicleState) {
          final vehicle = vehicleState.selectedVehicle;
          if (vehicle == null) {
            return const Center(child: CircularProgressIndicator(color: VoltColors.primary));
          }

          final insideTemp = vehicle.insideTemp;

          return SingleChildScrollView(
            padding: const EdgeInsets.only(top: 100, left: 24, right: 24, bottom: 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Climate Centerpiece
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
                  decoration: BoxDecoration(
                    color: isDark ? VoltColors.surfaceContainer : VoltColors.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.02),
                        blurRadius: 40,
                        offset: const Offset(0, 20),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        'INTERIOR TEMPERATURE',
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: VoltColors.outline,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${insideTemp.toInt()}',
                            style: theme.textTheme.headlineLarge?.copyWith(
                              fontSize: 80,
                              fontWeight: FontWeight.w800,
                              height: 1,
                              color: isDark ? Colors.white : Colors.black87,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 4),
                            child: Text(
                              '°F',
                              style: theme.textTheme.headlineMedium?.copyWith(
                                color: VoltColors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      
                      // Slider visual
                      Row(
                        children: [
                          const Text('60°F', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: VoltColors.outline)),
                          Expanded(
                            child: SliderTheme(
                              data: SliderThemeData(
                                trackHeight: 6,
                                activeTrackColor: VoltColors.primary,
                                inactiveTrackColor: isDark ? Colors.white10 : Colors.black12,
                                thumbColor: Colors.white,
                                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12, elevation: 4),
                                overlayColor: VoltColors.primary.withOpacity(0.2),
                              ),
                              child: Slider(
                                value: insideTemp,
                                min: 60,
                                max: 85,
                                onChanged: (val) {
                                  context.read<VehicleBloc>().add(SetTemperature(vehicle.id, val));
                                },
                              ),
                            ),
                          ),
                          const Text('85°F', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: VoltColors.outline)),
                        ],
                      ),
                      const SizedBox(height: 32),

                      // Actions
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () => context.read<VehicleBloc>().add(ToggleClimate(vehicle.id, !vehicle.isClimateOn)),
                            icon: Icon(Icons.ac_unit, color: vehicle.isClimateOn ? Colors.white : VoltColors.primary, size: 18),
                            label: Text(vehicle.isClimateOn ? 'ON' : 'TURN ON'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: vehicle.isClimateOn ? VoltColors.primary : (isDark ? VoltColors.surfaceContainerLow : VoltColors.surfaceContainerHighest),
                              foregroundColor: vehicle.isClimateOn ? Colors.white : (isDark ? Colors.white : Colors.black87),
                              elevation: vehicle.isClimateOn ? 8 : 0,
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                            ),
                          ),
                          const SizedBox(width: 16),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isDark ? VoltColors.surfaceContainerLow : VoltColors.surfaceContainerHighest,
                              foregroundColor: isDark ? Colors.white : Colors.black87,
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                            ),
                            child: const Text('SCHEDULE', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Features Grid
                GridView.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _FeatureSquare(icon: Icons.event_seat, label: 'Driver', isActive: false),
                    _FeatureSquare(icon: Icons.event_seat, label: 'Passenger', isActive: false),
                    _FeatureSquare(icon: Icons.heat_pump, label: 'Steering', isActive: true),
                    _FeatureSquare(icon: Icons.window, label: 'Defrost', isActive: false),
                  ],
                ),

                const SizedBox(height: 16),

                // Mixed Stats Grid (Tire Pressure, Sentry Mode)
                Row(
                  children: [
                    Expanded(
                      child: _StatCard(
                        icon: Icons.tire_repair,
                        title: 'Tire Pressure',
                        subtitle: _getTireStatus(vehicle),
                        value: _getLowestTirePressure(vehicle),
                        unit: 'PSI',
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _StatCard(
                        icon: Icons.security,
                        title: 'Sentry Mode',
                        subtitle: vehicle.isSentryModeOn ? 'Active' : 'Disabled',
                        valueWidget: Switch(
                          value: vehicle.isSentryModeOn,
                          onChanged: (val) => context.read<VehicleBloc>().add(ToggleSentryMode(vehicle.id, val)),
                          activeThumbColor: VoltColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Map Below
                Container(
                  height: 240,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    image: const DecorationImage(
                      image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuAQb1nezjVULyjBUhz0YDG2GTNb-2L6mOQIUXjHB3wNYvFtLVoqNL_CqFsWBTn9-pemxkIS2ba4AmOwMULArjUmUwfbThJvlzx50xwKB40nTT59mOBHXQrW0LHOaUjhI4xmIWpUJs2P9KYyb4CynLzb7a7Ll5QWY1lSslzs16pEXF0GLCzzJ7zcsv3HRjMjgUTYBLavrls9A1MYMlmnwIk5TM2EcVeG5Es-tsQjhIS0KDtWhR0yVjBC0KtymcppeHO2aEo7CwOv2uxL'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(Colors.grey, BlendMode.saturation)
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
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 24,
                        left: 24,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'VEHICLE LOCATION',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: Colors.white70,
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              vehicle.state == 'asleep' ? 'Last Known Location' : 'Live Tracking Active',
                              style: theme.textTheme.headlineMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: VoltColors.primary,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 4),
                            boxShadow: [
                              BoxShadow(color: VoltColors.primary.withOpacity(0.5), blurRadius: 10)
                            ]
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  String _getLowestTirePressure(Vehicle vehicle) {
    final pressures = [
      vehicle.tpmsPressureFl,
      vehicle.tpmsPressureFr,
      vehicle.tpmsPressureRl,
      vehicle.tpmsPressureRr,
    ].whereType<double>().toList();
    
    if (pressures.isEmpty) return '--';
    
    double min = pressures.reduce((a, b) => a < b ? a : b);
    if (min < 10) min = min * 14.5038;
    return min.toInt().toString();
  }

  String _getTireStatus(Vehicle vehicle) {
    final pressures = [
      vehicle.tpmsPressureFl,
      vehicle.tpmsPressureFr,
      vehicle.tpmsPressureRl,
      vehicle.tpmsPressureRr,
    ].whereType<double>().toList();

    if (pressures.isEmpty) return 'No Data';

    double min = pressures.reduce((a, b) => a < b ? a : b);
    if (min < 10) min = min * 14.5038;

    if (min < 30) return 'LOW PRESSURE ALERT';
    if (min < 35) return 'Check Pressure';
    return 'All Systems OK';
  }
}

class _FeatureSquare extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;

  const _FeatureSquare({required this.icon, required this.label, required this.isActive});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? VoltColors.surfaceContainer : VoltColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: VoltColors.onSurfaceVariant, size: 24),
          const SizedBox(height: 8),
          Text(label.toUpperCase(), style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold, letterSpacing: 1, color: VoltColors.onSurfaceVariant)),
          const SizedBox(height: 8),
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: isActive ? VoltColors.primary : (isDark ? Colors.white10 : Colors.black12),
              shape: BoxShape.circle,
            ),
          )
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String? value;
  final String? unit;
  final Widget? valueWidget;

  const _StatCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.value,
    this.unit,
    this.valueWidget,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? VoltColors.surfaceContainer : VoltColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isDark ? VoltColors.backgroundDark : VoltColors.surfaceContainerLow,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: VoltColors.onSurfaceVariant, size: 20),
              ),
              if (valueWidget != null) valueWidget!,
            ],
          ),
          const SizedBox(height: 16),
          Text(title, style: theme.textTheme.headlineSmall?.copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(subtitle, style: theme.textTheme.labelSmall?.copyWith(color: VoltColors.onSurfaceVariant, fontWeight: FontWeight.bold, fontSize: 10, letterSpacing: 1)),
          
          if (value != null && unit != null) ...[
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(value!, style: theme.textTheme.headlineLarge?.copyWith(fontSize: 32, fontWeight: FontWeight.w800, color: VoltColors.primary)),
                Text(' $unit', style: theme.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.bold)),
              ],
            )
          ]
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/volt_colors.dart';
import '../../../dashboard/domain/vehicle.dart';
import '../../../dashboard/presentation/bloc/vehicle_bloc.dart';
import 'dart:ui';

class ClimatePage extends StatefulWidget {
  const ClimatePage({super.key});

  @override
  State<ClimatePage> createState() => _ClimatePageState();
}

class _ClimatePageState extends State<ClimatePage> {
  /// Local slider value while the user is dragging. Null = use vehicle's reported target.
  double? _localTemp;

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
                'CLIMATE & CONTROLS',
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
      body: BlocConsumer<VehicleBloc, VehicleBlocState>(
        listenWhen: (prev, curr) =>
            curr.commandError != null && curr.commandError != prev.commandError,
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.commandError!),
              backgroundColor: VoltColors.error,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          );
        },
        builder: (context, vehicleState) {
          final vehicle = vehicleState.selectedVehicle;
          if (vehicle == null) {
            return const Center(child: CircularProgressIndicator(color: VoltColors.primary));
          }

          final targetTemp = vehicle.driverTemp ?? (vehicle.useFahrenheit ? 70.0 : 21.0);
          final tempUnit = vehicle.useFahrenheit ? '°F' : '°C';
          final sliderMin = vehicle.useFahrenheit ? 60.0 : 15.0;
          final sliderMax = vehicle.useFahrenheit ? 85.0 : 28.0;

          // Display temp for the slider thumb (local drag override or vehicle-reported target)
          final displayTarget = (_localTemp ?? targetTemp).clamp(sliderMin, sliderMax);

          // Interior temp display — API always returns Celsius
          final insideTemp = vehicle.insideTemp;
          final displayInsideTemp = vehicle.useFahrenheit
              ? (insideTemp * 9 / 5 + 32)
              : insideTemp;

          final isClimateLoading = vehicleState.loadingCommands.contains('${vehicle.id}_climate');

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
                    color: isDark ? VoltColors.surfaceElevatedDark : VoltColors.surfaceContainerLowest,
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
                            '${displayInsideTemp.toInt()}',
                            style: theme.textTheme.headlineLarge?.copyWith(
                              fontSize: 80,
                              fontWeight: FontWeight.w800,
                              height: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 4),
                            child: Text(
                              tempUnit,
                              style: theme.textTheme.headlineMedium?.copyWith(
                                color: VoltColors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),

                      // Target temp label — updates live while dragging
                      Text(
                        'TARGET: ${displayTarget.toStringAsFixed(1)}$tempUnit',
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          color: VoltColors.outline,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Temperature slider
                      Row(
                        children: [
                          Text(
                            '${sliderMin.toInt()}$tempUnit',
                            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: VoltColors.outline),
                          ),
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
                                value: displayTarget,
                                min: sliderMin,
                                max: sliderMax,
                                divisions: ((sliderMax - sliderMin) * 2).toInt(), // 0.5° steps
                                onChanged: (val) {
                                  setState(() => _localTemp = val);
                                },
                                onChangeEnd: (val) {
                                  setState(() => _localTemp = null);
                                  // Tesla API always expects Celsius
                                  final celsiusVal = vehicle.useFahrenheit
                                      ? (val - 32) * 5 / 9
                                      : val;
                                  context.read<VehicleBloc>().add(SetTemperature(vehicle.id, celsiusVal));
                                },
                              ),
                            ),
                          ),
                          Text(
                            '${sliderMax.toInt()}$tempUnit',
                            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: VoltColors.outline),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),

                      // Actions
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            onPressed: isClimateLoading
                                ? null
                                : () => context.read<VehicleBloc>().add(
                                      ToggleClimate(vehicle.id, !vehicle.isClimateOn),
                                    ),
                            icon: isClimateLoading
                                ? const SizedBox(
                                    width: 18,
                                    height: 18,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ),
                                  )
                                : Icon(
                                    Icons.ac_unit,
                                    color: vehicle.isClimateOn ? Colors.white : VoltColors.primary,
                                    size: 18,
                                  ),
                            label: Text(vehicle.isClimateOn ? 'ON' : 'TURN ON'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: vehicle.isClimateOn
                                  ? VoltColors.primary
                                  : (isDark ? VoltColors.surfaceElevatedDark : VoltColors.surfaceContainerHighest),
                              foregroundColor: vehicle.isClimateOn
                                  ? Colors.white
                                  : (isDark ? Colors.white : Colors.black87),
                              elevation: vehicle.isClimateOn ? 8 : 0,
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                            ),
                          ),
                          const SizedBox(width: 16),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isDark ? VoltColors.surfaceElevatedDark : VoltColors.surfaceContainerHighest,
                              foregroundColor: isDark ? Colors.white : Colors.black87,
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                            ),
                            child: const Text('SCHEDULE', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Climate Keeper Mode (Dog Mode / Camp Mode / Keep On)
                _buildKeeperModeSection(context, vehicle, isDark, theme),

                const SizedBox(height: 16),

                // Feature squares grid — live from Tesla API climate_state
                GridView.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _FeatureSquare(
                      icon: Icons.event_seat,
                      label: 'Driver ${vehicle.seatHeaterLeft > 0 ? vehicle.seatHeaterLeft : ""}',
                      isActive: vehicle.seatHeaterLeft > 0,
                      onTap: () => context.read<VehicleBloc>().add(
                        SetSeatHeater(vehicle.id, 0, vehicle.seatHeaterLeft > 0 ? 0 : 1),
                      ),
                    ),
                    _FeatureSquare(
                      icon: Icons.event_seat,
                      label: 'Psngr ${vehicle.seatHeaterRight > 0 ? vehicle.seatHeaterRight : ""}',
                      isActive: vehicle.seatHeaterRight > 0,
                      onTap: () => context.read<VehicleBloc>().add(
                        SetSeatHeater(vehicle.id, 1, vehicle.seatHeaterRight > 0 ? 0 : 1),
                      ),
                    ),
                    _FeatureSquare(
                      icon: Icons.heat_pump,
                      label: 'Steering',
                      isActive: vehicle.steeringWheelHeater,
                    ),
                    _FeatureSquare(
                      icon: Icons.window,
                      label: 'Defrost',
                      isActive: vehicle.frontDefrosterOn,
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Tire Pressure + Sentry Mode
                Row(
                  children: [
                    Expanded(
                      child: _StatCard(
                        icon: Icons.tire_repair,
                        title: 'Tire Pressure',
                        subtitle: _getTireStatus(vehicle),
                        value: _getLowestTirePressure(vehicle),
                        unit: vehicle.pressureUnit ?? 'Psi',
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

                // Vehicle location map
                Container(
                  height: 240,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuAQb1nezjVULyjBUhz0YDG2GTNb-2L6mOQIUXjHB3wNYvFtLVoqNL_CqFsWBTn9-pemxkIS2ba4AmOwMULArjUmUwfbThJvlzx50xwKB40nTT59mOBHXQrW0LHOaUjhI4xmIWpUJs2P9KYyb4CynLzb7a7Ll5QWY1lSslzs16pEXF0GLCzzJ7zcsv3HRjMjgUTYBLavrls9A1MYMlmnwIk5TM2EcVeG5Es-tsQjhIS0KDtWhR0yVjBC0KtymcppeHO2aEo7CwOv2uxL',
                      ),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(Colors.grey, BlendMode.saturation),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [Colors.black.withOpacity(0.8), Colors.transparent],
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
                              BoxShadow(color: VoltColors.primary.withOpacity(0.5), blurRadius: 10),
                            ],
                          ),
                        ),
                      ),
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

  Widget _buildKeeperModeSection(BuildContext context, Vehicle vehicle, bool isDark, ThemeData theme) {
    final current = vehicle.climateKeeperMode;

    Widget modeButton(String mode, IconData icon, String label) {
      final isActive = current == mode;
      return GestureDetector(
        onTap: () {
          final next = isActive ? 'off' : mode;
          context.read<VehicleBloc>().add(SetClimateKeeperMode(vehicle.id, next));
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          decoration: BoxDecoration(
            color: isActive ? VoltColors.primary : (isDark ? VoltColors.surfaceElevatedDark : VoltColors.surfaceContainerLowest),
            borderRadius: BorderRadius.circular(16),
            border: isActive ? Border.all(color: VoltColors.primary.withOpacity(0.4), width: 1.5) : null,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: isActive ? Colors.white : VoltColors.onSurfaceVariant, size: 22),
              const SizedBox(height: 6),
              Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                  color: isActive ? Colors.white : VoltColors.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'KEEPER MODE',
          style: theme.textTheme.labelSmall?.copyWith(
            color: VoltColors.outline,
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(child: modeButton('dog', Icons.pets, 'DOG')),
            const SizedBox(width: 12),
            Expanded(child: modeButton('camp', Icons.local_fire_department, 'CAMP')),
            const SizedBox(width: 12),
            Expanded(child: modeButton('on', Icons.ac_unit, 'KEEP ON')),
          ],
        ),
        if (current != 'off') ...[
          const SizedBox(height: 8),
          Text(
            current == 'dog'
                ? 'Dog Mode active — climate maintained for pets'
                : current == 'camp'
                    ? 'Camp Mode active — climate on for cabin comfort'
                    : 'Climate kept on while parked',
            style: theme.textTheme.bodySmall?.copyWith(color: VoltColors.primary, fontWeight: FontWeight.w600),
          ),
        ],
      ],
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

    final min = pressures.reduce((a, b) => a < b ? a : b);
    final unit = vehicle.pressureUnit ?? 'Psi';
    if (unit == 'Psi' || unit == 'PSI') return (min * 14.5038).toInt().toString();
    if (unit == 'kPa') return (min * 100).toInt().toString();
    return min.toStringAsFixed(1);
  }

  String _getTireStatus(Vehicle vehicle) {
    final pressures = [
      vehicle.tpmsPressureFl,
      vehicle.tpmsPressureFr,
      vehicle.tpmsPressureRl,
      vehicle.tpmsPressureRr,
    ].whereType<double>().toList();

    if (pressures.isEmpty) return 'No Data';

    final min = pressures.reduce((a, b) => a < b ? a : b);
    final psi = min * 14.5038;

    if (psi < 30) return 'LOW PRESSURE ALERT';
    if (psi < 35) return 'Check Pressure';
    return 'All Systems OK';
  }
}

class _FeatureSquare extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback? onTap;

  const _FeatureSquare({required this.icon, required this.label, required this.isActive, this.onTap});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? VoltColors.surfaceElevatedDark : VoltColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: VoltColors.onSurfaceVariant, size: 24),
            const SizedBox(height: 8),
            Text(
              label.toUpperCase(),
              style: const TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                color: VoltColors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: isActive ? VoltColors.primary : (isDark ? Colors.white10 : Colors.black12),
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
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
        color: isDark ? VoltColors.surfaceElevatedDark : VoltColors.surfaceContainerLowest,
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
          Text(
            title,
            style: theme.textTheme.headlineSmall?.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: theme.textTheme.labelSmall?.copyWith(
              color: VoltColors.onSurfaceVariant,
              fontWeight: FontWeight.bold,
              fontSize: 10,
              letterSpacing: 1,
            ),
          ),
          if (value != null && unit != null) ...[
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  value!,
                  style: theme.textTheme.headlineLarge?.copyWith(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    color: VoltColors.primary,
                  ),
                ),
                Text(' $unit', style: theme.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

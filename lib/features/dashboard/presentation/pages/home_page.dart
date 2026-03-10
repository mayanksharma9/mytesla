import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voltride/core/theme/volt_colors.dart';
import 'package:voltride/features/dashboard/domain/tesla_product.dart';
import '../bloc/vehicle_bloc.dart';
import '../widgets/battery_widget.dart';
import '../widgets/stat_card.dart';
import '../widgets/status_chip.dart';

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
    // Don't necessarily stop polling here if we want background updates, 
    // but for "free tier" it's safer to stop.
    // However, GoRouter might keep the state alive. 
    // Let's stop to be safe.
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
    return Scaffold(
      backgroundColor: VoltColors.backgroundDark,
      body: BlocBuilder<VehicleBloc, VehicleState>(
        builder: (context, vehicleState) {
          final vehicle = vehicleState.selectedVehicle;
          if (vehicle == null) {
            return const Center(child: CircularProgressIndicator(color: VoltColors.primary));
          }

          return SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Status Bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          (vehicle.displayName ?? 'My Tesla').toUpperCase(),
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                              ),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: vehicle.state == 'online' ? VoltColors.success : VoltColors.textTertiaryDark,
                                shape: BoxShape.circle,
                                boxShadow: vehicle.state == 'online'
                                    ? [
                                        BoxShadow(
                                          color: VoltColors.success.withValues(alpha: 0.5),
                                          blurRadius: 8,
                                          spreadRadius: 2,
                                        )
                                      ]
                                    : null,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              vehicle.state.toUpperCase(),
                              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                    color: vehicle.state == 'online' ? VoltColors.success : VoltColors.textSecondaryDark,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Vehicle Hero Image
                  const SizedBox(height: 20),
                  Center(
                    child: Container(
                      height: 180,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          colors: [
                            VoltColors.primary.withValues(alpha: 0.1),
                            Colors.transparent,
                          ],
                          radius: 0.8,
                        ),
                      ),
                      child: Icon(
                        Icons.directions_car,
                        size: 140,
                        color: Colors.white.withValues(alpha: 0.8),
                      ), // Placeholder for actual car illustration
                    ),
                  ),

                  // Battery Widget
                  Center(
                    child: BatteryWidget(
                      level: vehicle.batteryLevel,
                      range: vehicle.batteryRange,
                      chargeState: vehicle.state == 'charging' ? 'Charging' : 'Parked',
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Quick Stats Row
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          StatCard(
                            icon: Icons.speed,
                            value: '${vehicle.batteryRange.toInt()}',
                            label: 'mi range',
                          ),
                          StatCard(
                            icon: Icons.thermostat,
                            value: '${vehicle.outsideTemp.toInt()}°',
                            label: 'outside',
                          ),
                          StatCard(
                            icon: Icons.ac_unit,
                            value: '${vehicle.insideTemp.toInt()}°',
                            label: 'cabin',
                          ),
                          StatCard(
                            icon: Icons.history,
                            value: '${(vehicle.odometer / 1000).toStringAsFixed(1)}k',
                            label: 'miles',
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Status Chips Selection
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        QuickStatusChip(
                          icon: vehicle.isLocked ? Icons.lock : Icons.lock_open,
                          label: vehicle.isLocked ? 'Locked' : 'Unlocked',
                          isActive: vehicle.isLocked,
                          isLoading: vehicleState.loadingCommands.contains('${vehicle.id}_lock'),
                          onTap: () => context.read<VehicleBloc>().add(ToggleLock(vehicle.id, !vehicle.isLocked)),
                        ),
                        QuickStatusChip(
                          icon: Icons.ac_unit,
                          label: 'Climate',
                          isActive: vehicle.isClimateOn,
                          isLoading: vehicleState.loadingCommands.contains('${vehicle.id}_climate'),
                          onTap: () => context.read<VehicleBloc>().add(ToggleClimate(vehicle.id, !vehicle.isClimateOn)),
                        ),
                        QuickStatusChip(
                          icon: Icons.bolt,
                          label: 'Charging',
                          isActive: vehicle.state == 'charging',
                          isLoading: vehicleState.loadingCommands.contains('${vehicle.id}_charging'),
                          onTap: () => context.read<VehicleBloc>().add(ToggleCharging(vehicle.id, vehicle.state != 'charging')),
                        ),
                        QuickStatusChip(
                          icon: Icons.security,
                          label: 'Sentry',
                          isActive: vehicle.isSentryModeOn,
                          onTap: () {}, // Not implemented yet in Repo
                        ),
                        QuickStatusChip(
                          icon: Icons.no_crash,
                          label: 'Valet',
                          isActive: vehicle.isValetModeOn,
                          onTap: () {}, // Not implemented yet in Repo
                        ),
                      ],
                    ),
                  ),

                  if (vehicleState.products.isNotEmpty) ...[
                    const SizedBox(height: 48),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        'POWER & ENERGY',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: VoltColors.textTertiaryDark,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 160,
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        scrollDirection: Axis.horizontal,
                        itemCount: vehicleState.products.where((p) => p.type != ProductType.vehicle).length,
                        separatorBuilder: (context, index) => const SizedBox(width: 16),
                        itemBuilder: (context, index) {
                          final product = vehicleState.products.where((p) => p.type != ProductType.vehicle).toList()[index];
                          return _EnergyProductCard(product: product);
                        },
                      ),
                    ),
                  ],

                  const SizedBox(height: 100), // Bottom padding for navigation
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: null,
    );
  }
}
class _EnergyProductCard extends StatelessWidget {
  final TeslaProduct product;

  const _EnergyProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    IconData iconData;
    String name;

    switch (product.type) {
      case ProductType.powerwall:
        iconData = Icons.battery_charging_full;
        name = product.siteName ?? 'Powerwall';
        break;
      case ProductType.solar:
        iconData = Icons.solar_power;
        name = product.siteName ?? 'Solar';
        break;
      default:
        iconData = Icons.bolt;
        name = product.siteName ?? 'Energy Site';
    }

    return Container(
      width: 240,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: VoltColors.surfaceDark,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(iconData, color: VoltColors.primary, size: 32),
              const Icon(Icons.arrow_forward_ios, color: VoltColors.textTertiaryDark, size: 14),
            ],
          ),
          const Spacer(),
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Live Status • Online',
            style: TextStyle(
              color: VoltColors.success,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

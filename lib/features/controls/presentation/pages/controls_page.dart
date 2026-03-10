import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/volt_colors.dart';
import '../../../dashboard/presentation/bloc/vehicle_bloc.dart';
import '../widgets/command_card.dart';

class ControlsPage extends StatelessWidget {
  const ControlsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VehicleBloc, VehicleState>(
      builder: (context, state) {
        final vehicle = state.selectedVehicle;
        final isLocked = vehicle?.state == 'online' ? true : false; // Simplification for UI

        return Scaffold(
          backgroundColor: VoltColors.backgroundDark,
          body: CustomScrollView(
            slivers: [
              const SliverAppBar(
                title: Text('Controls'),
                floating: true,
                backgroundColor: VoltColors.backgroundDark,
                elevation: 0,
              ),
              
              _buildSectionHeader('Security'),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                sliver: SliverGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.5,
                  children: [
                    CommandCard(
                      icon: isLocked ? Icons.lock : Icons.lock_open,
                      label: isLocked ? 'Locked' : 'Unlocked',
                      isActive: isLocked,
                      onTap: () {
                        if (vehicle != null) {
                          context.read<VehicleBloc>().add(ToggleLock(vehicle.id, !isLocked));
                        }
                      },
                    ),
                    CommandCard(
                      icon: Icons.security,
                      label: 'Sentry Mode',
                      isActive: true, // Placeholder for actual sentry state
                      onTap: () {},
                    ),
                    CommandCard(
                      icon: Icons.no_crash,
                      label: 'Valet Mode',
                      isActive: false,
                      onTap: () {},
                    ),
                    CommandCard(
                      icon: Icons.speed,
                      label: 'Speed Limit',
                      isActive: false,
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              _buildSectionHeader('Access'),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                sliver: SliverGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.5,
                  children: [
                    CommandCard(
                      icon: Icons.unarchive,
                      label: 'Frunk',
                      onTap: () {
                        if (vehicle != null) {
                          context.read<VehicleBloc>().add(ActuateTrunk(vehicle.id, 'front'));
                        }
                      },
                    ),
                    CommandCard(
                      icon: Icons.archive,
                      label: 'Trunk',
                      onTap: () {
                        if (vehicle != null) {
                          context.read<VehicleBloc>().add(ActuateTrunk(vehicle.id, 'rear'));
                        }
                      },
                    ),
                    CommandCard(
                      icon: Icons.bolt,
                      label: 'Charge Port',
                      onTap: () {},
                    ),
                    CommandCard(
                      icon: Icons.window,
                      label: 'Vent Windows',
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              _buildSectionHeader('Alerts'),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                sliver: SliverGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.5,
                  children: [
                    CommandCard(
                      icon: Icons.volume_up,
                      label: 'Honk Horn',
                      onTap: () {
                        if (vehicle != null) {
                          context.read<VehicleBloc>().add(HonkHorn(vehicle.id));
                        }
                      },
                    ),
                    CommandCard(
                      icon: Icons.lightbulb,
                      label: 'Flash Lights',
                      onTap: () {
                        if (vehicle != null) {
                          context.read<VehicleBloc>().add(FlashLights(vehicle.id));
                        }
                      },
                    ),
                    CommandCard(
                      icon: Icons.vpn_key,
                      label: 'Remote Start',
                      isDestructive: true,
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 100)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSectionHeader(String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0, top: 32.0, bottom: 8.0),
        child: Text(
          title.toUpperCase(),
          style: const TextStyle(
            color: VoltColors.textTertiaryDark,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }
}

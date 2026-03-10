import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/volt_colors.dart';
import '../../../../core/widgets/adaptive/adaptive_button.dart';
import '../../../dashboard/presentation/bloc/vehicle_bloc.dart';
import '../widgets/seat_heater_button.dart';

class ClimatePage extends StatelessWidget {
  const ClimatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VehicleBloc, VehicleState>(
      builder: (context, state) {
        final vehicle = state.selectedVehicle;
        final insideTemp = vehicle?.insideTemp ?? 72.0;
        final outsideTemp = vehicle?.outsideTemp ?? 45.0;
        
        return Scaffold(
          backgroundColor: VoltColors.backgroundDark,
          body: CustomScrollView(
            slivers: [
              const SliverAppBar(
                title: Text('Climate'),
                floating: true,
                backgroundColor: VoltColors.backgroundDark,
                elevation: 0,
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    
                    Text(
                      'Outside: ${outsideTemp.toInt()}°',
                      style: const TextStyle(color: VoltColors.textTertiaryDark, fontSize: 14),
                    ),
                    const SizedBox(height: 40),
                    
                    // Temperature Controls
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildTempDial(
                            context,
                            label: 'Interior',
                            temp: insideTemp,
                            onChanged: (val) {
                              if (vehicle != null) {
                                context.read<VehicleBloc>().add(SetTemperature(vehicle.id, insideTemp + val));
                              }
                            },
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 60),

                    // Seat Heaters & Steering
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SeatHeaterButton(
                            level: 0, // Placeholder
                            onTap: () {
                              if (vehicle != null) {
                                context.read<VehicleBloc>().add(SetSeatHeater(vehicle.id, 0, 1));
                              }
                            },
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: VoltColors.surfaceDark,
                                shape: BoxShape.circle,
                                border: Border.all(color: VoltColors.surfaceOverlayDark),
                              ),
                              child: const Icon(Icons.radio_button_checked, color: Colors.white, size: 32),
                            ),
                          ),
                          SeatHeaterButton(
                            level: 0, // Placeholder
                            onTap: () {
                              if (vehicle != null) {
                                context.read<VehicleBloc>().add(SetSeatHeater(vehicle.id, 1, 1));
                              }
                            },
                            isRightSide: true,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 60),

                    // Modes Grid
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              _buildModeButton(context, 'Keep', Icons.hourglass_empty),
                              const SizedBox(width: 12),
                              _buildModeButton(context, 'Dog', Icons.pets),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              _buildModeButton(context, 'Camp', Icons.terrain),
                              const SizedBox(width: 12),
                              _buildModeButton(context, 'Defrost', Icons.ac_unit),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 60),

                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: AdaptiveButton(
                        onPressed: () {
                          if (vehicle != null) {
                            context.read<VehicleBloc>().add(ToggleClimate(vehicle.id, true));
                          }
                        },
                        child: const Text(
                          'Turn On Climate',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTempDial(BuildContext context, {required String label, required double temp, required Function(double) onChanged}) {
    return Column(
      children: [
        IconButton(
          icon: const Icon(Icons.keyboard_arrow_up, color: Colors.white, size: 32),
          onPressed: () => onChanged(1.0),
        ),
        Text(
          '${temp.toInt()}°',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 56,
              ),
        ),
        IconButton(
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 32),
          onPressed: () => onChanged(-1.0),
        ),
        const SizedBox(height: 8),
        Text(
          label.toUpperCase(),
          style: const TextStyle(color: VoltColors.textTertiaryDark, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.5),
        ),
      ],
    );
  }

  Widget _buildModeButton(BuildContext context, String label, IconData icon) {
    return Expanded(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: VoltColors.surfaceDark,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Icon(icon, color: VoltColors.textSecondaryDark, size: 20),
              const SizedBox(width: 12),
              Text(
                label,
                style: const TextStyle(
                  color: VoltColors.textSecondaryDark,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

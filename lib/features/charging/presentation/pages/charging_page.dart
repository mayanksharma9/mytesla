import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voltride/core/theme/volt_colors.dart';
import 'package:voltride/core/widgets/adaptive/adaptive_button.dart';
import 'package:voltride/features/dashboard/presentation/bloc/vehicle_bloc.dart';
import 'package:voltride/features/charging/presentation/bloc/charging_bloc.dart';
import '../widgets/charging_arc_widget.dart';

class ChargingPage extends StatelessWidget {
  const ChargingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VehicleBloc, VehicleState>(
      builder: (context, vehicleState) {
        final vehicle = vehicleState.selectedVehicle;
        final batteryLevel = vehicle?.batteryLevel ?? 0;
        final chargeLimit = 80.0;
        final isCharging = vehicle?.state == 'charging';

        return BlocBuilder<ChargingBloc, ChargingState>(
          builder: (context, chargingState) {
            return Scaffold(
              backgroundColor: VoltColors.backgroundDark,
              body: CustomScrollView(
                slivers: [
                  const SliverAppBar(
                    title: Text('Charging'),
                    floating: true,
                    backgroundColor: VoltColors.backgroundDark,
                    elevation: 0,
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        ChargingArcWidget(
                          level: batteryLevel,
                          limit: chargeLimit.toInt(),
                          isCharging: isCharging,
                        ),
                        const SizedBox(height: 40),

                        // Vehicle Stats
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            childAspectRatio: 2.5,
                            children: [
                              _buildStatItem('Charge Rate', '+24 mi/hr'),
                              _buildStatItem('Added', '18.4 kWh'),
                              _buildStatItem('Current', '32A'),
                              _buildStatItem('Voltage', '242V'),
                            ],
                          ),
                        ),

                        const SizedBox(height: 32),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.0),
                          child: Text(
                            'NEARBY STATIONS',
                            style: TextStyle(
                              color: VoltColors.textTertiaryDark,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        _buildStationList(context, chargingState),
                        
                        if (chargingState.selectedStation != null) ...[
                          const SizedBox(height: 32),
                          _buildTariffDetails(context, chargingState),
                        ],

                        const SizedBox(height: 40),

                        // Controls
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildSliderSection(
                                context,
                                label: 'Charge Limit',
                                value: chargeLimit,
                                min: 50,
                                max: 100,
                                suffix: '%',
                                onChanged: (val) {
                                  if (vehicle != null) {
                                    context.read<VehicleBloc>().add(SetChargeLimit(vehicle.id, val.toInt()));
                                  }
                                },
                              ),
                              const SizedBox(height: 32),
                              _buildSliderSection(
                                context,
                                label: 'Charge Current',
                                value: 32,
                                min: 5,
                                max: 48,
                                suffix: 'A',
                                onChanged: (val) {
                                  if (vehicle != null) {
                                    context.read<VehicleBloc>().add(SetChargingAmps(vehicle.id, val.toInt()));
                                  }
                                },
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 48),

                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: AdaptiveButton(
                            onPressed: () {
                              if (vehicle != null) {
                                context.read<VehicleBloc>().add(ToggleCharging(vehicle.id, !isCharging));
                              }
                            },
                            child: Text(
                              isCharging ? 'Stop Charging' : 'Start Charging',
                              style: const TextStyle(fontWeight: FontWeight.bold),
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
      },
    );
  }

  Widget _buildStationList(BuildContext context, ChargingState state) {
    if (state.isLoading && state.stations.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state.stations.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Text('No stations found nearby', style: TextStyle(color: VoltColors.textSecondaryDark)),
      );
    }

    return SizedBox(
      height: 160,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        scrollDirection: Axis.horizontal,
        itemCount: state.stations.length,
        itemBuilder: (context, index) {
          final station = state.stations[index];
          final isSelected = state.selectedStation?.id == station.id;
          
          return GestureDetector(
            onTap: () => context.read<ChargingBloc>().add(SelectStation(station)),
            child: Container(
              width: 200,
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isSelected ? VoltColors.primary.withValues(alpha: 0.1) : VoltColors.surfaceDark,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isSelected ? VoltColors.primary : Colors.transparent,
                  width: 1.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    station.name ?? 'Tesla Supercharger',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${station.city}, ${station.state}',
                    style: const TextStyle(color: VoltColors.textSecondaryDark, fontSize: 12),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Icon(Icons.bolt, color: VoltColors.primary, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        '${station.evseCount ?? 0} Stalls',
                        style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTariffDetails(BuildContext context, ChargingState state) {
    if (state.isLoading && state.currentTariff == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final tariff = state.currentTariff;
    if (tariff == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'PRICING',
            style: TextStyle(
              color: VoltColors.textTertiaryDark,
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: VoltColors.surfaceDark,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: tariff.elements.expand((element) {
                return element.priceComponents.map((component) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          component.type.replaceAll('_', ' '),
                          style: const TextStyle(color: VoltColors.textSecondaryDark),
                        ),
                        Text(
                          '${tariff.currency} ${component.price}/kWh',
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                });
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: VoltColors.surfaceDark,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label.toUpperCase(),
            style: const TextStyle(color: VoltColors.textTertiaryDark, fontSize: 8, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildSliderSection(
    BuildContext context, {
    required String label,
    required double value,
    required double min,
    required double max,
    required String suffix,
    required ValueChanged<double> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label.toUpperCase(),
              style: const TextStyle(color: VoltColors.textSecondaryDark, fontSize: 12, fontWeight: FontWeight.bold),
            ),
            Text(
              '${value.toInt()}$suffix',
              style: const TextStyle(color: VoltColors.primary, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: VoltColors.primary,
            inactiveTrackColor: VoltColors.surfaceOverlayDark,
            thumbColor: Colors.white,
            overlayColor: VoltColors.primary.withValues(alpha: 0.2),
            trackHeight: 4,
          ),
          child: Slider(
            value: value,
            min: min,
            max: max,
            onChanged: (val) {}, // State is managed by Bloc
            onChangeEnd: onChanged, // Trigger action on release
          ),
        ),
      ],
    );
  }
}

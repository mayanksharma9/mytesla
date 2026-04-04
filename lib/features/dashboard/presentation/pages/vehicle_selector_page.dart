import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/vehicle_bloc.dart';
import '../widgets/vehicle_card.dart';
import '../../../../core/theme/volt_colors.dart';
import '../../../../core/widgets/adaptive/adaptive_button.dart';

class VehicleSelectorPage extends StatefulWidget {
  const VehicleSelectorPage({super.key});

  @override
  State<VehicleSelectorPage> createState() => _VehicleSelectorPageState();
}

class _VehicleSelectorPageState extends State<VehicleSelectorPage> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    context.read<VehicleBloc>().add(FetchVehicles());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VoltColors.backgroundDark,
      appBar: AppBar(
        title: const Text('Your Vehicles'),
        backgroundColor: Colors.transparent,
      ),
      body: BlocBuilder<VehicleBloc, VehicleState>(
        builder: (context, state) {
          if (state.status == VehicleStatus.loading) {
            return const Center(child: CircularProgressIndicator(color: VoltColors.primary));
          }

          if (state.status == VehicleStatus.error) {
            return Center(child: Text('Error: ${state.error}', style: const TextStyle(color: Colors.white)));
          }

          if (state.vehicles.isEmpty) {
            return const Center(child: Text('No vehicles found', style: TextStyle(color: Colors.white)));
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40),
                SizedBox(
                  height: 220,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: state.vehicles.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      final vehicle = state.vehicles[index];
                      return AnimatedScale(
                        scale: _currentPage == index ? 1.0 : 0.9,
                        duration: const Duration(milliseconds: 300),
                        child: VehicleCard(
                          vehicle: vehicle,
                          onTap: () {
                            context.read<VehicleBloc>().add(SelectVehicle(vehicle.vin));
                          },
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    state.vehicles.length,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: _currentPage == index ? 12 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: _currentPage == index ? VoltColors.primary : VoltColors.surfaceOverlayDark,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 48),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: AdaptiveButton(
                    onPressed: () {
                      final selected = state.vehicles[_currentPage];
                      context.read<VehicleBloc>().add(SelectVehicle(selected.vin));
                      context.go('/home');
                    },
                    child: const Text('Select Vehicle', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:voltride/core/theme/volt_colors.dart';
import 'package:voltride/features/dashboard/data/models/tesla_models.dart';
import 'package:voltride/features/dashboard/presentation/bloc/vehicle_bloc.dart';

class TripsPage extends StatelessWidget {
  const TripsPage({super.key});

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
                'TRIP HISTORY',
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
      body: BlocBuilder<VehicleBloc, VehicleBlocState>(
        builder: (context, state) {
          final vehicle = state.selectedVehicle;
          if (vehicle == null) {
            return const Center(
              child: CircularProgressIndicator(color: VoltColors.primary),
            );
          }

          final trips = state.tripHistory;

          if (trips.isEmpty) {
            return _buildEmptyState(context, state.status, vehicle.vin);
          }

          return RefreshIndicator(
            color: VoltColors.primary,
            onRefresh: () async {
              context.read<VehicleBloc>().add(FetchHistory(vehicle.vin));
            },
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(24, 100, 24, 120),
              itemCount: trips.length,
              itemBuilder: (context, index) {
                return _TripCard(trip: trips[index], isDark: isDark);
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, VehicleStatus status, String vin) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.route_outlined,
              size: 64,
              color: VoltColors.onSurfaceVariant.withOpacity(0.4),
            ),
            const SizedBox(height: 24),
            const Text(
              'No trips recorded yet',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              'Trips are recorded automatically when you drive.\nKeep the app running and connected to capture your drives.',
              style: TextStyle(
                fontSize: 13,
                color: VoltColors.onSurfaceVariant,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            OutlinedButton.icon(
              onPressed: () {
                context.read<VehicleBloc>().add(FetchHistory(vin));
              },
              icon: const Icon(Icons.refresh, size: 16),
              label: const Text('REFRESH'),
              style: OutlinedButton.styleFrom(
                foregroundColor: VoltColors.primary,
                side: const BorderSide(color: VoltColors.primary),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TripCard extends StatelessWidget {
  final DriveSession trip;
  final bool isDark;

  const _TripCard({required this.trip, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dateFormat = DateFormat('MMM d, yyyy  h:mm a');
    final duration = trip.endTime.difference(trip.startTime);
    final effWhPerMi = trip.distance > 0
        ? (trip.energyUsedKwh / trip.distance * 1000)
        : 0.0;
    final effColor = effWhPerMi == 0
        ? VoltColors.onSurfaceVariant
        : effWhPerMi < 280
            ? VoltColors.success
            : effWhPerMi < 350
                ? VoltColors.warning
                : VoltColors.error;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: isDark ? VoltColors.surfaceElevatedDark : VoltColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isDark ? Colors.white.withOpacity(0.05) : Colors.black.withOpacity(0.04),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: VoltColors.primary.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.directions_car, color: VoltColors.primary, size: 18),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dateFormat.format(trip.startTime),
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${_formatDuration(duration)}  ·  ${trip.distance.toStringAsFixed(1)} mi',
                        style: TextStyle(
                          fontSize: 11,
                          color: VoltColors.onSurfaceVariant,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                // Efficiency badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: effColor.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    effWhPerMi > 0 ? '${effWhPerMi.toInt()} Wh/mi' : '—',
                    style: TextStyle(
                      color: effColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Divider
          Divider(
            height: 1,
            color: isDark ? Colors.white10 : Colors.black.withOpacity(0.06),
          ),

          // Stats row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _Stat(
                  icon: Icons.bolt,
                  label: 'ENERGY',
                  value: '${trip.energyUsedKwh.toStringAsFixed(1)} kWh',
                ),
                _Stat(
                  icon: Icons.battery_4_bar,
                  label: 'SOC USED',
                  value: '${(trip.startSoc - trip.endSoc).toStringAsFixed(0)}%',
                ),
                _Stat(
                  icon: Icons.thermostat_outlined,
                  label: 'AVG TEMP',
                  value: '${trip.avgOutsideTemp.toStringAsFixed(0)}°C',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration d) {
    if (d.inHours > 0) return '${d.inHours}h ${d.inMinutes.remainder(60)}m';
    return '${d.inMinutes}m';
  }
}

class _Stat extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _Stat({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 16, color: VoltColors.onSurfaceVariant),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w800,
            letterSpacing: 1,
            color: VoltColors.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w800),
        ),
      ],
    );
  }
}

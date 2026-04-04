import 'package:voltride/features/telemetry/data/repositories/trip_repository.dart';
import 'package:voltride/core/utils/injection_container.dart' as di;
import 'package:voltride/features/dashboard/presentation/bloc/vehicle_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TripsPage extends StatelessWidget {
  const TripsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final vehicleState = context.watch<VehicleBloc>().state;
    final vehicle = vehicleState.selectedVehicle;

    if (vehicle == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator(color: VoltColors.primary)),
      );
    }

    return Scaffold(
      backgroundColor: VoltColors.background,
      appBar: AppBar(
        title: Text('TRIP HISTORY', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800, letterSpacing: 2)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: StreamBuilder<List<TripModel>>(
        stream: di.sl<TripRepository>().getTripsStream(vehicle.vin),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.history_toggle_off, size: 48, color: VoltColors.onSurfaceVariant),
                  const SizedBox(height: 16),
                  Text('No trips found', style: theme.textTheme.titleMedium?.copyWith(color: VoltColors.onSurfaceVariant)),
                ],
              ),
            );
          }
          final trips = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(24),
            itemCount: trips.length,
            itemBuilder: (context, index) {
              final trip = trips[index];
              return _TripCard(trip: trip);
            },
          );
        },
      ),
    );
  }
}

class _TripCard extends StatelessWidget {
  final TripModel trip;

  const _TripCard({required this.trip});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final dateFormat = DateFormat('MMM d, yyyy h:mm a');
    final duration = trip.endTime?.difference(trip.startTime) ?? const Duration();

    return GestureDetector(
      onTap: () {
        context.go('/more/trips/detail', extra: trip);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: isDark ? VoltColors.surfaceContainer : VoltColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white.withOpacity(0.05)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  dateFormat.format(trip.startTime),
                  style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: VoltColors.primary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${trip.distanceMiles?.toStringAsFixed(1) ?? '0.0'} mi',
                    style: const TextStyle(
                      color: VoltColors.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _StatColumn(icon: Icons.timer, label: 'Duration', value: '${duration.inMinutes}m'),
                _StatColumn(icon: Icons.bolt, label: 'Energy Used', value: '${trip.energyUsedPercent?.toStringAsFixed(1) ?? '0.0'}%'),
                _StatColumn(icon: Icons.speed, label: 'Efficiency', value: '${((trip.distanceMiles ?? 0) / (trip.energyUsedPercent ?? 1) * 100).toStringAsFixed(0)} mi/%'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatColumn extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _StatColumn({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: VoltColors.onSurfaceVariant, size: 14),
            const SizedBox(width: 4),
            Text(
              label,
              style: theme.textTheme.labelSmall?.copyWith(color: VoltColors.onSurfaceVariant),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
        ),
      ],
    );
  }
}

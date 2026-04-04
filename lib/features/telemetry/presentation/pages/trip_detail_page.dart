import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:voltride/core/theme/volt_colors.dart';
import 'package:voltride/features/telemetry/data/models/trip_model.dart';
import 'package:intl/intl.dart';

class TripDetailPage extends StatelessWidget {
  final TripModel trip;

  const TripDetailPage({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final Set<Polyline> polylines = {};
    
    // Create polyline from route points
    if (trip.routePoints.isNotEmpty) {
      polylines.add(
        Polyline(
          polylineId: const PolylineId('trip_route'),
          color: VoltColors.primary,
          width: 5,
          points: trip.routePoints.map((p) => LatLng(p.lat, p.lon)).toList(),
        ),
      );
    }

    final initialCameraPosition = trip.routePoints.isNotEmpty
        ? CameraPosition(
            target: LatLng(trip.routePoints.first.lat, trip.routePoints.first.lon),
            zoom: 12,
          )
        : const CameraPosition(target: LatLng(37.7749, -122.4194), zoom: 10);

    return Scaffold(
      backgroundColor: VoltColors.background,
      body: Stack(
        children: [
          // The Map
          GoogleMap(
            initialCameraPosition: initialCameraPosition,
            polylines: polylines,
            myLocationEnabled: false,
            zoomControlsEnabled: false,
            mapType: MapType.normal, // You would apply a dark map style here
          ),
          
          // Back Button
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            left: 16,
            child: CircleAvatar(
              backgroundColor: isDark ? VoltColors.surfaceContainer.withOpacity(0.8) : Colors.white.withOpacity(0.8),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ),

          // Details Card (Glassmorphism)
          Positioned(
            bottom: 40,
            left: 24,
            right: 24,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: isDark ? VoltColors.surfaceContainer.withOpacity(0.85) : Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(32),
                border: Border.all(color: Colors.white.withOpacity(0.1)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Trip Details',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    DateFormat('MMM d, h:mm a').format(trip.startTime),
                    style: theme.textTheme.labelSmall?.copyWith(color: VoltColors.onSurfaceVariant),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _DetailStat(label: 'Distance', value: '${trip.distanceMiles?.toStringAsFixed(1) ?? '0.0'} mi'),
                      _DetailStat(label: 'Energy', value: '${trip.energyUsedPercent?.toStringAsFixed(1) ?? '0.0'}%'),
                      _DetailStat(
                        label: 'Duration', 
                        value: '${trip.endTime?.difference(trip.startTime).inMinutes ?? 0}m'
                      ),
                    ],
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

class _DetailStat extends StatelessWidget {
  final String label;
  final String value;

  const _DetailStat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(value, style: theme.textTheme.headlineSmall?.copyWith(color: VoltColors.primary, fontWeight: FontWeight.w800)),
        const SizedBox(height: 4),
        Text(label, style: theme.textTheme.labelSmall?.copyWith(color: VoltColors.onSurfaceVariant)),
      ],
    );
  }
}

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voltride/core/theme/volt_colors.dart';
import 'package:voltride/features/dashboard/presentation/bloc/vehicle_bloc.dart';
import 'package:voltride/features/dashboard/data/models/tesla_models.dart' as models;

class NearbySuperchargersPage extends StatefulWidget {
  const NearbySuperchargersPage({super.key});

  @override
  State<NearbySuperchargersPage> createState() => _NearbySuperchargersPageState();
}

class _NearbySuperchargersPageState extends State<NearbySuperchargersPage> {
  @override
  void initState() {
    super.initState();
    context.read<VehicleBloc>().add(FetchNearbySuperchargers());
  }

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
                'NEARBY SUPERCHARGERS',
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
        buildWhen: (prev, curr) =>
            prev.nearbySuperchargers != curr.nearbySuperchargers ||
            prev.nearbyLoading != curr.nearbyLoading,
        builder: (context, state) {
          if (state.nearbyLoading) {
            return const Center(child: CircularProgressIndicator(color: VoltColors.primary));
          }

          final locations = state.nearbySuperchargers;
          if (locations == null || locations.isEmpty) {
            return _buildEmptyState(context, isDark, theme);
          }

          return RefreshIndicator(
            onRefresh: () async {
              context.read<VehicleBloc>().add(FetchNearbySuperchargers());
            },
            color: VoltColors.primary,
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(24, 100, 24, 40),
              itemCount: locations.length,
              itemBuilder: (context, index) {
                return _SuperchargerCard(location: locations[index], isDark: isDark);
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, bool isDark, ThemeData theme) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.ev_station, size: 56, color: VoltColors.primary.withOpacity(0.4)),
            const SizedBox(height: 20),
            const Text(
              'NO NEARBY SUPERCHARGERS',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.5,
                color: VoltColors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Availability depends on your vehicle\'s current GPS location.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: VoltColors.onSurfaceVariant),
            ),
            const SizedBox(height: 28),
            ElevatedButton.icon(
              onPressed: () => context.read<VehicleBloc>().add(FetchNearbySuperchargers()),
              icon: const Icon(Icons.refresh),
              label: const Text('REFRESH'),
              style: ElevatedButton.styleFrom(
                backgroundColor: VoltColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SuperchargerCard extends StatelessWidget {
  final models.ChargingLocation location;
  final bool isDark;

  const _SuperchargerCard({required this.location, required this.isDark});

  int get _availableStalls {
    if (location.evses == null) return 0;
    return location.evses!.where((e) => e.status == 'AVAILABLE').length;
  }

  int get _totalStalls => location.evses?.length ?? location.evseCount ?? 0;

  Color get _availabilityColor {
    if (_totalStalls == 0) return VoltColors.onSurfaceVariant;
    final ratio = _availableStalls / _totalStalls;
    if (ratio >= 0.5) return VoltColors.success;
    if (ratio > 0) return const Color(0xFFF5A623);
    return VoltColors.error;
  }

  @override
  Widget build(BuildContext context) {
    final hasEvse = _totalStalls > 0;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: VoltColors.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.bolt, color: VoltColors.primary, size: 22),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  location.name ?? 'Tesla Supercharger',
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                if (location.address != null)
                  Text(
                    [location.address, location.city].where((s) => s != null && s.isNotEmpty).join(', '),
                    style: const TextStyle(
                      fontSize: 11,
                      color: VoltColors.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: hasEvse ? _availabilityColor : VoltColors.onSurfaceVariant,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      hasEvse
                          ? '$_availableStalls / $_totalStalls AVAILABLE'
                          : '${_totalStalls > 0 ? _totalStalls : "?"} STALLS',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                        color: hasEvse ? _availabilityColor : VoltColors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:voltride/core/theme/volt_colors.dart';
import 'package:voltride/features/auth/domain/auth_repository.dart';
import 'package:voltride/features/dashboard/data/models/tesla_models.dart';
import 'package:voltride/core/utils/injection_container.dart';

class ChargingHistoryPage extends StatefulWidget {
  const ChargingHistoryPage({super.key});

  @override
  State<ChargingHistoryPage> createState() => _ChargingHistoryPageState();
}

class _ChargingHistoryPageState extends State<ChargingHistoryPage> {
  late Future<List<ChargingHistoryEntry>> _historyFuture;

  @override
  void initState() {
    super.initState();
    _historyFuture = sl<AuthRepository>().getChargingHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VoltColors.backgroundDark,
      appBar: AppBar(
        title: const Text('Charging History'),
        backgroundColor: VoltColors.backgroundDark,
        elevation: 0,
      ),
      body: FutureBuilder<List<ChargingHistoryEntry>>(
        future: _historyFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: VoltColors.primary));
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(color: VoltColors.error),
              ),
            );
          }

          final history = snapshot.data ?? [];
          if (history.isEmpty) {
            return const Center(
              child: Text(
                'No charging history found.',
                style: TextStyle(color: VoltColors.textTertiaryDark),
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(24),
            itemCount: history.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final entry = history[index];
              return _HistoryCard(entry: entry);
            },
          );
        },
      ),
    );
  }
}

class _HistoryCard extends StatelessWidget {
  final ChargingHistoryEntry entry;

  const _HistoryCard({required this.entry});

  @override
  Widget build(BuildContext context) {
    final start = entry.chargeStartDateTime != null 
        ? DateTime.tryParse(entry.chargeStartDateTime!) 
        : null;
    final dateStr = start != null ? DateFormat('MMM d, yyyy • h:mm a').format(start) : 'Unknown Date';

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: VoltColors.surfaceDark,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dateStr,
                style: const TextStyle(
                  color: VoltColors.textSecondaryDark,
                  fontSize: 14,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: VoltColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '\$${entry.totalCost.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: VoltColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.flash_on, color: VoltColors.primary, size: 24),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${entry.energyKwh.toStringAsFixed(1)} kWh',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    entry.locationId ?? 'Tesla Supercharger',
                    style: const TextStyle(
                      color: VoltColors.textTertiaryDark,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

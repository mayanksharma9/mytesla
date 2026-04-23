import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:voltride/core/theme/volt_colors.dart';
import 'package:voltride/features/dashboard/data/models/tesla_models.dart';
import 'package:voltride/features/dashboard/presentation/bloc/vehicle_bloc.dart';
import 'package:voltride/features/charging/presentation/bloc/charging_bloc.dart';

class ChargingHistoryPage extends StatefulWidget {
  const ChargingHistoryPage({super.key});

  @override
  State<ChargingHistoryPage> createState() => _ChargingHistoryPageState();
}

class _ChargingHistoryPageState extends State<ChargingHistoryPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    final vin = context.read<VehicleBloc>().state.selectedVehicle?.vin;
    context.read<ChargingBloc>().add(FetchChargingHistory(vin: vin));
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      final vin = context.read<VehicleBloc>().state.selectedVehicle?.vin;
      context.read<ChargingBloc>().add(LoadMoreChargingHistory(vin: vin));
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: VoltColors.background,
      appBar: AppBar(
        title: Text('CHARGING HISTORY',
            style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w800, letterSpacing: 2)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: BlocConsumer<ChargingBloc, ChargingState>(
        listener: (context, state) {
          if (state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error!), backgroundColor: VoltColors.error),
            );
          }
          if (state.successMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.successMessage!), backgroundColor: VoltColors.success),
            );
          }
        },
        builder: (context, state) {
          if (state.isHistoryLoading && state.history.isEmpty) {
            return const Center(
                child: CircularProgressIndicator(color: VoltColors.primary));
          }

          if (state.history.isEmpty && !state.isHistoryLoading) {
            return const Center(
              child: Text(
                'No charging history found.',
                style: TextStyle(color: VoltColors.textTertiaryDark),
              ),
            );
          }

          // Footer: spinner while loading more, "all loaded" when done.
          final footerCount = (state.isLoadingMore || !state.hasMoreHistory) ? 1 : 0;

          return RefreshIndicator(
            onRefresh: () async {
              final vin = context.read<VehicleBloc>().state.selectedVehicle?.vin;
              context.read<ChargingBloc>().add(FetchChargingHistory(vin: vin, refresh: true));
            },
            color: VoltColors.primary,
            child: ListView.separated(
              controller: _scrollController,
              padding: const EdgeInsets.all(24),
              itemCount: state.history.length + footerCount,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                if (index >= state.history.length) {
                  if (state.isLoadingMore) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: CircularProgressIndicator(color: VoltColors.primary),
                      ),
                    );
                  }
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: Text(
                        'All sessions loaded',
                        style: TextStyle(color: VoltColors.onSurfaceVariant, fontSize: 13),
                      ),
                    ),
                  );
                }
                final entry = state.history[index];
                return _HistoryCard(entry: entry);
              },
            ),
          );
        },
      ),
    );
  }
}

String _currencySymbol(String? code) {
  const symbols = {
    'USD': r'$', 'CAD': r'CA$', 'AUD': r'A$', 'NZD': r'NZ$',
    'EUR': '€', 'GBP': '£', 'NOK': 'kr', 'SEK': 'kr', 'DKK': 'kr',
    'CHF': 'CHF', 'CNY': '¥', 'JPY': '¥', 'KRW': '₩',
    'SGD': r'S$', 'HKD': r'HK$', 'MXN': r'MX$',
    'BRL': r'R$', 'INR': '₹',
  };
  final c = (code ?? 'USD').toUpperCase();
  return symbols[c] ?? c;
}

class _HistoryCard extends StatelessWidget {
  final ChargingHistoryEntry entry;

  const _HistoryCard({required this.entry});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // Parse timestamps
    final start = entry.chargeStartDateTime != null
        ? DateTime.tryParse(entry.chargeStartDateTime!)
        : null;
    final stop = entry.chargeStopDateTime != null
        ? DateTime.tryParse(entry.chargeStopDateTime!)
        : null;

    final dateStr = start != null
        ? DateFormat('MMM d, yyyy • h:mm a').format(start.toLocal())
        : 'Unknown Date';

    // Duration
    String durationStr = '';
    if (start != null && stop != null) {
      final diff = stop.difference(start);
      final h = diff.inHours;
      final m = diff.inMinutes.remainder(60);
      durationStr = h > 0 ? '${h}h ${m}m' : '${m}m';
    }

    // Cost display using actual currency code from the entry.
    final sym = _currencySymbol(entry.currencyCode);
    final costStr = entry.totalCost > 0
        ? '$sym${entry.totalCost.toStringAsFixed(2)}'
        : 'Free';

    // Rate from CHARGING fee
    final chargingFee = entry.fees.isNotEmpty
        ? entry.fees.firstWhere(
            (f) => f.feeType.toUpperCase() == 'CHARGING',
            orElse: () => entry.fees.first,
          )
        : null;
    final rateStr = chargingFee != null && chargingFee.rateBase > 0
        ? '$sym${chargingFee.rateBase.toStringAsFixed(2)}/${chargingFee.usageBase > 0 ? 'kWh' : 'min'}'
        : null;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? VoltColors.surfaceElevatedDark : VoltColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isDark ? Colors.white.withOpacity(0.06) : Colors.black.withOpacity(0.06),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row 1: date + cost badge
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dateStr,
                      style: TextStyle(
                        color: isDark ? VoltColors.textSecondaryDark : Colors.black87,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (durationStr.isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(
                        durationStr,
                        style: const TextStyle(
                          color: VoltColors.onSurfaceVariant,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: VoltColors.primary.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  costStr,
                  style: const TextStyle(
                    color: VoltColors.primary,
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),
          const Divider(color: Colors.white10, height: 1),
          const SizedBox(height: 14),

          // Row 2: energy + location + invoice button
          Row(
            children: [
              const Icon(Icons.bolt, color: VoltColors.primary, size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${entry.energyKwh.toStringAsFixed(2)} kWh',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      entry.locationName,
                      style: const TextStyle(
                        color: VoltColors.onSurfaceVariant,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (rateStr != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        rateStr,
                        style: const TextStyle(
                          color: VoltColors.onSurfaceVariant,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (entry.invoices.isNotEmpty)
                IconButton(
                  icon: const Icon(Icons.receipt_long, color: VoltColors.primary),
                  tooltip: 'Download Invoice',
                  onPressed: () => context.read<ChargingBloc>().add(
                    DownloadInvoice(entry.invoices.first.contentId),
                  ),
                ),
            ],
          ),

          // Row 3: fee breakdown chips (CHARGING, CONGESTION, etc.)
          if (entry.fees.length > 1) ...[
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 6,
              children: entry.fees.map((f) {
                final feeSym = _currencySymbol(f.currencyCode ?? entry.currencyCode);
                final label = '${_capitalize(f.feeType)}: '
                    '${f.totalDue > 0 ? '$feeSym${f.totalDue.toStringAsFixed(2)}' : 'Free'}';
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: isDark ? Colors.white.withOpacity(0.06) : Colors.black.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    label,
                    style: const TextStyle(fontSize: 10, color: VoltColors.onSurfaceVariant),
                  ),
                );
              }).toList(),
            ),
          ],
        ],
      ),
    );
  }

  String _capitalize(String s) {
    if (s.isEmpty) return s;
    return s[0].toUpperCase() + s.substring(1).toLowerCase();
  }
}

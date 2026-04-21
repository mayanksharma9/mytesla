import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:voltride/core/theme/volt_colors.dart';
import 'package:voltride/features/dashboard/data/models/tesla_models.dart';
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
    context.read<ChargingBloc>().add(const FetchChargingHistory());
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<ChargingBloc>().add(LoadMoreChargingHistory());
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
          if (state.isLoading && state.history.isEmpty) {
            return const Center(
                child: CircularProgressIndicator(color: VoltColors.primary));
          }

          if (state.history.isEmpty && !state.isLoading) {
            return const Center(
              child: Text(
                'No charging history found.',
                style: TextStyle(color: VoltColors.textTertiaryDark),
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              context.read<ChargingBloc>().add(const FetchChargingHistory(refresh: true));
            },
            color: VoltColors.primary,
            child: ListView.separated(
              controller: _scrollController,
              padding: const EdgeInsets.all(24),
              itemCount: state.hasMoreHistory
                  ? state.history.length + 1
                  : state.history.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                if (index >= state.history.length) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(color: VoltColors.primary),
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

class _HistoryCard extends StatelessWidget {
  final ChargingHistoryEntry entry;

  const _HistoryCard({required this.entry});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final start = entry.chargeStartDateTime != null
        ? DateTime.tryParse(entry.chargeStartDateTime!)
        : null;
    final dateStr = start != null
        ? DateFormat('MMM d, yyyy • h:mm a').format(start)
        : 'Unknown Date';

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isDark ? VoltColors.surfaceElevatedDark : VoltColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    const Icon(Icons.flash_on, color: VoltColors.primary, size: 24),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${entry.energyKwh.toStringAsFixed(1)} kWh',
                            style: theme.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            entry.locationId ?? 'Tesla Supercharger',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: VoltColors.onSurfaceVariant,
                              fontWeight: FontWeight.w600,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (entry.sessionId != null)
                IconButton(
                  icon: const Icon(Icons.receipt_long, color: VoltColors.primary),
                  tooltip: 'Download Invoice',
                  onPressed: () {
                    context.read<ChargingBloc>().add(DownloadInvoice(entry.sessionId!));
                  },
                ),
            ],
          ),
        ],
      ),
    );
  }
}

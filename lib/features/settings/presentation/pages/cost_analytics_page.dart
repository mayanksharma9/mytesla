import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:voltride/core/theme/volt_colors.dart';
import 'package:voltride/features/dashboard/data/models/tesla_models.dart';
import 'package:voltride/features/dashboard/presentation/bloc/vehicle_bloc.dart';
import 'dart:ui';

class CostAnalyticsPage extends StatefulWidget {
  const CostAnalyticsPage({super.key});

  @override
  State<CostAnalyticsPage> createState() => _CostAnalyticsPageState();
}

class _CostAnalyticsPageState extends State<CostAnalyticsPage> {
  Box get _prefs => Hive.box('user_prefs');
  Box<ChargeSession> get _chargeBox => Hive.box<ChargeSession>('charge_sessions');

  double _costPerKwh = 0.13;
  double _gasPricePerGallon = 3.50;
  double _gasCarMpg = 28.0;

  @override
  void initState() {
    super.initState();
    _costPerKwh = (_prefs.get('electricity_cost_per_kwh', defaultValue: 0.13) as num).toDouble();
    _gasPricePerGallon = (_prefs.get('gas_price_per_gallon', defaultValue: 3.50) as num).toDouble();
    _gasCarMpg = (_prefs.get('gas_car_mpg', defaultValue: 28.0) as num).toDouble();
  }

  List<ChargeSession> get _sessions => _chargeBox.values.toList()
    ..sort((a, b) => b.startTime.compareTo(a.startTime));

  double _sessionCost(ChargeSession s) => s.kwhAdded * _costPerKwh;

  double get _totalKwh => _sessions.fold(0.0, (sum, s) => sum + s.kwhAdded);
  double get _totalCost => _totalKwh * _costPerKwh;

  // Cost equivalent in gas for the same distance driven
  double get _gasCostEquivalent {
    final vehicle = context.read<VehicleBloc>().state.selectedVehicle;
    final effWh = vehicle != null && vehicle.odometer > 0
        ? (_totalKwh * 1000) / (vehicle.odometer > 0 ? vehicle.odometer : 1)
        : 350.0; // default Wh/mi
    final milesDriven = _totalKwh * 1000 / effWh;
    return milesDriven / _gasCarMpg * _gasPricePerGallon;
  }

  double get _savings => _gasCostEquivalent - _totalCost;

  // Monthly cost breakdown (last 6 months)
  Map<String, double> get _monthlyCosts {
    final result = <String, double>{};
    for (final s in _sessions) {
      final key = DateFormat('MMM yyyy').format(s.startTime);
      result[key] = (result[key] ?? 0) + _sessionCost(s);
    }
    return result;
  }

  List<MapEntry<String, double>> get _last6Months {
    final months = <String>[];
    for (int i = 5; i >= 0; i--) {
      final d = DateTime.now().subtract(Duration(days: i * 30));
      months.add(DateFormat('MMM yyyy').format(d));
    }
    final mc = _monthlyCosts;
    return months.map((m) => MapEntry(m, mc[m] ?? 0)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final cardColor = isDark ? VoltColors.surfaceElevatedDark : VoltColors.surfaceContainerLowest;
    final currency = NumberFormat.currency(symbol: '\$', decimalDigits: 2);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(72),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: AppBar(
              backgroundColor:
                  isDark ? Colors.black.withOpacity(0.6) : Colors.white.withOpacity(0.8),
              title: Text('Cost Analytics',
                  style: theme.textTheme.headlineLarge
                      ?.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 100, left: 20, right: 20, bottom: 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Settings row
            _SettingsCard(
              isDark: isDark,
              costPerKwh: _costPerKwh,
              gasPricePerGallon: _gasPricePerGallon,
              gasCarMpg: _gasCarMpg,
              onCostChanged: (v) {
                setState(() => _costPerKwh = v);
                _prefs.put('electricity_cost_per_kwh', v);
              },
              onGasPriceChanged: (v) {
                setState(() => _gasPricePerGallon = v);
                _prefs.put('gas_price_per_gallon', v);
              },
              onMpgChanged: (v) {
                setState(() => _gasCarMpg = v);
                _prefs.put('gas_car_mpg', v);
              },
            ),
            const SizedBox(height: 24),

            // Summary tiles
            Row(
              children: [
                Expanded(
                  child: _StatTile(
                    isDark: isDark,
                    label: 'Total Spent',
                    value: currency.format(_totalCost),
                    sub: '${_totalKwh.toStringAsFixed(1)} kWh',
                    color: VoltColors.primary,
                    icon: Icons.bolt,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _StatTile(
                    isDark: isDark,
                    label: 'Gas Equivalent',
                    value: currency.format(_gasCostEquivalent),
                    sub: 'at ${_gasPricePerGallon.toStringAsFixed(2)}/gal',
                    color: VoltColors.warning,
                    icon: Icons.local_gas_station,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _SavingsBanner(isDark: isDark, savings: _savings, currency: currency),

            const SizedBox(height: 28),

            // Monthly chart
            _SectionLabel('MONTHLY SPEND'),
            const SizedBox(height: 12),
            _MonthlyChart(isDark: isDark, data: _last6Months, costPerKwh: _costPerKwh),

            const SizedBox(height: 28),

            // Recent sessions
            _SectionLabel('RECENT SESSIONS'),
            const SizedBox(height: 12),
            if (_sessions.isEmpty)
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Text('No charging sessions recorded yet',
                      style: TextStyle(color: VoltColors.onSurfaceVariant)),
                ),
              )
            else
              ...(_sessions.take(20).map((s) => _SessionCostTile(
                    isDark: isDark,
                    session: s,
                    cost: _sessionCost(s),
                    currency: currency,
                  ))),
          ],
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel(this.text);
  @override
  Widget build(BuildContext context) => Text(text,
      style: const TextStyle(
          fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 2, color: VoltColors.outline));
}

class _SettingsCard extends StatelessWidget {
  final bool isDark;
  final double costPerKwh;
  final double gasPricePerGallon;
  final double gasCarMpg;
  final ValueChanged<double> onCostChanged;
  final ValueChanged<double> onGasPriceChanged;
  final ValueChanged<double> onMpgChanged;

  const _SettingsCard({
    required this.isDark,
    required this.costPerKwh,
    required this.gasPricePerGallon,
    required this.gasCarMpg,
    required this.onCostChanged,
    required this.onGasPriceChanged,
    required this.onMpgChanged,
  });

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDark ? VoltColors.surfaceElevatedDark : VoltColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: VoltColors.primary.withOpacity(0.15)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Rate Settings',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            const SizedBox(height: 12),
            _RateRow(
                label: 'Electricity Cost',
                value: '\$${costPerKwh.toStringAsFixed(3)}/kWh',
                onTap: () => _editRate(context, r'Electricity ($/kWh)', costPerKwh, onCostChanged)),
            const Divider(height: 16, color: Colors.white10),
            _RateRow(
                label: 'Gas Price',
                value: '\$${gasPricePerGallon.toStringAsFixed(2)}/gal',
                onTap: () => _editRate(context, r'Gas Price ($/gal)', gasPricePerGallon, onGasPriceChanged)),
            const Divider(height: 16, color: Colors.white10),
            _RateRow(
                label: 'Comparison Car MPG',
                value: '${gasCarMpg.toStringAsFixed(0)} MPG',
                onTap: () => _editRate(context, 'Gas Car MPG', gasCarMpg, onMpgChanged)),
          ],
        ),
      );

  void _editRate(BuildContext context, String label, double current, ValueChanged<double> onChanged) {
    final ctrl = TextEditingController(text: current.toStringAsFixed(3));
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(label),
        content: TextField(
          controller: ctrl,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(border: OutlineInputBorder()),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          FilledButton(
            onPressed: () {
              final v = double.tryParse(ctrl.text);
              if (v != null) onChanged(v);
              Navigator.pop(ctx);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}

class _RateRow extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback onTap;
  const _RateRow({required this.label, required this.value, required this.onTap});
  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(color: VoltColors.onSurfaceVariant, fontSize: 13)),
            Row(
              children: [
                Text(value,
                    style: const TextStyle(fontWeight: FontWeight.bold, color: VoltColors.primary)),
                const SizedBox(width: 4),
                const Icon(Icons.edit, size: 14, color: VoltColors.onSurfaceVariant),
              ],
            ),
          ],
        ),
      );
}

class _StatTile extends StatelessWidget {
  final bool isDark;
  final String label;
  final String value;
  final String sub;
  final Color color;
  final IconData icon;
  const _StatTile(
      {required this.isDark,
      required this.label,
      required this.value,
      required this.sub,
      required this.color,
      required this.icon});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDark ? VoltColors.surfaceElevatedDark : VoltColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(height: 8),
            Text(value,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: color)),
            const SizedBox(height: 2),
            Text(label,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            Text(sub, style: const TextStyle(fontSize: 11, color: VoltColors.onSurfaceVariant)),
          ],
        ),
      );
}

class _SavingsBanner extends StatelessWidget {
  final bool isDark;
  final double savings;
  final NumberFormat currency;
  const _SavingsBanner({required this.isDark, required this.savings, required this.currency});

  @override
  Widget build(BuildContext context) {
    final isPositive = savings > 0;
    final color = isPositive ? VoltColors.success : VoltColors.error;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(isPositive ? Icons.savings : Icons.trending_down, color: color),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isPositive ? 'You\'ve saved ${currency.format(savings)}' : 'No savings data yet',
                  style: TextStyle(fontWeight: FontWeight.bold, color: color),
                ),
                Text(
                  isPositive
                      ? 'vs. driving an equivalent gas car'
                      : 'Drive more to see savings vs. gas',
                  style: TextStyle(fontSize: 12, color: color.withOpacity(0.7)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MonthlyChart extends StatelessWidget {
  final bool isDark;
  final List<MapEntry<String, double>> data;
  final double costPerKwh;
  const _MonthlyChart({required this.isDark, required this.data, required this.costPerKwh});

  @override
  Widget build(BuildContext context) {
    final maxY = data.map((e) => e.value).fold(0.0, (a, b) => a > b ? a : b);
    final bars = data.asMap().entries.map((e) => BarChartGroupData(
          x: e.key,
          barRods: [
            BarChartRodData(
              toY: e.value.value,
              color: VoltColors.primary,
              width: 24,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
            )
          ],
        )).toList();

    return Container(
      height: 180,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? VoltColors.surfaceElevatedDark : VoltColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(20),
      ),
      child: BarChart(
        BarChartData(
          maxY: maxY == 0 ? 10 : maxY * 1.2,
          barGroups: bars,
          borderData: FlBorderData(show: false),
          gridData: const FlGridData(show: false),
          titlesData: FlTitlesData(
            leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (v, _) {
                  final idx = v.toInt();
                  if (idx < 0 || idx >= data.length) return const SizedBox.shrink();
                  return Text(data[idx].key.substring(0, 3),
                      style: const TextStyle(fontSize: 10, color: VoltColors.onSurfaceVariant));
                },
              ),
            ),
          ),
          barTouchData: BarTouchData(
            touchTooltipData: BarTouchTooltipData(
              getTooltipItem: (group, _, rod, __) => BarTooltipItem(
                '\$${rod.toY.toStringAsFixed(2)}',
                const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SessionCostTile extends StatelessWidget {
  final bool isDark;
  final ChargeSession session;
  final double cost;
  final NumberFormat currency;
  const _SessionCostTile(
      {required this.isDark,
      required this.session,
      required this.cost,
      required this.currency});

  @override
  Widget build(BuildContext context) {
    final dateStr = DateFormat('MMM d, h:mm a').format(session.startTime);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDark ? VoltColors.surfaceElevatedDark : VoltColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: VoltColors.success.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.bolt, color: VoltColors.success, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(dateStr, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                Text(
                  '${session.kwhAdded.toStringAsFixed(1)} kWh · '
                  '${session.startSoc.toStringAsFixed(0)}% → ${session.endSoc.toStringAsFixed(0)}%',
                  style: const TextStyle(color: VoltColors.onSurfaceVariant, fontSize: 12),
                ),
              ],
            ),
          ),
          Text(currency.format(cost),
              style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/volt_colors.dart';
import '../bloc/telemetry_bloc.dart';
import '../../data/models/telemetry_models.dart';

class TelemetrySetupPage extends StatefulWidget {
  final String vehicleId;

  const TelemetrySetupPage({super.key, required this.vehicleId});

  @override
  State<TelemetrySetupPage> createState() => _TelemetrySetupPageState();
}

class _TelemetrySetupPageState extends State<TelemetrySetupPage> {
  final _hostnameController = TextEditingController();
  final _caController = TextEditingController();

  final List<String> _availableFields = [
    'VehicleSpeed',
    'Location',
    'Soc',
    'DoorState',
    'Odometer',
    'Locked',
    'EstBatteryRange',
    'ChargeAmps',
    'DetailedChargeState',
    'VehicleName',
    'InsideTemp',
    'OutsideTemp',
  ];

  @override
  void dispose() {
    _hostnameController.dispose();
    _caController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VoltColors.backgroundDark,
      appBar: AppBar(
        title: const Text('Fleet Telemetry'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocConsumer<TelemetryBloc, TelemetryState>(
        listener: (context, state) {
          if (state.status == TelemetryStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Telemetry configured successfully')),
            );
            Navigator.pop(context);
          } else if (state.status == TelemetryStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error ?? 'Configuration failed')),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'STREAMING CONFIGURATION',
                  style: TextStyle(
                    color: VoltColors.textTertiaryDark,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: _hostnameController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Server URL (wss://...)',
                    labelStyle: const TextStyle(color: VoltColors.textSecondaryDark),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: VoltColors.primary),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _caController,
                  maxLines: 3,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'CA Certificate (Optional)',
                    labelStyle: const TextStyle(color: VoltColors.textSecondaryDark),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: VoltColors.primary),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  'DATA FIELDS',
                  style: TextStyle(
                    color: VoltColors.textTertiaryDark,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 16),
                ..._availableFields.map((field) {
                  final isSelected = state.selectedFields.containsKey(field);
                  final config = state.selectedFields[field];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: VoltColors.surfaceDark,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isSelected ? VoltColors.primary.withOpacity(0.3) : Colors.transparent,
                      ),
                    ),
                    child: Row(
                      children: [
                        Checkbox(
                          value: isSelected,
                          activeColor: VoltColors.primary,
                          onChanged: (val) {
                            if (val == true) {
                              context.read<TelemetryBloc>().add(
                                UpdateFieldConfig(field, const TelemetryFieldConfig(intervalSeconds: 10)),
                              );
                            } else {
                              context.read<TelemetryBloc>().add(UpdateFieldConfig(field, null));
                            }
                          },
                        ),
                        Expanded(
                          child: Text(
                            field,
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                          ),
                        ),
                        if (isSelected) ...[
                          const Text('Interval: ', style: TextStyle(color: VoltColors.textTertiaryDark, fontSize: 12)),
                          SizedBox(
                            width: 40,
                            child: DropdownButton<int>(
                              value: config?.intervalSeconds ?? 10,
                              dropdownColor: VoltColors.surfaceDark,
                              underline: const SizedBox(),
                              style: const TextStyle(color: VoltColors.primary, fontSize: 12),
                              items: [1, 5, 10, 30, 60].map((i) {
                                return DropdownMenuItem(value: i, child: Text('${i}s'));
                              }).toList(),
                              onChanged: (val) {
                                if (val != null) {
                                  context.read<TelemetryBloc>().add(
                                    UpdateFieldConfig(field, TelemetryFieldConfig(intervalSeconds: val)),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ],
                    ),
                  );
                }),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: state.status == TelemetryStatus.loading
                        ? null
                        : () {
                            if (_hostnameController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Please enter server URL')),
                              );
                              return;
                            }
                            context.read<TelemetryBloc>().add(
                              ConfigureTelemetryRequested(
                                vehicleId: widget.vehicleId,
                                hostname: _hostnameController.text,
                                ca: _caController.text.isEmpty ? null : _caController.text,
                              ),
                            );
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: VoltColors.primary,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleAt(borderRadius: BorderRadius.circular(16)),
                    ),
                    child: state.status == TelemetryStatus.loading
                        ? const CircularProgressIndicator(color: Colors.black)
                        : const Text(
                            'APPLY CONFIGURATION',
                            style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2),
                          ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Note: Fleet Telemetry requires your secure Virtual Key to be paired with the vehicle.',
                  style: TextStyle(color: VoltColors.textTertiaryDark, fontSize: 12, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class RoundedRectangleAt extends OutlinedBorder {
  final BorderRadius borderRadius;
  const RoundedRectangleAt({this.borderRadius = BorderRadius.zero});

  @override
  OutlinedBorder copyWith({BorderSide? side, BorderRadiusGeometry? borderRadius}) {
    return RoundedRectangleAt(borderRadius: (borderRadius ?? this.borderRadius) as BorderRadius);
  }

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path()..addRRect(borderRadius.toRRect(rect).deflate(side.width));
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()..addRRect(borderRadius.toRRect(rect));
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    if (rect.isEmpty) return;
    final paint = side.toPaint();
    final outer = borderRadius.toRRect(rect);
    canvas.drawRRect(outer, paint);
  }

  @override
  ShapeBorder scale(double t) {
    return RoundedRectangleAt(borderRadius: borderRadius * t);
  }
}

import '../../domain/vehicle.dart';
import '../models/tesla_models.dart';
import 'telemetry_analytics_service.dart';

class SmartSuggestion {
  final String title;
  final String description;
  final String icon;
  final bool isActionable;
  final String? actionLabel;

  SmartSuggestion({
    required this.title,
    required this.description,
    required this.icon,
    this.isActionable = false,
    this.actionLabel,
  });
}

class IntelligenceEngine {
  final TelemetryAnalyticsService _analyticsService;

  IntelligenceEngine(this._analyticsService);

  List<SmartSuggestion> generateSuggestions({
    required Vehicle vehicle,
    required List<BatterySnapshot> history,
    required VehicleCache? cache,
  }) {
    final suggestions = <SmartSuggestion>[];

    // 1. Charge Limit Suggestion (Feature 8)
    if (cache?.batteryType?.contains('LFP') == true) {
      if (vehicle.chargeLimitSoc < 100) {
        suggestions.add(SmartSuggestion(
          title: 'Optimize LFP Battery',
          description: 'Tesla recommends charging LFP batteries to 100% at least once a week to maintain calibration.',
          icon: 'battery_charging_full',
          isActionable: true,
          actionLabel: 'Set to 100%',
        ));
      }
    } else {
      if (vehicle.chargeLimitSoc > 90 && history.isNotEmpty) {
        suggestions.add(SmartSuggestion(
          title: 'Daily Driving Limit',
          description: 'For daily use, a charge limit of 80% or 90% is recommended for long-term health.',
          icon: 'battery_saver',
          isActionable: true,
          actionLabel: 'Set to 80%',
        ));
      }
    }

    // 2. Battery Health Insight (Feature 4)
    if (history.isNotEmpty && cache != null) {
      final report = _analyticsService.generateBatteryHealthReport(cache, history.first);
      final healthGrade = report['grade'] as String? ?? 'N/A';
      final degradation = report['degradation'] as double? ?? 0.0;

      if (healthGrade == 'F' || healthGrade == 'D') {
        suggestions.add(SmartSuggestion(
          title: 'Battery Health Warning',
          description: 'Significant degradation detected (${degradation.toStringAsFixed(1)}%). Consider a service check.',
          icon: 'warning',
        ));
      } else if (healthGrade == 'A' || healthGrade == 'B') {
         suggestions.add(SmartSuggestion(
          title: 'Excellent Battery Health',
          description: 'Your battery is performing better than average. Keep up the good charging habits!',
          icon: 'verified',
        ));
      }
    }

    // 3. Tire Pressure Suggestion (Feature 11)
    final pressures = [
      vehicle.tpmsPressureFl,
      vehicle.tpmsPressureFr,
      vehicle.tpmsPressureRl,
      vehicle.tpmsPressureRr,
    ];
    
    if (pressures.any((p) => p != null && p < 38)) {
       suggestions.add(SmartSuggestion(
          title: 'Low Tire Pressure',
          description: 'One or more tires are below 38 PSI. Proper inflation improves efficiency by up to 3%.',
          icon: 'tire_repair',
        ));
    }

    // 4. Ghost Drain Detection (Feature 7)
    if (history.length > 2) {
      final last = history.first;
      final prev = history[1];
      final timeDiff = last.timestamp.difference(prev.timestamp).inHours;
      if (timeDiff > 4 && last.shiftState == 'P' && prev.shiftState == 'P') {
        final drain = prev.batteryLevel - last.batteryLevel;
        if (drain > 2) {
          suggestions.add(SmartSuggestion(
            title: 'Ghost Drain Alert',
            description: 'Your car lost ${drain}% battery while parked. Sentry mode or 3rd party apps might be the cause.',
            icon: 'visibility',
          ));
        }
      }
    }

    return suggestions;
  }
}

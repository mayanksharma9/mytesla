import '../models/tesla_models.dart';

class TelemetryAnalyticsService {
  
  double calculateVampireDrain(List<BatterySnapshot> history, int hours) {
    if (history.length < 2) return 0.0;

    final now = DateTime.now();
    final cutoff = now.subtract(Duration(hours: hours));
    
    final recent = history.where((s) => s.timestamp.isAfter(cutoff)).toList();
    if (recent.length < 2) return 0.0;

    double totalDrain = 0.0;
    for (int i = 0; i < recent.length - 1; i++) {
        final current = recent[i];
        final next = recent[i+1];
        if (current.shiftState == 'P' && next.batteryLevel < current.batteryLevel) {
          totalDrain += (current.batteryLevel - next.batteryLevel);
        }
    }
    return totalDrain;
  }

  double getHealthScore(double currentMaxRange, double originalMaxRange) {
    if (originalMaxRange <= 0) return 100.0;
    return (currentMaxRange / originalMaxRange) * 100;
  }

  String getGradeFromScore(double score) {
    if (score >= 95) return 'A';
    if (score >= 90) return 'B';
    if (score >= 85) return 'C';
    if (score >= 80) return 'D';
    return 'F';
  }

  Map<String, dynamic> generateBatteryHealthReport(VehicleCache specs, BatterySnapshot latest) {
    // 1. Calculate Estimated Max Range at 100%
    // If battery is at 80% and range is 200mi, then 100% is 250mi.
    final estMaxRange = (latest.idealBatteryRange / (latest.batteryLevel / 100.0));
    final originalRange = specs.originalRangeRating ?? 0.0;
    
    final healthScore = getHealthScore(estMaxRange, originalRange);
    final degradation = 100.0 - healthScore;
    final healthGrade = getGradeFromScore(healthScore);

    // 2. Estimated Capacity
    final estCapacity = (specs.batteryCapacityKwh ?? 0.0) * (healthScore / 100.0);

    return {
      'grade': healthGrade,
      'score': healthScore,
      'degradation': degradation,
      'estimated_capacity': estCapacity,
      'original_capacity': specs.batteryCapacityKwh,
      'estimated_max_range': estMaxRange,
      'original_range': originalRange,
    };
  }

  // Gets daily averages for SOC
  Map<DateTime, double> getDailySocAverages(List<BatterySnapshot> history) {
    final Map<DateTime, List<double>> dailyPoints = {};

    for (var s in history) {
      final date = DateTime(s.timestamp.year, s.timestamp.month, s.timestamp.day);
      dailyPoints.putIfAbsent(date, () => []).add(s.batteryLevel.toDouble());
    }

    return dailyPoints.map((date, levels) => MapEntry(date, levels.reduce((a, b) => a + b) / levels.length));
  }

  double calculateMilesDrivenToday(List<BatterySnapshot> history) {
    if (history.isEmpty) return 0.0;

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    
    final todayStats = history.where((s) => s.timestamp.isAfter(today)).toList();
    if (todayStats.length < 2) return 0.0;

    todayStats.sort((a, b) => a.timestamp.compareTo(b.timestamp));
    
    return todayStats.last.odometer - todayStats.first.odometer;
  }

  // Energy used in kWh (Estimated)
  double calculateEnergyUsedToday(List<BatterySnapshot> history, {VehicleCache? specs}) {
    if (history.isEmpty) return 0.0;

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    
    final todayStats = history.where((s) => s.timestamp.isAfter(today)).toList();
    if (todayStats.length < 2) return 0.0;

    todayStats.sort((a, b) => a.timestamp.compareTo(b.timestamp));

    double totalDrainSoc = 0.0;
    for (int i = 0; i < todayStats.length - 1; i++) {
        final current = todayStats[i];
        final next = todayStats[i+1];
        // Only count if level decreased (ignoring charging increases)
        if (next.batteryLevel < current.batteryLevel) {
          totalDrainSoc += (current.batteryLevel - next.batteryLevel);
        }
    }

    // Use actual capacity if available, otherwise assume 75 kWh (typical for Model 3/Y LR)
    final capacity = specs?.batteryCapacityKwh ?? 75.0;
    return totalDrainSoc * (capacity / 100.0);
  }

  double calculateEfficiencyScoreToday(List<BatterySnapshot> history, {VehicleCache? specs}) {
    final miles = calculateMilesDrivenToday(history);
    final energy = calculateEnergyUsedToday(history, specs: specs);

    if (energy <= 0) return 100.0;
    
    // Efficiency: miles per kWh. Typical is 3-4. 
    // Normalized to 0-100 score where 4.0 mi/kWh (250 Wh/mi) is 100%
    final miPerKwh = miles / energy;
    final score = (miPerKwh / 4.0) * 100;
    
    return score.clamp(0, 100);
  }

  double calculateEfficiencyWhPerMi(DriveSession session) {
    if (session.distance <= 0) return 0;
    return (session.energyUsedKwh * 1000) / session.distance;
  }

  double calculateMilesDrivenTodayFromTrips(List<DriveSession> sessions) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    
    return sessions
        .where((s) => s.startTime.isAfter(today))
        .fold(0.0, (sum, s) => sum + s.distance);
  }

  double calculateEnergyUsedTodayFromTrips(List<DriveSession> sessions) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    
    return sessions
        .where((s) => s.startTime.isAfter(today))
        .fold(0.0, (sum, s) => sum + s.energyUsedKwh);
  }
}

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
  double calculateEnergyUsedToday(List<BatterySnapshot> history) {
    if (history.isEmpty) return 0.0;

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    
    final todayStats = history.where((s) => s.timestamp.isAfter(today)).toList();
    if (todayStats.length < 2) return 0.0;

    todayStats.sort((a, b) => a.timestamp.compareTo(b.timestamp));

    double totalDrain = 0.0;
    for (int i = 0; i < todayStats.length - 1; i++) {
        final current = todayStats[i];
        final next = todayStats[i+1];
        // Only count if level decreased (ignoring charging increases)
        if (next.batteryLevel < current.batteryLevel) {
          totalDrain += (current.batteryLevel - next.batteryLevel);
        }
    }

    // Estimate 0.75 kWh per 1% SOC drop (Typical for Model 3/Y)
    return totalDrain * 0.75;
  }

  double calculateEfficiencyScoreToday(List<BatterySnapshot> history) {
    final miles = calculateMilesDrivenToday(history);
    final energy = calculateEnergyUsedToday(history);

    if (energy <= 0) return 100.0;
    
    // Efficiency: miles per kWh. Typical is 3-4. 
    // Normalized to 0-100 score where 4 mi/kWh is 100%
    final miPerKwh = miles / energy;
    final score = (miPerKwh / 4.0) * 100;
    
    return score.clamp(0, 100);
  }
}

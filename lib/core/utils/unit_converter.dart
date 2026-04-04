class UnitConverter {
  /// Format temperature based on user preference.
  /// Standard Tesla API returns Celsius.
  static String formatTemperature(double? celsius, {required bool useFahrenheit}) {
    if (celsius == null) return '--';
    if (useFahrenheit) {
      final f = (celsius * 9 / 5) + 32;
      return '${f.toStringAsFixed(1)}°F';
    }
    return '${celsius.toStringAsFixed(1)}°C';
  }

  /// Format distance based on user preference.
  /// Standard Tesla API returns Miles for Range, and Miles for Odometer? 
  /// Actually, Tesla API 'battery_range' is always miles, but 'odometer' depends on vehicle.
  /// Wait, Fleet API 'odometer' is in miles by default? 
  /// Let's assume input is Miles and convert to KM if needed.
  static String formatDistance(double? miles, {required bool useMiles, int precision = 1}) {
    if (miles == null) return '--';
    if (useMiles) {
      return '${miles.toStringAsFixed(precision)} mi';
    }
    final km = miles * 1.60934;
    return '${km.toStringAsFixed(precision)} km';
  }

  /// Format pressure based on user preference.
  /// Standard Tesla API returns Bar.
  static String formatPressure(double? bar, {String? unit}) {
    if (bar == null) return '--';
    final targetUnit = unit ?? 'Psi';
    
    if (targetUnit == 'Psi') {
      final psi = bar * 14.5038;
      return '${psi.toStringAsFixed(1)} PSI';
    } else if (targetUnit == 'kPa') {
       final kpa = bar * 100;
       return '${kpa.toStringAsFixed(0)} kPa';
    }
    return '${bar.toStringAsFixed(2)} Bar';
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class TripModel {
  final String id;
  final String status;
  final DateTime startTime;
  final DateTime? endTime;
  final double startOdometer;
  final double? endOdometer;
  final double startBatteryLevel;
  final double? endBatteryLevel;
  final double? distanceMiles;
  final double? energyUsedPercent;
  final List<TripRoutePoint> routePoints;

  TripModel({
    required this.id,
    required this.status,
    required this.startTime,
    this.endTime,
    required this.startOdometer,
    this.endOdometer,
    required this.startBatteryLevel,
    this.endBatteryLevel,
    this.distanceMiles,
    this.energyUsedPercent,
    required this.routePoints,
  });

  factory TripModel.fromFirestore(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>;
    return TripModel(
      id: doc.id,
      status: data['status'] ?? 'unknown',
      startTime: (data['start_time'] as Timestamp).toDate(),
      endTime: data['end_time'] != null ? (data['end_time'] as Timestamp).toDate() : null,
      startOdometer: (data['start_odometer'] ?? 0).toDouble(),
      endOdometer: data['end_odometer'] != null ? (data['end_odometer']).toDouble() : null,
      startBatteryLevel: (data['start_battery_level'] ?? 0).toDouble(),
      endBatteryLevel: data['end_battery_level'] != null ? (data['end_battery_level']).toDouble() : null,
      distanceMiles: data['distance_miles'] != null ? (data['distance_miles']).toDouble() : null,
      energyUsedPercent: data['energy_used_percent'] != null ? (data['energy_used_percent']).toDouble() : null,
      routePoints: _parseRoutePoints(data['route_points']),
    );
  }

  static List<TripRoutePoint> _parseRoutePoints(dynamic pointsData) {
    if (pointsData == null || pointsData is! List) return [];
    return pointsData.map((e) => TripRoutePoint.fromMap(e as Map<String, dynamic>)).toList();
  }
}

class TripRoutePoint {
  final double lat;
  final double lon;
  final int timestamp;

  TripRoutePoint({required this.lat, required this.lon, required this.timestamp});

  factory TripRoutePoint.fromMap(Map<String, dynamic> map) {
    return TripRoutePoint(
      lat: (map['lat'] ?? 0).toDouble(),
      lon: (map['lon'] ?? 0).toDouble(),
      timestamp: map['ts'] ?? 0,
    );
  }
}

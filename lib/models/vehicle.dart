
class Vehicle {
  final String id;
  final String vin;
  final String displayName;
  final String state;

  Vehicle({
    required this.id,
    required this.vin,
    required this.displayName,
    required this.state,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      id: json['id_s'],
      vin: json['vin'],
      displayName: json['display_name'],
      state: json['state'],
    );
  }
}

import 'package:equatable/equatable.dart';

enum ProductType { vehicle, powerwall, solar, unknown }

class TeslaProduct extends Equatable {
  final String id;
  final String? energySiteId;
  final String? siteName;
  final ProductType type;
  final String? vin;

  const TeslaProduct({
    required this.id,
    this.energySiteId,
    this.siteName,
    required this.type,
    this.vin,
  });

  @override
  List<Object?> get props => [id, energySiteId, siteName, type, vin];
}

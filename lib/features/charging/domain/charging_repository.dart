import '../../dashboard/data/models/tesla_models.dart';

abstract class ChargingRepository {
  Future<List<ChargingLocation>> getChargingLocations();
  Future<ChargingTariff?> getChargingTariffs(String locationId);
}

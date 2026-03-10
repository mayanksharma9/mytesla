import 'package:voltride/core/network/tesla_api_client.dart';
import 'package:voltride/features/dashboard/data/models/tesla_models.dart';
import 'package:voltride/features/charging/domain/charging_repository.dart';

class ChargingRepositoryImpl implements ChargingRepository {
  final TeslaApiClient _apiClient;

  ChargingRepositoryImpl(this._apiClient);

  @override
  Future<List<ChargingLocation>> getChargingLocations() async {
    return await _apiClient.getChargingLocations();
  }

  @override
  Future<ChargingTariff?> getChargingTariffs(String locationId) async {
    return await _apiClient.getChargingTariffs(locationId);
  }
}

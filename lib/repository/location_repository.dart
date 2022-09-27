import 'package:weather_app/model/location_model.dart';
import 'package:weather_app/services/location_services.dart';

class LocationRepository {
  Future<Location?> getLocation({
    required String cityName,
    int limit = 1,
  }) async {
    final locations =
        await LocationServices.getLocation(city: cityName, limit: limit);
    return locations.isEmpty ? null : locations.first;
  }
}

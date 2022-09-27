import 'package:flutter/foundation.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/repository/location_repository.dart';
import 'package:weather_app/repository/weather_repository.dart';

class WeatherResult {
  final LocationRepository _locationRepository;
  final WeatherRepository _weatherRepository;

  const WeatherResult(this._locationRepository, this._weatherRepository);

  Future<Weather?> getResult({required String city}) async {
    final location = await _locationRepository.getLocation(cityName: city);
    if (location == null) return null;

    debugPrint("location is $location");

    final weather = await _weatherRepository.getWeather(
        latitude: location.latitude, longitude: location.longitude);
    return Weather(
      temperature: weather!.temperature,
      windspeed: weather.windspeed,
      weathercode: weather.weathercode,
    );
  }
}

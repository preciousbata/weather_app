import 'dart:convert';

import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

class WeatherRepository {
  Future<Weather?> getWeather({
    required double latitude,
    required double longitude,
  }) async {
    final response = await WeatherServices.getWeather(
        latitude: latitude, longitude: longitude);

    if (response.statusCode == 200) {
      final decodedWeatherResponse = jsonDecode(response.body);
      if (decodedWeatherResponse['current_weather'] != null) {
        return Weather.fromJson(decodedWeatherResponse['current_weather']);
      } else {
        throw WeatherNotFoundFailure();
      }
    }
    return null;
  }
}

class WeatherNotFoundFailure implements Exception {
}

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:weather_app/model/location_model.dart';

class LocationServices {
  static const _locationBaseUrl = 'https://geocoding-api.open-meteo.com';

  static Future<List<Location>> getLocation({
    required String city,
    int limit = 1,
  }) async {
    final String url = "$_locationBaseUrl/v1/search?name=$city&limit=$limit";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == HttpStatus.ok) {
      // 1st way
      final locationResponse =
          LocationDtoResponse.fromJson(jsonDecode(response.body));
      //return locationResponse.locations;
      // 2nd way
      final results = jsonDecode(response.body)['results'] as List<dynamic>;
      //return results.map((e) => Location.fromJson(e)).toList();

      // 3rd way
      return locationResponseFromJson(response.body);
    } else {
      throw Exception("something went wrong ${response.statusCode}");
    }
  }
}

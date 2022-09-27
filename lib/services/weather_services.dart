import 'package:http/http.dart' as http;

class WeatherServices {


  // https://api.open-meteo.com/v1/forecast?latitude=41.85003&longitude=-87.65005&current_weather=true
  static const weatherBaseUrl = 'https://api.open-meteo.com';

  static Future<http.Response> getWeather(
      {required double latitude, required double longitude}) async {

    final String url = "$weatherBaseUrl/v1/forecast?latitude=$latitude&longitude=$longitude&current_weather=true";
    return http.get(Uri.parse(url));
  }
}

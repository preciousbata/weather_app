// To parse this JSON data, do
//
//     final weather = weatherFromJson(jsonString);

import 'dart:convert';

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));

String weatherToJson(Weather data) => json.encode(data.toJson());

class Weather {
  Weather({
    required this.temperature,
    required this.windspeed,
    required this.weathercode,
  });

  num temperature;
  num windspeed;
  num weathercode;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    temperature: json["temperature"],
    windspeed: json["windspeed"],
    weathercode: json["weathercode"],
  );

  Map<String, dynamic> toJson() => {
    "temperature": temperature,
    "windspeed": windspeed,
    "weathercode": weathercode,
  };
}

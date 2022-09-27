// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

// To parse this JSON data, do
//
//     final location = locationFromJson(jsonString);

import 'dart:convert';


List<Location> locationResponseFromJson(String str) => List<Location>.from(json.decode(str)['results'].map((x) => Location.fromJson(x)));


Location locationFromJson(String str) => Location.fromJson(json.decode(str));

String locationToJson(Location data) => json.encode(data.toJson());

class Location {
  Location({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  int id;
  String name;
  double latitude;
  double longitude;


  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        name: json["name"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
      };

  @override
  String toString() {
    return 'Location{id: $id, name: $name, latitude: $latitude, longitude: $longitude}';
  }
}

class LocationDtoResponse {
  final List<Location> locations;

  LocationDtoResponse(this.locations);

  factory LocationDtoResponse.fromJson(Map<String, dynamic> json) =>
      LocationDtoResponse((json['results'] as List<dynamic>)
          .map((e) => Location.fromJson(e))
          .toList());
}

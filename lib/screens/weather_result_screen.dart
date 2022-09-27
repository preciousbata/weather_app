import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherResultScreen extends StatelessWidget {
  final Weather weather;

  const WeatherResultScreen({Key? key, required this.weather})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '${weather.temperature} Celsius',
          style: const TextStyle(
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}

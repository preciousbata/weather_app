import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/screens/weather_result_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<WeatherBloc, WeatherState>(
      listener: (context, state) {
        if (state is WeatherLoadedState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WeatherResultScreen(
                weather: Weather(
                    temperature: state.weather.temperature,
                    windspeed: state.weather.windspeed,
                    weathercode: state.weather.weathercode),
              ),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitialState) {
              return buildInitialPage();
            } else if (state is WeatherLoadingState) {
              return buildLoadingScreen();
            } else if (state is ErrorState) {
              return buildErrorScreen(state.message);
            }
            return buildInitialPage();
          },
        ),
      ),
    );
  }

  SafeArea buildInitialPage() {
    return SafeArea(
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          return Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              const Text(
                'WEATHER APP',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  onSubmitted: (word) => BlocProvider.of<WeatherBloc>(context)
                      .add(FetchWeather(word)),
                  decoration: InputDecoration(
                    hintText: 'City Name',
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.search),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget buildLoadingScreen() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget buildErrorScreen(String message) {
    return Center(child: Text(message));
  }
}

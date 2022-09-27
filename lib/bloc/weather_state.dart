part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherInitialState extends WeatherState {
  @override
  List<Object> get props => [];

}class WeatherLoadingState extends WeatherState {
  @override
  List<Object> get props => [];

}class WeatherLoadedState extends WeatherState {
  final Weather weather;

  const WeatherLoadedState({required this.weather});

  @override
  List<Object> get props => [weather];

}class ErrorState extends WeatherState {
  final String message;

  const ErrorState(this.message);
  @override
  List<Object> get props => [];
}

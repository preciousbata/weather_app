import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_app/repository/result.dart';

import '../model/weather_model.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherResult _weatherResult;

  WeatherBloc(this._weatherResult) : super(WeatherInitialState()) {
    on<FetchWeather>(
      (event, emit) async {
        emit(WeatherLoadingState());
        try {
          final result = await _weatherResult.getResult(city: event.cityName);
          if (result == null) {
            emit(const ErrorState('Something went wrong'));
          }else{
            emit(WeatherLoadedState(weather: result));
          }
        } catch (exception) {
          debugPrint("exception getting weather is ${exception.toString()}");
          emit(const ErrorState('Something went wrong'));
        }
      },
    );
  }
}

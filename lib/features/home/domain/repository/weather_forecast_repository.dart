import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/constants/constants.dart';
import 'package:weather_app/core/error/server_error.dart';

import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/send_weather_forecast_request.dart';
import '../../data/models/weather_forecast/weather_forecast_response.dart';

part '../../data/repository/weather_forecast_repository_impl.dart';

sealed class WeatherForecastRepository {
  const WeatherForecastRepository();

  Future<Either<Failure, WeatherForecastResponse>> getWeatherForecastByLatLong({
    required SendWeatherForecastRequest request,
  });
}

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../core/core.dart';
import '../../data/models/models.dart';
import '../../../../constants/constants.dart';
part '../../data/repository/weather_forecast_repository_impl.dart';

sealed class WeatherForecastRepository {
  const WeatherForecastRepository();

  Future<Either<Failure, WeatherForecastResponse>>
      getWeatherForecastByCityName({
    required SendWeatherForecastRequest request,
  });
}

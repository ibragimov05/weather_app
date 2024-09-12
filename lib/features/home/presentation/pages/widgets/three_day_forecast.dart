import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/utils.dart';
import 'package:weather_app/features/home/data/models/weather_forecast/weather_forecast_response.dart';

class ThreeDayForecast extends StatelessWidget {
  final WeatherForecastResponse? weatherForecastResponse;

  const ThreeDayForecast({super.key, required this.weatherForecastResponse});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: AppUtils.kBorderRadius12),
      child: FlutterLogo(),
    );
  }
}

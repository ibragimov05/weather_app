import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/core.dart';
import '../../data/models/models.dart';

class WeatherData extends StatelessWidget {
  final WeatherForecastResponse? weatherForecastResponse;

  const WeatherData({super.key, required this.weatherForecastResponse});

  @override
  Widget build(BuildContext context) {
    if (weatherForecastResponse == null) {
      return const Center(
        child: Text('Something went wrong'),
      );
    }

    final WeatherForecastResponse response = weatherForecastResponse!;

    return Padding(
      padding: AppUtils.kPaddingAll24,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _weatherData(
            data: "${response.current?.humidity}%",
            type: 'Humidity',
            icoPath: AppAssets.icons.humidity.path,
          ),
          _weatherData(
            data: "${response.current?.windKph}km/h",
            type: 'Wind',
            icoPath: AppAssets.icons.wind.path,
          ),
          _weatherData(
            data: "${response.current?.feelslikeC}°",
            type: 'Feels like',
            icoPath: AppAssets.icons.feelsLike.path,
          ),
        ],
      ),
    );
  }

  Widget _weatherData({
    required String data,
    required String type,
    required String icoPath,
  }) {
    return Column(
      children: [
        SvgPicture.asset(
          icoPath,
          width: 50,
          colorFilter: const ColorFilter.mode(
            AppColors.white,
            BlendMode.srcIn,
          ),
        ),
        Text(
          type,
          style: const TextStyle(color: AppColors.white),
        ),
        Text(
          data,
          style: const TextStyle(color: AppColors.white),
        ),
      ],
    );
  }
}

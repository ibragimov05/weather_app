import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/core.dart';
import '../../data/models/models.dart';

class ThreeDayForecast extends StatefulWidget {
  final WeatherForecastResponse? weatherForecastResponse;

  const ThreeDayForecast({super.key, required this.weatherForecastResponse});

  @override
  State<ThreeDayForecast> createState() => _ThreeDayForecastState();
}

class _ThreeDayForecastState extends State<ThreeDayForecast> {
  @override
  Widget build(BuildContext context) {
    if (widget.weatherForecastResponse == null) {
      return const Center(
        child: Text('Something went wrong'),
      );
    }

    return Container(
      width: double.infinity,
      padding: AppUtils.kPaddingAll16,
      margin: AppUtils.kPaddingAll24,
      decoration: BoxDecoration(
        color: AppColors.grey.withOpacity(0.6),
        borderRadius: AppUtils.kBorderRadius12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          3,
          (index) => _weatherDataWidget(
            data: widget
                .weatherForecastResponse?.forecast?.forecastday?[index + 1],
          ),
        ),
      ),
    );
  }

  Widget _weatherDataWidget({
    required Forecastday? data,
  }) {
    final DateTime date = data?.date?.parseToDateTime ?? DateTime.now();

    return Column(
      children: [
        Text(
          date.formatWithDayName,
          style: const TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        AppUtils.kGap8,
        Lottie.asset(
          data?.day?.condition?.text.lottiePath ?? AppAssets.lottie.cloud.path,
          height: DeviceScreen.h(context) / 15,
        ),
        Text(
          "${data?.day?.avgtempC?.round()}°",
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        AppUtils.kGap8,
        Text(
          "${data?.day?.maxwindKph}",
          style: const TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Text(
          'km/h',
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

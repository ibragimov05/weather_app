import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../../../router/app_router.dart';
import '../../../home/presentation/bloc/weather/weather_forecast_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherForecastBloc, WeatherForecastState>(
      builder: (context, state) {
        if (state.weatherForecastStatus == WeatherForecastStatus.initial) {
          /// call the event to fetch weather data
          ///
          /// if the user enters first time
          context.read<WeatherForecastBloc>().add(
                const GetWeatherByNameEvent(cityName: 'Tashkent'),
              );
        } else if (state.weatherForecastStatus ==
            WeatherForecastStatus.loaded) {
          /// Navigate to home page after a delay
          Future.delayed(const Duration(seconds: 2), () {
            if (!context.mounted) return;

            context.replace(Routes.home);
          });
        }
        return Scaffold(
          body: Center(
            child: AppAssets.lottie.loading.lottie(),
          ),
        );
      },
    );
  }
}

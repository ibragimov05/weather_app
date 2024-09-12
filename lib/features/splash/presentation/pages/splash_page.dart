import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/core/core.dart';
import 'package:weather_app/core/utils/utils.dart';
import 'package:weather_app/router/app_router.dart';

import '../../../../injector_container.dart';
import '../../../home/presentation/bloc/weather/weather_forecast_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    final state = getIt.get<WeatherForecastBloc>().state;

    if (state.weatherForecastStatus != WeatherForecastStatus.loaded) {
      getIt
          .get<WeatherForecastBloc>()
          .add(const GetWeatherByNameEvent(cityName: 'Tashkent'));
    }

    if (state.weatherForecastStatus == WeatherForecastStatus.loaded) {
      Future.delayed(const Duration(seconds: 3)).then(
        (value) => _toTheNextScreen(),
      );
    }
  }

  void _toTheNextScreen() => context.replace(Routes.home);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppAssets.lottie.loading.lottie(),
      ),
    );
  }
}

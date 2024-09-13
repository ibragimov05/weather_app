import 'package:flutter/material.dart';

import '../../../../../injector_container.dart';
import '../../bloc/weather/weather_forecast_bloc.dart';

/// [WeatherEmpty] widget works only once
///
/// When the user enters first time to the app
class WeatherEmpty extends StatelessWidget {
  const WeatherEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    getIt.get<WeatherForecastBloc>().add(
          const GetWeatherByNameEvent(cityName: 'Tashkent'),
        );
    return const Center(child: CircularProgressIndicator());
  }
}

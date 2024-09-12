import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:weather_app/features/home/presentation/pages/widgets/three_day_forecast.dart';

import 'widgets/widgets.dart';
import '../../../../core/core.dart';
import '../../../../injector_container.dart';
import '../bloc/weather/weather_forecast_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<WeatherForecastBloc>(),
      child: RefreshIndicator(
        onRefresh: () async => getIt
            .get<WeatherForecastBloc>()
            .add(GetWeatherByUserCurrentLocationEvent()),
        child: Scaffold(
          backgroundColor: Colors.blue,
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: BlocBuilder<WeatherForecastBloc, WeatherForecastState>(
              builder: (context, state) => state.weatherForecastStatus.isError
                  ? Center(child: Text('Error: ${state.errorMessage}'))
                  : Skeletonizer(
                      enabled: state.weatherForecastStatus.isLoading,
                      child: Row(
                        children: [
                          const Skeleton.keep(
                            child: Icon(
                              Icons.location_pin,
                              color: AppColors.white,
                            ),
                          ),
                          Text(
                            "${state.weatherForecastResponse?.location?.name}",
                            style: const TextStyle(color: AppColors.white),
                          ),
                        ],
                      ),
                    ),
            ),
          ),
          endDrawer: const HomeDrawer(),
          body: BlocBuilder<WeatherForecastBloc, WeatherForecastState>(
            builder: (BuildContext context, WeatherForecastState state) {
              return state.weatherForecastStatus.isError
                  ? Center(child: Text('Error: ${state.errorMessage}'))
                  : Skeletonizer(
                      enableSwitchAnimation: true,
                      enabled: state.weatherForecastStatus.isLoading,
                      child: ListView(
                        padding: AppUtils.kPaddingHor16,
                        children: [
                          /// current date
                          Skeleton.keep(
                            child: Text(
                              DateTime.now().formatDate,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                                color: AppColors.white,
                              ),
                            ),
                          ),

                          /// last updated at
                          Text(
                            "Updated ${state.weatherForecastResponse?.lastUpdatedAt?.formatDateUpdated}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: AppColors.white),
                          ),
                          AppUtils.kGap16,

                          /// lottie by weather info
                          Lottie.asset(
                            state.weatherForecastResponse?.current?.condition
                                    ?.text.lottiePath ??
                                AppAssets.lottie.cloud.path,
                            height: DeviceScreen.h(context) / 10,
                          ),

                          /// weather condition
                          Text(
                            "${state.weatherForecastResponse?.current?.condition?.text}",
                            style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),

                          /// weather temperature
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${state.weatherForecastResponse?.current?.tempC?.round().toString()}",
                                style: const TextStyle(
                                  color: AppColors.white,
                                  fontSize: 80,
                                  fontWeight: FontWeight.w800,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const Text(
                                '°C',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 30,
                                  height: 2.5,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),

                          /// weather info's
                          WeatherData(
                            weatherForecastResponse:
                                state.weatherForecastResponse,
                          ),

                          /// weather forecast for three days
                          ThreeDayForecast(
                            weatherForecastResponse:
                                state.weatherForecastResponse,
                          ),
                        ],
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }
}

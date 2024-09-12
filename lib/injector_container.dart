import "dart:developer";

import "package:dio/dio.dart";
import "package:flutter/foundation.dart";
import "package:get_it/get_it.dart";
import "package:shared_preferences/shared_preferences.dart";
import "package:weather_app/features/home/domain/repository/weather_forecast_repository.dart";
import "package:weather_app/features/home/presentation/bloc/weather/weather_forecast_bloc.dart";

final GetIt getIt = GetIt.instance;

Future<void> init() async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();

  /// registering dio
  getIt.registerLazySingleton(
    () => Dio()
      ..options = BaseOptions(
        contentType: 'application/json',
        sendTimeout: const Duration(seconds: 15),
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      )
      ..interceptors.add(LogInterceptor(
        error: kDebugMode,
        request: kDebugMode,
        requestBody: kDebugMode,
        responseBody: kDebugMode,
        requestHeader: kDebugMode,
        responseHeader: kDebugMode,
        logPrint: (Object object) {
          if (kDebugMode) log("dio: $object");
        },
      )),
  );

  /// registering shared preference
  getIt.registerLazySingleton(() => preferences);

  /// registering blocs
  getIt.registerLazySingleton(
    () => WeatherForecastBloc(
      weatherForecastRepository: WeatherForecastRepositoryImpl(dio: getIt()),
    ),
  );
}

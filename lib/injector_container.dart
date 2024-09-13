import "dart:developer";

import "package:dio/dio.dart";
import "package:flutter/foundation.dart";
import "package:get_it/get_it.dart";

import "features/home/domain/repository/weather_forecast_repository.dart";
import "features/home/presentation/bloc/blocs.dart";

final GetIt getIt = GetIt.instance;

Future<void> init() async {
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

  /// registering blocs
  getIt.registerLazySingleton(
    () => WeatherForecastBloc(
      weatherForecastRepository: WeatherForecastRepositoryImpl(
        dio: getIt<Dio>(),
      ),
    ),
  );

  getIt.registerLazySingleton(
    () => SavedLocationBloc(
      weatherForecastRepository: WeatherForecastRepositoryImpl(
        dio: getIt<Dio>(),
      ),
    ),
  );
}

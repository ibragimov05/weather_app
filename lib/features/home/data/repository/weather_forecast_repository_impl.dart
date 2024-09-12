part of '../../domain/repository/weather_forecast_repository.dart';

class WeatherForecastRepositoryImpl extends WeatherForecastRepository {
  final Dio _dio;

  const WeatherForecastRepositoryImpl({
    required Dio dio,
  }) : _dio = dio;

  @override
  Future<Either<Failure, WeatherForecastResponse>> getWeatherForecastByLatLong({
    required SendWeatherForecastRequest request,
  }) async {
    try {
      // final String url =
      //     '${Constants.baseUrl}?latitude=${request.latitude}&longitude=${request.longitude}${Constants.queryParameter}';

      final Response<dynamic> response = await _dio.get(
          'https://api.weatherapi.com/v1/forecast.json?key=&q=tashkent&days=3');

      return Right<Failure, WeatherForecastResponse>(
        WeatherForecastResponse.fromJson(response.data),
      );
    } on DioException catch (error, stacktrace) {
      log("Dio exception occurred: $error stacktrace: $stacktrace");
      return Left<Failure, WeatherForecastResponse>(
        ServerError.withDioError(error: error).failure,
      );
    } on Exception catch (error, stacktrace) {
      log("Exception occurred: $error stacktrace: $stacktrace");
      return Left<Failure, WeatherForecastResponse>(
        ServerError.withError(message: error.toString()).failure,
      );
    }
  }
}

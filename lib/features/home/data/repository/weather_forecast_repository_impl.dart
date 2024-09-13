part of '../../domain/repository/weather_forecast_repository.dart';

class WeatherForecastRepositoryImpl extends WeatherForecastRepository {
  final Dio _dio;
  static final String _apiKey = dotenv.get('API_KEY');

  const WeatherForecastRepositoryImpl({
    required Dio dio,
  }) : _dio = dio;

  @override
  Future<Either<Failure, WeatherForecastResponse>>
      getWeatherForecastByCityName({
    required SendWeatherForecastRequest request,
  }) async {
    try {
      final Response<dynamic> response = await _dio.get(
        '${Constants.baseUrl}?key=$_apiKey&q=${request.cityName}&days=4',
      );

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

part of 'weather_forecast_bloc.dart';

sealed class WeatherForecastEvent extends Equatable {
  const WeatherForecastEvent();
}

// class GetWeatherByUserCurrentLocationEvent extends WeatherForecastEvent {
//   @override
//   List<Object> get props => [];
// }

class GetWeatherByNameEvent extends WeatherForecastEvent {
  final String cityName;

  // final double latitude;
  // final double longitude;

  const GetWeatherByNameEvent({required this.cityName});

  @override
  List<Object> get props => [cityName];
}

class RefreshWeatherEvent extends WeatherForecastEvent {
  const RefreshWeatherEvent();

  @override
  List<Object> get props => [];
}

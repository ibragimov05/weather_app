part of 'weather_forecast_bloc.dart';

sealed class WeatherForecastEvent extends Equatable {
  const WeatherForecastEvent();
}

class GetWeatherByUserCurrentLocationEvent extends WeatherForecastEvent {
  @override
  List<Object> get props => [];
}

class GetWeatherByLatLongEvent extends WeatherForecastEvent {
  final double latitude;
  final double longitude;

  const GetWeatherByLatLongEvent({
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object> get props => [latitude, longitude];
}

class RefreshWeatherEvent extends WeatherForecastEvent {
  const RefreshWeatherEvent();

  @override
  List<Object> get props => [];
}

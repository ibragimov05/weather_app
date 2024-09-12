part of 'weather_forecast_bloc.dart';

@JsonSerializable()
class WeatherForecastState extends Equatable {
  final WeatherForecastResponse? weatherForecastResponse;
  final WeatherForecastStatus weatherForecastStatus;
  final String? errorMessage;

  const WeatherForecastState({
    this.weatherForecastResponse,
    this.weatherForecastStatus = WeatherForecastStatus.initial,
    this.errorMessage,
  });

  factory WeatherForecastState.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastStateFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherForecastStateToJson(this);

  @override
  List<Object?> get props => <Object?>[
        weatherForecastResponse,
        weatherForecastStatus,
        errorMessage,
      ];

  WeatherForecastState copyWith({
    WeatherForecastResponse? weatherForecastResponse,
    WeatherForecastStatus? weatherForecastStatus,
    String? errorMessage,
  }) =>
      WeatherForecastState(
        weatherForecastResponse:
            weatherForecastResponse ?? this.weatherForecastResponse,
        weatherForecastStatus:
            weatherForecastStatus ?? this.weatherForecastStatus,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}

/// enumeration for weather status
enum WeatherForecastStatus { initial, loading, loaded, error }

/// extension to check weather status
extension WeatherForecastStatusX on WeatherForecastStatus {
  bool get isInitial => this == WeatherForecastStatus.initial;

  bool get isLoading => this == WeatherForecastStatus.loading;

  bool get isLoaded => this == WeatherForecastStatus.loaded;

  bool get isError => this == WeatherForecastStatus.error;
}

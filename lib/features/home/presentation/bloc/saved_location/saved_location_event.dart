part of 'saved_location_bloc.dart';

@immutable
sealed class SavedLocationEvent extends Equatable {
  const SavedLocationEvent();
}

final class RefreshSavedLocationsWeatherEvent extends SavedLocationEvent {
  final List<WeatherForecastResponse> weatherForecasts;

  const RefreshSavedLocationsWeatherEvent({required this.weatherForecasts});

  @override
  List<Object> get props => [];
}

final class AddNewLocationEvent extends SavedLocationEvent {
  final String cityName;

  const AddNewLocationEvent({required this.cityName});

  @override
  List<Object> get props => [cityName];
}

final class DeleteLocationEvent extends SavedLocationEvent {
  final String cityName;

  const DeleteLocationEvent({required this.cityName});

  @override
  List<Object> get props => [cityName];
}

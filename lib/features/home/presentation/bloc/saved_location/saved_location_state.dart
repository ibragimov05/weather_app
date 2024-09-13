part of 'saved_location_bloc.dart';

@JsonSerializable()
class SavedLocationState extends Equatable {
  final List<WeatherForecastResponse> savedLocationsWeather;
  final SavedLocationStatus status;
  final String? error;

  const SavedLocationState({
    this.savedLocationsWeather = const [],
    this.status = SavedLocationStatus.initial,
    this.error,
  });

  SavedLocationState copyWith({
    List<WeatherForecastResponse>? savedLocations,
    SavedLocationStatus? status,
    String? error,
  }) =>
      SavedLocationState(
        savedLocationsWeather: savedLocations ?? this.savedLocationsWeather,
        status: status ?? this.status,
        error: error ?? this.error,
      );

  factory SavedLocationState.fromJson(Map<String, dynamic> json) =>
      _$SavedLocationStateFromJson(json);

  Map<String, dynamic> toJson() => _$SavedLocationStateToJson(this);

  @override
  List<Object?> get props => [savedLocationsWeather, status, error];
}

/// enumeration for saved location
enum SavedLocationStatus { initial, loading, loaded, error }

/// extension to check saved locations status
extension SavedLocationStatusX on SavedLocationStatus {
  bool get isInitial => this == SavedLocationStatus.initial;

  bool get isLoading => this == SavedLocationStatus.loading;

  bool get isLoaded => this == SavedLocationStatus.loaded;

  bool get isError => this == SavedLocationStatus.error;
}
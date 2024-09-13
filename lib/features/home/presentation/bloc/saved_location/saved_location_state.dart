part of 'saved_location_bloc.dart';

@JsonSerializable()
class SavedLocationState extends Equatable {
  final SavedLocationStatus status;
  final List<WeatherForecastResponse> savedLocationsWeathers;
  final String? error;

  const SavedLocationState({
    this.status = SavedLocationStatus.initial,
    this.savedLocationsWeathers = const [],
    this.error,
  });

  SavedLocationState copyWith({
    List<WeatherForecastResponse>? savedLocationsWeathers,
    SavedLocationStatus? status,
    String? error,
  }) =>
      SavedLocationState(
        savedLocationsWeathers:
            savedLocationsWeathers ?? this.savedLocationsWeathers,
        status: status ?? this.status,
        error: error ?? this.error,
      );

  factory SavedLocationState.fromJson(Map<String, dynamic> json) =>
      _$SavedLocationStateFromJson(json);

  Map<String, dynamic> toJson() => _$SavedLocationStateToJson(this);

  @override
  List<Object?> get props => [savedLocationsWeathers, status, error];
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

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/core/core.dart';
import 'package:weather_app/features/home/data/models/send_weather_forecast_request.dart';
import 'package:weather_app/features/home/data/models/weather_forecast/weather_forecast_response.dart';
import 'package:weather_app/features/home/domain/repository/weather_forecast_repository.dart';

part 'saved_location_event.dart';

part 'saved_location_state.dart';

part 'saved_location_bloc.g.dart';

class SavedLocationBloc
    extends HydratedBloc<SavedLocationEvent, SavedLocationState> {
  final WeatherForecastRepository _weatherForecastRepository;

  SavedLocationBloc({
    required WeatherForecastRepository weatherForecastRepository,
  })  : _weatherForecastRepository = weatherForecastRepository,
        super(const SavedLocationState()) {
    on<GetSavedLocationsWeatherEvent>(_onGetSavedLocationsWeather);
    on<AddNewLocationEvent>(_onAddNewLocation);
    on<DeleteLocationEvent>(_onDeleteLocation);
  }

  void _onGetSavedLocationsWeather(
    GetSavedLocationsWeatherEvent event,
    Emitter<SavedLocationState> emit,
  ) async {
    emit(state.copyWith(status: SavedLocationStatus.loading));
    try {
      final List<WeatherForecastResponse> data = [];

      for (var each in event.weatherForecasts) {
        final response =
            await _weatherForecastRepository.getWeatherForecastByCityName(
          request: SendWeatherForecastRequest(
            cityName: each.location?.name ?? 'Tashkent',
          ),
        );

        response.fold(
          (left) => data.add(each),
          (right) => data.add(right),
        );
      }

      emit(state.copyWith(
        status: SavedLocationStatus.loaded,
        savedLocations: data,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: SavedLocationStatus.error,
        error: e.toString(),
      ));
    }
  }

  void _onAddNewLocation(
    AddNewLocationEvent event,
    Emitter<SavedLocationState> emit,
  ) async {
    emit(state.copyWith(status: SavedLocationStatus.loading));

    final response =
        await _weatherForecastRepository.getWeatherForecastByCityName(
      request: SendWeatherForecastRequest(cityName: event.cityName),
    );

    response.fold(
      (Failure l) => emit(state.copyWith(status: SavedLocationStatus.loaded)),
      (WeatherForecastResponse r) {
        state.savedLocationsWeather.add(r);
        emit(state.copyWith(status: SavedLocationStatus.loaded));
      },
    );
  }

  void _onDeleteLocation(
    DeleteLocationEvent event,
    Emitter<SavedLocationState> emit,
  ) async {
    emit(state.copyWith(status: SavedLocationStatus.loading));

    final locations = state.savedLocationsWeather;

    final int index = locations.indexWhere(
      (element) => element.location?.name == event.cityName,
    );

    if (index != -1) locations.removeAt(index);

    emit(state.copyWith(
      savedLocations: locations,
      status: SavedLocationStatus.loaded,
    ));
  }

  /// for hydrated bloc
  @override
  SavedLocationState? fromJson(Map<String, dynamic> json) {
    try {
      return SavedLocationState.fromJson(json);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(SavedLocationState state) {
    try {
      return state.toJson();
    } catch (_) {
      return null;
    }
  }
}

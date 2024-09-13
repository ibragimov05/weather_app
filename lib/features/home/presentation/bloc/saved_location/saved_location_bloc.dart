import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../../../core/core.dart';
import '../../../data/models/models.dart';
import '../../../domain/repository/weather_forecast_repository.dart';

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
    on<RefreshSavedLocationsWeatherEvent>(_onGetSavedLocationsWeather);
    on<AddNewLocationEvent>(_onAddNewLocation);
    on<DeleteLocationEvent>(_onDeleteLocation);
  }

  void _onGetSavedLocationsWeather(
    RefreshSavedLocationsWeatherEvent event,
    Emitter<SavedLocationState> emit,
  ) async {
    if (event.weatherForecasts.isEmpty) return;

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
        savedLocationsWeathers: data,
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
      (Failure l) => emit(state.copyWith(
        status: SavedLocationStatus.error,
        error: l.toString(),
      )),
      (WeatherForecastResponse r) {
        final updatedLocations =
            List<WeatherForecastResponse>.from(state.savedLocationsWeathers)
              ..add(r);
        emit(state.copyWith(
          status: SavedLocationStatus.loaded,
          savedLocationsWeathers: updatedLocations,
        ));
      },
    );
  }

  void _onDeleteLocation(
    DeleteLocationEvent event,
    Emitter<SavedLocationState> emit,
  ) async {
    emit(state.copyWith(status: SavedLocationStatus.loading));

    final locations = state.savedLocationsWeathers;

    final int index = locations.indexWhere(
      (element) => element.location?.name == event.cityName,
    );

    if (index != -1) locations.removeAt(index);

    emit(state.copyWith(
      savedLocationsWeathers: locations,
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

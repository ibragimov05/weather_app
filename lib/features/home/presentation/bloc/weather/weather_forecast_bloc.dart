import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/core.dart';
import '../../../data/models/models.dart';
import '../../../domain/repository/weather_forecast_repository.dart';

part 'weather_forecast_event.dart';

part 'weather_forecast_state.dart';

part 'weather_forecast_bloc.g.dart';

class WeatherForecastBloc
    extends HydratedBloc<WeatherForecastEvent, WeatherForecastState> {
  final WeatherForecastRepository _weatherForecastRepository;

  WeatherForecastBloc({
    required WeatherForecastRepository weatherForecastRepository,
  })  : _weatherForecastRepository = weatherForecastRepository,
        super(const WeatherForecastState()) {
    on<GetWeatherByNameEvent>(_onGetWeatherByLatLong);
  }

  void _onGetWeatherByLatLong(
    GetWeatherByNameEvent event,
    Emitter<WeatherForecastState> emit,
  ) async {
    emit(state.copyWith(weatherForecastStatus: WeatherForecastStatus.loading));

    final Either<Failure, WeatherForecastResponse> result =
        await _weatherForecastRepository.getWeatherForecastByCityName(
      request: SendWeatherForecastRequest(
        cityName: event.cityName,
      ),
    );

    result.fold(
      (Failure l) {
        emit(state.copyWith(
          weatherForecastStatus: WeatherForecastStatus.error,
          errorMessage: l.message,
        ));
      },
      (WeatherForecastResponse r) {
        emit(state.copyWith(
          weatherForecastStatus: WeatherForecastStatus.loaded,
          weatherForecastResponse: r,
        ));
      },
    );
  }

  /// for hydrated bloc
  @override
  WeatherForecastState? fromJson(Map<String, dynamic> json) {
    try {
      return WeatherForecastState.fromJson(json);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(WeatherForecastState state) {
    try {
      return state.toJson();
    } catch (_) {
      return null;
    }
  }
}

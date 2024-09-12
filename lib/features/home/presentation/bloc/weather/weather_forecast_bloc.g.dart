// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_forecast_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherForecastState _$WeatherForecastStateFromJson(
        Map<String, dynamic> json) =>
    WeatherForecastState(
      weatherForecastResponse: json['weatherForecastResponse'] == null
          ? null
          : WeatherForecastResponse.fromJson(
              json['weatherForecastResponse'] as Map<String, dynamic>),
      weatherForecastStatus: $enumDecodeNullable(
              _$WeatherForecastStatusEnumMap, json['weatherForecastStatus']) ??
          WeatherForecastStatus.initial,
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$WeatherForecastStateToJson(
        WeatherForecastState instance) =>
    <String, dynamic>{
      'weatherForecastResponse': instance.weatherForecastResponse,
      'weatherForecastStatus':
          _$WeatherForecastStatusEnumMap[instance.weatherForecastStatus]!,
      'errorMessage': instance.errorMessage,
    };

const _$WeatherForecastStatusEnumMap = {
  WeatherForecastStatus.initial: 'initial',
  WeatherForecastStatus.loading: 'loading',
  WeatherForecastStatus.loaded: 'loaded',
  WeatherForecastStatus.error: 'error',
};

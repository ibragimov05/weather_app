// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_location_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavedLocationState _$SavedLocationStateFromJson(Map<String, dynamic> json) =>
    SavedLocationState(
      savedLocationsWeather: (json['savedLocationsWeather'] as List<dynamic>?)
              ?.map((e) =>
                  WeatherForecastResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      status:
          $enumDecodeNullable(_$SavedLocationStatusEnumMap, json['status']) ??
              SavedLocationStatus.initial,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$SavedLocationStateToJson(SavedLocationState instance) =>
    <String, dynamic>{
      'savedLocationsWeather': instance.savedLocationsWeather,
      'status': _$SavedLocationStatusEnumMap[instance.status]!,
      'error': instance.error,
    };

const _$SavedLocationStatusEnumMap = {
  SavedLocationStatus.initial: 'initial',
  SavedLocationStatus.loading: 'loading',
  SavedLocationStatus.loaded: 'loaded',
  SavedLocationStatus.error: 'error',
};

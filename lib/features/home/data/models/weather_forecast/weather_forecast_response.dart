// import 'package:flutter/foundation.dart';
//
// part 'daily_weather.dart';
//
// part 'daily_units.dart';
//
// @immutable
// class WeatherForecastResponse {
//   final num latitude;
//   final num longitude;
//   final num generationTimeMs;
//   final num utcOffsetSeconds;
//   final String timezone;
//   final String timezoneAbbreviation;
//   final num elevation;
//   final DailyUnits dailyUnits;
//   final DailyWeather daily;
//
//   const WeatherForecastResponse({
//     required  latitude,
//     required  longitude,
//     required  generationTimeMs,
//     required  utcOffsetSeconds,
//     required  timezone,
//     required  timezoneAbbreviation,
//     required  elevation,
//     required  dailyUnits,
//     required  daily,
//   });
//
//   /// Factory method for creating a WeatherForecast from JSON
//   factory WeatherForecastResponse.fromJson(Map<String, dynamic> json) =>
//       WeatherForecastResponse(
//         latitude: json['latitude'],
//         longitude: json['longitude'],
//         generationTimeMs: json['generationtime_ms'],
//         utcOffsetSeconds: json['utc_offset_seconds'],
//         timezone: json['timezone'],
//         timezoneAbbreviation: json['timezone_abbreviation'],
//         elevation: json['elevation'],
//         dailyUnits: DailyUnits.fromJson(json['daily_units']),
//         daily: DailyWeather.fromJson(json['daily']),
//       );
//
//   /// Method to convert WeatherForecast to JSON
//   Map<String, dynamic> toJson() => {
//         'latitude': latitude,
//         'longitude': longitude,
//         'generationtime_ms': generationTimeMs,
//         'utc_offset_seconds': utcOffsetSeconds,
//         'timezone': timezone,
//         'timezone_abbreviation': timezoneAbbreviation,
//         'elevation': elevation,
//         'daily_units': dailyUnits.toJson(),
//         'daily': daily.toJson(),
//       };
// }

part 'location.dart';

part 'current.dart';

part 'forecast.dart';

class WeatherForecastResponse {
  Location? location;
  Current? current;
  Forecast? forecast;
  DateTime? lastUpdatedAt;

  WeatherForecastResponse({
    this.location,
    this.current,
    this.forecast,
    this.lastUpdatedAt,
  });

  WeatherForecastResponse.fromJson(Map<String, dynamic> json) {
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    current =
        json['current'] != null ? Current.fromJson(json['current']) : null;
    forecast =
        json['forecast'] != null ? Forecast.fromJson(json['forecast']) : null;
    lastUpdatedAt = DateTime.now();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (location != null) {
      data['location'] = location!.toJson();
    }
    if (current != null) {
      data['current'] = current!.toJson();
    }
    if (forecast != null) {
      data['forecast'] = forecast!.toJson();
    }
    return data;
  }
}

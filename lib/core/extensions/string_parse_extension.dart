part of 'extensions.dart';

extension StringParseX on String? {
  String get lottiePath {
    if (this == null) return AppAssets.lottie.cloud.path;

    final condition = this!.toLowerCase();

    switch (condition) {
      case 'sunny' || 'clear':
        return AppAssets.lottie.sunny.path;
      case 'cloudy':
        return AppAssets.lottie.cloud.path;
      case 'thunderstorm':
        return AppAssets.lottie.thunder.path;
      case 'rain' || 'freezing_rain':
        return AppAssets.lottie.rainSunny.path;
      case "snow":
        return AppAssets.lottie.snow.path;
      default:
        return AppAssets.lottie.cloud.path;
    }
  }

  DateTime get parseToDateTime {
    if (this == null) return DateTime.now();

    final dateParts = this!.split('-');

    int year = int.parse(dateParts[0]);
    int month = int.parse(dateParts[1]);
    int day = int.parse(dateParts[2]);

    return DateTime(year, month, day);
  }
}

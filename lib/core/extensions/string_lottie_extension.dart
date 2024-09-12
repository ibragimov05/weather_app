import '../utils/utils.dart';

extension StringLottieX on String? {
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
}

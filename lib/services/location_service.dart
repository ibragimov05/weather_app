import 'package:geolocator/geolocator.dart';

class LocationService {
  static LocationPermission? permission;

  /// method to check whether user granted to access [permission]
  static Future<bool> checkPermissions() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return permission != LocationPermission.deniedForever;
  }

  /// method to get
  static Future<Position?> determinePosition() async {
    if (permission != LocationPermission.deniedForever ||
        permission != LocationPermission.denied) {
      return await Geolocator.getCurrentPosition();
    }
    return null;
  }
}

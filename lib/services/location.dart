import 'package:geolocator/geolocator.dart';

class Location {
  static late double latitude;
  static late double longitude;

  static Future<void> getCurrentLocation() async {
    final LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.best,
    );
    try {
      Position position = await Geolocator.getCurrentPosition(
          locationSettings: locationSettings);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print("The request is denied.");
    }
  }
}

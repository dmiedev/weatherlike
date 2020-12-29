import 'package:geolocator/geolocator.dart';

class LocationRepository {
  bool _canAccessLocation;
  bool get canAccessLocation => _canAccessLocation;

  Future<bool> initialize() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (serviceEnabled) {
      final permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse) {
        _canAccessLocation = true;
      } else if (permission == LocationPermission.deniedForever) {
        _canAccessLocation = false;
      } else {
        final requestedPermission = await Geolocator.requestPermission();
        if (requestedPermission == LocationPermission.always ||
            requestedPermission == LocationPermission.whileInUse) {
          _canAccessLocation = true;
        } else {
          _canAccessLocation = false;
        }
      }
    } else {
      _canAccessLocation = false;
    }
    return _canAccessLocation;
  }

  Future<Map<String, double>> getCurrentLocationCoordinates() async {
    if (_canAccessLocation ?? false) {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: Duration(seconds: 15),
      );
      return {
        'longitude': position.longitude,
        'latitude': position.latitude,
      };
    }
    return null;
  }
}

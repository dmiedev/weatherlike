// import 'package:geolocator/geolocator.dart';

// import 'package:weatherlike/src/models/location.dart';

// class LocationService {
//   bool _canAccessLocation = false;
//   bool get canAccessLocation => _canAccessLocation;

//   Future<void> updateCanAccessLocation() async {
//     final serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (serviceEnabled) {
//       final permission = await Geolocator.checkPermission();
//       if (permission == LocationPermission.always ||
//           permission == LocationPermission.whileInUse) {
//         return true;
//       } else if (permission == LocationPermission.deniedForever) {
//         return false;
//       }
//       final requestedPermission = await Geolocator.requestPermission();
//       if (requestedPermission == LocationPermission.always ||
//           requestedPermission == LocationPermission.whileInUse) {
//         return true;
//       }
//     }
//   }

//   Future<Location> getCurrentLocation() async {
//     if (_canAccessLocation) {
//       final position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high,
//       );
//       return Location(
//         longitude: position.longitude,
//         latitude: position.latitude,
//       );
//     }
//     return null;
//   }
// }

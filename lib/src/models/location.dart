import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final double latitude;
  final double longitude;
  final String name;
  final String state;
  final String country;

  const Location({
    this.latitude,
    this.longitude,
    this.name,
    this.state,
    this.country,
  });

  @override
  List<Object> get props => [latitude, longitude, name, state, country];

  static Location fromJson(Map<String, dynamic> json) {
    return Location(
      latitude: json['lat'],
      longitude: json['lon'],
      country: json['country'],
      state: json['state'],
      name: json['name'],
    );
  }

  @override
  String toString() =>
      'Location: { latitude: $latitude, longitude: $longitude}';
}

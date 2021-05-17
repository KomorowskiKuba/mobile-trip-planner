import 'package:mobile_trip_planner/models/geometry_model.dart';

class Place {
  final Geometry geometry;
  final String name;
  final String vicinity;

  Place({this.name, this.geometry, this.vicinity});

  factory Place.fromJson(Map<String, dynamic> parsedJson) {
    return Place(
      geometry: Geometry.fromJson(parsedJson['geometry']),
      name: parsedJson['formatted_address'],
      vicinity: parsedJson['vicinity']
    );
  }
}
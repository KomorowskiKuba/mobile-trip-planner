import 'package:mobile_trip_planner/models/location_model.dart';

class Geometry {
  final Location location;

  Geometry({this.location});

  factory Geometry.fromJson(Map<dynamic, dynamic> parsedJson) {
    return Geometry(
      location: Location.fromJson(parsedJson['location'])
    );
  }
}
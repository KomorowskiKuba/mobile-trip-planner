import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobile_trip_planner/geolocation/geolocator_service.dart';

class AppBloc with ChangeNotifier {
  final geolocatorService = GeolocatorService();
  Position currentLocation;

  AppBloc() {
    setCurrentLocation();
  }

  setCurrentLocation() async { 
    currentLocation = await geolocatorService.getCurrentLocation();
    print(currentLocation);
    notifyListeners();
  }
}
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobile_trip_planner/models/place_search.dart';
import 'package:mobile_trip_planner/services/geolocator_service.dart';
import 'package:mobile_trip_planner/services/places_service.dart';

class AppBloc with ChangeNotifier {
  final geolocatorService = GeolocatorService();
  final placesService = PlacesService();

  Position currentLocation;
  List<PlaceSearch> searchResults;

  AppBloc() {
    setCurrentLocation();
  }

  setCurrentLocation() async { 
    currentLocation = await geolocatorService.getCurrentLocation();
    print(currentLocation);
    notifyListeners();
  }

  searchPlaces(String searchTerm) async {
    searchResults = await placesService.getAutocomplete(searchTerm);
    notifyListeners();
  }
}
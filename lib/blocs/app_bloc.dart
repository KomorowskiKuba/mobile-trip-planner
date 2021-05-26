import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobile_trip_planner/models/place_model.dart';
import 'package:mobile_trip_planner/models/place_search.dart';
import 'package:mobile_trip_planner/services/geolocator_service.dart';
import 'package:mobile_trip_planner/services/places_service.dart';

class AppBloc with ChangeNotifier {
  final geolocatorService = GeolocatorService();
  final placesService = PlacesService();

  late Position currentLocation;
  late List<PlaceSearch> searchResults;
  late StreamController<Place> selectedLocation = StreamController<Place>.broadcast();

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

  setSelectedLocation(String placeId) async {
    selectedLocation.add(await placesService.getPlace(placeId));
    //searchResults = null;
    notifyListeners();
  }

  @override
  void dispose() {
    selectedLocation.close();
    super.dispose();
  }
}
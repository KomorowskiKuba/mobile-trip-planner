import 'dart:core';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:flutter_config/flutter_config.dart';

import 'package:mobile_trip_planner/models/place_model.dart';
import 'package:mobile_trip_planner/models/place_search.dart';

class PlacesService {
  late String key;

  PlacesService() {
    key = FlutterConfig.get('GOOGLE_MAPS_KEY');
  }

  Future<List<PlaceSearch>> getAutocomplete(String search) async {
    var url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&types=(cities)&key=$key');
    var response = await http.get(url);
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['predictions'] as List;

    return jsonResults.map((place) => PlaceSearch.fromJson(place)).toList();
  }

  Future<Place> getPlace(String placeId) async {
    var url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key');
    var response = await http.get(url);
    var json = convert.jsonDecode(response.body);
    var jsonResult = json['result'] as Map<String, dynamic>;

    return Place.fromJson(jsonResult);
  }
}

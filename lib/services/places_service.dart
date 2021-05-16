import 'dart:core';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:mobile_trip_planner/models/place_search.dart'; 
import 'package:flutter_config/flutter_config.dart';

class PlacesService  {
  String key;

  PlacesService() {
    key = FlutterConfig.get('GOOGLE_MAPS_KEY');
  }

  Future<List<PlaceSearch>> getAutocomplete(String query) async {
    var url = Uri.parse('https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$query&types=(cities)&key=$key');  //'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$query&types=(cities)&key=$key'); //'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$query&types=(cities)&key=$key';
    var response = await http.get(url);
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['predictions'] as List;
    
    return jsonResults.map((place) => PlaceSearch.fromJson(place)).toList();
  }
}
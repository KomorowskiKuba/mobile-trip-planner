import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_trip_planner/blocs/app_bloc.dart';
import 'package:mobile_trip_planner/models/place_model.dart';
import 'package:mobile_trip_planner/models/tripinfo_model.dart';
import 'package:mobile_trip_planner/screens/add_place.dart';
import 'package:mobile_trip_planner/services/places_service.dart';
import 'package:provider/provider.dart';

class TravelDestinationTile extends StatefulWidget {
  final Tripinfo travel;

  TravelDestinationTile({key, required this.travel})
      : super(key: key);

  @override
  _TravelDestinationTileState createState() => _TravelDestinationTileState();
}

class _TravelDestinationTileState extends State<TravelDestinationTile> {
  Completer<GoogleMapController> _controller = Completer();
  PlacesService placesService = PlacesService();
  Marker _destination = Marker(markerId: MarkerId('center'));
  final _locationController = TextEditingController();
  String _actualPlaceId = '';

  StreamSubscription? locationSubscription;

  Future<void> _goToPlace(Place place) async {
    final GoogleMapController controller = await _controller.future;
    _addMarker(place);
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(place.geometry.location.lat, place.geometry.location.lng),
      zoom: 10.0,
    )));
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  void initState() {
    print(widget.travel.destinationId);
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_){
            asyncMethod();
          });
  }

  void asyncMethod() async {
    Place place = await placesService.getPlace(widget.travel.destinationId);
    print(place.geometry.location.lat);
    print(place.geometry.location.lng);
    _addMarker(place);
    _goToPlace(place);
  }

  void _addMarker(Place place) {
    _destination = Marker(
      markerId: MarkerId('center'),
      draggable: false,
      infoWindow: InfoWindow(title: place.name, snippet: place.vicinity),
      position:
          LatLng(place.geometry.location.lat, place.geometry.location.lng),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appBloc = Provider.of<AppBloc>(context);
    
    return Container(
      height: 250,
      width: double.infinity,
      child: Card(
        color: Theme.of(context).primaryColor,
        child: Container(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  widget.travel.name,
                  style: TextStyle(
                      color: Theme.of(context).accentColor, fontSize: 30),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 185,
                child: Card(
                  child: GoogleMap(
                    markers: {_destination},
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                              target: LatLng(appBloc.currentLocation!.latitude,
                                  appBloc.currentLocation!.longitude),
                              zoom: 10),
                    onMapCreated: _onMapCreated,
                    onTap: (val) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddPlaceScreen()));
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_trip_planner/screens/add_place.dart';

class TravelDestinationTile extends StatefulWidget {
  final String travelDestination;

  TravelDestinationTile({key, required this.travelDestination})
      : super(key: key);

  @override
  _TravelDestinationTileState createState() => _TravelDestinationTileState();
}

class _TravelDestinationTileState extends State<TravelDestinationTile> {
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
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
                  widget.travelDestination,
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
                    mapType: MapType.normal,
                    initialCameraPosition:
                        CameraPosition(target: _center, zoom: 11),
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

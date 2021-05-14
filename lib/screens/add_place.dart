import 'dart:async';

import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_trip_planner/geolocation/app_bloc.dart';
//import 'package:google_places_picker/google_places_picker.dart';

import 'package:mobile_trip_planner/widgets/my_app_bar.dart';
import 'package:provider/provider.dart';

class AddPlaceScreen extends StatefulWidget {
  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    final appBloc = Provider.of<AppBloc>(context);

    return Scaffold(
        appBar: MyAppBar.withoutIcons('Dodaj miejsce'),
        backgroundColor: Theme.of(context).primaryColor,
        body: Stack(
          children: [
            (appBloc.currentLocation == null)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : GoogleMap(
                    mapType: MapType.normal,
                    myLocationEnabled: true,
                    initialCameraPosition: CameraPosition(
                        target: LatLng(appBloc.currentLocation.latitude,
                            appBloc.currentLocation.longitude),
                        zoom: 11),
                    onMapCreated: _onMapCreated,
                  ),
            Positioned(
                top: 10,
                right: 10,
                left: 10,
                child: Container(
                    child: Card(
                  color: Theme.of(context).primaryColor,
                  child: Row(
                    children: [
                      IconButton(
                          color: Theme.of(context).accentColor,
                          icon: Icon(Icons.search),
                          onPressed: () {}),
                      Expanded(
                          child: TextField(
                        style: TextStyle(color: Colors.white, fontSize: 25),
                        cursorColor: Theme.of(context).accentColor,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.go,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            hintText: 'Szukaj miejsca...'),
                        onSubmitted: (val) {},
                      ))
                    ],
                  ),
                )))
          ],
        ));
  }
}

import 'dart:async';

import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_trip_planner/blocs/app_bloc.dart';
import 'package:mobile_trip_planner/models/place_model.dart';

import 'package:mobile_trip_planner/widgets/my_app_bar.dart';
import 'package:provider/provider.dart';

class AddPlaceScreen extends StatefulWidget {
  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  Completer<GoogleMapController> _controller = Completer();
  final _locationController = TextEditingController();

  StreamSubscription locationSubscription;

  Future<void> _goToPlace(Place place) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(place.geometry.location.lat, place.geometry.location.lng),
          zoom: 10.0,
        )
      )
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  void initState() {
    final appBloc = Provider.of<AppBloc>(context, listen: false);
    
    locationSubscription = appBloc.selectedLocation.stream.listen((place) {
      if (place != null) {
        _goToPlace(place);
      } else {
        _locationController.text = "";
      }
    });
    
    super.initState();
  }

  @override
  void dispose() {
    final appBloc = Provider.of<AppBloc>(context, listen: false);

    appBloc.dispose();
    _locationController.dispose();
    locationSubscription.cancel();
    super.dispose();
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
                : Stack(
                    children: [
                      Container(
                        child: GoogleMap(
                          mapType: MapType.normal,
                          myLocationEnabled: true,
                          initialCameraPosition: CameraPosition(
                              target: LatLng(appBloc.currentLocation.latitude,
                                  appBloc.currentLocation.longitude),
                              zoom: 10),
                          onMapCreated: _onMapCreated
                        ),
                      ),
                      if (appBloc.searchResults != null && appBloc.searchResults.length != 0) // && _locationController.text.length != 0) 
                        Container(
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .backgroundColor
                                  .withOpacity(.6),
                              backgroundBlendMode: BlendMode.darken),
                        ),
                      if (appBloc.searchResults != null && _locationController.text.length != 0)
                        Container(
                          height: 300,
                          width: double.infinity,
                          child: ListView.builder(
                            itemCount: appBloc.searchResults.length,
                            itemBuilder: (context, index) {
                              
                              return ListTile(
                                title: Text(
                                  appBloc.searchResults[index].description,
                                  style: TextStyle(color: Colors.white),
                                ),
                                onTap: () {
                                  appBloc.setSelectedLocation(
                                    appBloc.searchResults[index].placeId
                                  );
                                  //FocusScope.of(context).unfocus();
                                },
                              );
                            },
                          ),
                        )
                    ],
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
                              controller: _locationController,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                              cursorColor: Theme.of(context).accentColor,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.go,
                              textCapitalization: TextCapitalization.words,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                  hintText: 'Szukaj miejsca...'),
                              onSubmitted: (val) {},
                              onChanged: (val) => appBloc.searchPlaces(val),
                            ))
                          ],
                        )))),
          ],
        ));
  }
}

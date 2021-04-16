import 'package:flutter/material.dart';

import 'package:mobile_trip_planner/models/travel_model.dart';
import 'package:mobile_trip_planner/screens/manage_travel.dart';

class TripPreviewTile extends StatelessWidget {
  final Travel _travel;

  TripPreviewTile(this._travel);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 200,
      child: GestureDetector(
        child: Card(
          color: Theme.of(context).primaryColorLight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(_travel.destination, style: TextStyle(fontSize: 25, color: Colors.white)),
              SizedBox(
                height: 5,
              ),
              Container(
                width: 100,
                height: 100,
                child: Image(
                  image: AssetImage('lib/assets/images/paris.jpg'),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => TravelManageScreen(_travel)));
        },
      ),
    );
  }
}

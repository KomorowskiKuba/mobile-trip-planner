import 'package:flutter/material.dart';
import 'package:mobile_trip_planner/models/travel_model.dart';
import 'package:mobile_trip_planner/widgets/trip_preview_tile.dart';

class ScrollableRowTile extends StatelessWidget {
  final List<Travel> _travels;

  ScrollableRowTile(this._travels);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Card(
          color: Theme.of(context).primaryColor,
          child: Container(
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                Row(
                  children: [
                    //Icon(),
                    Text('Poprzednie podróże',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ))
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (var currentTravel in _travels)
                        TripPreviewTile(currentTravel),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

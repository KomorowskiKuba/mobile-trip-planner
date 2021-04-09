import 'package:flutter/material.dart';
import 'package:mobile_trip_planner/widgets/trip_preview_tile.dart';

class ScrollableRowTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        width: double.infinity,
        child: Card(
          color: Theme.of(context).primaryColor,
          child: Column(
            children: [
              Row(
                children: [
                  //Icon(),
                  Text('xddd', style: TextStyle(color: Colors.white))
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    TripPreviewTile(),
                    TripPreviewTile(),
                    TripPreviewTile(),
                    TripPreviewTile(),
                    TripPreviewTile(),
                    TripPreviewTile(),
                    TripPreviewTile(),
                    TripPreviewTile(),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

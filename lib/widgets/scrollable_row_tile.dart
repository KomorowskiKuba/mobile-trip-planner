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
                      TripPreviewTile('Rzym', null),
                      TripPreviewTile('Paryż', null),
                      TripPreviewTile('Huston', null),
                      TripPreviewTile('Nowy Jork', null),
                      TripPreviewTile('Warszawa', null),
                      TripPreviewTile('Barcelona', null),
                      TripPreviewTile('Czeremcha', null),
                      TripPreviewTile('Bydgoszcz', null),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

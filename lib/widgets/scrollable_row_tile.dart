import 'package:flutter/material.dart';
import 'package:mobile_trip_planner/models/tripinfo_model.dart';
import 'package:mobile_trip_planner/screens/manage_travel.dart';
import 'package:mobile_trip_planner/widgets/trip_preview_tile.dart';

class ScrollableRowTile extends StatefulWidget {
  List<Tripinfo> _travels;
  bool isChanged = false;

  ScrollableRowTile(this._travels);

  @override
  _ScrollableRowTileState createState() => _ScrollableRowTileState();
}

class _ScrollableRowTileState extends State<ScrollableRowTile> {
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
                /*Row(
                  children: [
                    Expanded(child: ListView.builder(
                      itemCount: widget._travels.length,
                          itemBuilder: (context, index) {
                            final travel = widget._travels[index];
                            return TripPreviewTile(travel);
                          }
                    )),
                  ],
                )*/
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (var currentTravel in widget._travels)
                        TripPreviewTile(currentTravel, () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TravelManageScreen(currentTravel)));
                        }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:mobile_trip_planner/database_helpers/trip_database_helper.dart';
import 'package:mobile_trip_planner/models/tripinfo_model.dart';

import 'package:mobile_trip_planner/screens/manage_travel.dart';

class TripPreviewTile extends StatelessWidget {
  final Tripinfo _tripinfo;
  final Function _function;

  TripPreviewTile(this._tripinfo, this._function);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return WillPopScope(
      child: Container(
        //height: height * 0.2,
        width: width * 0.5,
        child: GestureDetector(
          child: Card(
            color: Theme.of(context).primaryColorLight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(_tripinfo.name,
                      style: TextStyle(fontSize: 25, color: Colors.white)),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  //width: width * 0.5,
                  //height: height * 0.16,
                  child: Image(
                    image: AssetImage('lib/assets/images/travel.png'),
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ],
            ),
          ),
          onTap: () => _function(),
        ),
      ),
      onWillPop: () async {
        Navigator.pop(context, true);
        return true;
      },
    );
  }
}

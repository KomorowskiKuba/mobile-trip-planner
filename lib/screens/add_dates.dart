import 'package:flutter/material.dart';

import 'package:mobile_trip_planner/widgets/date_pick_and_display_tile.dart';
import 'package:mobile_trip_planner/widgets/my_app_bar.dart';
import 'package:mobile_trip_planner/widgets/next_screen_tile.dart';

class AddDatesScreen extends StatefulWidget {
  @override
  _AddDatesScreenState createState() => _AddDatesScreenState();
}

class _AddDatesScreenState extends State<AddDatesScreen> {
  List<DateTime> dates = [DateTime.now(), DateTime.now()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.withoutIcons('Dodaj daty'),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(children: [
        SizedBox(
              height: 5,
            ),
        DatePickAndDisplayTile(),
        NextScreenTile('xd', Icon(Icons.ac_unit), null)
      ],),
    );
  }
}
import 'package:flutter/material.dart';

import 'package:mobile_trip_planner/models/travel_model.dart';
import 'package:mobile_trip_planner/widgets/my_app_bar.dart';

class TravelManageScreen extends StatelessWidget {
  final Travel _travel;

  TravelManageScreen(this._travel);  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.withoutIcons(_travel.destination),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(),
      ),
    );
  }
}
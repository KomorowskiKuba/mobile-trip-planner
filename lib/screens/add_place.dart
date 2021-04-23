import 'package:flutter/material.dart';
import 'package:mobile_trip_planner/widgets/my_app_bar.dart';

class AddPlaceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.withoutIcons('Dodaj miejsce'),
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(children: [
        SizedBox(
              height: 5,
            ),
      ],),
    );
  }
}

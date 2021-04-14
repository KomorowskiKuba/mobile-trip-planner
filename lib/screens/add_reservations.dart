import 'package:flutter/material.dart';
import 'package:mobile_trip_planner/widgets/my_app_bar.dart';

class AddReservationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Dodaj bilety i rezerwacje'),
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(children: [
        SizedBox(
              height: 5,
            ),
      ],),
    );
  }
}

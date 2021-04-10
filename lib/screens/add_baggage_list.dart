import 'package:flutter/material.dart';
import 'package:mobile_trip_planner/widgets/my_app_bar.dart';

class AddBaggageListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Dodaj listę rzeczy'),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}

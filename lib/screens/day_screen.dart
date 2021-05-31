import 'package:flutter/material.dart';
import 'package:mobile_trip_planner/models/day_model.dart';
import 'package:mobile_trip_planner/widgets/my_app_bar.dart';

class DayScreen extends StatelessWidget {
  final SingleDay? day;

  DayScreen({this.day});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.withoutIcons(day!.name, () {}),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}
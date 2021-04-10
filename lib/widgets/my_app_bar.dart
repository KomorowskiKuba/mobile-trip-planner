import 'package:flutter/material.dart';
import 'package:mobile_trip_planner/main.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final String _title;
  final double height = kToolbarHeight;

  MyAppBar(this._title);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Theme.of(context).accentColor,
        title: Text(
          _title,
          style: TextStyle(color: Colors.white),
        ));
  }
}

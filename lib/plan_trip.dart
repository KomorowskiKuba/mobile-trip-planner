import 'package:flutter/material.dart';

class PlanTrip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        title: Text(
          'Second screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mobile_trip_planner/plan_trip.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _name = 'Kuba';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Witaj, ' + _name + '!'),
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                height: 300, //TODO: change to dynamic
                width: 400, //TODO: change to dynamic
                child: Card(
                    color: Theme.of(context).primaryColor,
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          Text('Porada dnia',
                              style: TextStyle(
                                  color: Colors.white)), //TODO: change fonts
                          Text('LOREM IPSUM',
                              style: TextStyle(
                                  color: Colors.white)), //TODO: change fonts
                        ],
                      ),
                    )),
              ),
            ),
            Center(
              child: Container(
                height: 100, //TODO: change to dynamic
                width: 400, //TODO: change to dynamic
                child: InkWell(
                  child: Card(
                    color: Theme.of(context).primaryColor,
                    child: Row(
                      children: [
                        Text('XDDD', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PlanTrip()));
                  },
                ),
              ),
            ),
            Center(
                child: Container(
                    child: Card(
              color: Theme.of(context).primaryColor,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('xddd', style: TextStyle(color: Colors.white))
                    ],
                  ),
                  Row(
                    children: [
                      Text('xddd', style: TextStyle(color: Colors.white))
                    ],
                  )
                ],
              ),
            ))),
          ],
        ),
      ),
    );
  }
}

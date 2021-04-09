import 'package:flutter/material.dart';
import 'package:mobile_trip_planner/plan_trip.dart';
import 'package:mobile_trip_planner/widgets/scrollable_row_tile.dart';

import 'widgets/next_screen_tile.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _name = 'Kuba';
  String _tipContent =
      'Nigdy nie zostawiaj pakowania bagazu na ostatni moment! Śpiesząc się możesz zapomnieć o czymś ważnym, co może negatywnie wpłynąć na Twój wyjazd!';

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
                width: double.infinity, //TODO: change to dynamic
                child: Card(
                  color: Theme.of(context).primaryColor,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text('Porada dnia',
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 35,
                              )),
                        ), //TODO: change fonts
                        Text(_tipContent,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                            )), //TODO: change fonts
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: NextScreenTile('XDDD_XDDD', null, PlanTrip()),
            ),
            Center(child: ScrollableRowTile()),
          ],
        ),
      ),
    );
  }
}

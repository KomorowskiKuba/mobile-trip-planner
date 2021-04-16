import 'package:flutter/material.dart';
import 'package:mobile_trip_planner/models/tip_model.dart';
import 'package:mobile_trip_planner/models/travel_model.dart';
import 'package:mobile_trip_planner/screens/plan_trip.dart';
import 'package:mobile_trip_planner/widgets/scrollable_row_tile.dart';

import '../widgets/next_screen_tile.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _name = 'Kuba';

  final Tip _tip = Tip('Porada na dziś', 'Nigdy nie zostawiaj pakowania bagazu na ostatni moment! Śpiesząc się możesz zapomnieć o czymś ważnym, co może negatywnie wpłynąć na Twój wyjazd!');

  final List<Travel> _travels = [
    Travel('Rzym', Image(image: AssetImage('lib/assets/images/paris.jpg'))),
    Travel('Paryż', Image(image: AssetImage('lib/assets/images/paris.jpg'))),
    Travel('Huston', Image(image: AssetImage('lib/assets/images/paris.jpg'))),
    Travel('Nowy Jork', Image(image: AssetImage('lib/assets/images/paris.jpg'))),
    Travel('Warszawa', Image(image: AssetImage('lib/assets/images/paris.jpg'))),
    Travel('Barcelona', Image(image: AssetImage('lib/assets/images/paris.jpg'))),
    Travel('Czeremcha', Image(image: AssetImage('lib/assets/images/paris.jpg'))),
    Travel('Bydgoszcz', Image(image: AssetImage('lib/assets/images/paris.jpg'))),
  ];

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
            SizedBox(
              height: 5,
            ),
            Center(
              child: Container(
                width: double.infinity, //TODO: change to dynamic
                child: Card(
                  color: Theme.of(context).primaryColor,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(_tip.title,
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 35,
                              )),
                        ), //TODO: change fonts
                        Text(_tip.content,
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
              child: NextScreenTile(
                  'Zaplanuj podróż',
                  Icon(
                    Icons.airplanemode_on_sharp,
                    size: 40,
                    color: Theme.of(context).accentColor,
                  ),
                  TripPlanScreen()),
            ),
            Center(child: ScrollableRowTile(_travels)),
          ],
        ),
      ),
    );
  }
}

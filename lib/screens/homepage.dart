import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:mobile_trip_planner/models/tip_model.dart';
import 'package:mobile_trip_planner/models/travel_model.dart';
import 'package:mobile_trip_planner/screens/plan_trip.dart';
import 'package:mobile_trip_planner/screens/settings.dart';
import 'package:mobile_trip_planner/widgets/my_app_bar.dart';
import 'package:mobile_trip_planner/widgets/scrollable_row_tile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/next_screen_tile.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future _future = Future<Null>.value(null);
  String _name = 'Nieznajomy';
  List<Tip> _tips = [];

  List<Travel> _travels = [
    Travel('Rzym', Image(image: AssetImage('lib/assets/images/paris.jpg')),
        [DateTime.now(), DateTime.now()]),
    Travel('Paryż', Image(image: AssetImage('lib/assets/images/paris.jpg')),
        [DateTime.now(), DateTime.now()]),
    Travel('Huston', Image(image: AssetImage('lib/assets/images/paris.jpg')),
        [DateTime.now(), DateTime.now()]),
    Travel('Nowy Jork', Image(image: AssetImage('lib/assets/images/paris.jpg')),
        [DateTime.now(), DateTime.now()]),
    Travel('Warszawa', Image(image: AssetImage('lib/assets/images/paris.jpg')),
        [DateTime.now(), DateTime.now()]),
    Travel('Barcelona', Image(image: AssetImage('lib/assets/images/paris.jpg')),
        [DateTime.now(), DateTime.now()]),
    Travel('Czeremcha', Image(image: AssetImage('lib/assets/images/paris.jpg')),
        [DateTime.now(), DateTime.now()]),
    Travel('Bydgoszcz', Image(image: AssetImage('lib/assets/images/paris.jpg')),
        [DateTime.now(), DateTime.now()]),
  ];

  _loadName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      if (preferences.getString('userName') != null &&
          preferences.getString('userName').length > 0) {
        _name = preferences.getString('userName');
      } else {
        _name = 'Nieznajomy';
      }
    });
  }

  int _getRandomIndex(int length) {
    var rng = new Random();
    return rng.nextInt(length);
  }

  Future<String> _readJson() async =>
      rootBundle.loadString('lib/assets/other/tips.json');

  @override
  void initState() {
    _future = _readJson();
    _loadName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: MyAppBar('Witaj, ' + _name + '!', Icon(Icons.settings), () {
        Navigator.push(context,
                MaterialPageRoute(builder: (context) => SettingsScreen()))
            .then((value) => _loadName());
      }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Center(
              child: Container(
                width: double.infinity,
                child: Card(
                  color: Theme.of(context).primaryColor,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text('Porada na dziś',
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 35,
                              )),
                        ),
                        FutureBuilder(
                            future: _future,
                            builder: (context, AsyncSnapshot snapshot) {
                              if (!snapshot.hasData) {
                                return Text('Ładowanie...');
                              }

                              List<dynamic> parsedJson =
                                  jsonDecode(snapshot.data);
                              _tips = parsedJson.map((element) {
                                return Tip(element.toString());
                              }).toList();

                              return Text(
                                  _tips.length == 0
                                      ? "Ładowanie..."
                                      : _tips[_getRandomIndex(_tips.length)]
                                          .toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                  ));
                            })
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

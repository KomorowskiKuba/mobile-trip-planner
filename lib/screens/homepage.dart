import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:mobile_trip_planner/database_helpers/trip_database_helper.dart';
import 'package:mobile_trip_planner/models/tip_model.dart';
import 'package:mobile_trip_planner/models/tripinfo_model.dart';
import 'package:mobile_trip_planner/screens/plan_trip.dart';
import 'package:mobile_trip_planner/screens/settings.dart';
import 'package:mobile_trip_planner/widgets/my_app_bar.dart';
import 'package:mobile_trip_planner/widgets/trip_preview_tile.dart';

import '../widgets/next_screen_tile.dart';
import 'manage_travel.dart';

import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading = false;
  Future _future = Future<Null>.value(null);
  String _name = 'Nieznajomy';
  List<Tip> _tips = [];

  List<Tripinfo> _travels = [];

  Future loadTravels() async {
    setState(() => isLoading = true);
    _travels = await TripDatabaseHelper.instance.readlAllInfo();
    setState(() => isLoading = false);
  }

  _loadName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      if (preferences.getString('userName') != null &&
          preferences.getString('userName')!.length > 0) {
        _name = preferences.getString('userName')!;
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
    loadTravels();
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
                    title: 'Zaplanuj podróż',
                    icon: Icon(
                      Icons.airplanemode_on_sharp,
                      size: 40,
                      color: Theme.of(context).accentColor,
                    ),
                    function: () {
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TripPlanScreen()))
                          .whenComplete(loadTravels);
                    })),
            isLoading
                ? CircularProgressIndicator()
                : Center(
                    child: Container(
                    width: double.infinity,
                    child: Card(
                      color: Theme.of(context).primaryColor,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                //Icon(),
                                Text('Poprzednie podróże',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                    ))
                              ],
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  for (var currentTravel in _travels)
                                    TripPreviewTile(currentTravel, () {
                                      Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      TravelManageScreen(
                                                          currentTravel)))
                                          .then((val) => loadTravels());
                                    }),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ))
          ],
        ),
      ),
    );
  }
}

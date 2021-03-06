import 'package:flutter/material.dart';

import 'package:mobile_trip_planner/database_helpers/trip_database_helper.dart';
import 'package:mobile_trip_planner/models/tripinfo_model.dart';
import 'package:mobile_trip_planner/screens/add_dates.dart';
import 'package:mobile_trip_planner/screens/add_place.dart';
import 'package:mobile_trip_planner/widgets/my_app_bar.dart';
import 'package:mobile_trip_planner/widgets/next_screen_tile.dart';
import 'package:mobile_trip_planner/widgets/saved_snack_bar.dart';
import 'package:mobile_trip_planner/widgets/travel_name_widget.dart';
import 'package:mobile_trip_planner/widgets/yes_no_saving_popup.dart';

class TripPlanScreen extends StatefulWidget {
  @override
  _TripPlanScreenState createState() => _TripPlanScreenState();
}

class _TripPlanScreenState extends State<TripPlanScreen> {
  Tripinfo _travel = Tripinfo(
      name: "Nowa podróż",
      destinationId: "",
      startDate: DateTime.now(),
      endDate: DateTime.now());
  bool _isSaved = false;
  var _dates;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: MyAppBar('Planowanie podróży', Icon(Icons.save), () {
          if (!_isSaved) {
            _isSaved = true;
            TripDatabaseHelper.instance.create(_travel);
          }
          SavedSnackBar.buildSavedSnackBar(context);
          _isSaved = true;
        }),
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Center(
                child: TravelNameWidget(
                  tripinfo: _travel,
                ),
              ),
              Center(
                  child: NextScreenTile(
                      title: 'Dodaj miejsce',
                      icon: Icon(
                        Icons.place,
                        color: Theme.of(context).accentColor,
                      ),
                      function: () async {
                        final placeId = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddPlaceScreen()))
                            as String;
                        _travel.destinationId = placeId;
                      })
                  //AddPlaceScreen()),
                  ),
              Center(
                  child: NextScreenTile(
                      title: 'Dodaj daty',
                      icon: Icon(
                        Icons.calendar_today,
                        color: Theme.of(context).accentColor,
                      ),
                      function: () async {
                        final outcome = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddDatesScreen(
                                        _travel.startDate, _travel.endDate)))
                            as DateTimeRange;
                        _travel.startDate = outcome.start;
                        _travel.endDate = outcome.end;
                      })),
            ],
          ),
        ),
      ),
      onWillPop: () {
        if (_isSaved) {
          Navigator.pop(context, false);
        } else {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return YesNoSavingPopupWidget(
                    title: 'Podróż nie zapisana',
                    content: 'Czy na pewno chcesz wyjść?');
              });
        }
        return Future.value(false);
      },
    );
  }
}

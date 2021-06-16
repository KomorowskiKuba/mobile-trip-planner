import 'package:flutter/material.dart';
import 'package:mobile_trip_planner/database_helpers/trip_database_helper.dart';

import 'package:mobile_trip_planner/models/tripinfo_model.dart';
import 'package:mobile_trip_planner/widgets/date_pick_and_display_tile.dart';
import 'package:mobile_trip_planner/widgets/my_app_bar.dart';
import 'package:mobile_trip_planner/widgets/next_screen_tile.dart';
import 'package:mobile_trip_planner/widgets/saved_snack_bar.dart';
import 'package:mobile_trip_planner/widgets/travel_destination_widget.dart';
import 'package:mobile_trip_planner/widgets/travel_name_widget.dart';

import 'add_baggage_list.dart';
import 'add_dates.dart';
import 'add_notes.dart';
import 'add_tickets.dart';

class TravelManageScreen extends StatelessWidget {
  final key = new GlobalKey<DatePickAndDisplayTileState>();
  final Tripinfo _tripinfo;

  TravelManageScreen(this._tripinfo);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: MyAppBar('Twoja podróż', Icon(Icons.delete), () {
          TripDatabaseHelper.instance.delete(_tripinfo.travelId);
          Navigator.pop(context);
        }),
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 5),
              Center(child: TravelNameWidget(tripinfo: _tripinfo)
                ,),
              TravelDestinationTile(travel: _tripinfo),
              Center(
                  child: NextScreenTile(
                      title: 'Daty',
                      icon: Icon(
                        Icons.calendar_today,
                        color: Theme.of(context).accentColor,
                      ),
                      function: () async {
                        print(_tripinfo.destinationId);
                          final outcome = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddDatesScreen(_tripinfo.startDate, _tripinfo.endDate))) as DateTimeRange;
                          _tripinfo.startDate = outcome.start;
                          _tripinfo.endDate = outcome.end;
                        })),
              Center(
                  child: NextScreenTile(
                      title: 'Rezerwacje',
                      icon: Icon(
                        Icons.check_box,
                        color: Theme.of(context).accentColor,
                      ), //zmienic ikonke
                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddTicketsScreen(tripinfo: _tripinfo,)));
                      })),
              Center(
                  child: NextScreenTile(
                      title: 'Notatki',
                      icon: Icon(
                        Icons.notes,
                        color: Theme.of(context).accentColor,
                      ),
                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NotesScreen(tripinfo: _tripinfo,)));
                      })
                  //NotesScreen()),
                  ),
              Center(
                  child: NextScreenTile(
                      title: 'Lista rzeczy',
                      icon: Icon(
                        Icons.check_box,
                        color: Theme.of(context).accentColor,
                      ),
                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddBaggageListScreen(tripinfo: _tripinfo,)));
                      })),
            ],
          ),
        ),
      ),
      onWillPop: () {
        TripDatabaseHelper.instance.update(_tripinfo);
        SavedSnackBar.buildSavedSnackBar(context);
        Navigator.of(context).pop();
        return Future.value(true);
      },
    );
  }
}

import 'package:flutter/material.dart';

import 'package:mobile_trip_planner/screens/add_baggage_list.dart';
import 'package:mobile_trip_planner/screens/add_dates.dart';
import 'package:mobile_trip_planner/screens/add_notes.dart';
import 'package:mobile_trip_planner/screens/add_place.dart';
import 'package:mobile_trip_planner/screens/add_tickets.dart';
import 'package:mobile_trip_planner/widgets/my_app_bar.dart';
import 'package:mobile_trip_planner/widgets/next_screen_tile.dart';

class TripPlanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Planowanie podróży'),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Center(
              child: NextScreenTile(
                  'Dodaj miejsce',
                  Icon(
                    Icons.place,
                    color: Theme.of(context).accentColor,
                  ),
                  AddPlaceScreen()),
            ),
            Center(
              child: NextScreenTile(
                  'Dodaj daty',
                  Icon(
                    Icons.calendar_today,
                    color: Theme.of(context).accentColor,
                  ),
                  AddDatesScreen()),
            ),
            Center(
                child: NextScreenTile(
                    'Dodaj rezerwacje',
                    Icon(
                      Icons.check_box,
                      color: Theme.of(context).accentColor,
                    ), //zmienic ikonke
                    AddTicketsScreen())),
            Center(
              child: NextScreenTile(
                  'Dodaj notatki',
                  Icon(
                    Icons.notes,
                    color: Theme.of(context).accentColor,
                  ),
                  AddNotesScreen()),
            ),
            Center(
              child: NextScreenTile(
                  'Dodaj listę rzeczy',
                  Icon(
                    Icons.check_box,
                    color: Theme.of(context).accentColor,
                  ),
                  AddBaggageListScreen()),
            ),
          ],
        ),
      ),
    );
  }
}

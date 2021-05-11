import 'package:flutter/material.dart';

import 'package:mobile_trip_planner/models/travel_model.dart';
import 'package:mobile_trip_planner/widgets/date_pick_and_display_tile.dart';
import 'package:mobile_trip_planner/widgets/my_app_bar.dart';
import 'package:mobile_trip_planner/widgets/next_screen_tile.dart';
import 'package:mobile_trip_planner/widgets/travel_destination_widget.dart';

import 'add_baggage_list.dart';
import 'add_notes.dart';
import 'add_tickets.dart';

class TravelManageScreen extends StatelessWidget {
  final key = new GlobalKey<DatePickAndDisplayTileState>();
  final Travel _travel;

  TravelManageScreen(this._travel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.withoutIcons('Twoja podróż'),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            TravelDestinationTile(travelDestination: _travel.destination),
            DatePickAndDisplayTile(),
            Center(
                child: NextScreenTile(
                    'Rezerwacje',
                    Icon(
                      Icons.check_box,
                      color: Theme.of(context).accentColor,
                    ), //zmienic ikonke
                    AddTicketsScreen())),
            Center(
              child: NextScreenTile(
                  'Notatki',
                  Icon(
                    Icons.notes,
                    color: Theme.of(context).accentColor,
                  ),
                  NotesScreen()),
            ),
            Center(
              child: NextScreenTile(
                  'Lista rzeczy',
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

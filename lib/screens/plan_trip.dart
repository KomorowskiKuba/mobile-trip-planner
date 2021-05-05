import 'package:flutter/material.dart';

import 'package:mobile_trip_planner/screens/add_baggage_list.dart';
import 'package:mobile_trip_planner/screens/add_dates.dart';
import 'package:mobile_trip_planner/screens/add_notes.dart';
import 'package:mobile_trip_planner/screens/add_place.dart';
import 'package:mobile_trip_planner/screens/add_tickets.dart';
import 'package:mobile_trip_planner/widgets/my_app_bar.dart';
import 'package:mobile_trip_planner/widgets/next_screen_tile.dart';

class TripPlanScreen extends StatelessWidget {
  bool _isSaved = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: MyAppBar('Planowanie podróży', Icon(Icons.save), () {
          //save
          print('Zapisano!');
          _isSaved = true;
          print(_isSaved);
        }),
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
                    NotesScreen()),
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
      ),
      onWillPop: () {
        if (_isSaved) {
          Navigator.pop(context, false);
        } else {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Zapisz podróż'),
                  content: Text('Czy przed wyjściem chcesz zapisać podróż?'),
                  actions: [
                    TextButton(
                      child: Text('Nie'),
                      onPressed: () {
                        Navigator.pop(context, false);
                        Navigator.pop(context, false);
                      },
                    ),
                    TextButton(
                      child: Text('Tak'),
                      onPressed: () {
                        //save
                        print('SAVED');
                        Navigator.pop(context, false);
                        Navigator.pop(context, false);
                      },
                    ),
                  ],
                );
              });
        }
        return Future.value(false);
      },
    );
  }
}

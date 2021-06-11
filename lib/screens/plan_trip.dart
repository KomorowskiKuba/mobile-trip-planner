import 'package:flutter/material.dart';

import 'package:mobile_trip_planner/screens/add_baggage_list.dart';
import 'package:mobile_trip_planner/screens/add_dates.dart';
import 'package:mobile_trip_planner/screens/add_notes.dart';
import 'package:mobile_trip_planner/screens/add_place.dart';
import 'package:mobile_trip_planner/screens/add_tickets.dart';
import 'package:mobile_trip_planner/widgets/my_app_bar.dart';
import 'package:mobile_trip_planner/widgets/next_screen_tile.dart';
import 'package:mobile_trip_planner/widgets/saved_snack_bar.dart';
import 'package:mobile_trip_planner/widgets/yes_no_saving_popup.dart';

class TripPlanScreen extends StatelessWidget {
  bool _isSaved = false;
  var _dates;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: MyAppBar('Planowanie podróży', Icon(Icons.save), () {
          //save
          SavedSnackBar.buildSavedSnackBar(context);
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
                      title: 'Dodaj miejsce',
                      icon: Icon(
                        Icons.place,
                        color: Theme.of(context).accentColor,
                      ),
                      function: () {
                        final placeId = Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddPlaceScreen()));
                        print("MIEJSCE");
                        print(placeId);
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
                                builder: (context) => AddDatesScreen()));
                        print("DATY!!!!");
                        print(outcome.toString());
                      })),
              Center(
                  child: NextScreenTile(
                      title: 'Dodaj rezerwacje',
                      icon: Icon(
                        Icons.check_box,
                        color: Theme.of(context).accentColor,
                      ),
                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddTicketsScreen()));
                      })), //zmienic ikonke
              Center(
                  child: NextScreenTile(
                      title: 'Dodaj notatki',
                      icon: Icon(
                        Icons.notes,
                        color: Theme.of(context).accentColor,
                      ),
                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NotesScreen()));
                      })),
              Center(
                  child: NextScreenTile(
                      title: 'Dodaj listę rzeczy',
                      icon: Icon(
                        Icons.check_box,
                        color: Theme.of(context).accentColor,
                      ),
                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddBaggageListScreen()));
                      })),
            ],
          ),
        ),
      ),
      onWillPop: () {
        print("DATES: ");
        print(_dates.toString());
        if (_isSaved) {
          Navigator.pop(context, false);
        } else {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return YesNoSavingPopupWidget(
                    title: 'Zapisz podróż',
                    content: 'Czy przed wyjściem chcesz zapisać podróż?');
              });
        }
        return Future.value(false);
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mobile_trip_planner/models/day_model.dart';
import 'package:mobile_trip_planner/screens/day_screen.dart';
import 'package:mobile_trip_planner/widgets/checklist_item_widget_dismissible.dart';

import 'package:mobile_trip_planner/widgets/date_pick_and_display_tile.dart';
import 'package:mobile_trip_planner/widgets/my_app_bar.dart';
import 'package:mobile_trip_planner/widgets/next_screen_tile.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;

class AddDatesScreen extends StatefulWidget {
  @override
  _AddDatesScreenState createState() => _AddDatesScreenState();
}

class _AddDatesScreenState extends State<AddDatesScreen> {
  final key = new GlobalKey<DatePickAndDisplayTileState>();
  List<DateTime> _dates = [DateTime.now(), DateTime.now()];
  int _amountOfDays = 7;
  late List<SingleDay> _days;

  static List<SingleDay> generateDays(int amount) {
    List<SingleDay> days = [];

    for (int i = 1; i <= amount; i++) {
      days.add(SingleDay(name: ('Dzień ' + i.toString()), activities: [], date: DateTime.now(), ));
    }

    return days;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: MyAppBar.withoutIcons('Dodaj daty'),
        backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            InkWell(
                child: DatePickAndDisplayTile(key: key, dates: _dates),
                onTap: () async {
                  final List<DateTime> picked =
                      await DateRangePicker.showDatePicker(
                    context: context,
                    initialFirstDate: DateTime.now(),
                    initialLastDate: (DateTime.now()).add(Duration(days: 7)),
                    firstDate: DateTime(2015),
                    lastDate: DateTime(2040),
                  );

                  if (picked != null && picked.length == 2) {
                    setState(() {
                      _dates = picked;
                      _amountOfDays = _dates[1].day - _dates[0].day + 1;
                      _days = generateDays(_amountOfDays);
                      print(_amountOfDays);
                    });
                  }
                }),
            _days == null ? Container(
             width: 1,
             height: 1, 
            ) 
            : Expanded(
              child: ListView.builder(
                itemCount: _days.length,
                itemBuilder: (context, index) {
                  final day = _days[index];

                  return Dismissible(
                    direction: DismissDirection.startToEnd,
                    background: DismissibleItemBackground(),
                    key: Key(day.name),
                    onDismissed: (direction) {
                      setState(() {
                        _days.removeAt(index);
                      });
                    },
                    child: NextScreenTile(day.name, Icon(Icons.calendar_today, color: Colors.white), DayScreen(day: day)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      onWillPop: () {
          Navigator.pop(context);
          throw Exception(); //TODO WTF
      },
    );
  }
}

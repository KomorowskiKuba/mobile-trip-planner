import 'package:flutter/material.dart';
import 'package:mobile_trip_planner/models/day_model.dart';
import 'package:mobile_trip_planner/screens/day_screen.dart';
import 'package:mobile_trip_planner/widgets/checklist_item_widget_dismissible.dart';

import 'package:mobile_trip_planner/widgets/date_pick_and_display_tile.dart';
import 'package:mobile_trip_planner/widgets/my_app_bar.dart';
import 'package:mobile_trip_planner/widgets/next_screen_tile.dart';

class AddDatesScreen extends StatefulWidget {
  @override
  _AddDatesScreenState createState() => _AddDatesScreenState();
}

class _AddDatesScreenState extends State<AddDatesScreen> {
  final key = new GlobalKey<DatePickAndDisplayTileState>();
  List<DateTime> _dates = [DateTime.now(), DateTime.now()];
  late List<SingleDay> _days;
  late DateTimeRange dateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now().add(Duration(days: 7))
  );

  static List<SingleDay> generateDays(int amount) {
    List<SingleDay> days = [];

    for (int i = 1; i <= amount; i++) {
      days.add(SingleDay(name: ('Dzień ' + i.toString()), activities: [], date: DateTime.now(), ));
    }
    
    return days;
  }

  Future pickRange(BuildContext context) async {
    final initialDateRange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now().add(Duration(days: 7))
    );

    final newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDateRange: dateRange
    );

    if (newDateRange == null) return;

    setState(() => dateRange = newDateRange);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: MyAppBar.withoutIcons('Dodaj daty', () {}),
        backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            InkWell(
                child: DatePickAndDisplayTile(key: key, dates: [dateRange.start, dateRange.end]),
                onTap: () => pickRange(context)
            ),
            /*dateRange == null ? Container(
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
            ),*/
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

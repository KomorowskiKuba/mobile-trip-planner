import 'package:flutter/material.dart';
import 'package:mobile_trip_planner/models/day_model.dart';

import 'package:mobile_trip_planner/widgets/date_pick_and_display_tile.dart';
import 'package:mobile_trip_planner/widgets/my_app_bar.dart';

class AddDatesScreen extends StatefulWidget {
  DateTime startDate;
  DateTime endDate;

  AddDatesScreen(this.startDate, this.endDate);

  @override
  _AddDatesScreenState createState() => _AddDatesScreenState();
}

class _AddDatesScreenState extends State<AddDatesScreen> {
  final key = new GlobalKey<DatePickAndDisplayTileState>();
  late DateTimeRange dateRange = DateTimeRange(start: widget.startDate, end: widget.endDate);

  static List<SingleDay> generateDays(int amount) {
    List<SingleDay> days = [];

    for (int i = 1; i <= amount; i++) {
      days.add(SingleDay(
        name: ('Dzień ' + i.toString()),
        activities: [],
        date: DateTime.now(),
      ));
    }

    return days;
  }

  Future pickRange(BuildContext context) async {
    final newDateRange = await showDateRangePicker(
        context: context,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5),
        initialDateRange: dateRange);

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
                child: DatePickAndDisplayTile(
                    key: key, dates: [dateRange.start, dateRange.end]),
                onTap: () => pickRange(context)),
          ],
        ),
      ),
      onWillPop: () async {
        Navigator.pop(context, dateRange);
        return true;
      },
    );
  }
}

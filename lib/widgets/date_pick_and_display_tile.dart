import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;

class DatePickAndDisplayTile extends StatefulWidget {
  DatePickAndDisplayTile({Key key}) : super(key: key);
  @override
  DatePickAndDisplayTileState createState() => DatePickAndDisplayTileState();
}

class DatePickAndDisplayTileState extends State<DatePickAndDisplayTile> {
  List<DateTime> _dates = [DateTime.now(), DateTime.now()];
  List<DateTime> get dates => _dates;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      child: Container(
        padding: EdgeInsets.all(5),
        //height: 125,
        width: double.infinity,
        child: Column(
          children: [
            Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 10),
                Icon(
                  Icons.calendar_today_outlined,
                  color: Theme.of(context).accentColor,
                ),
                SizedBox(width: 10),
                Text(
                  'Data wyjazdu:',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10),
                Text(
                  DateFormat('dd-MM-yyyy').format(_dates[0]),
                  style: TextStyle(
                      color: Colors.white, //TODO: change to constrained display
                      fontSize: 28),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 10),
                Icon(
                  Icons.calendar_today_rounded,
                  color: Theme.of(context).accentColor,
                ),
                SizedBox(width: 10),
                Text(
                  'Data powrotu:',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10),
                Text(
                  DateFormat('dd-MM-yyyy').format(_dates[1]),
                  style: TextStyle(color: Colors.white, fontSize: 28),
                )
              ],
            ),
            Container(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).accentColor,
                    ),
                  ),
                  child: Text(
                    'Wybierz daty',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
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
                      });
                    }
                  },
                )),
          ],
        ),
      ),
    );
  }
}

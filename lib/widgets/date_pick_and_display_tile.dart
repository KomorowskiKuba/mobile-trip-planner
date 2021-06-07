import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickAndDisplayTile extends StatefulWidget {
  List<DateTime> dates;
  DatePickAndDisplayTile({Key? key, required this.dates}) : super(key: key);

  @override
  DatePickAndDisplayTileState createState() => DatePickAndDisplayTileState();
}

class DatePickAndDisplayTileState extends State<DatePickAndDisplayTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      child: Container(
        padding: EdgeInsets.all(5),
        width: double.infinity,
        child: Column(
          children: [
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Row(
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
                    DateFormat('dd-MM-yyyy').format(widget.dates[0]),
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  ),
                  SizedBox(width: 10)
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Row(
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
                    DateFormat('dd-MM-yyyy').format(widget.dates[1]),
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  ),
                  SizedBox(width: 10)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

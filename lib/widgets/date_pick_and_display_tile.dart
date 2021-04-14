import 'package:flutter/material.dart';

import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;

class DatePickAndDisplayTile extends StatefulWidget {
  @override
  _DatePickAndDisplayTileState createState() => _DatePickAndDisplayTileState();
}

class _DatePickAndDisplayTileState extends State<DatePickAndDisplayTile> {
  List<DateTime> dates = [DateTime.now(), DateTime.now()];

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).primaryColor,
        child: Container(
          padding: EdgeInsets.all(5),
          height: 125,
          width: double.infinity,
          child: Column(children: [
            Row(children: [
              Text(
                'Data wyjazdu:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),
              ),
              SizedBox(width: 10),
              Text(
                dates[0].toString(),
                style: TextStyle(
                  color: Colors.white, //TODO: change to constrained display
                  fontSize: 15
                ),
              )
            ],),
            SizedBox(height: 20,),
            Row(children: [
              Text(
                'Data powrotu:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),
              ),
              SizedBox(width: 10),
              Text(
                dates[1].toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15
                ),
              )
            ],),
            Container(
              alignment: Alignment.bottomRight,
              child: RaisedButton(
                color: Theme.of(context).accentColor,
                child: Text('Wybierz daty', style: TextStyle(color: Colors.white),),
                onPressed: () async {
                  final List<DateTime> picked = await DateRangePicker.showDatePicker(
                    context: context,
                    initialFirstDate: DateTime.now(),
                    initialLastDate: (DateTime.now()).add(Duration(days: 7)), 
                    firstDate: DateTime(2015),
                    lastDate: DateTime(2040),
                  );

                  if (picked != null && picked.length == 2) {
                    setState(() {
                      dates = picked;
                    });
                  }
                },
              ),
            ),
          ],),
        ),
      );
  }
}
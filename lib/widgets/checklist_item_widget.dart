import 'package:flutter/material.dart';

class CheckListItemWidget extends StatefulWidget {
  final String _title;

  CheckListItemWidget(this._title);

  @override
  _CheckListItemWidgetState createState() => _CheckListItemWidgetState(_title);
}

class _CheckListItemWidgetState extends State<CheckListItemWidget> {
  final String _title;
  bool _checkBoxValue = false;

  _CheckListItemWidgetState(this._title);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80, //TODO: change to dynamic
      width: double.infinity, //TODO: change to dynamic
      child: Card(
        color: Theme.of(context).primaryColor,
        child: Row(
          children: [
            Checkbox(
                value: _checkBoxValue,
                onChanged: (value) {
                  setState(() => _checkBoxValue = value);
                }),
            SizedBox(
              width: 20,
            ),
            Text(_title, style: TextStyle(fontSize: 25, color: Colors.white)),
            //SizedBox(
            //  width: 70,
          ],
        ),
      ),
    );
  }
}

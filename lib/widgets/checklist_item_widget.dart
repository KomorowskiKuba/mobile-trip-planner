import 'package:flutter/material.dart';

class CheckListItemWidget extends StatefulWidget {
  final String _title;

  CheckListItemWidget(this._title);

  String get title => _title;

  @override
  _CheckListItemWidgetState createState() => _CheckListItemWidgetState(
      _title); //TODO: CHANGE to proper version, without constructor
}

class _CheckListItemWidgetState extends State<CheckListItemWidget> {
  final String _title;
  bool _checkBoxValue = false;
  var _noteController;

  _CheckListItemWidgetState(this._title);

  void initState() {
    super.initState();
    if (_title != null) {
      _noteController = TextEditingController(text: _title);
    }
  }

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
              width: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 50,
              child: TextField(
                  onSubmitted: (val) {
                    FocusScope.of(context).unfocus();
                  },
                  controller: _noteController,
                  textCapitalization: TextCapitalization.sentences,
                  style: TextStyle(fontSize: 25, color: Colors.white),
                  decoration: InputDecoration(
                      hintText: 'Przedmiot', border: InputBorder.none)),
            ),
            //SizedBox(
            //  width: 70,
          ],
        ),
      ),
    );
  }
}

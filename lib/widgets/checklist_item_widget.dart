import 'package:flutter/material.dart';

class CheckListItemWidget extends StatefulWidget {
  final String title;

  CheckListItemWidget({key, this.title}) : super(key: key);

  @override
  _CheckListItemWidgetState createState() => _CheckListItemWidgetState();
}

class _CheckListItemWidgetState extends State<CheckListItemWidget> {
  bool _checkBoxValue = false;
  var _noteController;

  void initState() {
    super.initState();
    if (widget.title != null) {
      _noteController = TextEditingController(text: widget.title);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: double.infinity,
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

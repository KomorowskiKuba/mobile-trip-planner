import 'package:flutter/material.dart';
import 'package:mobile_trip_planner/database_helpers/checklist_database_helper.dart';
import 'package:mobile_trip_planner/models/checklist_item_model.dart';

class CheckListItemWidget extends StatefulWidget {
  final ChecklistItem item;

  CheckListItemWidget({key, required this.item}) : super(key: key);

  @override
  _CheckListItemWidgetState createState() => _CheckListItemWidgetState();
}

class _CheckListItemWidgetState extends State<CheckListItemWidget> {
  bool _checkBoxValue = false;
  var _itemController;

  void initState() {
    super.initState();
    if (widget.item.itemName != null) {
      _itemController = TextEditingController(text: widget.item.itemName);
      _checkBoxValue = widget.item.checked == 0 ? false : true;
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
                  setState(() => _checkBoxValue = value!);
                  widget.item.checked = _checkBoxValue == false ? 0 : 1;
                  ChecklistDatabaseHelper.instance.update(widget.item);
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
                  controller: _itemController,
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

import 'package:flutter/material.dart';
import 'package:mobile_trip_planner/widgets/bottomsheet_input_widget.dart';
import 'package:mobile_trip_planner/widgets/checklist_item_widget.dart';
import 'package:mobile_trip_planner/widgets/checklist_item_widget_dismissible.dart';
import 'package:mobile_trip_planner/widgets/my_app_bar.dart';

class AddBaggageListScreen extends StatefulWidget {
  @override
  _AddBaggageListScreenState createState() => _AddBaggageListScreenState();
}

class _AddBaggageListScreenState extends State<AddBaggageListScreen> {
  String _text = "";
  final _myController = TextEditingController();
  List<String> _items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
  ];

  _saveItem(String itemName) async {
    setState(() {
      _items.add(itemName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar('Dodaj listę rzeczy', Icon(Icons.add), () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return BottomsheetInputWidget(
                    hintText: 'Nazwa przedmiotu',
                    controller: _myController,
                    onPressedFunction: () {
                      _text = _myController.text;
                      _saveItem(_text);
                      _myController.clear();
                      Navigator.pop(context, _text);
                    },
                    onWillPopFunction: () {
                      _myController.clear();
                      Navigator.pop(context, _text);
                      throw Exception();
                    },
                  );
                });
        }),
        backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  final item = _items[index];

                  return Dismissible(
                    direction: DismissDirection.startToEnd,
                    background: DismissibleItemBackground(),
                    key: Key(item),
                    onDismissed: (direction) {
                      setState(() {
                        _items.removeAt(index);
                      });
                    },
                    child: CheckListItemWidget(title: item),
                  );
                },
              ),
            ),
          ],
        ));
  }
}

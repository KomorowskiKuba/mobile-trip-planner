import 'package:flutter/material.dart';
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
          setState(() {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return Wrap(children: [
                    WillPopScope(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        color: Theme.of(context).backgroundColor,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(5),
                                width: double.infinity,
                                child: Container(
                                  color: Theme.of(context).primaryColor,
                                  child: TextField(
                                    controller: _myController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: _text,
                                    ),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                ),
                              ),
                              Container(
                                  alignment: Alignment.bottomRight,
                                  padding: EdgeInsets.only(right: 5),
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Theme.of(context)
                                                      .accentColor)),
                                      onPressed: () {
                                        _text = _myController.text;
                                        _saveItem(_text);
                                        _myController.clear();
                                        Navigator.pop(context, _text);
                                      },
                                      child: Text(
                                        'Zapisz',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      )))
                            ],
                          ),
                        ),
                      ),
                      onWillPop: () {
                        _myController.clear();
                        Navigator.pop(context, _text);
                        throw Exception(); //wtf
                      },
                    ),
                  ]);
                });
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
                    child: CheckListItemWidget(item),
                  );
                },
              ),
            ),
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:mobile_trip_planner/database_helpers/checklist_database_helper.dart';
import 'package:mobile_trip_planner/models/checklist_item_model.dart';
import 'package:mobile_trip_planner/widgets/bottomsheet_input_widget.dart';
import 'package:mobile_trip_planner/widgets/checklist_item_widget.dart';
import 'package:mobile_trip_planner/widgets/checklist_item_widget_dismissible.dart';
import 'package:mobile_trip_planner/widgets/my_app_bar.dart';

class AddBaggageListScreen extends StatefulWidget {
  @override
  _AddBaggageListScreenState createState() => _AddBaggageListScreenState();
}

class _AddBaggageListScreenState extends State<AddBaggageListScreen> {
  final _myController = TextEditingController();
  String _text = "";
  List<ChecklistItem> _items = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  _saveItem(ChecklistItem itemName) async {
    setState(() {
      _items.add(itemName);
    });
  }

  Future loadItems() async {
    setState(() => isLoading = true);
    _items = await ChecklistDatabaseHelper.instance.readAllChecklistItems();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar('Dodaj listę rzeczy', Icon(Icons.add), () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return Padding(
                  padding: MediaQuery.of(context).viewInsets,
                  child: Container(
                    child: BottomsheetInputWidget(
                      hintText: 'Nazwa przedmiotu',
                      controller: _myController,
                      onPressedFunction: () {
                        _text = _myController.text;
                        ChecklistItem item = ChecklistItem(
                            travelId: 1, itemName: _text, checked: 0);
                        ChecklistDatabaseHelper.instance.create(item);
                        _saveItem(item);
                        _myController.clear();
                        Navigator.pop(context, _text);
                        loadItems();
                      },
                      onWillPopFunction: () {
                        _myController.clear();
                        Navigator.pop(context, _text);
                        loadItems();
                        //throw Exception();
                      },
                    ),
                  ),
                );
              });
        }),
        backgroundColor: Theme.of(context).backgroundColor,
        body: isLoading
            ? CircularProgressIndicator()
            : Column(
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
                          key: Key(item.itemName),
                          onDismissed: (direction) {
                            //setState(() {
                            ChecklistDatabaseHelper.instance
                                .delete(item.itemId);
                            //});
                          },
                          child: CheckListItemWidget(item: item),
                        );
                      },
                    ),
                  ),
                ],
              ));
  }
}

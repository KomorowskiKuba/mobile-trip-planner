import 'package:flutter/material.dart';
import 'package:mobile_trip_planner/widgets/checklist_item_widget.dart';
import 'package:mobile_trip_planner/widgets/my_app_bar.dart';

class AddBaggageListScreen extends StatefulWidget {
  @override
  _AddBaggageListScreenState createState() => _AddBaggageListScreenState();
}

class _AddBaggageListScreenState extends State<AddBaggageListScreen> {
  int _counter = 7;
  List<String> _items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Dodaj listę rzeczy', Icon(Icons.add), () {
        setState(() {
          String currentItem = 'Item ' + _counter.toString();
          _counter++;
          _items.add(currentItem);
        });
      }),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          SizedBox(height: 5,),
          Expanded(
            child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  final item = _items[index];

                  return Dismissible(
                    direction: DismissDirection.startToEnd,
                    background: Card(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.centerLeft,
                        color: Theme.of(context).errorColor,
                        child: Row(
                          children: [
                            Icon(Icons.delete, color: Colors.white,),
                            SizedBox(width: 10),
                            Text(
                              'Usuń element',
                              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ]
                        ),
                      ),
                    ),
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
      )
    );
  }
}

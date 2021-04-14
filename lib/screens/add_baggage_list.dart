import 'package:flutter/material.dart';
import 'package:mobile_trip_planner/widgets/checklist_item_widget.dart';
import 'package:mobile_trip_planner/widgets/my_app_bar.dart';

class AddBaggageListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Dodaj listę rzeczy'),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            CheckListItemWidget('Item 1'),
            CheckListItemWidget('Item 2'),
            CheckListItemWidget('Item 3'),
            CheckListItemWidget('Item 4'),
            CheckListItemWidget('Item 5'),
          ],
        ),
      ),
    );
  }
}

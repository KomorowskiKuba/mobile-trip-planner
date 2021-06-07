import 'package:flutter/material.dart';
import 'package:mobile_trip_planner/widgets/saved_snack_bar.dart';

class YesNoSavingPopupWidget extends StatefulWidget {
  final String title;
  final String content;

  const YesNoSavingPopupWidget(
      {Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  _YesNoSavingPopupWidgetState createState() => _YesNoSavingPopupWidgetState();
}

class _YesNoSavingPopupWidgetState extends State<YesNoSavingPopupWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: Text(widget.content),
      actions: [
        TextButton(
          child: Text('Nie'),
          onPressed: () {
            Navigator.pop(context, false);
            Navigator.pop(context, false);
          },
        ),
        TextButton(
          child: Text('Tak'),
          onPressed: () {
            //save
            SavedSnackBar.buildSavedSnackBar(context);
            print('SAVED');
            Navigator.pop(context, false);
            Navigator.pop(context, false);
          },
        ),
      ],
    );
  }
}

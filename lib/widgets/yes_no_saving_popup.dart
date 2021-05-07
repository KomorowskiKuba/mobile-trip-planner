import 'package:flutter/material.dart';

class YesNoSavingPopupWidget extends StatefulWidget {
  final String title;
  final String content;

  const YesNoSavingPopupWidget({Key key, this.title, this.content})
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
            print('SAVED');
            Navigator.pop(context, false);
            Navigator.pop(context, false);
          },
        ),
      ],
    );
  }
}

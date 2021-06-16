import 'package:flutter/material.dart';

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
          child: Text('Tak'),
          onPressed: () {
            Navigator.pop(context, false);
            Navigator.pop(context, false);
          },
        ),
      ],
    );
  }
}

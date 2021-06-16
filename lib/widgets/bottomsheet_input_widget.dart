import 'package:flutter/material.dart';

class BottomsheetInputWidget extends StatefulWidget {
  final String hintText;
  final Function onPressedFunction;
  final Function onWillPopFunction;

  String text = "";
  TextEditingController controller;

  BottomsheetInputWidget(
      {Key? key,
      required this.hintText,
      required this.controller,
      required this.onPressedFunction,
      required this.onWillPopFunction})
      : super(key: key);

  @override
  _BottomsheetInputWidgetState createState() => _BottomsheetInputWidgetState();
}

class _BottomsheetInputWidgetState extends State<BottomsheetInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      WillPopScope(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.2,
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
                      onSubmitted: (val) {
                        FocusScope.of(context).unfocus();
                      },
                      textCapitalization: TextCapitalization.sentences,
                      controller: widget.controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: widget.hintText,
                      ),
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                ),
                Container(
                    alignment: Alignment.bottomRight,
                    padding: EdgeInsets.only(right: 5),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).accentColor)),
                        onPressed: () => widget.onPressedFunction(),
                        child: Text(
                          'Zapisz',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        )))
              ],
            ),
          ),
        ),
        onWillPop: () => widget.onWillPopFunction(),
      ),
    ]);
  }
}

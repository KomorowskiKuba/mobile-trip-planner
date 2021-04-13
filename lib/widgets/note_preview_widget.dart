import 'package:flutter/material.dart';

class NotePreviewWidget extends StatelessWidget {
  final String _title;
  final String _content;

  NotePreviewWidget(this._title, this._content);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200, //TODO: change to dynamic
      width: double.infinity, //TODO: change to dynamic
      child: Card(
        color: Theme.of(context).primaryColor,
        child: Column(
          children: [
            Row(
              children: [
                //_icon,
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.circle,
                  color: Theme.of(context).accentColor,
                ), //Wywalic
                SizedBox(
                  width: 20,
                ),
                Text(_title,
                    style: TextStyle(fontSize: 25, color: Colors.white)),
                Spacer(),
                IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 30,
                    color: Theme.of(context).accentColor,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => null));
                  },
                )
              ],
            ),
            Container(
                padding: EdgeInsets.all(5),
                alignment: Alignment.topLeft,
                child: Text(_content,
                    style: TextStyle(color: Colors.white, fontSize: 20))),
          ],
        ),
      ),
    );
  }
}

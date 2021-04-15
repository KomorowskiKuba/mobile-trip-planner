import 'package:flutter/material.dart';
import 'package:mobile_trip_planner/models/note_model.dart';

class NotePreviewWidget extends StatelessWidget {
  final Note _note;
  final Widget _nextScreen;

  NotePreviewWidget(this._note, this._nextScreen);

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
                Text(_note.title,
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
                        context, MaterialPageRoute(builder: (context) => _nextScreen));
                  },
                )
              ],
            ),
            Container(
                padding: EdgeInsets.all(5),
                alignment: Alignment.topLeft,
                child: Text(_note.content,
                    style: TextStyle(color: Colors.white, fontSize: 20))),
          ],
        ),
      ),
    );
  }
}

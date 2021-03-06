import 'package:flutter/material.dart';
import 'package:mobile_trip_planner/models/note_model.dart';

class NotePreviewWidget extends StatelessWidget {
  final Note _note;
  final Function _function;

  NotePreviewWidget(this._note, this._function);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        color: Theme.of(context).primaryColor,
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.circle,
                  size: 15,
                  color: Theme.of(context).accentColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(_note.title,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                Spacer(),
                IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 30,
                    color: Theme.of(context).accentColor,
                  ),
                  onPressed: () => _function(),
                )
              ],
            ),
            Container(
                padding: EdgeInsets.all(5),
                alignment: Alignment.topLeft,
                child: Text(_note.content,
                    maxLines: 5,
                    style: TextStyle(color: Colors.white, fontSize: 20))),
          ],
        ),
      ),
    );
  }
}

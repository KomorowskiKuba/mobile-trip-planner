import 'package:flutter/material.dart';
import 'package:mobile_trip_planner/models/note_model.dart';
import 'package:mobile_trip_planner/widgets/my_app_bar.dart';

class NoteViewScreen extends StatefulWidget {
  final Note _note;

  NoteViewScreen(this._note);

  @override
  _NoteViewScreenState createState() => _NoteViewScreenState(_note);
}

class _NoteViewScreenState extends State<NoteViewScreen> {
  final Note _note;

  _NoteViewScreenState(this._note);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.withoutIcons(_note.title),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}
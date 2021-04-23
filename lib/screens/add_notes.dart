import 'package:flutter/material.dart';
import 'package:mobile_trip_planner/models/note_model.dart';
import 'package:mobile_trip_planner/screens/note_view.dart';
import 'package:mobile_trip_planner/widgets/my_app_bar.dart';
import 'package:mobile_trip_planner/widgets/note_preview_widget.dart';

class AddNotesScreen extends StatelessWidget {
  final List<Note> notes = [
    Note('Note 1', 'Nothing here yet!'),
    Note('Note 2', 'Nothing here yet!'),
    Note('Note 3', 'Nothing here yet!'),
    Note('Note 4', 'Nothing here yet!'),
    Note('Note 5', 'Nothing here yet!'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.withoutIcons('Dodaj notatki'),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              for (var currentNote in notes) NotePreviewWidget(currentNote, NoteViewScreen(currentNote)),
            ],
          ),
        ),
      ),
    );
  }
}

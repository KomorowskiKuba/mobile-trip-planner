import 'package:flutter/material.dart';
import 'package:mobile_trip_planner/widgets/my_app_bar.dart';
import 'package:mobile_trip_planner/widgets/note_preview_widget.dart';

class AddNotesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Dodaj notatki'),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            NotePreviewWidget('Note 1', 'Nothing here yet!'),
            NotePreviewWidget('Note 2', 'Nothing here yet!'),
            NotePreviewWidget('Note 3', 'Nothing here yet!'),
            NotePreviewWidget('Note 4', 'Nothing here yet!'),
            NotePreviewWidget('Note 5', 'Nothing here yet!'),
          ],
        ),
      ),
    );
  }
}

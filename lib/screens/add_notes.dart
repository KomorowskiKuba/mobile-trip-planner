import 'package:flutter/material.dart';

import 'package:mobile_trip_planner/models/note_model.dart';
import 'package:mobile_trip_planner/screens/note_view.dart';
import 'package:mobile_trip_planner/widgets/note_preview_widget.dart';
import 'package:mobile_trip_planner/widgets/checklist_item_widget_dismissible.dart';
import 'package:mobile_trip_planner/widgets/my_app_bar.dart';

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final List<Note> _notes = [
    Note(travelId: 1, title: 'Note 1',
        content: 'Sed ac ultricies justo. Vestibulum auctor laoreet massa, sed porta tellus placerat a. Ut egestas ac urna nec tincidunt. Etiam vulputate sollicitudin dolor in venenatis. In volutpat in lorem vestibulum semper.Sed ac ultricies justo. Vestibulum auctor laoreet massa, sed porta tellus placerat a. Ut egestas ac urna nec tincidunt. Etiam vulputate sollicitudin dolor in venenatis. In volutpat in lorem vestibulum semper. Sed ac ultricies justo. Vestibulum auctor laoreet massa, sed porta tellus placerat a. Ut egestas ac urna nec tincidunt. Sed ac ultricies justo. Vestibulum auctor laoreet massa, sed porta tellus placerat a. Ut egestas ac urna nec tincidunt. Sed ac ultricies justo. Vestibulum auctor laoreet massa, sed porta tellus placerat a. Ut egestas ac urna nec tincidunt. Sed ac ultricies justo. Vestibulum auctor laoreet massa, sed porta tellus placerat a. Ut egestas ac urna nec tincidunt. Etiam vulputate sollicitudin dolor in venenatis. In volutpat in lorem vestibulum semper.Sed ac ultricies justo. Vestibulum auctor laoreet massa, sed porta tellus placerat a. Ut egestas ac urna nec tincidunt. Etiam vulputate sollicitudin dolor in venenatis. In volutpat in lorem vestibulum semper. Sed ac ultricies justo. Vestibulum auctor laoreet massa, sed porta tellus placerat a. Ut egestas ac urna nec tincidunt. Sed ac ultricies justo. Vestibulum auctor laoreet massa, sed porta tellus placerat a. Ut egestas ac urna nec tincidunt. Sed ac ultricies justo. Vestibulum auctor laoreet massa, sed porta tellus placerat a. Ut egestas ac urna nec tincidunt.'),
    Note(travelId: 1, title: 'Note 2', content: 'Nothing here yet!'),
    Note(travelId: 1, title: 'Note 3', content: 'Nothing here yet!'),
    Note(travelId: 1, title: 'Note 4', content: 'Nothing here yet!'),
    Note(travelId: 1, title: 'Note 5', content: 'Nothing here yet!'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar('Dodaj notatki', Icon(Icons.add), () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NoteViewScreen(note: Note(travelId: 1, noteId: _notes.length + 1, title: '', content: ''))));
        }),
        backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _notes.length,
                itemBuilder: (context, index) {
                  final note = _notes[index];

                  return Dismissible(
                    direction: DismissDirection.startToEnd,
                    background: DismissibleItemBackground(),
                    key: Key(note.title),
                    onDismissed: (direction) {
                      setState(() {
                        _notes.removeAt(index);
                      });
                    },
                    child: NotePreviewWidget(note, NoteViewScreen(note: note)),
                  );
                },
              ),
            ),
          ],
        ));
  }
}

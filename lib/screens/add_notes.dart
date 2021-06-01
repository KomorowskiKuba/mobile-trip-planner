import 'package:flutter/material.dart';

import 'package:mobile_trip_planner/models/note_model.dart';
import 'package:mobile_trip_planner/screens/note_view.dart';
import 'package:mobile_trip_planner/widgets/note_preview_widget.dart';
import 'package:mobile_trip_planner/widgets/checklist_item_widget_dismissible.dart';
import 'package:mobile_trip_planner/widgets/my_app_bar.dart';
import 'package:mobile_trip_planner/database_helpers/notes_database_helper.dart';

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List<Note> _notes = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadNotes();
  }

  @override
  void dispose() {
    //NotesDatabaseHelper.instance.close();

    super.dispose();
  }

  Future loadNotes() async {
    setState(() => isLoading = true);
    _notes = await NotesDatabaseHelper.instance.readAllNotes();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar('Dodaj notatki', Icon(Icons.add), () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NoteViewScreen(note: Note(travelId: 1,  title: '', content: '')))).whenComplete(loadNotes);
        }),
        backgroundColor: Theme.of(context).backgroundColor,
        body: isLoading
         ? CircularProgressIndicator()
         : Column(
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
                        NotesDatabaseHelper.instance.delete(note.noteId);
                        _notes.removeAt(index);
                        loadNotes();
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

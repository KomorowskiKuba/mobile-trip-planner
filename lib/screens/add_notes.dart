import 'package:flutter/material.dart';

import 'package:mobile_trip_planner/models/note_model.dart';
import 'package:mobile_trip_planner/models/tripinfo_model.dart';
import 'package:mobile_trip_planner/screens/note_view.dart';
import 'package:mobile_trip_planner/widgets/note_preview_widget.dart';
import 'package:mobile_trip_planner/widgets/checklist_item_widget_dismissible.dart';
import 'package:mobile_trip_planner/widgets/my_app_bar.dart';
import 'package:mobile_trip_planner/database_helpers/notes_database_helper.dart';

class NotesScreen extends StatefulWidget {
  Tripinfo tripinfo;

  NotesScreen({Key? key, required this.tripinfo}) : super(key: key);

  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List<Note> _notes = [];
  bool isLoading = false;

  Future loadNotes() async {
    setState(() => isLoading = true);
    _notes = await NotesDatabaseHelper.instance
        .readAllNotes(widget.tripinfo.travelId as int);
    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    loadNotes();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar('Dodaj notatki', Icon(Icons.add), () {
          Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          NoteViewScreen(tripinfo: widget.tripinfo)))
              .whenComplete(loadNotes);
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
                                NotesDatabaseHelper.instance
                                    .delete(note.noteId);
                                _notes.removeAt(index);
                                loadNotes();
                              });
                            },
                            child: NotePreviewWidget(note, () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NoteViewScreen(
                                            note: note,
                                            tripinfo: widget.tripinfo,
                                          ))).whenComplete(loadNotes);
                            }));
                      },
                    ),
                  ),
                ],
              ));
  }
}

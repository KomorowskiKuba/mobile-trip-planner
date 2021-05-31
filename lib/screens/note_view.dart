import 'package:flutter/material.dart';
import 'package:mobile_trip_planner/database_helpers/notes_database_helper.dart';
import 'package:mobile_trip_planner/models/note_model.dart';
import 'package:mobile_trip_planner/widgets/my_app_bar.dart';
import 'package:mobile_trip_planner/widgets/saved_snack_bar.dart';
import 'package:mobile_trip_planner/widgets/yes_no_saving_popup.dart';

class NoteViewScreen extends StatefulWidget {
  final Note note;

  NoteViewScreen({key, required this.note}) : super(key: key);

  @override
  _NoteViewScreenState createState() => _NoteViewScreenState();
}

class _NoteViewScreenState extends State<NoteViewScreen> {
  bool _isSaved = false;
  var _titleController;
  var _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note.title);
    _contentController = TextEditingController(text: widget.note.content);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
          appBar: MyAppBar('Notatka', Icon(Icons.save), () async {
            if (!_isSaved) {
              _isSaved = true;
              //save
              print(_titleController.toString());
              Note note = Note(travelId: 1, noteId: 19, title: _titleController.toString(), content: _contentController.toString());
              await NotesDatabaseHelper.instance.create(note);
              SavedSnackBar.buildSavedSnackBar(context);
            }
          }),
          backgroundColor: Theme.of(context).backgroundColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  color: Theme.of(context).primaryColor,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        alignment: Alignment.topLeft,
                        child: TextField(
                            onSubmitted: (val) {
                              FocusScope.of(context).unfocus();
                            },
                            onChanged: (text) {
                              _isSaved = false;
                            },
                            controller: _titleController,
                            textCapitalization: TextCapitalization.sentences,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                            decoration: InputDecoration(
                                hintText: 'Tytuł', border: InputBorder.none)),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        width: double.infinity,
                        padding: EdgeInsets.all(5),
                        child: TextField(
                            onSubmitted: (val) {
                              FocusScope.of(context).unfocus();
                            },
                            onChanged: (text) {
                              _isSaved = false;
                            },
                            controller: _contentController,
                            maxLines: null,
                            textCapitalization: TextCapitalization.sentences,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            decoration: InputDecoration(
                                hintText: 'Treść notatki',
                                border: InputBorder.none)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
      onWillPop: () {
        if (_isSaved) {
          Navigator.pop(context, false);
        } else {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return YesNoSavingPopupWidget(
                    title: 'Zapisz notatkę',
                    content: 'Czy przed wyjściem chcesz zapisać notatkę?');
              });
        }
        return Future.value(false);
      },
    );
  }
}

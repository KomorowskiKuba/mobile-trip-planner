import 'package:flutter/material.dart';
import 'package:mobile_trip_planner/database_helpers/notes_database_helper.dart';
import 'package:mobile_trip_planner/models/note_model.dart';
import 'package:mobile_trip_planner/models/tripinfo_model.dart';
import 'package:mobile_trip_planner/widgets/my_app_bar.dart';
import 'package:mobile_trip_planner/widgets/saved_snack_bar.dart';
import 'package:mobile_trip_planner/widgets/yes_no_saving_popup.dart';

class NoteViewScreen extends StatefulWidget {
  Note? note;
  Tripinfo tripinfo;

  NoteViewScreen({key, this.note, required this.tripinfo}) : super(key: key);

  @override
  _NoteViewScreenState createState() => _NoteViewScreenState();
}

class _NoteViewScreenState extends State<NoteViewScreen> {
  bool _isSaved = false;

  late Note note;
  late bool _isEdit;

  var _titleController;
  var _contentController;

  @override
  void initState() {
    if (widget.note == null) {
      note = Note(
          travelId: widget.tripinfo.travelId as int, title: '', content: '');

      _isEdit = false;
      _titleController = TextEditingController(text: '');
      _contentController = TextEditingController(text: '');
    } else {
      note = widget.note!;

      super.initState();

      _isEdit = true;
      _titleController = TextEditingController(text: widget.note!.title);
      _contentController = TextEditingController(text: widget.note!.content);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
          appBar: MyAppBar('Notatka', Icon(Icons.save), () {
            if (!_isSaved) {
              _isSaved = true;
              note.title = _titleController.text;
              note.content = _contentController.text;
              if (_isEdit) {
                NotesDatabaseHelper.instance.update(note);
              } else {
                NotesDatabaseHelper.instance.create(note);
              }
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
                    title: 'Nie zapisano notatki',
                    content: 'Czy na pewno chcesz wyjść?');
              });
        }
        return Future.value(false);
      },
    );
  }
}

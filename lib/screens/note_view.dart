import 'package:flutter/material.dart';
import 'package:mobile_trip_planner/models/note_model.dart';
import 'package:mobile_trip_planner/widgets/my_app_bar.dart';
import 'package:mobile_trip_planner/widgets/yes_no_saving_popup.dart';

class NoteViewScreen extends StatefulWidget {
  final Note _note;

  NoteViewScreen(this._note);

  @override
  _NoteViewScreenState createState() => _NoteViewScreenState(_note);
}

class _NoteViewScreenState extends State<NoteViewScreen> {
  bool _isSaved = false;
  final Note _note;
  var _titleController;
  var _contentController;

  _NoteViewScreenState(this._note);

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: _note.title);
    _contentController = TextEditingController(text: _note.content);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
          appBar: MyAppBar('Notatka', Icon(Icons.save), () {
            if (!_isSaved) {
              _isSaved = true;
              print("Zapisano!");
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

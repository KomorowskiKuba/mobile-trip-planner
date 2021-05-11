import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_trip_planner/models/ticket_model.dart';
import 'package:mobile_trip_planner/widgets/my_app_bar.dart';
import 'package:mobile_trip_planner/widgets/saved_snack_bar.dart';
import 'package:mobile_trip_planner/widgets/yes_no_saving_popup.dart';

class TicketView extends StatefulWidget {
  Ticket ticket;

  TicketView({Key key, this.ticket}) : super(key: key);
  
  @override
  _TicketViewState createState() => _TicketViewState();
}

class _TicketViewState extends State<TicketView> {
  bool _isSaved = true;
  final picker = ImagePicker();
  Image _image;

  @override
  void initState() {
    super.initState();
    _image = widget.ticket.image;
  }
  
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = Image.file(File(pickedFile.path));
        _isSaved = false;
      } else {
        print('No image selected!');
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: MyAppBar(widget.ticket.title, Icon(Icons.save), () {
          if (!_isSaved) {
                _isSaved = true;
                //save
                SavedSnackBar.buildSavedSnackBar(context);
          }
        }),
        backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
          children: [
            SizedBox(height: 5),
            Container(
              width: double.infinity,
              height: 300,
              child: InkWell(
                child: Card(
                  color: Theme.of(context).primaryColor,
                  child: Container(
                    child: widget.ticket.image,
                  ),
                ),
                onLongPress: getImage,
              ),
            )
          ],
        ),
      ),
      onWillPop: () {
        if (_isSaved) {
          Navigator.pop(context, false);
        } else {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return YesNoSavingPopupWidget(
                    title: 'Zapisz bilet',
                    content: 'Czy przed wyjściem chcesz zapisać bilet?');
              });
        }
        return Future.value(false);
      },
    );
  }
}
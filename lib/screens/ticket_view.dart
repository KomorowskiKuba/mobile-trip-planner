import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_trip_planner/models/reservation_model.dart';
import 'package:mobile_trip_planner/screens/full_ticket_screen.dart';
import 'package:mobile_trip_planner/widgets/my_app_bar.dart';
import 'package:mobile_trip_planner/widgets/saved_snack_bar.dart';
import 'package:mobile_trip_planner/widgets/yes_no_saving_popup.dart';

class TicketView extends StatefulWidget {
  Reservation ticket;

  TicketView({Key? key, required this.ticket}) : super(key: key);

  @override
  _TicketViewState createState() => _TicketViewState();
}

class _TicketViewState extends State<TicketView> {
  bool _isSaved = true;
  final picker = ImagePicker();
  late File _imageFile;

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
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
                  child: _imageFile == null
                      ? Container(
                          alignment: Alignment.center,
                          child: Text('Przytrzymaj żeby dodać zdjęcie',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)))
                      : Container(
                          child: Image.file(_imageFile),
                        ),
                ),
                onLongPress: _getFromGallery,
                onTap: () {
                  if (_imageFile != null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                FullTicketScreen(_imageFile)));
                  }
                },
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

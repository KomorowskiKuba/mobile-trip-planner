import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart' show rootBundle;

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

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {});
    }
  }

  Future<String> loadAsset(String path) async {
    return await rootBundle.loadString(path);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: MyAppBar(widget.ticket.title, Icon(Icons.save), () {
          if (!_isSaved) {
            _isSaved = true;
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
                  child: widget.ticket.imagePath == null
                      ? Container(
                          alignment: Alignment.center,
                          child: Text('Przytrzymaj żeby dodać zdjęcie',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)))
                      : Container(
                          child: Image(
                            image: AssetImage(widget.ticket.imagePath),
                          ),
                        ),
                ),
                onLongPress: _getFromGallery,
                onTap: () {
                  if (widget.ticket.imagePath != null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                FullTicketScreen(widget.ticket.imagePath)));
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
                    title: 'Zmiany nie zapisane',
                    content: 'Czy na pewno chcesz wyjść?');
              });
        }
        return Future.value(false);
      },
    );
  }
}

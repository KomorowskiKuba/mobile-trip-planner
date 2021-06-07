import 'package:flutter/material.dart';
import 'package:mobile_trip_planner/widgets/my_app_bar.dart';
import 'package:mobile_trip_planner/widgets/saved_snack_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _text = 'Twoje imię';
  final _myController = TextEditingController();

  _saveUserName(String name) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setString('userName', name);
      SavedSnackBar.buildSavedSnackBar(context);
    });
  }

  @override
  void dispose() {
    _myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.withoutIcons('Ustawienia', () {}),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              width: double.infinity,
              child: Container(
                color: Theme.of(context).primaryColor,
                child: TextField(
                  controller: _myController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: _text,
                  ),
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.only(right: 5),
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).accentColor)),
                  onPressed: () {
                    _text = _myController.text;
                    _saveUserName(_text);
                    Navigator.pop(context, _text);
                  },
                  child: Text(
                    'Zapisz',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class NextScreenTile extends StatelessWidget {
  final String _title;
  final Icon _icon;
  final Widget _nextScreen;

  NextScreenTile(this._title, this._icon, this._nextScreen);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      width: double.infinity,
      child: Card(
        color: Theme.of(context).primaryColor,
        child: Row(
          children: [
            //_icon,
            SizedBox(
              width: 20,
            ),
            _icon, //Wywalic
            SizedBox(
              width: 20,
            ),
            Text(_title, style: TextStyle(fontSize: 25, color: Colors.white)),
            //SizedBox(
            //  width: 70,
            //),
            Spacer(),
            IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 30,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => _nextScreen));
              },
            )
          ],
        ),
      ),
    );
  }
}

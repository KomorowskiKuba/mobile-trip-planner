import 'package:flutter/material.dart';

class TripPreviewTile extends StatelessWidget {
  final String _name;
  final Image _image;

  TripPreviewTile(this._name, this._image);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 200,
      child: Card(
        color: Theme.of(context).primaryColorLight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(_name, style: TextStyle(fontSize: 25, color: Colors.white)),
            SizedBox(
              height: 5,
            ),
            Container(
              width: 100,
              height: 100,
              child: Image(
                image: AssetImage('lib/assets/images/paris.jpg'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TripPreviewTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: Card(
        color: Theme.of(context).primaryColorLight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('XDDD'),
            Icon(Icons.ac_unit),
            /*Image.asset(
              'assets/images/paris.jpg',
              fit: BoxFit.cover,
              height: 50,
              width: 50,
            ),*/
            //Image(image: AssetImage('assets:paris.jpg')),
          ],
        ),
      ),
    );
  }
}

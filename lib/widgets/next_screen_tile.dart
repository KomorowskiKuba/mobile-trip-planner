import 'package:flutter/material.dart';

class NextScreenTile extends StatelessWidget {
  final String title;
  final Icon icon;
  final Function function;

  NextScreenTile(
      {required this.title, required this.icon, required this.function});

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
            icon, //Wywalic
            SizedBox(
              width: 20,
            ),
            Text(title, style: TextStyle(fontSize: 25, color: Colors.white)),
            Spacer(),
            IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 30,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () => function(),
            )
          ],
        ),
      ),
    );
  }
}

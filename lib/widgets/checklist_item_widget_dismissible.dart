import 'package:flutter/material.dart';

class DismissibleItemBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.centerLeft,
        color: Theme.of(context).errorColor,
        child: Row(children: [
          Icon(
            Icons.delete,
            color: Colors.white,
          ),
          SizedBox(width: 10),
          Text(
            'Usuń element',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ]),
      ),
    );
  }
}

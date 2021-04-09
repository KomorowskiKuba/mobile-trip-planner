import 'package:flutter/material.dart';

class NextScreenTile extends StatelessWidget {
  final String _title;
  final ImageIcon _icon;
  final Widget _nextScreen;

  NextScreenTile(this._title, this._icon, this._nextScreen);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100, //TODO: change to dynamic
      width: double.infinity, //TODO: change to dynamic
      child: InkWell(
        child: Card(
          color: Theme.of(context).primaryColor,
          child: Row(
            children: [
              //_icon,
              Text(_title, style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => _nextScreen));
        },
      ),
    );
  }
}

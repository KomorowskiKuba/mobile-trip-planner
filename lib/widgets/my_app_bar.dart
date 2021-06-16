import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double _height = kToolbarHeight;
  String _title;
  Icon _icon = Icon(null);
  Function _function;

  MyAppBar(this._title, this._icon, this._function);

  MyAppBar.withoutIcons(this._title, this._function);

  @override
  Size get preferredSize => Size.fromHeight(_height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).accentColor,
      title: Text(
        _title,
        style: TextStyle(color: Colors.white),
      ),
      actions: [IconButton(onPressed: () => _function(), icon: _icon)],
    );
  }
}

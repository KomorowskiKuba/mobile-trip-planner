import 'dart:io';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class FullTicketScreen extends StatelessWidget {
  final String _imagePath;

  FullTicketScreen(this._imagePath);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
            child: PhotoView(
          imageProvider: AssetImage(_imagePath), //TODO: TO CHANGE
          backgroundDecoration:
              BoxDecoration(color: Theme.of(context).backgroundColor),
          minScale: PhotoViewComputedScale.contained * 0.8,
          maxScale: PhotoViewComputedScale.covered,
        )),
      ),
    );
  }
}

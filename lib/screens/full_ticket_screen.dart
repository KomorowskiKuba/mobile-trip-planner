import 'dart:io';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class FullTicketScreen extends StatelessWidget {
  final File _imageFile;

  FullTicketScreen(this._imageFile);

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
          imageProvider: FileImage(_imageFile),
          backgroundDecoration:
              BoxDecoration(color: Theme.of(context).backgroundColor),
          minScale: PhotoViewComputedScale.contained * 0.8,
          maxScale: PhotoViewComputedScale.covered,
        )),
      ),
    );
  }
}

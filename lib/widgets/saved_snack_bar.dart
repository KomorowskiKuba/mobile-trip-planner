import 'package:flutter/material.dart';

class SavedSnackBar {
  SavedSnackBar._();

  static buildSavedSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
                  backgroundColor: Theme.of(context).accentColor,
                  content: const Text(
                    'Zapisano',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  )
                )
    );
  }
}
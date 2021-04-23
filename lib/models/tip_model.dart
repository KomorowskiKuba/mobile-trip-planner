import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Tip {
  String content;

  Tip(this.content) {
    print('XDDDDD');
  }

  void loadJSON(BuildContext context) {
    print('XDDDDD');
    var myData;
    FutureBuilder( 
      future: DefaultAssetBundle.of(context).loadString('lib/assets/other/tips.json'),
      builder: (context, snapshot) {
        myData = json.decode(snapshot.data.toString());
        print(myData);
      }
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/homepage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((_) {
      runApp(MyApp());
    });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Planowanie podrozy",
      theme: ThemeData(
        primaryColor: Color(0xff353942),
        primaryColorLight: Color(0xff474e5e),
        accentColor: Color(0xff0ebfeb),
        hintColor: Color(0xff81e7fd),
        backgroundColor: Color(0xff27282c),
        errorColor: Colors.red
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

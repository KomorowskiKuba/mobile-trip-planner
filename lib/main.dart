import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Planowanie podrozy",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _name = 'Kuba';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Witaj, ' + _name + '!'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Text('XDD'),
            ),
            Card(
              child: Text('XDDD'),
            ),
          ],
        ),
      ),
    );
  }
}

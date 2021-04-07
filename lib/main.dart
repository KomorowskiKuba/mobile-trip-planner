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
            Center(
              child: Container(
                height: 300, //TODO: change to dynamic
                width: 400, //TODO: change to dynamic
                child: Card(
                    child: Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      Text('Porada dnia'), //TODO: change fonts
                      Text('LOREM IPSUM'), //TODO: change fonts
                    ],
                  ),
                )),
              ),
            ),
            Center(
              child: Container(
                height: 100, //TODO: change to dynamic
                width: 400, //TODO: change to dynamic
                child: Card(
                    child: Row(
                  children: [
                    Text('XDDD'),
                  ],
                )),
              ),
            ),
            Center(
                child: Container(
                    child: Card(
              child: Column(
                children: [
                  Row(
                    children: [Text('xddd')],
                  ),
                  Row(
                    children: [Text('xddd')],
                  )
                ],
              ),
            ))),
          ],
        ),
      ),
    );
  }
}

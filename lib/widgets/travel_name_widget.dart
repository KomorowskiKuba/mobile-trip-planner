import 'package:flutter/material.dart';
import 'package:mobile_trip_planner/models/tripinfo_model.dart';

class TravelNameWidget extends StatefulWidget {
  Tripinfo tripinfo;

  TravelNameWidget({Key? key, required this.tripinfo}) : super(key: key);

  @override
  _TravelNameWidgetState createState() => _TravelNameWidgetState();
}

class _TravelNameWidgetState extends State<TravelNameWidget> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    controller.text = widget.tripinfo.name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: double.infinity,
      child: Card(
        color: Theme.of(context).primaryColor,
        child: Row(
          children: [
            //_icon,
            SizedBox(
              width: 20,
            ),
            Icon(Icons.text_fields, color: Theme.of(context).accentColor,),
            SizedBox(
              width: 20,
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.5,
              color: Theme.of(context).primaryColor,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                ),
                style: TextStyle(color: Colors.white, fontSize: 22),
                onChanged: (val) {
                  widget.tripinfo.name = controller.text;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

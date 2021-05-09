import 'package:mobile_trip_planner/models/single_activity_model.dart';

class SingleDay {
  String name;
  DateTime date;
  List<SingleActivity> activities;

  SingleDay({this.name, this.date, this.activities});
}

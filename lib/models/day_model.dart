import 'package:mobile_trip_planner/models/single_activity_model.dart';

class SingleDay {
  String name;
  DateTime date = DateTime.now();
  List<SingleActivity> activities = [];

  SingleDay({required this.name, required this.date, required this.activities});
}

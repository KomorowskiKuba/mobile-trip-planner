import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mobile_trip_planner/models/tripinfo_model.dart';

class TripDatabaseHelper {
  static final TripDatabaseHelper instance = TripDatabaseHelper._init();

  static Database? _database;

  TripDatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDB('tripinfo_database.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database database, int version) async {}

  //Future<Tripinfo> create(Tripinfo tripinfo) async {
  //  final database = await instance.database;
  //final tripId = await database.insert(tableName, values);

  //}
}

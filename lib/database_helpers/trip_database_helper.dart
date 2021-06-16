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

  Future _createDB(Database database, int version) async {
    final String travelIdType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final String nameType = 'TEXT NOT NULL';
    final String destinantionIdType = 'TEXT NOT NULL';
    final String startDateType = 'TEXT NOT NULL';
    final String endDateType = 'TEXT NOT NULL';

    await database.execute('''
        CREATE TABLE $tableName (
          ${TripinfoFields.travelId} $travelIdType,
          ${TripinfoFields.name} $nameType,
          ${TripinfoFields.destinantionId} $destinantionIdType,
          ${TripinfoFields.startDate} $startDateType,
          ${TripinfoFields.endDate} $endDateType
        )
      ''');
  }

  Future<Tripinfo> create(Tripinfo tripinfo) async {
    final database = await instance.database;
    final travelId = await database.insert(tableName, tripinfo.toJson());

    return tripinfo.copy(travelId: travelId);
  }

  Future<Tripinfo> readTripinfo(int travelId) async {
    final database = await instance.database;

    final maps = await database.query(tableName,
        columns: TripinfoFields.values,
        where: '$TripinfoFields.travelId = ?',
        whereArgs: [travelId]);

    if (maps.isNotEmpty) {
      return Tripinfo.fromJson(maps.first);
    } else {
      throw Exception('Id not found!');
    }
  }

  Future<List<Tripinfo>> readlAllInfo() async {
    final database = await instance.database;

    final result = await database.query(tableName);

    return result.map((json) => Tripinfo.fromJson(json)).toList();
  }

  Future<int> update(Tripinfo tripinfo) async {
    final database = await instance.database;

    return database.update(tableName, tripinfo.toJson(),
        where: '${TripinfoFields.travelId} = ?',
        whereArgs: [tripinfo.travelId]);
  }

  Future<int> delete(int? travelId) async {
    final database = await instance.database;

    return await database.delete(tableName,
        where: '${TripinfoFields.travelId} = ?', whereArgs: [travelId]);
  }

  Future close() async {
    final database = await instance.database;

    database.close();
  }
}

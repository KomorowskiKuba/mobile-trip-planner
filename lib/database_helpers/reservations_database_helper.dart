import 'package:mobile_trip_planner/models/reservation_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ReservationsDatabaseHelper {
  static final ReservationsDatabaseHelper instance =
      ReservationsDatabaseHelper._init();

  static Database? _database;

  ReservationsDatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDB('reservations_database.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database database, int version) async {
    final String travelIdType = 'INTEGER NOT NULL';
    final String reservationIdType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final String titleType = 'TEXT NOT NULL';
    final String imagePathType = 'TEXT NOT NULL';

    database.execute('''
        CREATE TABLE $tableName (
          ${ReservationFields.travelId} $travelIdType,
          ${ReservationFields.reservationId} $reservationIdType,
          ${ReservationFields.title} $titleType,
          ${ReservationFields.imagePath} $imagePathType
        )
      ''');
  }

  Future<Reservation> create(Reservation reservation) async {
    final database = await instance.database;
    final reservationId =
        await database.insert(tableName, reservation.toJson());

    return reservation.copy(reservationId: reservationId);
  }

  Future<int> update(Reservation reservation) async {
    final database = await instance.database;

    return database.update(tableName, reservation.toJson(),
        where: '${ReservationFields.reservationId} = ?',
        whereArgs: [reservation.reservationId]);
  }

  Future<List<Reservation>> readAllReservations(int travelId) async {
    final database = await instance.database;
    print("TABLENAME: " + tableName);
    final result = await database.query(tableName,
    where: '${ReservationFields.travelId} = ?',
    whereArgs: [travelId]
    );

    return result.map((json) => Reservation.fromJson(json)).toList();
  }

  Future<int> delete(int? reservationId) async {
    final database = await instance.database;

    return await database.delete(tableName,
        where: '${ReservationFields.reservationId} = ?',
        whereArgs: [reservationId]);
  }

  Future close() async {
    final database = await instance.database;

    database.close();
  }
}

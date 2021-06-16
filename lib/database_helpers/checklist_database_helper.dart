import 'package:mobile_trip_planner/models/checklist_item_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ChecklistDatabaseHelper {
  static final ChecklistDatabaseHelper instance =
      ChecklistDatabaseHelper._init();

  static Database? _database;

  ChecklistDatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDB('checklist_database.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database database, int version) async {
    final travelIdType = 'INTEGER NOT NULL';
    final itemIdType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final itemType = 'TEXT NOT NULL';
    final checked = 'BOOLEAN NOT NULL';

    database.execute('''
        CREATE TABLE $tableName (
          ${ChecklistItemFields.travelId} $travelIdType,
          ${ChecklistItemFields.itemId} $itemIdType,
          ${ChecklistItemFields.itemName} $itemType,
          ${ChecklistItemFields.checked} $checked
        )
      ''');
  }

  Future<ChecklistItem> create(ChecklistItem checklistItem) async {
    final database = await instance.database;
    final itemId = await database.insert(tableName, checklistItem.toJson());

    return checklistItem.copy(itemId: itemId);
  }

  Future<int> update(ChecklistItem item) async {
    final database = await instance.database;

    return database.update(tableName, item.toJson(),
        where: '${ChecklistItemFields.itemId} = ?', whereArgs: [item.itemId]);
  }

  Future<List<ChecklistItem>> readAllChecklistItems(int travelId) async {
    final database = await instance.database;
    final result = await database.query(tableName,
    where: '${ChecklistItemFields.travelId} = ?',
    whereArgs: [travelId]);

    return result.map((json) => ChecklistItem.fromJson(json)).toList();
  }

  Future<int> delete(int? itemId) async {
    final database = await instance.database;

    return await database.delete(tableName,
        where: '${ChecklistItemFields.itemId} = ?', whereArgs: [itemId]);
  }

  Future close() async {
    final database = await instance.database;

    database.close();
  }
}

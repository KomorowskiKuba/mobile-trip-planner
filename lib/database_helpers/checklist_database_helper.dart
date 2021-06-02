import 'package:mobile_trip_planner/models/checklist_item_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ChecklistDatabaseHelper {
  static final ChecklistDatabaseHelper instance = ChecklistDatabaseHelper._init();

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
    final itemType = 'TEXT NOT NULL';
    final checked = 'BOOLEAN NOT NULL';

    database.execute(
      '''
        CREATE TABLE $tableName (
          ${ChecklistItemFields.travelId} $travelIdType,
          ${ChecklistItemFields.itemName} $itemType,
          ${ChecklistItemFields.checked} $checked
        )
      '''
    );
  }

  Future<ChecklistItem> create(ChecklistItem checklistItem) async {
    final database = await instance.database;
    final itemId = await database.insert(tableName, checklistItem.toJson());

    return checklistItem.copy(itemId: itemId);
  }
}
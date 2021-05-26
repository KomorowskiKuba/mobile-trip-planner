import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class NotesDatabaseHelper {
  static final NotesDatabaseHelper instance = NotesDatabaseHelper._init();

  static Database? _database;

  NotesDatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDB('notes_database.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }
  
  Future _createDB(Database database, int version) async {
    
  }

  Future close() async {
    final database = await instance.database;

    database.close();
  }
}
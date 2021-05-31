import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mobile_trip_planner/models/note_model.dart';

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
    final travelIdType = 'INTEGER NOT NULL';
    final noteIdType = 'INTEGER PRIMARY KEY';
    final titleType = 'TEXT NOT NULL';
    final contentType = 'TEXT NOT NULL';

    await database.execute(
      '''
        CREATE TABLE $tableName (
          ${NoteFields.travelId} $travelIdType,
          ${NoteFields.noteId} $noteIdType,
          ${NoteFields.title} $titleType,
          ${NoteFields.content} $contentType
        )
      '''
    );
  }

  Future<Note> create(Note note) async {
    final database = await instance.database;

    //final json = note.toJson();
    //final columns = '${NoteFields.travelId}, ${NoteFields.title}, ${NoteFields.content}';
    //final values = '${json[NoteFields.travelId]}, ${json[NoteFields.title]}, ${json[NoteFields.content]}';

    //final noteId = await database.rawInsert('INSERT INTO tableName')

    final noteId = await database.insert(tableName, note.toJson());
    return note.copy(noteId: noteId);
  }

  Future<Note> readNote(int noteId) async {
    final database = await instance.database;

    final maps = await database.query(
      tableName,
      columns: NoteFields.values,
      where: '${NoteFields.noteId} = ?',
      whereArgs: [noteId]
    );

    if (maps.isNotEmpty) {
      return Note.fromJson(maps.first);
    } else {
      throw Exception('Id not found!');
    }
  }

  Future<List<Note>> readAllNotes() async {
    final database = await instance.database;

    final result = await database.query(tableName);

    return result.map((json) => Note.fromJson(json)).toList();
  }

  Future<int> update(Note note) async {
    final database = await instance.database;

    return database.update(
      tableName,
      note.toJson(),
      where: '${NoteFields.noteId} = ?',
      whereArgs: [note.noteId]
    );
  }

  Future<int> delete(int noteId) async {
    final database = await instance.database;

    return await database.delete(
      tableName,
      where: '${NoteFields.noteId} = ?',
      whereArgs: [noteId]
    );
  }

  Future close() async {
    final database = await instance.database;

    database.close();
  }
}
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/image.dart';

class DatabaseService {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'app_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE images(id INTEGER PRIMARY KEY, url TEXT, dateUploaded TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> saveImageMetadata(ImageModel image) async {
    final db = await database;
    await db.insert('images', image.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Other database methods...
}

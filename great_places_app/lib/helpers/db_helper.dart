import 'package:sqflite/sqflite.dart' as sqlite;

import 'package:path/path.dart' as path;

class DBHelper {
  static Future<void> insert({String table, Map<String, Object> data}) async {
    final dbPath = await sqlite.getDatabasesPath();

    final sqlDb = await sqlite.openDatabase(
      path.join(dbPath, 'place.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT)');
      },
      version: 1,
    );

    await sqlDb.insert(
      table,
      data,
      conflictAlgorithm: sqlite.ConflictAlgorithm.replace,
    );
  }
}

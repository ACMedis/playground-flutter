import 'package:flutter/services.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  Database? _database;

  Future<Database> get database async {
    return _database ??= await _initDatabase();
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'mysellersflutter.db'),
      version: 1,
      onCreate: (db, version) async {
        String s = await rootBundle.loadString("assets/sql/sql_v1.sql");

        List<String> sqls = s.split(";");

        for (String sql in sqls) {
          if (sql.trim().isNotEmpty) {
            await db.execute(sql);
          }
        }
        // await setupIni(db);
      },
      //onUpdate:
    );
  }

  // setupIni(db) {}
}

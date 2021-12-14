import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_app/data/db/db_const.dart';
import 'package:path/path.dart';

class DbConfig {
  static Database? _database;

  static const initScripts = [CREATE_TABLE_TODO];
  static const migrationScripts = [CREATE_TABLE_TODO];

  DbConfig._();
  static final DbConfig instance = DbConfig._();

  Future<Database> get database async {
    if (_database != null) return _database!;

    // if _database is null we instantiate it
    WidgetsFlutterBinding.ensureInitialized();
    _database = await openDatabase(join(await getDatabasesPath(), DB_NAME),
        version: DB_VERSION, onCreate: (Database db, int version) {
      initScripts.forEach((script) async {
        await db.execute(script);
      });
    }, onUpgrade: (Database db, int oldVersion, int newVersion) {
      migrationScripts.forEach((script) async {
        await db.execute(script);
      });
    });
    return _database!;
  }

  static close() async {
    await _database?.close();
  }
}

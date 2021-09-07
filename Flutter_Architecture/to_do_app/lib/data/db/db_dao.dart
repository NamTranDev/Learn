import 'package:sqflite/sqflite.dart';
import 'package:to_do_app/data/db/db_config.dart';
import 'package:to_do_app/data/db/db_const.dart';
import 'package:to_do_app/data/models/todo.dart';

class DbDAO {
  Future<List<Todo>> allTodo() async {
    final db = await DbConfig.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(TODO_TABLE_NAME);
    return List.generate(maps.length, (index) {
      return Todo.fromData(maps[index]['id'], maps[index]['content']);
    });
  }

  Future<Todo> insert(Todo todo) async {
    final db = await DbConfig.instance.database;
    int id = await db.insert(TODO_TABLE_NAME, todo.toJson(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
    todo.id = id;
    return todo;
  }

  Future<Todo> delete(Todo todo) async {
    final db = await DbConfig.instance.database;
    await db.delete(TODO_TABLE_NAME, where: 'id = ?', whereArgs: [todo.id]);
    return todo;
  }

  Future<Todo> update(Todo todo) async {
    final db = await DbConfig.instance.database;
    await db.update(TODO_TABLE_NAME, todo.toJson(),
        where: 'id = ?', whereArgs: [todo.id]);
    return todo;
  }

  Future<Todo> getTodo(int id) async {
    final db = await DbConfig.instance.database;
    final List<Map<String, dynamic>> maps =
        await db.query(TODO_TABLE_NAME, where: 'id = ?', whereArgs: [id]);
    return List.generate(maps.length, (index) {
      return Todo.fromData(maps[index]['id'], maps[index]['content']);
    }).first;
  }
}

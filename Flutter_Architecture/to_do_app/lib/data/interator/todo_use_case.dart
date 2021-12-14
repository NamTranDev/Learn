import 'package:to_do_app/data/db/db_dao.dart';
import 'package:to_do_app/data/local/preference.dart';
import 'package:to_do_app/data/models/todo.dart';
import 'package:to_do_app/injection.dart';

abstract class ITodoUseCase {
  Future<List<Todo>> getListTodo();
  Future<Todo> insertTodo(Todo todo);
  Future<Todo> deleteTodo(Todo todo);
  Future<Todo> getTodo(int id);
  Future<Todo> updateTodo(Todo todo);
}

class TodoUseCase implements ITodoUseCase {
  DbDAO _db = inject<DbDAO>();
  IPref _iPref = inject<IPref>();

  @override
  Future<Todo> deleteTodo(Todo todo) {
    return _db.delete(todo);
  }

  @override
  Future<List<Todo>> getListTodo() {
    return _db.allTodo();
  }

  @override
  Future<Todo> insertTodo(Todo todo) {
    return _db.insert(todo);
  }

  @override
  Future<Todo> getTodo(int id) {
    return _db.getTodo(id);
  }

  @override
  Future<Todo> updateTodo(Todo todo) {
    return _db.update(todo);
  }
}

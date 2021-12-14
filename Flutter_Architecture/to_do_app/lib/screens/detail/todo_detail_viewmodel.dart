import 'dart:async';

import 'package:to_do_app/data/interator/todo_use_case.dart';
import 'package:to_do_app/data/models/todo.dart';
import 'package:to_do_app/screens/base/model/loading_process.dart';
import 'package:to_do_app/screens/base/viewmodel.dart';

import '../../injection.dart';

class TodoDetailViewModel extends ViewModel {
  ITodoUseCase _useCase = inject<ITodoUseCase>();

  StreamController<Todo> _navigate = StreamController();
  StreamController<Todo> get navigate => this._navigate;

  Todo? _todo;
  Todo? get todo => this._todo;

  @override
  void loadData(id) {
    excute(_useCase.getTodo(id), (value) {
      _todo = value;
    }, loading: LoadingProcess.LOADING_NORMAL);
  }

  void updateTodo(String text) {
    if (_todo?.content == text) return;
    _todo?.content = text;
    excute(_useCase.updateTodo(todo!), (value) {
      _navigate.sink.add(todo!);
    });
  }

  @override
  void dispose() {
    _navigate.close();
    super.dispose();
  }
}

import 'package:to_do_app/common/logger.dart';
import 'package:to_do_app/data/interator/todo_use_case.dart';
import 'package:to_do_app/data/models/todo.dart';
import 'package:to_do_app/screens/base/model/loading_process.dart';
import 'package:to_do_app/screens/base/viewmodel.dart';

import '../../injection.dart';

class TodoViewModel extends ViewModel {
  ITodoUseCase _useCase = inject<ITodoUseCase>();

  List<Todo> _todoList = [];
  List<Todo> get todoList => this._todoList;

  void addTodo(String text) async {
    // stateLoading.sink
    //     .add(StateProcess.loading(loading: LoadingProcess.LOADING_DIALOG));

    // state = StateProcess.loading();

    // await Future.delayed(Duration(seconds: 5));
    // _todoList.add(Todo(text));

    // state = StateProcess.success();

    // stateLoading.sink
    //     .add(StateProcess.success(loading: LoadingProcess.LOADING_DIALOG));
    if (text.isEmpty) return;
    excute(_useCase.insertTodo(Todo(text)), (value) {
      _todoList.add(value);
    });
  }

  void deleteTodo(int index) {
    excute(_useCase.deleteTodo(_todoList[index]), (value) {
      _todoList.remove(value);
    });
  }

  @override
  void loadData(dynamic) async {
    // state = StateProcess.loading();
    // await Future.delayed(Duration(seconds: 1));
    // state = StateProcess.success();

    excute(_useCase.getListTodo(), (value) {
      _todoList = value;
    }, loading: LoadingProcess.LOADING_NORMAL);
  }

  void updateTodo(Todo? todo) {
    if (todo == null) return;
    _todoList[_todoList.indexWhere((element) => element.id == todo.id)] = todo;
    notifyListeners();
  }
}

import 'package:flutter/cupertino.dart';
import 'package:to_do_app/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> listTask = [];

  void addTask(String task) {
    listTask.add(Task(name: task));
    notifyListeners();
  }

  void changeStatus(int index) {
    listTask[index].changeStatus();
    notifyListeners();
  }

  void removeTask(int index) {
    listTask.removeAt(index);
    notifyListeners();
  }
}

class Task {
  String name;
  bool isDone = false;

  Task({required this.name});

  void changeStatus() {
    isDone = !isDone;
  }
}

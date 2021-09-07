class Todo {
  int id = 0;
  String content;

  Todo(this.content);

  Todo.fromData(this.id, this.content);

  Map<String, dynamic> toJson() => {"content": content};
}

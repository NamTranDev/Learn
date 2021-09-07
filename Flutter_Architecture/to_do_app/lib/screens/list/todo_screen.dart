import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_app/screens/base/base_screen.dart';
import 'package:to_do_app/screens/list/todo_header.dart';
import 'package:to_do_app/screens/list/todo_list.dart';
import 'package:to_do_app/screens/list/todo_viewmodel.dart';

class TodoListScreen extends BaseScreen<TodoViewModel> {
  @override
  argument() => null;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Todo List"),
        ),
        body: Column(
          children: [
            TodoHeader(),
            Expanded(child: Container(child: TodoList())),
          ],
        ),
      ),
    );
  }

  @override
  TodoViewModel initVM() => TodoViewModel();

  @override
  void listenerVM(BuildContext context, TodoViewModel? viewModel) {}
}

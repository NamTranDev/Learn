import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_app/screens/base/base_screen.dart';
import 'package:to_do_app/screens/detail/todo_detail.dart';
import 'package:to_do_app/screens/detail/todo_detail_viewmodel.dart';

class TodoDetailScreen extends BaseScreen<TodoDetailViewModel> {
  final int id;

  TodoDetailScreen(this.id);

  @override
  argument() => id;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Todo Detail"),
        ),
        body: TodoDetail(),
      ),
    );
  }

  @override
  TodoDetailViewModel initVM() {
    return TodoDetailViewModel();
  }

  @override
  void listenerVM(BuildContext context, TodoDetailViewModel? viewModel) {
    viewModel?.navigate.stream.listen((event) {
      Navigator.pop(context, event);
    });
  }
}

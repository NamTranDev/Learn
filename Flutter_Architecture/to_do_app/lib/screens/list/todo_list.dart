import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/data/models/todo.dart';
import 'package:to_do_app/screens/base/widget_loading_stateless.dart';
import 'package:to_do_app/screens/detail/todo_detail_screen.dart';
import 'package:to_do_app/screens/list/todo_viewmodel.dart';

class TodoList extends WidgetLoadingStateless<TodoViewModel> {
  @override
  Widget widget(TodoViewModel viewModel) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () async {
            Todo? todo = await Navigator.push(context,
                MaterialPageRoute(builder: (context) {
              return TodoDetailScreen(viewModel.todoList[index].id);
            }));
            viewModel.updateTodo(todo);
          },
          child: ListTile(
            title: Text("${viewModel.todoList[index].content}"),
            trailing: GestureDetector(
              onTap: () {
                viewModel.deleteTodo(index);
              },
              child: Icon(Icons.delete),
            ),
          ),
        );
      },
      itemCount: viewModel.todoList.length,
    );
  }
}

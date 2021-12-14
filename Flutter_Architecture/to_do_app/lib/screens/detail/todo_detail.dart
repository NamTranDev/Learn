import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_app/screens/base/widget_loading_stateless.dart';
import 'package:to_do_app/screens/detail/todo_detail_viewmodel.dart';

class TodoDetail extends WidgetLoadingStateless<TodoDetailViewModel> {
  @override
  Widget widget(TodoDetailViewModel viewModel) {
    TextEditingController controller =
        TextEditingController(text: viewModel.todo?.content);
    controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length));
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            textInputAction: TextInputAction.done,
            onSubmitted: (value) {
              viewModel.updateTodo(value);
            },
            autofocus: true,
            controller: controller,
            decoration: InputDecoration(hintText: "Add Todo"),
          ),
          MaterialButton(
            color: Colors.lightBlueAccent,
            onPressed: () {
              viewModel.updateTodo(controller.text);
            },
            child: Text("Update"),
          ),
        ],
      ),
    );
  }
}

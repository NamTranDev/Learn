import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/screens/base/widget_stateless.dart';
import 'package:to_do_app/screens/list/todo_viewmodel.dart';

class TodoHeader extends WidgetStateless<TodoViewModel> {
  
  @override
  Widget widget(TodoViewModel viewModel) {
    var inputController = TextEditingController();
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              textInputAction: TextInputAction.done,
              onSubmitted: (value){
                viewModel.addTodo(value);
              },
              controller: inputController,
              decoration: InputDecoration(hintText: "Add Todo"),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          MaterialButton(
            color: Colors.lightBlueAccent,
            onPressed: () {
              viewModel.addTodo(inputController.text);
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

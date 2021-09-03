import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/task_data.dart';

class NewTaskScreen extends StatefulWidget {
  @override
  _NewTaskScreenState createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  TextEditingController controllerInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.only(top: 20, left: 30, right: 30),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                "Add Task",
                style: TextStyle(color: Colors.lightBlueAccent, fontSize: 25),
              ),
            ),
            TextField(
              controller: controllerInput,
              autofocus: true,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: FlatButton(
                onPressed: () {
                  context.read<TaskData>().addTask(controllerInput.text);
                  Navigator.pop(context);
                },
                child: Text(
                  "Add Task",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.lightBlueAccent,
              ),
            )
          ],
        ),
      ),
    );
  }
}

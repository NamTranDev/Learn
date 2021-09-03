import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:to_do_app/models/task.dart';
import 'package:to_do_app/models/task_data.dart';
import 'package:provider/provider.dart';

import 'new_task_screen.dart';

class TaskScreen extends StatelessWidget {
  String? taskString;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 30),
            child: CircleAvatar(
              child: Icon(
                Icons.list,
                size: 40,
                color: Colors.lightBlueAccent,
              ),
              radius: 30,
              backgroundColor: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 30),
            child: Text(
              "Todo",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 50),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 20),
            child: Text(
              "${context.watch<TaskData>().listTask.length} Task",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            child: Consumer<TaskData>(
              builder: (context, taskData, child) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        taskData.listTask[index].name,
                        style: TextStyle(
                            decoration: taskData.listTask[index].isDone
                                ? TextDecoration.lineThrough
                                : TextDecoration.none),
                      ),
                      trailing: Checkbox(
                        activeColor: Colors.lightBlueAccent,
                        value: taskData.listTask[index].isDone,
                        onChanged: (value) {
                          taskData.changeStatus(index);
                        },
                      ),
                      onTap: () {
                        print("onTap");
                      },
                      onLongPress: () {
                        print("onLongPress");
                        taskData.removeTask(index);
                      },
                    );
                  },
                  itemCount: context.watch<TaskData>().listTask.length,
                );
              },
            ),
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return NewTaskScreen();
            },
          );
        },
        child: Icon(Icons.add),
      ),
    ));
  }
}

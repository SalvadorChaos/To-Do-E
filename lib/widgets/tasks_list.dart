import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task_data.dart';
import 'task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.taskList[index];
            return Dismissible(
              background: stackBehindDismiss(),
              key: ObjectKey(task),
              child: TaskTile(
                taskTitle: task.name,
                isChecked: task.isDone,
                checkboxCallback: (checkboxState) {
                  taskData.updateTask(task);
                },
              ),
              onDismissed: (direction) {
                taskData.deleteTask(task);
              },
            );
          },
          itemCount: taskData.taskList.length,
        );
      },
    );
  }

  Widget stackBehindDismiss() {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            Icons.delete,
            color: Colors.red,
          ),
          Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}

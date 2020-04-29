import 'package:flutter/material.dart';

import '../screens/tasks_screen.dart';

class TaskTile extends StatelessWidget {
  TaskTile({
    @required this.taskTitle,
    @required this.isChecked,
    @required this.checkboxCallback,
    @required this.longPressCallback,
  });

  final String taskTitle;
  final bool isChecked;
  final Function checkboxCallback;
  final Function longPressCallback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
          color: TasksScreen.isSwitched ? Colors.greenAccent : Colors.black,
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Theme(
        data: Theme.of(context).copyWith(
          unselectedWidgetColor:
              TasksScreen.isSwitched ? Colors.green : Colors.black,
        ),
        child: Checkbox(
          value: isChecked,
          activeColor:
              TasksScreen.isSwitched ? Colors.greenAccent : Colors.black,
          checkColor:
              TasksScreen.isSwitched ? Colors.black : Colors.greenAccent,
          onChanged: checkboxCallback,
        ),
      ),
    );
  }
}

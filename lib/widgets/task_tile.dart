import 'package:flutter/material.dart';

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
          color: Colors.greenAccent,
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Theme(
        data: Theme.of(context).copyWith(
          unselectedWidgetColor: Colors.green,
        ),
        child: Checkbox(
          value: isChecked,
          activeColor: Colors.greenAccent,
          checkColor: Colors.black,
          onChanged: checkboxCallback,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task_data.dart';

class AddTaskScreen extends StatefulWidget {
  final Function addTaskCallback;

  AddTaskScreen(this.addTaskCallback);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    String newTask;

    return Container(
      padding: EdgeInsets.only(
        top: 27.0,
        left: 30.0,
        right: 30.0,
        bottom: 30.0,
      ),
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              'Add a Task',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 6.0),
                focusedBorder: UnderlineInputBorder(),
              ),
              onChanged: (String textInput) {
                newTask = textInput;
              },
            ),
            SizedBox(height: 21.0),
            SizedBox(
              height: 60.0,
              width: double.infinity,
              child: FlatButton(
                color: Colors.black,
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 21.0,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                onPressed: () {
                  Provider.of<TaskData>(
                    context,
                    listen: false,
                  ).addTask(newTask);
                  Navigator.pop(context);
                  //addTaskCallback(newTask);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

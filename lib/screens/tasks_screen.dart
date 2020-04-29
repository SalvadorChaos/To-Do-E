import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task_data.dart';
import '../widgets/tasks_list.dart';
import '../widgets/theme_switch.dart';
import 'add_task_screen.dart';

class TasksScreen extends StatefulWidget {
  static bool isSwitched = false;
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  Color lightThemeColor = Colors.greenAccent;
  Color darkThemeColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.0),
        child: AppBar(
          backgroundColor: darkThemeColor,
          brightness:
              TasksScreen.isSwitched ? Brightness.light : Brightness.dark,
          elevation: 0.0,
        ),
      ),
      backgroundColor: darkThemeColor,
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: 60.0,
              left: 30.0,
              right: 30.0,
              bottom: 30.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CircleAvatar(
                      child: Icon(
                        Icons.list,
                        color: darkThemeColor,
                        size: 30.0,
                      ),
                      backgroundColor: lightThemeColor,
                      radius: 30.0,
                    ),
                    ThemeSwitch(
                      onChanged: (value) {
                        setState(() {
                          TasksScreen.isSwitched = !TasksScreen.isSwitched;
                          if (TasksScreen.isSwitched == true) {
                            darkThemeColor = Colors.greenAccent;
                            lightThemeColor = Colors.black;
                          } else {
                            darkThemeColor = Colors.black;
                            lightThemeColor = Colors.greenAccent;
                          }
                          print(TasksScreen.isSwitched);
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 21.0,
                ),
                Text(
                  'Todoey',
                  style: TextStyle(
                    color: lightThemeColor,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${Provider.of<TaskData>(context).taskCount} Tasks',
                  style: TextStyle(
                    color: lightThemeColor,
                    fontSize: 21.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              decoration: BoxDecoration(
                color: lightThemeColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: TasksList(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: darkThemeColor,
        child: Icon(
          Icons.add,
          color: lightThemeColor,
        ),
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                child: AddTaskScreen((newTask) {
                  Navigator.pop(context);
                }),
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

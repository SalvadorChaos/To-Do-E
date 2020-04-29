import 'package:flutter/material.dart';

import '../screens/tasks_screen.dart';

class ThemeSwitch extends StatelessWidget {
  ThemeSwitch({
    @required this.onChanged,
  });

  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            'Theme Switch',
            style: TextStyle(
              color: TasksScreen.isSwitched ? Colors.black : Colors.greenAccent,
            ),
          ),
          Switch(
            activeTrackColor: Colors.green,
            activeColor:
                TasksScreen.isSwitched ? Colors.black : Colors.greenAccent,
            inactiveThumbColor:
                TasksScreen.isSwitched ? Colors.black : Colors.greenAccent,
            inactiveTrackColor: Colors.green,
            value: TasksScreen.isSwitched,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

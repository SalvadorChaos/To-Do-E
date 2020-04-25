import 'dart:collection';

import 'package:flutter/foundation.dart';

import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _taskList = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy Bread'),
    Task(name: 'Buy Eggs'),
  ];

  int completedTasks = 0;

  UnmodifiableListView<Task> get taskList {
    return UnmodifiableListView(_taskList);
  }

  int get taskCount {
    return _taskList.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _taskList.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _taskList.remove(task);
    notifyListeners();
  }
}

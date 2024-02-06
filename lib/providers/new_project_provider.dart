import 'package:areis/models/task_model.dart';
import 'package:flutter/material.dart';

class NewProjectProvider with ChangeNotifier {
  TextEditingController projectNameController = TextEditingController();
  TextEditingController projectDescriptionController = TextEditingController();

  List<Task> taskList = [];

  void addTask(Task task) {
    taskList.add(task);
    notifyListeners();
  }

  void removeTask(Task task) {
    taskList.removeWhere((element) => element == task);
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../data/models/task.dart';

enum Filter { all, active, completed }

class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = [];
  Filter _filter = Filter.all;

  Filter get filter => _filter;

  List<Task> get filteredTasks {
    switch (_filter) {
      case Filter.active:
        return _tasks.where((task) => !task.isCompleted).toList();
      case Filter.completed:
        return _tasks.where((task) => task.isCompleted).toList();
      default:
        return _tasks;
    }
  }

  void setFilter(Filter filter) {
    _filter = filter;
    notifyListeners();
  }

  Future<void> loadTasks() async {
    final box = Hive.box<Task>('tasks');
    _tasks = box.values.toList();
    notifyListeners();
  }

  Future<void> addTask(Task task) async {
    final box = Hive.box<Task>('tasks');
    await box.add(task);
    _tasks = box.values.toList();
    notifyListeners();
  }

  Future<void> updateTask(Task task) async {
    await task.save();
    _tasks = Hive.box<Task>('tasks').values.toList();
    notifyListeners();
  }

  Future<void> deleteTask(Task task) async {
    await task.delete();
    _tasks = Hive.box<Task>('tasks').values.toList();
    notifyListeners();
  }

  void toggleComplete(Task task) {
    task.isCompleted = !task.isCompleted;
    task.save();
    notifyListeners();
  }

  void sortByDueDate() {
    _tasks.sort((a, b) => a.dueDate.compareTo(b.dueDate));
    notifyListeners();
  }

  void sortByCreatedDate() {
    _tasks.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    notifyListeners();
  }
}

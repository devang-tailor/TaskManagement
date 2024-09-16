import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskmanagement/res/exports/common_exports.dart';

class TaskProvider with ChangeNotifier {
  final TaskService _taskService = TaskService();

  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  Future<void> loadTasks() async {
    _tasks = await _taskService.getTasks();
    notifyListeners();
  }

  Future<void> addTask(Task task) async {
    await _taskService.addTask(task);
    await loadTasks();
  }

  Future<void> updateTask(Task task) async {
    await _taskService.updateTask(task);
    await loadTasks();
  }

  Future<void> deleteTask(Task task) async {
    await _taskService.deleteTask(task);
    await loadTasks();
  }
}

final taskProvider = ChangeNotifierProvider((ref) => TaskProvider());
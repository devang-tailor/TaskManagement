import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskmanagement/res/exports/common_exports.dart';


class FilterProvider with ChangeNotifier {
  String _filter = 'all';

  String get filter => _filter;

  void setFilter(String filter) {
    _filter = filter;
    notifyListeners();
  }

  List<Task> getFilteredTasks(List<Task> tasks) {
    switch (_filter) {
      case 'all':
        return tasks;
      case 'completed':
        return tasks.where((task) => task.isCompleted).toList();
      case 'pending':
        return tasks.where((task) => !task.isCompleted).toList();
      default:
        return tasks;
    }
  }
}

final filterProvider = ChangeNotifierProvider((ref) => FilterProvider());
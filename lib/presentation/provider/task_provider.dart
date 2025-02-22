import 'package:flutter/foundation.dart';
import '../../data/models/task_model.dart';
import '../../data/services/task_service.dart';


class TaskProvider with ChangeNotifier {
  final TaskService _taskService;
  List<Task> _tasks = [];
  bool _isLoading = false;
  DateTime _selectedDate = DateTime.now();

  TaskProvider(this._taskService) {
    _init();
  }

  List<Task> get tasks => _tasks;
  bool get isLoading => _isLoading;
  DateTime get selectedDate => _selectedDate;

  Future<void> _init() async {
    await loadTasks();
  }

  Future<void> loadTasks() async {
    try {
      _isLoading = true;
      notifyListeners();

      _tasks = await _taskService.getTasks();

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> createTask(Task task) async {
    try {
      _isLoading = true;
      notifyListeners();

      final newTask = await _taskService.createTask(task);
      _tasks.add(newTask);

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      _isLoading = true;
      notifyListeners();

      final updatedTask = await _taskService.updateTask(task);
      final index = _tasks.indexWhere((t) => t.id == task.id);
      if (index != -1) {
        _tasks[index] = updatedTask;
      }

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteTask(String id) async {
    try {
      _isLoading = true;
      notifyListeners();

      await _taskService.deleteTask(id);
      _tasks.removeWhere((task) => task.id == id);

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
    }
  }

  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  List<Task> getTasksForDate(DateTime date) {
    return _tasks.where((task) =>
    task.startTime.year == date.year &&
        task.startTime.month == date.month &&
        task.startTime.day == date.day
    ).toList();
  }

  List<Task> getTasksForHour(int hour) {
    return _tasks.where((task) =>
    task.startTime.hour == hour &&
        task.startTime.year == _selectedDate.year &&
        task.startTime.month == _selectedDate.month &&
        task.startTime.day == _selectedDate.day
    ).toList();
  }
}
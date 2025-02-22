import '../models/task_model.dart';
import 'package:uuid/uuid.dart';

class TaskService {
  final List<Task> _tasks = [];
  final _uuid = const Uuid();

  Future<List<Task>> getTasks() async {
    return _tasks;
  }

  Future<Task> createTask(Task task) async {
    final newTask = Task(
      id: _uuid.v4(),
      title: task.title,
      description: task.description,
      startTime: task.startTime,
      endTime: task.endTime,
      priority: task.priority,
      category: task.category,
      userId: task.userId,
    );
    _tasks.add(newTask);
    return newTask;
  }

  Future<Task> updateTask(Task task) async {
    final index = _tasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      _tasks[index] = task;
      return task;
    }
    throw Exception('Task not found');
  }

  Future<void> deleteTask(String id) async {
    _tasks.removeWhere((task) => task.id == id);
  }

  Future<List<Task>> getTasksByDate(DateTime date) async {
    return _tasks.where((task) {
      return task.startTime.year == date.year &&
          task.startTime.month == date.month &&
          task.startTime.day == date.day;
    }).toList();
  }
}
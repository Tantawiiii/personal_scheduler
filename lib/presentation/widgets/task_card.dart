import 'package:flutter/material.dart';
import '../../data/models/task_model.dart';

class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(task.title),
        subtitle: Text('${task.startTime} - ${task.endTime}'),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            // Delete task logic
          },
        ),
      ),
    );
  }
}

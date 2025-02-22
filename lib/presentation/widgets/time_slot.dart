import 'package:flutter/material.dart';
import '../../data/models/task_model.dart';

class TimeSlot extends StatelessWidget {
  final int hour;
  final List<Task> tasks;

  const TimeSlot({super.key, required this.hour, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${hour.toString().padLeft(2, '0')}:00',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ...tasks.map((task) => ListTile(
            title: Text(task.title),
            subtitle: Text(task.description ?? ''),
            leading: const Icon(Icons.task),
          )),
        ],
      ),
    );
  }
}

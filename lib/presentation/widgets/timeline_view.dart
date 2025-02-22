import 'package:flutter/material.dart';
import 'package:personal_scheduler/presentation/widgets/time_slot.dart';
import 'package:provider/provider.dart';

import '../provider/task_provider.dart';

class TaskTimeline extends StatelessWidget {
  const TaskTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, taskProvider, child) {
        return ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            final hour = index + 9;
            return TimeSlot(
              hour: hour,
              tasks: taskProvider.getTasksForHour(hour),
            );
          },
        );
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:personal_scheduler/presentation/ui/task_modal.dart';
import '../widgets/date_selector.dart';
import '../widgets/timeline_view.dart';


class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Scheduler'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          const DateSelector(),
          Expanded(
            child: TaskTimeline(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) => const TaskModal(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
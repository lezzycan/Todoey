import 'package:bloc_task_app/models/task_model.dart';
import 'package:bloc_task_app/screens/add_task_screen.dart';
import 'package:bloc_task_app/widget/taskList.dart';
import 'package:flutter/material.dart';

import '../blocs/bloc_export.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context, builder: (context) => const AddTaskScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: ((context, state) {
        List<Task> taskList = state.alltasks;

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.brown,
            title: const Text('Tasks App'),
            actions: [
              IconButton(
                onPressed: () {
                  _addTask(context);
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          body: Column(
            children: [
              const Center(
                child: Chip(label: Text('Task')),
              ),
              TasksList(taskList: taskList),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _addTask(context),
            tooltip: 'Add Task',
            child: const Icon(Icons.add),
          ),
        );
      }),
    );
  }
}

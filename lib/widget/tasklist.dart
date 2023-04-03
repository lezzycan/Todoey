import 'package:bloc_task_app/blocs/bloc/task_bloc.dart';
import 'package:bloc_task_app/blocs/bloc_export.dart';
import 'package:flutter/material.dart';

import '../models/task_model.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
    required this.taskList,
  }) : super(key: key);

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: ((context, index) {
          final task = taskList[index];
          return ListTile(
            title: Text(task.title),
            trailing: Checkbox(
              onChanged: (value) {
                context.read<TaskBloc>().add(
                      UpdateTask(task: task),
                    );
              },
              value: task.isChecked,
            ),
            onLongPress: () => context.read<TaskBloc>().add(
                  DeleteTask(task: task),
                ),
          );
        }),
      ),
    );
  }
}

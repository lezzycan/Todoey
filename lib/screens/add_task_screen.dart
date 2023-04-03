import 'package:bloc_task_app/blocs/bloc/task_bloc.dart';
import 'package:bloc_task_app/blocs/bloc_export.dart';
import 'package:bloc_task_app/models/task_model.dart';
import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}



class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                'Add Task',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                autofocus: true,
                controller: titleController,
                decoration: const InputDecoration(
                  label: Text('Title'),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('cancel'),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        var task = Task(title: titleController.text);
                        context.read<TaskBloc>().add(
                              AddTask(
                                task: task,
                              ),
                            );
                       
                        Navigator.pop(context);
                      },
                      child: const Text('Add'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


import 'package:bloc_task_app/blocs/bloc_export.dart';
import 'package:bloc_task_app/models/task_model.dart';
import 'package:equatable/equatable.dart';


part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
  }

  void _onAddTask(AddTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(
      TaskState(
        alltasks: List.from(state.alltasks)..add(event.task),
      ),
    );
  }

  void _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) {
    final state = this.state;
    final task = event.task;

    final int index = state.alltasks.indexOf(task);
    List<Task> alltasks = List.from(state.alltasks)..remove(task);
    task.isChecked == false
        ? alltasks.insert(
            index,
            task.copyWith(isChecked: true),
          )
        : alltasks.insert(
            index,
            task.copyWith(isChecked: false),
          );
    emit(
      TaskState(alltasks: alltasks),
    );
  }

  void _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) {
    final state = this.state;
    final task = event.task;

    List<Task> alltasks = List.from(state.alltasks)..remove(task);

    emit(
      TaskState(alltasks: alltasks),
    );
  }

  @override
  TaskState? fromJson(Map<String, dynamic> json) {
    return TaskState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TaskState state) {
    return state.toMap();
  }
}

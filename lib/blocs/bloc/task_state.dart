

part of 'task_bloc.dart';

class TaskState extends Equatable {
  final List<Task> alltasks;
  const TaskState({this.alltasks = const <Task>[]});

  @override
  List<Object> get props => [alltasks];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'alltasks': alltasks.map((x) => x.toMap()).toList()});
  
    return result;
  }

  factory TaskState.fromMap(Map<String, dynamic> tasks) {
    return TaskState(
      alltasks: List<Task>.from(tasks['alltasks']?.map((task) => Task.fromMap(task))),
    );
  }

 
}

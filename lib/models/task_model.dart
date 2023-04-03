import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Task extends Equatable {
  final String title;
  bool? isChecked;
  bool? isDeleted;

  Task({
    required this.title,
    this.isChecked,
    this.isDeleted,
  }) {
    isChecked = isChecked ?? false;
    isDeleted = isDeleted ?? false;
  }

  Task copyWith({String? title, bool? isChecked, bool? isDeleted}) {
    return Task(
        title: title ?? this.title,
        isChecked: isChecked ?? this.isChecked,
        isDeleted: isDeleted ?? this.isDeleted);
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    if (isChecked != null) {
      result.addAll({'isChecked': isChecked});
    }
    if (isDeleted != null) {
      result.addAll({'isDeleted': isDeleted});
    }

    return result;
  }

  factory Task.fromMap(Map<String, dynamic> data) {
    return Task(
      title: data['title'] ?? '',
      isChecked: data['isChecked'],
      isDeleted: data['isDeleted'],
    );
  }

  @override
  List<Object?> get props => [title, isChecked, isDeleted];
}

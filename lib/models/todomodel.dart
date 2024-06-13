class TodoModel {
  String task;
  bool isDone;

  TodoModel({required this.task, required this.isDone});

  TodoModel.fromJson(Map<String, Object?> json)
      : this(task: json['task']! as String, isDone: json['isDone']! as bool);

  TodoModel copyWith({String? task, bool? isDone}) {
    return TodoModel(task: task ?? this.task, isDone: isDone ?? this.isDone);
  }

  Map<String, Object?> toJson() {
    return {
      'task' : task,
      'isDone': isDone
    };
  }
}

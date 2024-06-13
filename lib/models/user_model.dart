import 'package:todojango/models/todomodel.dart';

class UserModel {
  List<TodoModel> todos;

  UserModel({required this.todos});

  factory UserModel.fromJson(Map<String, Object?> json) {
    var list = json['todos'] as List;
    List<TodoModel> todoList =
        list.map((todos) => TodoModel.fromJson(todos)).toList();
    return UserModel(
      todos: todoList,
    );
  }

  Map<String, Object?> toJson() {
    var list = todos.map((todo) => todo.toJson()).toList();
    return {'todos': list};
  }
}

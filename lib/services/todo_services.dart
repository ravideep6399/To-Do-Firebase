import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todojango/models/todomodel.dart';
// import 'package:todojango/models/user_model.dart';

const String userCollection = "user";
const String todoCollection = "todos";

class TodoFireBaseServices {
  final _firestore = FirebaseFirestore.instance;
  late final CollectionReference _todoref;
  late final DocumentReference _user;
  final String userId;
  TodoFireBaseServices({required this.userId}) {
    _user = _firestore.collection(userCollection).doc(userId);
    _todoref = _user.collection(todoCollection).withConverter<TodoModel>(
        fromFirestore: (snapshots, _) => TodoModel.fromJson(snapshots.data()!),
        toFirestore: (todo, _) => todo.toJson());
  }

  // Future addUserData(String task) async {
  //   TodoModel todo = TodoModel(task: task,isDone: false);
  //   List<TodoModel> todos = [todo];
  //   return _todoref.doc(userId).set(todos);
  // }

  Stream<QuerySnapshot> getTodos() {
    // print(_todoref.path);
    return _todoref.snapshots();
  }

  Future<void> addTodo(TodoModel todo) async {
    _todoref.add(todo);
  }

  void updateTodo(String todoId, TodoModel todo) {
    _todoref.doc(todoId).update(todo.toJson());
  }

  void deleteTodo(String todoId) {
    _todoref.doc(todoId).delete();
  }
}

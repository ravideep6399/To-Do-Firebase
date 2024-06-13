import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todojango/services/todo_services.dart';
import 'package:todojango/user%20auth/usermodelview.dart';
import 'package:todojango/widget/container.dart';
import 'package:todojango/widget/todotile.dart';

import 'models/todomodel.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  final TextEditingController newTask = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User user;
    user = FirebaseAuth.instance.currentUser!;
    final TodoFireBaseServices db = TodoFireBaseServices(userId: user.uid);
    final auth = Provider.of<UserViewModel>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 52, 52, 52),
      appBar: AppBar(
        title: const Text(
          "Your List",
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.blueGrey,
            child: user.displayName == null||user.displayName!.isEmpty
                ? const Icon(Icons.person_2_sharp)
                : Text(user.displayName.toString()[0]),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                auth.signOut(context);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: StreamBuilder(
          stream: db.getTodos(),
          builder: (context, snapshot) {
            List todos = snapshot.data?.docs ?? [];
            print(todos.length);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  String todoId = todos[index].id;
                  print(todoId);
                  TodoModel todo = todos[index].data();
                  return Todotile(
                    task: todo.task,
                    taskcompleted: todo.isDone,
                    onChanged: (value) {
                      TodoModel updated = todo.copyWith(isDone: !todo.isDone);
                      db.updateTodo(todoId, updated);
                    },
                    deleteTile: () {
                      db.deleteTodo(
                        todoId,
                      );
                    },
                  );
                },
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        elevation: 15,
        onPressed: () async {
          showDialog(
              context: context,
              builder: ((context) {
                return Containers(
                  newTask: newTask,
                  save: () {
                    TodoModel todo =
                        TodoModel(task: newTask.text, isDone: false);
                    db.addTodo(todo);
                    newTask.clear();
                    Navigator.pop(context);
                  },
                );
              }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

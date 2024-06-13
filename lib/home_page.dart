import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todojango/todo.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    User user;
    user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 45, 45, 45),
      appBar: AppBar(
        title: const Text("TO-DO"),
        actions: [
          Padding(
            padding:const EdgeInsets.fromLTRB(0, 0, 8, 0),
            child: CircleAvatar(
              backgroundColor: Colors.blueGrey,
              child: user.displayName == null||user.displayName!.isEmpty
                  ? const Icon(Icons.person_2_sharp)
                  : Text(user.displayName![0]),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(300, 80),
                shadowColor: Colors.blue,
                elevation: 20,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                backgroundColor: Colors.blue,
              ),
              onPressed: (() {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => const Todo())));
              }),
              child: const Text(
                "List",
                style: TextStyle(fontSize: 28),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

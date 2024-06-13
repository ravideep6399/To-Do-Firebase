import 'package:flutter/material.dart';

class Todotile extends StatelessWidget {
  final String task;
  final bool taskcompleted;
  final Function(bool?)? onChanged;
  final Function() deleteTile;
  const Todotile(
      {super.key,
      required this.task,
      required this.taskcompleted,
      this.onChanged,
      required this.deleteTile,});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        // onTap: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        tileColor: Colors.white,
        leading: Checkbox(
          value: taskcompleted,
          onChanged: onChanged,
        ),
        title: Text(
          task,
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 0, 0, 0)),
        ),
        trailing: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            margin: const EdgeInsets.symmetric(vertical: 12),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                color: const Color.fromARGB(219, 50, 50, 50),
                borderRadius: BorderRadius.circular(5)),
            child: IconButton(
              onPressed: deleteTile,
              color: Colors.white,
              iconSize: 18,
              icon: const Icon(Icons.delete),
            ),
          ),
        ),
      ),
    );
  }
}

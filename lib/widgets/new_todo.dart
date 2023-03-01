import 'package:flutter/material.dart';
import '../models/todo.dart';

class NewTodo extends StatefulWidget {
  final Function addTodo;

  const NewTodo(this.addTodo);

  @override
  State<NewTodo> createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Todo'),
            controller: descriptionController,
            onSubmitted: (_) => _submitData(),
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.purple,
            ),
            child: Text("Add todo"),
            onPressed: () {
              _submitData();
            },
          )
        ]),
      ),
    );
  }

  void _submitData() {
    final String enteredDescription = descriptionController.text;

    if (enteredDescription.isNotEmpty) {
      final Todo todoToAdd = Todo.of(enteredDescription, false);
      widget.addTodo(
        todoToAdd,
      );
      Navigator.of(context).pop();
    }
  }
}

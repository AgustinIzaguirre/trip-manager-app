import 'package:flutter/material.dart';
import 'package:trip_manager/models/todo.dart';

class TodoListItemWidget extends StatelessWidget {
  final Todo todo;
  final Function updateTodo;
  final Function removeTodo;

  const TodoListItemWidget(this.todo, this.updateTodo, this.removeTodo,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: BeveledRectangleBorder(
        //<-- 2. SEE HERE
        side: BorderSide(
          color: todo.isDone ? Colors.greenAccent : Colors.grey,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              todo.description,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Checkbox(
              value: todo.isDone,
              onChanged: (value) => updateTodo(todo, value),
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => removeTodo(todo),
            )
          ],
        ),
      ),
    );
  }
}

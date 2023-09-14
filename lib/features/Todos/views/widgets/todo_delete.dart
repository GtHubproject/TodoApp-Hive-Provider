import 'package:flutter/material.dart';
import 'package:provider_state/features/Todos/controllers/todo_controllers.dart';
import 'package:provider_state/model/model.dart';



Future<String?> todoDeleteShowDialog(BuildContext context,
    TodoController provider, int index, Todo todos) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('Delete Todo'),
      content: const Text('sure to delete this '),
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            provider.deleteTodo(index);
            Navigator.pop(context);
          },

          child: const Text('Delete'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
      ],
    ),
  );
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/features/Todos/controllers/todo_controllers.dart';
import 'package:provider_state/features/Todos/views/widgets/custom_todo_addButton.dart';
import 'package:provider_state/features/Todos/views/widgets/todo_delete.dart';
import 'package:provider_state/features/Todos/views/widgets/todo_update.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoController>(
      context,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.all(18),
          child: Text(
            'Todo App',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SafeArea(
        child: Consumer<TodoController>(
          builder: (context, value, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Expanded(
                child: ListView.builder(
                    itemCount: value.todoBox.length,
                    itemBuilder: (context, index) {
                      final todos = value.todoBox.getAt(index);
                      return GestureDetector(
                        onTap: () {
                          if (todoProvider.todoBox.isNotEmpty) {
                            todoDeleteShowDialog(
                                context, todoProvider, index, todos);
                          }
                        },
                        child: ListTile(
                          leading: Checkbox(
                            checkColor: Colors.black,
                            value: todos!.isCompleted,
                            onChanged: (value) {
                              todos.isCompleted = !todos.isCompleted;
                              todoProvider.saveTodo(todos);
                            },
                          ),
                          title: Text(
                            todos.title,
                          ),
                          subtitle: Text(
                            todos.description,
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                todoUpdateTodo(context,
                                    index: index,
                                    title: todos.title,
                                    todoNote: todos.description);
                              },
                              icon: const Icon(Icons.edit)),
                        ),
                      );
                    }),
              ),
            );
          },
        ),
      ),
      floatingActionButton: TodoAddButton(
        todoprovider: todoProvider,
      ),
    );
  }
}

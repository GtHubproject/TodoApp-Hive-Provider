import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider_state/model/model.dart';



class TodoController extends ChangeNotifier {
  Box<Todo> todoBox = Hive.box('Todo_Database');

  int currentBottomNavIndex = 0;


  Future<void> bottomNavbar(value) async {
    currentBottomNavIndex = value;
    notifyListeners();
  }

  // Create  Todo
  Future<void> createTodo(Todo todos) async {
    await todoBox.add(todos);
    notifyListeners();
  }

  // Compeleted  Todo
  Future<void> saveTodo(Todo todos) async {
    await todos.save();
    notifyListeners();
  }

  // Update Todo
  Future<void> updateTodo({required int index, required title, required description}) async {
    await todoBox.putAt(index,
      Todo(
        title: title,
        description: description,
        isCompleted: false,
      ),
    );
    notifyListeners();
  }

  // Delete Todo
  Future<void> deleteTodo(int index) async {
    await todoBox.deleteAt(index);
    notifyListeners();
  }
}
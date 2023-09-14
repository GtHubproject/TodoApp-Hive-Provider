import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider_state/model/model.dart';

class Databasehive {
  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Hive.initFlutter();

    //  RegisterAdapter => Todo
    Hive.registerAdapter(TodoAdapter());

    // open todo box
    await Hive.openBox<Todo>('Todo_Database');
  }

}
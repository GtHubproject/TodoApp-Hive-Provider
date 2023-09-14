import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/features/Todos/controllers/todo_controllers.dart';
import 'package:provider_state/features/Todos/home/home.dart';
import 'package:provider_state/features/note/note.dart';
import 'package:provider_state/features/Todos/controllers/database.dart';


void main() async {
  final databasehive = Databasehive();
  await databasehive.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TodoController()),
        ChangeNotifierProvider(create: (context) => NoteController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.light,
          colorSchemeSeed: Colors.tealAccent,
        ),
        home: HomeScreen(),
      ),
    );
  }
}


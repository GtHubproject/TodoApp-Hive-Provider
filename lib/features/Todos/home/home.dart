import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/features/Todos/controllers/todo_controllers.dart';
import 'package:provider_state/features/Todos/views/pages/todo_screen.dart';
import 'package:provider_state/features/note/note_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<Widget> pages = [
    const TodoScreen(),
    const NoteScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoController>(
      context,
    );
    return SafeArea(
        child: Scaffold(
      body: pages[provider.currentBottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: provider.currentBottomNavIndex,
          onTap: (value) => provider.bottomNavbar(value),
          items: [
            customBottomNavbarItem(
              icon: const Icon(Icons.note_outlined),
              label: 'Todos',
            ),
            customBottomNavbarItem(
              icon: const Icon(Icons.note_add),
              label: 'Notes',
            ),
          ]),
    ));
  }

  BottomNavigationBarItem customBottomNavbarItem ({required Widget icon, required String label}){
    return BottomNavigationBarItem(icon: icon, label: label);
  }
}

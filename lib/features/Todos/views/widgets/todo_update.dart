import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/features/Todos/controllers/todo_controllers.dart';

import 'custom_textFormField.dart';

final TextEditingController editController = TextEditingController();
final TextEditingController editNoteController = TextEditingController();

PersistentBottomSheetController<dynamic> todoUpdateTodo(BuildContext context,
    {required index, required title, required todoNote}) {
  return showBottomSheet(
    enableDrag: true,
    context: context,
    builder: (context) {
      final todoProvider = Provider.of<TodoController>(context, listen: false);
      update() {
        todoProvider.updateTodo(
          index: index,
          title: editController.text,
         description: editNoteController.text,
        );
        Navigator.pop(context);
      }

      editController.text = title;
      editNoteController.text = todoNote;
      return Padding(
        padding: const EdgeInsets.all(28.0),
        child: SizedBox(
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFormField(
                label: 'title',
                icon: const Icon(Icons.today_outlined),
                textController: editController,
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                label: 'note',
                icon: const Icon(Icons.edit),
                textController: editNoteController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: update,
                    child: const Text("Update"),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: ElevatedButton(
                        child: const Text('cancel'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
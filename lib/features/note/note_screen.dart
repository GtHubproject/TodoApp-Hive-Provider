import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:tdBGColor,
        actions: [

      ]),

      body: Text('Notes'),
    );
  }
}

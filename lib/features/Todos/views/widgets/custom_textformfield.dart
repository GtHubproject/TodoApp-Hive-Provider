import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final Widget icon;

  final TextEditingController textController;

  const CustomTextFormField({
    super.key,
    required this.label,
    required this.icon,
    required this.textController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      decoration: InputDecoration(
        prefixIcon: icon,
        label: Text(
          label,
          style: const TextStyle(color: Colors.black),
        ),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
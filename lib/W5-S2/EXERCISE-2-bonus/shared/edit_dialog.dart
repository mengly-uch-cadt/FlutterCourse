import 'package:flutter/material.dart';

class EditDialog extends StatelessWidget {
  const EditDialog({super.key, required this.initialValue});

  final String initialValue;

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController(text: initialValue);

    return AlertDialog(
      title: const Text("Edit Value"),
      content: TextField(
        controller: controller,
        decoration: const InputDecoration(labelText: "New Value"),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(controller.text),
          child: const Text("Save"),
        ),
      ],
    );
  }
}
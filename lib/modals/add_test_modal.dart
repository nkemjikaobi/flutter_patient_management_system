// AddTestModal.dart

import 'package:flutter/material.dart';

class AddTestModal extends StatelessWidget {
  const AddTestModal({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Test'),
      content: const SingleChildScrollView(
        child: Column(
          children: [
            // Your form fields for adding a test
            // You can add text fields, dropdowns, etc.
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            // Implement logic for saving the test data
            // Navigator.of(context).pop();
          },
          child: const Text('Save'),
        ),
        TextButton(
          onPressed: () {
            // Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}

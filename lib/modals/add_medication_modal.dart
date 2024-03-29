// AddMedicationModal.dart

import 'package:flutter/material.dart';

class AddMedicationModal extends StatelessWidget {
  const AddMedicationModal({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Medication'),
      content: const SingleChildScrollView(
        child: Column(
          children: [
            // Your form fields for adding medication
            // You can add text fields, dropdowns, etc.
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            // Implement logic for saving the medication data
            Navigator.of(context).pop();
          },
          child: const Text('Save'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}

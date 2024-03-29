// AddTestModal.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_project_1/models/patient_test_model.dart';

class AddTestModal extends StatefulWidget {
  const AddTestModal({Key? key}) : super(key: key);

  @override
  State<AddTestModal> createState() => _AddTestModalState();
}

class _AddTestModalState extends State<AddTestModal> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController valueController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Test'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text("Name*", style: TextStyle(fontSize: 18)),
              const SizedBox(
                  height:
                      10), // Add spacing between Text and TextField if needed
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "This field is required";
                  }
                  return null;
                },
                controller: nameController,
                decoration: const InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: 'Name', // Placeholder text
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 10),

              const Text("Value*", style: TextStyle(fontSize: 18)),
              const SizedBox(
                  height:
                      10), // Add spacing between Text and TextField if needed
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "This field is required";
                  }
                  return null;
                },
                controller: valueController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                decoration: const InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: 'Value', // Placeholder text
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),

              const Text("Notes", style: TextStyle(fontSize: 18)),
              const SizedBox(height: 10),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: notesController,
                decoration: const InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: 'Notes',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            // Implement logic for saving the test data
            // Navigator.of(context).pop();
            _formKey.currentState!.validate();

            PatientTestModel newTest = PatientTestModel(
                name: nameController.text,
                value: valueController.text,
                testDate: DateTime.now().toString());
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

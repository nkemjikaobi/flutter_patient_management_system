// AddTestModal.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_project_1/models/patient_test_model.dart';
import 'package:flutter_application_project_1/services/patient_service.dart';

class AddTestModal extends StatefulWidget {
  final String patientId;
  const AddTestModal({Key? key, required this.patientId}) : super(key: key);

  @override
  State<AddTestModal> createState() => _AddTestModalState();
}

class _AddTestModalState extends State<AddTestModal> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController valueController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  bool isLoading = false;

  Future addTest(patient, id) async {
    isLoading = true;
    await PatientService().addTest(patient, id);
    isLoading = false;
  }

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
                  labelText: 'Eye Scan', // Placeholder text
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
                  labelText: '7', // Placeholder text
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
                  labelText: 'This patient is asthmatic',
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
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            // Implement logic for saving the test data
            if (_formKey.currentState!.validate()) {
              PatientTestModel newTest = PatientTestModel(
                  name: nameController.text,
                  value: valueController.text,
                  testDate: DateTime.now().toString());

              await addTest(newTest, widget.patientId);

              const snackBar = SnackBar(
                content: Text('Patient test added successfully.'),
                backgroundColor: Colors.green,
              );

              Navigator.of(context).pop();

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : const Text('Save'),
        ),
      ],
    );
  }
}

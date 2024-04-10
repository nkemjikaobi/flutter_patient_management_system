// AddTestModal.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_project_1/models/patient_test_model.dart';
import 'package:flutter_application_project_1/providers/patient_provider.dart';
import 'package:provider/provider.dart';

class AddTestModal extends StatefulWidget {
  final String patientId;
  const AddTestModal({Key? key, required this.patientId}) : super(key: key);

  @override
  State<AddTestModal> createState() => _AddTestModalState();
}

class _AddTestModalState extends State<AddTestModal> {
  final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> addTestNameKey = GlobalKey<FormState>();
  GlobalKey<FormState> addTestValueKey = GlobalKey<FormState>();
  GlobalKey<FormState> addTestNotesKey = GlobalKey<FormState>();
  GlobalKey<FormState> addTestSaveBtn = GlobalKey<FormState>();

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
                key: addTestNameKey,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "This field is required";
                  }

                  if (value.length < 5) {
                    return "Should be at least 5 characters";
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
                key: addTestValueKey,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "This field is required";
                  }
                  // Convert the input value to an integer
                  int? intValue = int.tryParse(value);
                  if (intValue == null || intValue < 0 || intValue > 10) {
                    return "Enter a number between 0-10";
                  }
                  return null;
                },
                controller: valueController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: 'number between 0 and 10',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 10),

              const Text("Notes", style: TextStyle(fontSize: 18)),
              const SizedBox(height: 10),
              TextField(
                key: addTestNotesKey,
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
          key: addTestSaveBtn,
          onPressed: () async {
            // Implement logic for saving the test data
            if (_formKey.currentState!.validate()) {
              PatientTestModel newTest = PatientTestModel(
                  name: nameController.text,
                  value: valueController.text,
                  testDate: DateTime.now().toString());

              Provider.of<PatientProvider>(context, listen: false)
                  .addTest(newTest, widget.patientId)
                  .then((_) {
                Navigator.of(context).pop();

                // Show a SnackBar indicating success
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Patient test added successfully.'),
                    backgroundColor: Colors.green,
                  ),
                );
              }).catchError((error) {
                // Show a SnackBar indicating error
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Failed to add test: $error'),
                    backgroundColor: Colors.red,
                  ),
                );
              });
            }
          },
          child: Provider.of<PatientProvider>(context, listen: false).isLoading
              ? const Center(child: CircularProgressIndicator())
              : const Text('Save'),
        ),
      ],
    );
  }
}

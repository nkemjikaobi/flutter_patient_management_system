// AddMedicationModal.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_project_1/models/patient_medications_model.dart';
import 'package:flutter_application_project_1/services/patient_service.dart';

class AddMedicationModal extends StatefulWidget {
  final String patientId;
  const AddMedicationModal({Key? key, required this.patientId})
      : super(key: key);

  @override
  State<AddMedicationModal> createState() => _AddMedicationModalState();
}

class _AddMedicationModalState extends State<AddMedicationModal> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController prescriptionController = TextEditingController();

  String doctor = "Dr. Rania Abesh";

  bool isLoading = false;

  Future addMedication(patient, id) async {
    isLoading = true;
    await PatientService().addMedication(patient, id);
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    const List<String> doctorData = <String>[
      'Dr. Rania Abesh',
      'Dr. Philip Nzaghi',
      'Dr. Walter Whyte',
      'Dr Jesse Pinkman',
      'Dr. Connor Mcgregor',
    ];

    return AlertDialog(
      title: const Text('Add Medication'),
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
                    labelText: 'Thylenol', // Placeholder text
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                // Add spacing between Text and TextField if needed

                const SizedBox(height: 20),
                const Text("Prescription*", style: TextStyle(fontSize: 18)),
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
                  controller: prescriptionController,
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: 'Twice daily', // Placeholder text
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text(
                      'Doctor:',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                        width:
                            10), // Adjust the spacing between label and dropdown button
                    Expanded(
                      child: DropdownButton<String>(
                        value: doctor,
                        icon: const Icon(Icons.arrow_drop_down),
                        onChanged: (String? value) {
                          setState(() {
                            doctor = value!;
                          });
                        },
                        items: doctorData
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                )
              ],
            )),
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
            // Implement logic for saving the medication data
            if (_formKey.currentState!.validate()) {
              PatientMedicationModel newMedication = PatientMedicationModel(
                  name: nameController.text,
                  prescription: prescriptionController.text,
                  doctor: doctor,
                  medicationDate: DateTime.now().toString());

              await addMedication(newMedication, widget.patientId);

              const snackBar = SnackBar(
                content: Text('Patient medication added successfully.'),
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

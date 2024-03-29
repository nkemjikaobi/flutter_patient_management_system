import 'package:flutter/material.dart';
import 'package:flutter_application_project_1/models/patient_medications_model.dart';

class PatientMedicationsListItem extends StatelessWidget {
  final PatientMedicationModel patientMedicationData;

  const PatientMedicationsListItem({
    super.key,
    required this.patientMedicationData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: InkWell(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(patientMedicationData.name),
                  Text("Doctor: ${patientMedicationData.doctor}")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

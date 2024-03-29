import 'package:flutter/material.dart';
import 'package:flutter_application_project_1/models/patient_test_model.dart';

class PatientTestsListItem extends StatelessWidget {
  final PatientTestModel patientTestData;

  const PatientTestsListItem({
    super.key,
    required this.patientTestData,
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(patientTestData.name),
                Text(patientTestData.testDate)
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(),
            ),
            // Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [Text("Head Scan"), Text("22nd April 2023")]),
            // Padding(
            //   padding: EdgeInsets.all(8.0),
            //   child: Divider(),
            // ),
            // Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [Text("Chemo Test"), Text("22nd April 2023")]),
            // Padding(
            //   padding: EdgeInsets.all(8.0),
            //   child: Divider(),
            // ),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [Text("Full Body Scan"), Text("22nd April 2023")],
            // ),
            // Padding(
            //   padding: EdgeInsets.all(8.0),
            //   child: Divider(),
            // ),
          ],
        ),
      ),
    );
  }
}

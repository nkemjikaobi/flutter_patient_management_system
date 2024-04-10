import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_project_1/models/patient_model.dart';
import 'package:flutter_application_project_1/screens/patient_details.dart';

class PatientListItem extends StatelessWidget {
  final PatientModel patientData;

  const PatientListItem({
    super.key,
    required this.patientData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: InkWell(
        onTap: () {
          // Navigator.pushNamed(context, '/patientdetails',
          //     arguments: patientData.id);

          Navigator.push(context, CupertinoPageRoute(builder: (context) {
            return PatientDetailPage(patientId: patientData.id);
          }));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.asset(
                    'assets/images/patientIcon.png',
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("${patientData.firstName} ${patientData.lastName}",
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                        const SizedBox(width: 30),
                        Text("${patientData.dateOfBirth} Years"),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          patientData.isAdmitted ? 'Admitted' : "Not Admitted",
                          style: const TextStyle(
                              color: Color.fromARGB(255, 95, 12, 177),
                              fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(width: 30),
                        const Text(
                          "Condition: ",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.black, // Adjust the color as needed
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          patientData.condition,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                            color: patientData.condition == "critical"
                                ? Colors.red
                                : Colors.green, // Change the color here
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}

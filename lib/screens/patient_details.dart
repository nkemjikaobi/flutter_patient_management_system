//import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_project_1/modals/add_medication_modal.dart';
import 'package:flutter_application_project_1/modals/add_test_modal.dart';
import 'package:flutter_application_project_1/models/patient_model.dart';
import 'package:flutter_application_project_1/providers/patient_provider.dart';
import 'package:flutter_application_project_1/screens/patient_medications_list_item.dart';
import 'package:flutter_application_project_1/screens/patient_tests_list_item.dart';
import 'package:flutter_application_project_1/screens/update_patient.dart';
import 'package:flutter_application_project_1/services/patient_service.dart';
import 'package:provider/provider.dart';
//import 'package:flutter/services.dart';
//import 'package:provider/provider.dart';

class PatientDetailPage extends StatefulWidget {
  final String patientId;
  const PatientDetailPage({Key? key, required this.patientId})
      : super(key: key);

  @override
  _PatientDetailPageState createState() => _PatientDetailPageState();
}

class _PatientDetailPageState extends State<PatientDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  int _selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }


  Future<void> _navigateToAddTestModal(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddTestModal(patientId: widget.patientId);
      },
    );
  }

  Future<void> _navigateToAddMedicationModal(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddMedicationModal(patientId: widget.patientId);
      },
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final String patientId =
    //     ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Details'),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueAccent,
          tooltip: _tabController.index == 1 ? 'Add Test' : 'Add Medication',
          onPressed: () {
            if (_tabController.index == 1) {
              // Navigate to add test modal
              _navigateToAddTestModal(context);
            } else if (_tabController.index == 2) {
              // Navigate to add medication modal
              _navigateToAddMedicationModal(context);
            }
          },
          child: const Icon(Icons.add, color: Colors.white, size: 28),
        ),
        body: Center(
            child: FutureBuilder(
                future: Provider.of<PatientProvider>(context, listen: false)
                    .fetchPatientDetails(widget.patientId),
                builder: (context, snapshot) => snapshot.connectionState ==
                        ConnectionState.waiting
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Consumer<PatientProvider>(
                        child: const Center(
                          child: Text('Patient details not available'),
                        ),
                        builder: (context, value, child) => value
                                    .currentPatient ==
                                null
                            ? child!
                            : Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Image.asset(
                                          'assets/images/patientIcon.png',
                                          height: 80,
                                          width: 80,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${value.currentPatient!.firstName} ${value.currentPatient!.lastName}",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.black),
                                          ),
                                          Row(
                                            children: [
                                              const Icon(Icons.person_2,
                                                  color: Colors.grey),
                                              const SizedBox(width: 2),
                                              Text(value.currentPatient!.gender,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15,
                                                      color: Color.fromARGB(
                                                          255, 83, 81, 81))),
                                              const SizedBox(width: 10),
                                              const Icon(
                                                Icons.circle,
                                                color: Colors.grey,
                                                size: 10,
                                              ),
                                              const SizedBox(width: 2),
                                              Text(
                                                  "${value.currentPatient!.dateOfBirth} years",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15,
                                                      color: Color.fromARGB(
                                                          255, 83, 81, 81))),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        const Text(
                                          "Condition: ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            color: Colors
                                                .black, // Adjust the color as needed
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          value.currentPatient!.condition,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 18,
                                            color: value.currentPatient!
                                                        .condition ==
                                                    "critical"
                                                ? Colors.red
                                                : Colors
                                                    .green, // Change the color here
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (!value.currentPatient!.isAdmitted)
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          PatientModel updatedPatient =
                                              PatientModel(
                                            firstName:
                                                value.currentPatient!.firstName,
                                            lastName:
                                                value.currentPatient!.lastName,
                                            address:
                                                value.currentPatient!.address,
                                            dateOfBirth: value
                                                .currentPatient!.dateOfBirth,
                                            department: value
                                                .currentPatient!.department,
                                            doctor:
                                                value.currentPatient!.doctor,
                                            condition:
                                                value.currentPatient!.condition,
                                            isAdmitted: true,
                                            bloodGroup: value
                                                .currentPatient!.bloodGroup,
                                            email: value.currentPatient!.email,
                                            phoneNumber: value
                                                .currentPatient!.phoneNumber,
                                            gender:
                                                value.currentPatient!.gender,
                                            genotype:
                                                value.currentPatient!.genotype,
                                            id: value.currentPatient!.id,
                                          );

                                          Provider.of<PatientProvider>(context,
                                                  listen: false)
                                              .updatePatient(updatedPatient,
                                                  value.currentPatient!.id)
                                              .then((_) {
                                            // Show a SnackBar indicating success
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                    'Patient admitted successfully.'),
                                                backgroundColor: Colors.green,
                                              ),
                                            );
                                          }).catchError((error) {
                                            // Show a SnackBar indicating error
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                    'Failed to admit patient: $error'),
                                                backgroundColor: Colors.red,
                                              ),
                                            );
                                          });
                                        },
                                        child: const Text('Admit Patient'),
                                      ),
                                    ),

                                  const SizedBox(height: 15),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            child: Column(
                                              children: [
                                                //const SizedBox(width: 8),
                                                Image.asset(
                                                  'assets/images/bloodLevel_green.png',
                                                  height: 50,
                                                  width: 50,
                                                  fit: BoxFit.cover,
                                                ),
                                                const SizedBox(height: 5),
                                                const Text("0mmHg",
                                                    style:
                                                        TextStyle(fontSize: 14)

                                                    ///textAlign: TextAlign.center,
                                                    ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            child: Column(
                                              children: [
                                                //const SizedBox(width: 8),
                                                Image.asset(
                                                  'assets/images/heartRate_green.png',
                                                  height: 50,
                                                  width: 50,
                                                  fit: BoxFit.cover,
                                                ),
                                                const SizedBox(height: 5),
                                                const Text("0/min",
                                                    style:
                                                        TextStyle(fontSize: 14)

                                                    ///textAlign: TextAlign.center,
                                                    ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            child: Column(
                                              children: [
                                                //const SizedBox(width: 8),
                                                Image.asset(
                                                  'assets/images/oxyLevel_green.png',
                                                  height: 50,
                                                  width: 50,
                                                  fit: BoxFit.cover,
                                                ),
                                                const SizedBox(height: 5),
                                                const Text("0%",
                                                    style:
                                                        TextStyle(fontSize: 14)

                                                    ///textAlign: TextAlign.center,
                                                    ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            child: Column(
                                              children: [
                                                //const SizedBox(width: 8),
                                                Image.asset(
                                                  'assets/images/respiRate_green.png',
                                                  height: 50,
                                                  width: 50,
                                                  fit: BoxFit.cover,
                                                ),
                                                const SizedBox(height: 5),
                                                const Text("0/min",
                                                    style:
                                                        TextStyle(fontSize: 14)

                                                    ///textAlign: TextAlign.center,
                                                    ),
                                              ],
                                            ),
                                          ),
                                        ]),
                                  ),

                                  const SizedBox(height: 10),
                                  TabBar(
                                    controller: _tabController,
                                    tabs: const [
                                      Tab(text: 'Details'),
                                      Tab(text: 'Tests'),
                                      Tab(text: 'Medications'),
                                    ],
                                  ),
                                  // Content for each tab
                                  Expanded(
                                    child: TabBarView(
                                      controller: _tabController,
                                      children: [
                                        Container(
                                            // alignment: Alignment.center,
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                      "Contact Information",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20,
                                                          color: Colors.grey)),
                                                  Row(
                                                    children: [
                                                      IconButton(
                                                          onPressed: () {
                                                            Navigator.push(
                                                                context,
                                                                CupertinoPageRoute(
                                                                    builder:
                                                                        (context) {
                                                              return UpdatePatientPage(
                                                                  patientInfo: value
                                                                      .currentPatient!);
                                                            }));
                                                          },
                                                          icon: const Icon(
                                                              Icons.edit,
                                                              color: Colors
                                                                  .black)),
                                                      Provider.of<PatientProvider>(
                                                                  context,
                                                                  listen: false)
                                                              .deleteLoading
                                                          ? const CircularProgressIndicator() // Show CircularProgressIndicator when isLoading is true
                                                          : IconButton(
                                                              onPressed:
                                                                  () async {
                                                                Provider.of<PatientProvider>(
                                                                        context,
                                                                        listen:
                                                                            false)
                                                                    .deletePatient(
                                                                        widget
                                                                            .patientId)
                                                                    .then((_) {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();

                                                                  // Show a SnackBar indicating success
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    const SnackBar(
                                                                      content: Text(
                                                                          'Patient deleted successfully.'),
                                                                      backgroundColor:
                                                                          Colors
                                                                              .green,
                                                                    ),
                                                                  );
                                                                }).catchError(
                                                                        (error) {
                                                                  // Show a SnackBar indicating error
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content: Text(
                                                                          'Failed to delete patient: $error'),
                                                                      backgroundColor:
                                                                          Colors
                                                                              .red,
                                                                    ),
                                                                  );
                                                                });
                                                              },
                                                              icon: const Icon(
                                                                  Icons.delete,
                                                                  color: Colors
                                                                      .red),
                                                            ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10.0),
                                                child: Text(
                                                    "Email: ${value.currentPatient?.email}",
                                                    style: const TextStyle(
                                                        fontSize: 15))),
                                            Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10.0),
                                                child: Text(
                                                    "Phone No.: ${value.currentPatient?.phoneNumber}",
                                                    style: const TextStyle(
                                                        fontSize: 15))),
                                            Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10.0),
                                                child: Text(
                                                    "Address: ${value.currentPatient?.address}",
                                                    style: const TextStyle(
                                                        fontSize: 15))),
                                            const SizedBox(height: 10),
                                            const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10.0),
                                                child: Text("Health Data",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20,
                                                        color: Colors.grey))),
                                            Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10.0),
                                                child: Text(
                                                    "Doctor: ${value.currentPatient?.doctor}",
                                                    style: const TextStyle(
                                                        fontSize: 15))),
                                            Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10.0),
                                                child: Text(
                                                    "Department: ${value.currentPatient?.department}",
                                                    style: const TextStyle(
                                                        fontSize: 15))),
                                            const SizedBox(height: 10),
                                          ],
                                        )),
                                        Container(
                                          padding: const EdgeInsets.all(15),
                                          child: value
                                                  .currentPatient!.tests.isEmpty
                                              ? const Text('No tests')
                                              : ListView.builder(
                                                  itemCount: value
                                                      .currentPatient!
                                                      .tests
                                                      .length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return PatientTestsListItem(
                                                      patientTestData: value
                                                          .currentPatient!
                                                          .tests[index],
                                                    );
                                                  },
                                                ),
                                        ),
                                        Container(
                                            padding: const EdgeInsets.all(15),
                                            child: value.currentPatient!
                                                    .medications.isEmpty
                                                ? const Text('No medications')
                                                : ListView.builder(
                                                    itemCount: value
                                                        .currentPatient!
                                                        .medications
                                                        .length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return PatientMedicationsListItem(
                                                        patientMedicationData:
                                                            value.currentPatient!
                                                                    .medications[
                                                                index],
                                                      );
                                                    },
                                                  ))
                                      ],
                                    ),
                                  ),
                                ],
                              )))));
  }
}

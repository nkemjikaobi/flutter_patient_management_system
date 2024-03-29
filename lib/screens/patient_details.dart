//import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_project_1/models/patient_model.dart';
import 'package:flutter_application_project_1/screens/patient_tests_list_item.dart';
import 'package:flutter_application_project_1/screens/update_patient.dart';
import 'package:flutter_application_project_1/services/patient_service.dart';
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

  PatientModel? patientInfo;
  bool isLoading = true;
  bool deleteLoading = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  Future _fetchPatientDetails(String id) async {
    patientInfo = await PatientService().getPatientDetails(id);
    isLoading = false;
    return patientInfo;
  }

  @override
  Widget build(BuildContext context) {
    final String patientId =
        ModalRoute.of(context)!.settings.arguments as String;

    Future deletePatient(String id) async {
      deleteLoading = true;
      await PatientService().deletePatient(id);
      deleteLoading = false;
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Details'),
          actions: [
            ElevatedButton(
                onPressed: () {
                  deletePatient(patientId);
                  Navigator.pushNamed(context, '/patients');

                  // Show a SnackBar indicating success
                  const snackBar = SnackBar(
                    content: Text('Patient deleted successfully.'),
                    backgroundColor: Colors.green,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: deleteLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : const Row(children: [
                        Icon(Icons.delete, color: Colors.red),
                        Text(
                          "DELETE PATIENT",
                          style: TextStyle(fontSize: 15, color: Colors.red),
                        )
                      ])),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromRGBO(82, 170, 94, 1.0),
          tooltip: 'Increment',
          onPressed: () {},
          child: const Icon(Icons.add, color: Colors.white, size: 28),
        ),
        body: Center(
          child: FutureBuilder(
              future: _fetchPatientDetails(patientId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${patientInfo?.firstName} ${patientInfo?.lastName}",
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
                                  Text(patientInfo!.gender,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color:
                                              Color.fromARGB(255, 83, 81, 81))),
                                  const SizedBox(width: 10),
                                  const Icon(
                                    Icons.circle,
                                    color: Colors.grey,
                                    size: 10,
                                  ),
                                  const SizedBox(width: 2),
                                  Text("${patientInfo!.dateOfBirth} years",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color:
                                              Color.fromARGB(255, 83, 81, 81))),
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
                                color:
                                    Colors.black, // Adjust the color as needed
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              patientInfo!.condition,
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 18,
                                color: patientInfo?.condition == "critical"
                                    ? Colors.red
                                    : Colors.green, // Change the color here
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        style: TextStyle(fontSize: 14)

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
                                        style: TextStyle(fontSize: 14)

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
                                        style: TextStyle(fontSize: 14)

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
                                        style: TextStyle(fontSize: 14)

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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("Contact Information",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.grey)),
                                      Row(
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                Navigator.push(context,
                                                    CupertinoPageRoute(
                                                        builder: (context) {
                                                  return UpdatePatientPage(
                                                      patientInfo:
                                                          patientInfo!);
                                                }));
                                              },
                                              icon: const Icon(Icons.edit,
                                                  color: Colors.black)),
                                          deleteLoading
                                              ? const CircularProgressIndicator() // Show CircularProgressIndicator when isLoading is true
                                              : IconButton(
                                                  onPressed: () async {
                                                    await deletePatient(
                                                            patientId)
                                                        .then((value) =>
                                                            Navigator.pop(
                                                                context));

                                                    // Show a SnackBar indicating success
                                                    const snackBar = SnackBar(
                                                      content: Text(
                                                          'Patient deleted successfully.'),
                                                      backgroundColor:
                                                          Colors.green,
                                                    );
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(snackBar);
                                                  },
                                                  icon: const Icon(Icons.delete,
                                                      color: Colors.red),
                                                ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Text("Email: ${patientInfo?.email}",
                                        style: const TextStyle(fontSize: 15))),
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Text(
                                        "Phone No.: ${patientInfo?.phoneNumber}",
                                        style: const TextStyle(fontSize: 15))),
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Text(
                                        "Address: ${patientInfo?.address}",
                                        style: const TextStyle(fontSize: 15))),
                                const SizedBox(height: 10),
                                const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Text("Health Data",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.grey))),
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Text(
                                        "Doctor: ${patientInfo?.doctor}",
                                        style: const TextStyle(fontSize: 15))),
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Text(
                                        "Department: ${patientInfo?.department}",
                                        style: const TextStyle(fontSize: 15))),
                                const SizedBox(height: 10),
                              ],
                            )),
                            Container(
                              padding: const EdgeInsets.all(15),
                             child: patientInfo!.tests.isEmpty
                                  ? const Text('No tests')
                                  : ListView.builder(
                                      itemCount: patientInfo!.tests.length,
                                      itemBuilder: (context, index) {
                                        return PatientTestsListItem(
                                          patientTestData:
                                              patientInfo!.tests[index],
                                        );
                                      },
                                    ),

                            ),
                            Container(
                                padding: const EdgeInsets.all(15),
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Full Body Medication"),
                                        Text("22nd April 2023")
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Divider(),
                                    ),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Head Scan"),
                                          Text("22nd April 2023")
                                        ]),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Divider(),
                                    ),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Chemo Test"),
                                          Text("22nd April 2023")
                                        ]),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Divider(),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Full Body Scan"),
                                        Text("22nd April 2023")
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Divider(),
                                    )
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

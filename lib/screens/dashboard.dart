import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:flutter/services.dart';
//import 'package:provider/provider.dart';
import 'package:flutter_application_project_1/models/patient_model.dart';
import 'package:flutter_application_project_1/services/patient_service.dart';

class PatientListTile extends StatelessWidget {
  final PatientModel patientData;

  const PatientListTile({
    required this.patientData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/patientdetails',
              arguments: patientData.id);
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
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                Text("${patientData.firstName} ${patientData.lastName}"),
                const SizedBox(width: 10),
                Text("${patientData.dateOfBirth} Years"),
              ],
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Row(
                        children: [
                          const SizedBox(width: 8),
                          Image.asset(
                            "assets/images/bloodLevel_green.png",
                            height: 20,
                            width: 20,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 8),
                          const Text("0mmHg", style: TextStyle(fontSize: 10)

                              ///textAlign: TextAlign.center,
                              ),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Row(
                        children: [
                          const SizedBox(width: 8),
                          Image.asset(
                            "assets/images/heartRate_green.png",
                            height: 20,
                            width: 20,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 8),
                          const Text("0/min", style: TextStyle(fontSize: 10)

                              ///textAlign: TextAlign.center,
                              ),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Row(
                        children: [
                          const SizedBox(width: 8),
                          Image.asset(
                            "assets/images/oxyLevel_green.png",
                            height: 20,
                            width: 20,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 8),
                          const Text("0%", style: TextStyle(fontSize: 10)

                              ///textAlign: TextAlign.center,
                              ),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Row(
                        children: [
                          const SizedBox(width: 8),
                          Image.asset(
                            "assets/images/respiRate_green.png",
                            height: 20,
                            width: 20,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 8),
                          const Text("0/min", style: TextStyle(fontSize: 10)

                              ///textAlign: TextAlign.center,
                              ),
                        ],
                      ),
                    ),
                  ]),
            ),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}

class DashBoardPage extends StatefulWidget {
  DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  List<PatientModel> patients = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchPatients();
  }

  _fetchPatients() async {
    try {
      var fetchedPatients = await PatientService().getAllPatients();
      setState(() {
        patients = fetchedPatients;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("An error occurred while loading patients: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
            onRefresh:() => _fetchPatients(),
            child: SingleChildScrollView(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        color: Colors.grey[200],
                        child: Column(children: [
                          const SizedBox(height: 20),
            
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.45,
                                  child: Card(
                                      color: Colors.white,
                                      child: Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: Column(children: [
                                            const Text(
                                              "Admitted Patients",
                                              style: TextStyle(
                                                fontSize: 12, // Font size
                                                fontWeight: FontWeight
                                                    .bold, // Font weight
                                                color: Color.fromARGB(255, 143,
                                                    136, 136), // Text color
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              "${patients.where((element) => element.isAdmitted).length} Patients",
                                              style: const TextStyle(
                                                fontSize: 22, // Font size
                                                fontWeight: FontWeight
                                                    .bold, // Font weight
                                                color: Colors.black, // Text color
                                              ),
                                            )
                                          ]))),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.45,
                                  child: Card(
                                      color: Colors.white,
                                      child: Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: Column(children: [
                                            const Text(
                                              "High Priority Patients",
                                              style: TextStyle(
                                                fontSize: 12, // Font size
                                                fontWeight: FontWeight
                                                    .bold, // Font weight
                                                color: Color.fromARGB(255, 143,
                                                    136, 136), // Text color
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              "${patients.where((element) => element.condition == 'critical').length} Patients",
                                              style: const TextStyle(
                                                fontSize: 22, // Font size
                                                fontWeight: FontWeight
                                                    .bold, // Font weight
                                                color: Colors.black, // Text color
                                              ),
                                            )
                                          ]))),
                                )
                              ]),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(8, 12, 8, 8),
                            child: Text("Requires Attention",
                                style: TextStyle(
                                  fontSize: 15, // Font size
                                  fontWeight: FontWeight.bold, // Font weight
                                  color: Colors.black,
                                )),
                          ),
                          const SizedBox(height: 10),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: patients
                                .where(
                                    (element) => element.condition == 'critical')
                                .length,
                            itemBuilder: (context, index) {
                              return PatientListTile(
                                patientData: patients
                                    .where((element) =>
                                        element.condition == 'critical')
                                    .toList()[index],
                              );
                            },
                          ), //const Divider(),
                        ])),
                    const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Text("Admitted Patients",
                          style: TextStyle(
                            fontSize: 15, // Font size
                            fontWeight: FontWeight.bold, // Font weight
                            color: Colors.black,
                          )),
                    ),
                    const SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:
                          patients.where((element) => element.isAdmitted).length,
                      itemBuilder: (context, index) {
                        return PatientListTile(
                          patientData: patients
                              .where((element) => element.isAdmitted)
                              .toList()[index],
                        );
                      },
                    ),
                  ],
                ),
              ),
          ),
    );
  }
}

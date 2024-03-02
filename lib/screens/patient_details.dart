//import 'dart:ffi';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:provider/provider.dart';

class TestListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          //Add Test View and Functionality Pop-ups
        },
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 10),
            Column(
              children: [
                Text("Critical",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text("3", style: TextStyle(fontSize: 12)),
                Text("24th March 2024", style: TextStyle(fontSize: 12)),
              ],
            ),
            SizedBox(width: 130),
            Icon(
              Icons.turn_right,
              size: 40,
            )
          ],
        ),
      ),
    );
  }
}

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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final String patientId =
        ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        actions: [
          ElevatedButton(
              onPressed: () {},
              child: const Row(children: [
                Icon(Icons.delete, color: Colors.red),
                Text(
                  "DELETE RECORD",
                  style: TextStyle(fontSize: 15, color: Colors.red),
                )
              ])),
        ],
      ),
      body: Column(
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
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rania Arbash",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  Row(
                    children: [
                      Icon(Icons.person_2, color: Colors.grey),
                      Text("ID: 5",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color.fromARGB(255, 83, 81, 81))),
                      SizedBox(width: 10),
                      Icon(
                        Icons.circle,
                        color: Colors.grey,
                        size: 10,
                      ),
                      SizedBox(width: 2),
                      Text("male",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color.fromARGB(255, 83, 81, 81))),
                      SizedBox(width: 10),
                      Icon(
                        Icons.circle,
                        color: Colors.grey,
                        size: 10,
                      ),
                      SizedBox(width: 2),
                      Text("24 Years",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color.fromARGB(255, 83, 81, 81))),
                    ],
                  )
                ],
              )
            ],
          ),
          Card(
            color: Colors.lightGreen,
            // color: patient.condition == "NORMAL"
            //     ? const Color.fromARGB(255, 151, 218, 153)
            //     : const Color.fromARGB(255, 218, 142, 137),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              // side: const BorderSide(
              //   color:
              //       Colors.red, // Border color (can be adjusted independently)
              //   width: 3, // Border thickness (can be adjusted independently)
              // ),
            ),
            child: const Row(children: [
              SizedBox(width: 15),
              Text("Condition: ",
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      fontSize: 18)),
              SizedBox(
                width: 150,
                height: 70,
              ),
              Text(
                "Normal",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                  color: Colors.white,
                ),
              )
            ]),
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
                        const Text("0mmHg", style: TextStyle(fontSize: 14)

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
                        const Text("0/min", style: TextStyle(fontSize: 14)

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
                        const Text("0%", style: TextStyle(fontSize: 14)

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
                        const Text("0/min", style: TextStyle(fontSize: 14)

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
              Tab(text: 'Patient Details'),
              Tab(text: 'Tests'),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Contact Information",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.grey)),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.edit,
                                      color: Colors.black)),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red)),
                            ],
                          )
                        ],
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text("Email: generic@generic.com",
                            style: TextStyle(fontSize: 15))),
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text("Phone No.: generic@generic.com",
                            style: TextStyle(fontSize: 15))),
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text("Address: 33th Street, City",
                            style: TextStyle(fontSize: 15))),
                    const SizedBox(height: 10),
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text("Health Data",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.grey))),
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text("Doctor: Doctor Franklin Nwoke",
                            style: TextStyle(fontSize: 15))),
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text("Department: Ward 3",
                            style: TextStyle(fontSize: 15))),
                    const SizedBox(height: 10),
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text("Date of Birth: January 10th 1980",
                            style: TextStyle(fontSize: 15))),
                  ],
                )),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Full Body Scan"),
                          Text("22nd April 2023")
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Divider(),
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Head Scan"),
                            Text("22nd April 2023")
                          ]),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Divider(),
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Chemo Test"),
                            Text("22nd April 2023")
                          ]),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Divider(),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Full Body Scan"),
                          Text("22nd April 2023")
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Divider(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

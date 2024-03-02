//import 'dart:ffi';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:provider/provider.dart';
import 'package:flutter_application_project_1/data/temp_patient_list.dart';


class TestListTile extends StatelessWidget {
  final TempTestModel testData;
  
  
  const TestListTile({
    required this.testData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          //Add Test View and Functionality Pop-ups
        },
        child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 10),
                Column(children: [
                  Text(testData.category, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(testData.id, style: const TextStyle(fontSize: 12)),
                  Text(testData.date, style: const TextStyle(fontSize: 12)),
                ],),
                const SizedBox(width: 130),
               const Icon(Icons.turn_right, size: 40,)
              ],
            ),
      ),
    );
  }
}

class PatientDetailPage extends StatefulWidget {
    final String patientId; 
    const PatientDetailPage({Key? key, required this.patientId}) : super(key: key);

  @override
    _PatientDetailPageState createState() => _PatientDetailPageState();
  }

  class _PatientDetailPageState extends State<PatientDetailPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    final String patientId = ModalRoute.of(context)!.settings.arguments as String;
    TempPatientModel? patient = tempPatientListFull.firstWhere((obj) => obj.id == patientId, orElse: () => tempPatientListFull[0]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        actions: [
           ElevatedButton(onPressed: (){}, 
            child: const Row(children: [
              
              Icon(Icons.delete, color: Colors.red), Text("DELETE RECORD", style: TextStyle(
                fontSize: 15,
                color: Colors.red
              
              ),
            )
            ])
          ),
        ],
      ),
      body: Column(
        children: [
          Row(children: [
            Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.asset(
                        'assets/images/patientIcon.png',
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                ),
            Column(children: [
              Text(patient.name, style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black
              ),),
              Row(children: [
                const Icon(Icons.person_2, color: Colors.grey),
                Text("ID: ${patient.id}", style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Color.fromARGB(255, 83, 81, 81))
                ),
                const SizedBox(width: 10),
                const Icon(Icons.circle, color: Colors.grey, size: 10,),
                const SizedBox(width: 2),
                Text(patient.gender, style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Color.fromARGB(255, 83, 81, 81))
                ),
                const SizedBox(width: 10),
                const Icon(Icons.circle, color: Colors.grey, size: 10,),
                const SizedBox(width: 2),
                Text("${patient.age} Years", style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Color.fromARGB(255, 83, 81, 81))
                ),
              ],)
            ],)
          ],),
          Card(
            
            color: patient.condition == "NORMAL" ? const Color.fromARGB(255, 151, 218, 153) : const Color.fromARGB(255, 218, 142, 137),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15), 
            side: BorderSide(
              color: patient.condition == "NORMAL" ? Colors.green : Colors.red, // Border color (can be adjusted independently)
              width: 3, // Border thickness (can be adjusted independently)
            ),),
            child: Row(children: [
              const SizedBox(width: 15),
              const Text("Condition: ", style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15)),
              const SizedBox(width: 150, height: 70,),
              Text(patient.condition, style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: patient.condition == "NORMAL" ? const Color.fromARGB(255, 2, 71, 23) : const Color.fromARGB(255, 71, 2, 2)))
            ]),),
            const SizedBox(height: 15),
            Row(
              children: [
                  SizedBox(width: 110,
                  child: Column(
                    children: [
                      //const SizedBox(width: 8),
                      Image.asset(
                        patient.images[0],
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        patient.readings[0],
                        style: const TextStyle(
                          fontSize: 14
                          
                        )///textAlign: TextAlign.center,
                      ),
                      
                    ],
                  ),
                ),
                Row(
                  children:
                    List.generate(3,
                    (index) => SizedBox( width: 90,
                      child: Column(
                        children: [
                          //const SizedBox(width: 15),
                          Image.asset(
                            patient.images[index+1],
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            patient.readings[index+1],
                            style: const TextStyle(
                              fontSize: 14
                              
                            )///textAlign: TextAlign.center,
                          ),
                          
                        ],
                      ),
                    ),
                  ),
                )
              ]
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
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                                const SizedBox(width: 10),
                                const Text( "Contact Information" , style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.grey)
                                ),
                                const SizedBox(width: 40,),
                                ElevatedButton(onPressed: (){Navigator.pushNamed(context, '/updatepatient', arguments: patient.id);}, 
                                  child: const Icon(Icons.edit, color: Colors.black)
                                ),
                                ElevatedButton(onPressed: (){}, 
                                  child: const Icon(Icons.delete, color: Colors.red)
                                )
                            ],),
                            const Padding( padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text("Email: generic@generic.com", style: TextStyle( fontSize: 15)
                                )
                            ),
                            const Padding( padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text("Phone No.: generic@generic.com", style: TextStyle( fontSize: 15)
                                )
                            ),
                            const Padding( padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text("Address: 33th Street, City", style: TextStyle( fontSize: 15)
                              )
                            ),
                            const SizedBox(height: 10),
                            const Padding( padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text( "Health Data" , style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.grey)
                                )
                            ),

                            const Padding( padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text("Doctor: Doctor Franklin Nwoke", style: TextStyle( fontSize: 15)
                                )
                            ),
                            const Padding( padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text("Department: Ward 3", style: TextStyle( fontSize: 15)
                              )
                            ),
                            const SizedBox(height: 10),
                            const Padding( padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text( "Date of Birth: January 10th 1980" , style: TextStyle( fontSize: 15)
                                )
                            ),
                        ],)
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Expanded(child: ListView.builder(
                          itemCount: tempTestList.length,
                          itemBuilder: (context, index) {
                              return TestListTile(
                                testData: tempTestList[index],
                              );
                            },
                        ))
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



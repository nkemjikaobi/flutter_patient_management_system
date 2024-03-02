import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:provider/provider.dart';
import 'package:flutter_application_project_1/data/temp_patient_list.dart';

class PatientListTile extends StatelessWidget {
  final TempPatientModel patientData;
  
  
  const PatientListTile({
    required this.patientData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/patientdetails', arguments: patientData.id);
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
                Text(patientData.name),
                Text("          ${patientData.age} Years"),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                  SizedBox(width: 110,
                  child: Row(
                    children: [
                      const SizedBox(width: 8),
                      Image.asset(
                        patientData.images[0],
                        height: 20,
                        width: 20,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        patientData.readings[0],
                        style: const TextStyle(
                          fontSize: 10
                          
                        )///textAlign: TextAlign.center,
                      ),
                      
                    ],
                  ),
                ),
                Row(
                  children:
                    List.generate(3,
                    (index) => SizedBox( width: 85,
                      child: Row(
                        children: [
                          const SizedBox(width: 15),
                          Image.asset(
                            patientData.images[index+1],
                            height: 20,
                            width: 20,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            patientData.readings[index+1],
                            style: const TextStyle(
                              fontSize: 10
                              
                            )///textAlign: TextAlign.center,
                          ),
                          
                        ],
                      ),
                    ),
                  ),
                )
              ]
              // List.generate(4,
              //   (index) => SizedBox( width: 70,
              //     child: Row(
              //       children: [
              //         const SizedBox(width: 8),
              //         Image.asset(
              //           'assets/images/patientIcon.png',
              //           height: 20,
              //           width: 20,
              //           fit: BoxFit.cover,
              //         ),
              //         const SizedBox(width: 8),
              //         Text(
              //           patientData.readings[index],
              //           style: const TextStyle(
              //             fontSize: 10
                          
              //           )///textAlign: TextAlign.center,
              //         ),
                      
              //       ],
              //     ),
              //   ),
              // ),
            ),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}

class DashBoardPage extends StatelessWidget {
  DashBoardPage({super.key});
  //final String patientsCount = (tempPatientListFull.length) as String;
  //final String criticalPatientsCount = (tempPatientListCritical.length) as String;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME'),
      ),
      body: Center(

        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Container(
              color: Colors.grey[200],
              child:
              Column( children: [

              const SizedBox(height: 20),

              Row( children: [
                
                Card( 
                  color: Colors.white,
                  child: 
                  
                  Padding( 
                  padding: const EdgeInsets.all(15), 
                  child: 
                  
                  Column( children:[
                    
                    const Text("Admitted Patients", style: TextStyle(
                        fontSize: 14, // Font size
                        fontWeight: FontWeight.bold, // Font weight
                        color: Color.fromARGB(255, 143, 136, 136), // Text color
                      ),
                    ),
                    
                    const SizedBox(height: 10),
                    
                    Text("${tempPatientListFull.length} Patients", style: const TextStyle(
                        fontSize: 20, // Font size
                        fontWeight: FontWeight.bold, // Font weight
                        color: Colors.black, // Text color
                      ),)
                    ])
                  )
                ),
                
                Card( 
                  color: Colors.white,
                  child: Padding( 
                  padding: const EdgeInsets.all(15), 
                  child: Column( children:[
                    const Text("High Priority Patients", style: TextStyle(
                        fontSize: 14, // Font size
                        fontWeight: FontWeight.bold, // Font weight
                        color: Color.fromARGB(255, 143, 136, 136), // Text color
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text( "${tempPatientListCritical.length} Patients", style: const TextStyle(
                        fontSize: 20, // Font size
                        fontWeight: FontWeight.bold, // Font weight
                        color: Colors.black, // Text color
                      ),)
                    ])
                  )
                )
              ]),
              const Text("Requires Attention", style: TextStyle(
                  fontSize: 15, // Font size
                  fontWeight: FontWeight.bold, // Font weight
                  color: Colors.black,
                )
              ),
              const SizedBox(height: 10),
              SizedBox(height: 200, child:
              ListView.builder(
              itemCount: tempPatientListCritical.length,
              itemBuilder: (context, index) {
                  return PatientListTile(
                    patientData: tempPatientListCritical[index],
                  );
                },
            ),
            ), //const Divider(),
              ])
            ),
           
            const Text("Admitted Patients", style: TextStyle(
                  fontSize: 15, // Font size
                  fontWeight: FontWeight.bold, // Font weight
                  color: Colors.black,
                )
              ),
              const SizedBox(height: 10),
            Expanded(child: 
            ListView.builder(
              itemCount: tempPatientListFull.length,
              itemBuilder: (context, index) {
                  return PatientListTile(
                    patientData: tempPatientListFull[index],
                  );
                },
            ),
            ),
          ],
        ),
      ),
    );
  }
}
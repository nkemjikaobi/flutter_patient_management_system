import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:provider/provider.dart';
import 'package:flutter_application_project_1/data/temp_patient_list.dart';


class PatientListItem extends StatelessWidget {
  final TempPatientModel patientData;
  
  
  const PatientListItem({
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
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                ),
                Column(children: [
                  Row(children: [
                      Text(patientData.name, style: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold)),
                      const SizedBox(width: 30),
                      Text("${patientData.age} Years"),
                  ],),
                  const SizedBox(height: 10),
                  Row(children: [
                      Text("ID: ${patientData.id}", style: const TextStyle(color: Color.fromARGB(255, 95, 12, 177), fontWeight: FontWeight.bold),),
                      const SizedBox(width: 30),
                      Text("Condition: ${patientData.condition}"),
                  ],)
                ],)
              ],
            ),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}


class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PATIENTS'),
      ),

      body: Column(
        children: [
          Row( mainAxisAlignment: MainAxisAlignment.end,
            children: [
          
            ElevatedButton(onPressed: (){}, 
            child: const Row(children: [
              
              Icon(Icons.delete, color: Colors.red), Text("DELETE ALL", style: TextStyle(
                fontSize: 15,
                color: Colors.red
              
              ),
            )
            ])
          ),

          const SizedBox(width: 20),]),

          const Padding(

            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          
          Expanded(
            child: ListView.builder(
              itemCount: tempPatientListFull.length,
              itemBuilder: (context, index) {
                  return PatientListItem(
                    patientData: tempPatientListFull[index],
                  );
                },
            ),
          ),
          const SizedBox(height: 5),
          Padding(padding: const EdgeInsets.only(left: 10, right: 10), child:ElevatedButton(
            onPressed: (){
              Navigator.pushNamed(context, '/addpatient');
            },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                minimumSize: const Size(double.infinity, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                ), 
              child: const Text("Add New Patient", style: TextStyle(color: Colors.white),), 
              ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
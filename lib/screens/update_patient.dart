import 'package:flutter/material.dart';
import 'package:flutter_application_project_1/data/temp_patient_list.dart';


class UpdatePatientPage extends StatefulWidget {
  //const UpdatePatientPage({Key? key}) : super(key: key);
  final String patientId; 
  const UpdatePatientPage({Key? key, required this.patientId}) : super(key: key);
  @override
  _UpdatePatientPage createState() => _UpdatePatientPage();
}

class _UpdatePatientPage extends State<UpdatePatientPage> {

  @override
  Widget build(BuildContext context) {
    
    final String patientId = ModalRoute.of(context)!.settings.arguments as String;
    TempPatientModel? patient = tempPatientListFull.firstWhere((obj) => obj.id == patientId, orElse: () => tempPatientListFull[0]);
    const List<String> list = <String>['Male', 'Female'];
    String genderValue = patient.gender;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Patient'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child:
        SingleChildScrollView(child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Image.asset(
                            'assets/images/patientIcon.png',
                            height: 70,
                            width: 70,
                            fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(onPressed: (){}, child: const Row(children: [
                      Icon(Icons.camera), SizedBox(width: 5), Text("Change Photo"),
                    ],))
                ]),
                const SizedBox(height: 20),
                const Text("Patient Name*", style: TextStyle(fontSize: 18)),
                TextField(
                  controller: TextEditingController(text: patient.name),
                  onChanged: (value){},
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: 'Clemount Scott', // Placeholder text
                    border: OutlineInputBorder(),
                  )
                ),
                const SizedBox(height: 10), //Source: https://api.flutter.dev/flutter/material/DropdownButton-class.html
                SizedBox(width: double.infinity,
                  child: DropdownButton<String>(
                    value: genderValue,
                    icon: const Icon(Icons.arrow_downward),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        genderValue = value!;
                      });
                    },
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )
                ),

                const SizedBox(height: 10),
                const Text("Date of Birth*", style: TextStyle(fontSize: 18)),
                TextField(
                  style: const TextStyle(fontSize: 16),
                  onChanged: (value){},
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: '24 February 1995', // Placeholder text
                    border: OutlineInputBorder(),
                  )
                ),
                const Text("Date of Birth*", style: TextStyle(fontSize: 12)),

                const SizedBox(height: 10),
                const Text("Email", style: TextStyle(fontSize: 18)),
                TextField(
                  onChanged: (value){},
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: 'ncscott@gmail.com', // Placeholder text
                    border: OutlineInputBorder(),
                  )
                ),

                const SizedBox(height: 10),
                const Text("Phone Number", style: TextStyle(fontSize: 18)),
                TextField(
                  onChanged: (value){},
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: '647 463 3112', // Placeholder text
                    border: OutlineInputBorder(),
                  )
                ),

                const SizedBox(height: 10),
                const Text("Address", style: TextStyle(fontSize: 18)),
                TextField(
                    onChanged: (value){},
                    style: const TextStyle(color: Colors.black, fontSize: 12),
                    decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: '56 Electric Avenue, Darby, Ontario', // Placeholder text
                      border: OutlineInputBorder(),
                    )
                ),

                const SizedBox(height: 10),
                const Text("Doctor*", style: TextStyle(fontSize: 18)),
                TextField(
                  onChanged: (value){},
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: 'Dr. Adam Peppers', // Placeholder text
                    border: OutlineInputBorder(),
                  )
                ),

                const SizedBox(height: 10),
                const Text("Department", style: TextStyle(fontSize: 18)),
                TextField(
                  onChanged: (value){},
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: 'Ward 2', // Placeholder text
                    border: OutlineInputBorder(),
                  )
                ),
                
                const SizedBox(height: 10),
                Padding(padding: const EdgeInsets.only(left: 10, right: 10), child:ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/patientdetails', arguments: patient.id);
                    },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          minimumSize: const Size(double.infinity, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          ), 
                        child: const Text("Update Patient Record", style: TextStyle(color: Colors.white),), 
                    ),
                ),
                const SizedBox(height: 5),
              ],
            ),
          )
        )
      );
  }
}
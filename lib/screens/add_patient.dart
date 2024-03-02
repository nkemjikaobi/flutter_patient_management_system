import 'package:flutter/material.dart';

class AddPatientPage extends StatefulWidget {
  const AddPatientPage({Key? key}) : super(key: key);

  @override
  _AddPatientPage createState() => _AddPatientPage();
}

class _AddPatientPage extends State<AddPatientPage> {
    String genderValue = "Male";

  @override
  Widget build(BuildContext context) {
    const List<String> list = <String>['Male', 'Female'];
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
                  
                  onChanged: (value){},
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: 'Name', // Placeholder text
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
                    labelText: 'D.O.B', // Placeholder text
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
                    labelText: 'name@email.com', // Placeholder text
                    border: OutlineInputBorder(),
                  )
                ),

                const SizedBox(height: 10),
                const Text("Phone Number", style: TextStyle(fontSize: 18)),
                TextField(
                  onChanged: (value){},
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: '000 000 0000', // Placeholder text
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
                      labelText: '---', // Placeholder text
                      border: OutlineInputBorder(),
                    )
                ),

                const SizedBox(height: 10),
                const Text("Doctor*", style: TextStyle(fontSize: 18)),
                TextField(
                  onChanged: (value){},
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: 'Doctor Name', // Placeholder text
                    border: OutlineInputBorder(),
                  )
                ),

                const SizedBox(height: 10),
                const Text("Department", style: TextStyle(fontSize: 18)),
                TextField(
                  onChanged: (value){},
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: 'Ex Ward 3', // Placeholder text
                    border: OutlineInputBorder(),
                  )
                ),
                
                const SizedBox(height: 10),
                Padding(padding: const EdgeInsets.only(left: 10, right: 10), child:ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/');
                    },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          minimumSize: const Size(double.infinity, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          ), 
                        child: const Text("Proceed", style: TextStyle(color: Colors.white),), 
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
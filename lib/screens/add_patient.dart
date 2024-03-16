import 'package:flutter/material.dart';
import 'package:flutter_application_project_1/data/temp_patient_list.dart';
import 'package:flutter_application_project_1/services/patient_service.dart';

class AddPatientPage extends StatefulWidget {
  const AddPatientPage({Key? key}) : super(key: key);

  @override
  _AddPatientPage createState() => _AddPatientPage();
}

class _AddPatientPage extends State<AddPatientPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  String gender = "Male";
  String department = "Emergency";
  String doctor = "Dr. Rania Abesh";
  String genotype = "AA";
  String bloodGroup = "A+";

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    const List<String> genderData = <String>['Male', 'Female'];
    const List<String> departmentData = <String>[
      'Emergency',
      'Child Care',
      'Ante Natal',
      'Post Natal',
      'Seniors',
    ];

    const List<String> doctorData = <String>[
      'Dr. Rania Abesh',
      'Dr. Philip Nzaghi',
      'Dr. Walter Whyte',
      'Dr Jesse Pinkman',
      'Dr. Connor Mcgregor',
    ];

    const List<String> genoTypeData = <String>[
      'AA',
      'AS',
      'AC',
      'SS',
      'SC',
    ];

    const List<String> bloodGroupData = <String>[
      'A+',
      'A-',
      'B+',
      'B-',
      'AB+',
      'AB-',
      'O+',
      'O-',
    ];

    Future addPatient(patient) async {
      isLoading = true;
      await PatientService().addPatient(patient);
      isLoading = false;
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Add New Patient'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
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
                      ElevatedButton(
                          onPressed: () {},
                          child: const Row(
                            children: [
                              Icon(Icons.camera),
                              SizedBox(width: 5),
                              Text("Change Photo"),
                            ],
                          ))
                    ]),
                    const SizedBox(height: 20),
                    const Text("Patient First Name*",
                        style: TextStyle(fontSize: 18)),
                    const SizedBox(
                        height:
                            10), // Add spacing between Text and TextField if needed
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "This field is required";
                        }
                        return null;
                      },
                      controller: firstNameController,
                      decoration: const InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: 'First Name', // Placeholder text
                        border: OutlineInputBorder(),
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text("Patient Last Name*",
                        style: TextStyle(fontSize: 18)),
                    const SizedBox(
                        height:
                            10), // Add spacing between Text and TextField if needed
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "This field is required";
                        }
                        return null;
                      },
                      controller: lastNameController,
                      decoration: const InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: 'Last Name', // Placeholder text
                        border: OutlineInputBorder(),
                      ),
                    ),

                    Row(
                      children: [
                        const Text(
                          'Gender:',
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                            width:
                                10), // Adjust the spacing between label and dropdown button
                        Expanded(
                          child: DropdownButton<String>(
                            value: gender,
                            icon: const Icon(Icons.arrow_drop_down),
                            onChanged: (String? value) {
                              setState(() {
                                gender = value!;
                              });
                            },
                            items: genderData
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text("Age*", style: TextStyle(fontSize: 18)),
                    TextFormField(
                        style: const TextStyle(fontSize: 16),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "This field is required";
                          }
                          return null;
                        },
                        controller: ageController,
                        decoration: const InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: '19', // Placeholder text
                          border: OutlineInputBorder(),
                        )),
                    const SizedBox(height: 10),
                    const Text("Email", style: TextStyle(fontSize: 18)),
                    TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "This field is required";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: 'name@email.com', // Placeholder text
                          border: OutlineInputBorder(),
                        )),
                    const SizedBox(height: 10),
                    const Text("Phone Number", style: TextStyle(fontSize: 18)),
                    TextFormField(
                        controller: phoneNumberController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "This field is required";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: '437 283 1836', // Placeholder text
                          border: OutlineInputBorder(),
                        )),
                    const SizedBox(height: 10),
                    const Text("Address", style: TextStyle(fontSize: 18)),
                    TextFormField(
                        controller: addressController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "This field is required";
                          }
                          return null;
                        },
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                        decoration: const InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: '941 Progress Avenue', // Placeholder text
                          border: OutlineInputBorder(),
                        )),
                    const SizedBox(height: 10),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Text(
                          'Department:',
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                            width:
                                10), // Adjust the spacing between label and dropdown button
                        Expanded(
                          child: DropdownButton<String>(
                            value: department,
                            icon: const Icon(Icons.arrow_drop_down),
                            onChanged: (String? value) {
                              setState(() {
                                department = value!;
                              });
                            },
                            items: departmentData
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Doctor:',
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                            width:
                                10), // Adjust the spacing between label and dropdown button
                        Expanded(
                          child: DropdownButton<String>(
                            value: doctor,
                            icon: const Icon(Icons.arrow_drop_down),
                            onChanged: (String? value) {
                              setState(() {
                                doctor = value!;
                              });
                            },
                            items: doctorData
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Genotype:',
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                            width:
                                10), // Adjust the spacing between label and dropdown button
                        Expanded(
                          child: DropdownButton<String>(
                            value: genotype,
                            icon: const Icon(Icons.arrow_drop_down),
                            onChanged: (String? value) {
                              setState(() {
                                genotype = value!;
                              });
                            },
                            items: genoTypeData
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Blood Group:',
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                            width:
                                10), // Adjust the spacing between label and dropdown button
                        Expanded(
                          child: DropdownButton<String>(
                            value: bloodGroup,
                            icon: const Icon(Icons.arrow_drop_down),
                            onChanged: (String? value) {
                              setState(() {
                                bloodGroup = value!;
                              });
                            },
                            items: bloodGroupData
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            //if it successful
                            PatientModel newPatient = PatientModel(
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              address: addressController.text,
                              dateOfBirth: ageController.text,
                              department: department,
                              doctor: doctor,
                              condition: 'normal',
                              isAdmitted: true,
                              bloodGroup: bloodGroup,
                              email: emailController.text,
                              phoneNumber: phoneNumberController.text,
                              gender: gender,
                              genotype: genotype,
                            );

                            // Call addPatient method with the new patient object
                            await addPatient(newPatient)
                                .then((value) => Navigator.pop(context));


                            // Show a SnackBar indicating success
                            const snackBar = SnackBar(
                              content: Text('Patient added successfully.'),
                              backgroundColor: Colors.green,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          minimumSize: const Size(double.infinity, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: isLoading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : const Text(
                                "Proceed",
                                style: TextStyle(color: Colors.white),
                              ),
                      ),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            )));
  }
}

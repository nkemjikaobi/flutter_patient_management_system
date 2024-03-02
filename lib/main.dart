import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:provider/provider.dart';

//get screens
//import 'package:flutter_application_project_1/screens/dashboard.dart';
import 'package:flutter_application_project_1/screens/home_page.dart';
import 'package:flutter_application_project_1/screens/all_patients.dart';
import 'package:flutter_application_project_1/screens/patient_details.dart';
import 'package:flutter_application_project_1/screens/add_patient.dart';
import 'package:flutter_application_project_1/screens/update_patient.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation App',
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/second': (context) => const SecondPage(),
        '/patientdetails': (context) => const PatientDetailPage(patientId: ""),
        '/addpatient': (context) => const AddPatientPage(),
        '/updatepatient': (context) => const UpdatePatientPage(patientId: "")
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             //Image.asset('assets/images/home_image.png'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              child: const Text('Go to Second Page'),
            ),
          ],
        ),
      ),
    );
  }
}




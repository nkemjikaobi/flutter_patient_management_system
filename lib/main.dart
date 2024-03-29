import 'package:flutter/material.dart';
import 'package:flutter_application_project_1/models/patient_model.dart';
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

//Snackbar start
class SnackBarDisplay extends StatelessWidget {
  const SnackBarDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Displaying a SnackBar',
      home: Scaffold(
        backgroundColor: (Colors.grey),
        appBar: AppBar(
          title: const Text('Displaying a SnackBar'),
          backgroundColor: Colors.black12,
        ),
        body: const SnackBarPage(),
      ),
    );
  }
}

class SnackBarPage extends StatelessWidget {
  const SnackBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: const Text('Hi, I am a SnackBar!'),
            backgroundColor: (Colors.black12),
            action: SnackBarAction(
              label: 'dismiss',
              onPressed: () {},
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text(
          'Click to Display a SnackBar',
        ),
      ),
    );
  }
}

//Snackbar end

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation App',
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/patients': (context) => const SecondPage(),
        '/patientdetails': (context) => const PatientDetailPage(patientId: ""),
        '/addpatient': (context) => const AddPatientPage(),
        '/updatepatient': (context) => UpdatePatientPage(
                patientInfo: PatientModel(
              id: "",
              firstName: "",
              lastName: "",
              address: "",
              dateOfBirth: "",
              department: "",
              doctor: "",
              bloodGroup: "",
              email: "",
              phoneNumber: "",
              isAdmitted: false,
              condition: "",
              gender: "",
              genotype: "",
            )),
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
                Navigator.pushNamed(context, '/patients');
              },
              child: const Text('Go to Second Page'),
            ),
          ],
        ),
      ),
    );
  }
}

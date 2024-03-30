import 'package:flutter/material.dart';
import 'package:flutter_application_project_1/providers/patient_provider.dart';
import 'package:flutter_application_project_1/screens/patient_list_item.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PatientProvider>(context, listen: false).fetchAllPatients();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PATIENTS'),
      ),
      body: Consumer<PatientProvider>(builder: (context, value, child) {
        if (value.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final patients = value.patients;
        return Column(
          children: [
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
              child: RefreshIndicator(
                onRefresh: () async {
                  await Provider.of<PatientProvider>(context, listen: false)
                      .fetchAllPatients();
                },
                child: ListView.builder(
                  itemCount: patients.length,
                  itemBuilder: (context, index) {
                    return PatientListItem(
                      patientData: patients[index],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/addpatient');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  minimumSize: const Size(double.infinity, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text(
                  "Add New Patient",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 5),
          ],
        );
      }),
    );
  }
}

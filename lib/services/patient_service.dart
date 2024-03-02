import 'dart:convert';

import 'package:flutter_application_project_1/data/temp_patient_list.dart';
import 'package:http/http.dart' as http;

class PatientService {
  final String _baseUrl = "https://patient-management-system-api.onrender.com";

  // Fetch all patients
  Future<List<PatientModel>> getAllPatients() async {
    final response = await http.get(Uri.parse('$_baseUrl/patients'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<PatientModel> patients = body
          .map((dynamic item) => PatientModel.fromJson(item as Map<String, dynamic>))
          .toList();
      return patients;
    } else {
      throw Exception('Error while loading patients');
    }
  }
}

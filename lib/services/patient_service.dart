import 'dart:convert';

import 'package:flutter_application_project_1/models/patient_medications_model.dart';
import 'package:flutter_application_project_1/models/patient_model.dart';
import 'package:flutter_application_project_1/models/patient_test_model.dart';
import 'package:http/http.dart' as http;

class PatientService {
  final String _baseUrl = "https://patient-management-system-api.onrender.com";

  // Fetch all patients
  Future<List<PatientModel>> getAllPatients() async {
    final response = await http.get(Uri.parse('$_baseUrl/patients'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<PatientModel> patients = body
          .map((dynamic item) =>
              PatientModel.fromJson(item as Map<String, dynamic>))
          .toList();
      return patients;
    } else {
      throw Exception('Error while loading patients');
    }
  }

  // Fetch patients based on search criteria
  Future<List<PatientModel>> searchPatients({
    String? search,
  }) async {
    final Map<String, dynamic> queryParameters = {};

    if (search != null) {
      queryParameters['search'] = search;
    }

    final Uri uri = Uri.parse('$_baseUrl/patients')
        .replace(queryParameters: queryParameters);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<PatientModel> patients = body
          .map((dynamic item) =>
              PatientModel.fromJson(item as Map<String, dynamic>))
          .toList();
      return patients;
    } else {
      throw Exception('Error while searching patients');
    }
  }

  //Fetch patient details
  Future<PatientModel> getPatientDetails(String id) async {
    final response = await http.get(Uri.parse('$_baseUrl/patients/$id'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> body = jsonDecode(response.body);
      return PatientModel.fromJson(body);
    } else {
      throw Exception('An error occurred while fetching patient details');
    }
  }

  //Add a new patient
  Future<PatientModel> addPatient(PatientModel patient) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/patients'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(patient.toJson()),
    );

    if (response.statusCode == 201) {
      return PatientModel.fromJson(json.decode(response.body));
    } else {
      throw Exception(
          'An error occurred while adding new patient. Status code: ${response.statusCode}');
    }
  }

  //Update a patient
  Future<void> updatePatient(PatientModel patient, String id) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/patients/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(patient.toJson()),
    );

    if (response.statusCode == 200) {
      // return PatientModel.fromJson(json.decode(response.body));
    } else {
      throw Exception(
          'An error occurred while updating patient. Status code: ${response.statusCode}');
    }
  }

  //Delete a patient
  Future<PatientModel> deletePatient(String id) async {
    final response = await http.delete(
      Uri.parse('$_baseUrl/patients/$id'),
    );

    if (response.statusCode == 200) {
      return PatientModel.fromJson(json.decode(response.body));
    } else {
      throw Exception(
          'An error occurred while deleting patient. Status code: ${response.statusCode}');
    }
  }

  //Add a new test
  Future<void> addTest(PatientTestModel patient, String patientId) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/patients/$patientId/tests'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(patient.toJson()),
    );

    if (response.statusCode == 201) {
      // return PatientTestModel.fromJson(json.decode(response.body));
    } else {
      throw Exception(
          'An error occurred while adding new test. Status code: ${response.statusCode}');
    }
  }

  //Add a new medication
  Future<void> addMedication(
      PatientMedicationModel patient, String patientId) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/patients/$patientId/medications'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(patient.toJson()),
    );

    if (response.statusCode == 201) {
      // return PatientMedicationModel.fromJson(json.decode(response.body.medications));
    } else {
      throw Exception(
          'An error occurred while adding new medication. Status code: ${response.statusCode}');
    }
  }
}

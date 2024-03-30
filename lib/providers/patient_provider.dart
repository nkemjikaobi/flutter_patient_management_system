import 'package:flutter/material.dart';
import 'package:flutter_application_project_1/models/patient_medications_model.dart';
import 'package:flutter_application_project_1/models/patient_model.dart';
import 'package:flutter_application_project_1/models/patient_test_model.dart';
import 'package:flutter_application_project_1/services/patient_service.dart';

class PatientProvider extends ChangeNotifier {
  List<PatientModel> _patients = [];
  PatientModel? _currentPatient;
  bool _isLoading = false;
  bool _deleteLoading = false;

  List<PatientModel> get patients => _patients;
  PatientModel? get currentPatient => _currentPatient;
  bool get isLoading => _isLoading;
  bool get deleteLoading => _deleteLoading;

  Future<void> fetchAllPatients() async {
    _isLoading = true;
    notifyListeners();
    try {
      _patients = await PatientService().getAllPatients();
    } catch (e) {
      // Handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchPatientDetails(String id) async {
    _isLoading = true;
    notifyListeners();
    try {
      _currentPatient = await PatientService().getPatientDetails(id);
    } catch (e) {
      // Handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addPatient(PatientModel patient) async {
    try {
      await PatientService().addPatient(patient);
      // Refresh patient list
      await fetchAllPatients();
    } catch (e) {
      // Handle error
    }
  }

  Future<void> updatePatient(PatientModel patient, String id) async {
    try {
      await PatientService().updatePatient(patient, id);
      // Refresh patient details
      await fetchPatientDetails(id);
    } catch (e) {
      // Handle error
    }
  }

  Future<void> deletePatient(String id) async {
    _deleteLoading = true;
    notifyListeners();
    try {
      await PatientService().deletePatient(id);
      // Refresh patient list
      await fetchAllPatients();
    } catch (e) {
      // Handle error
    } finally {
      _deleteLoading = false;
      notifyListeners();
    }
  }

  Future<void> addTest(PatientTestModel patientTest, String patientId) async {
    try {
      await PatientService().addTest(patientTest, patientId);
      // Refresh patient details
      await fetchPatientDetails(patientId);
    } catch (e) {
      // Handle error
    }
  }

  Future<void> addMedication(
      PatientMedicationModel patientMedication, String patientId) async {
    try {
      await PatientService().addMedication(patientMedication, patientId);
      // Refresh patient details
      await fetchPatientDetails(patientId);
    } catch (e) {
      // Handle error
    }
  }
}

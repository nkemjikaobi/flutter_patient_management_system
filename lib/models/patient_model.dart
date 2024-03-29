import 'package:flutter_application_project_1/models/patient_medications_model.dart';
import 'package:flutter_application_project_1/models/patient_test_model.dart';

class PatientModel {
  String id;
  String firstName;
  String lastName;
  String address;
  String dateOfBirth;
  String department;
  String doctor;
  String bloodGroup;
  String email;
  String phoneNumber;
  bool isAdmitted;
  String condition;
  String gender;
  String genotype;
  List<PatientTestModel> tests;
  List<PatientMedicationModel> medications;

  PatientModel(
      {this.id = "",
      this.tests = const [],
      this.medications = const [],
      required this.firstName,
      required this.lastName,
      required this.address,
      required this.dateOfBirth,
      required this.department,
      required this.doctor,
      required this.condition,
      required this.isAdmitted,
      required this.bloodGroup,
      required this.email,
      required this.phoneNumber,
      required this.gender,
      required this.genotype});

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> testsJson = json['tests'];
    List<PatientTestModel> tests = testsJson
        .map((dynamic item) => PatientTestModel.fromJson(item))
        .toList();

    List<dynamic> medicationsJson = json['medications'];
    List<PatientMedicationModel> medications = medicationsJson
        .map((dynamic item) => PatientMedicationModel.fromJson(item))
        .toList();

    return PatientModel(
        id: json['_id'] as String,
        firstName: json['first_name'] as String,
        lastName: json['last_name'] as String,
        address: json['house_address'] as String,
        dateOfBirth: json['date_of_birth'] as String,
        department: json['department'] as String,
        doctor: json['doctor'] as String,
        bloodGroup: json['blood_group'] as String,
        email: json['email'] as String,
        phoneNumber: json['phone_number'] as String,
        condition: json['condition'] as String,
        isAdmitted: json['isAdmitted'] as bool,
        gender: json['gender'] as String,
        genotype: json['genotype'] as String,
        medications: medications,
        tests: tests);
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'house_address': address,
      'date_of_birth': dateOfBirth,
      'department': department,
      'doctor': doctor,
      'isAdmitted': isAdmitted,
      'condition': condition,
      'blood_group': bloodGroup,
      'phone_number': phoneNumber,
      'gender': gender,
      'genotype': genotype,
      'email': email,
      'tests': tests,
      'medications': medications
    };
  }
}

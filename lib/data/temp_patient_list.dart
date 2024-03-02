//import 'package:flutter/material.dart';

class TempPatientModel {
  final String name;
  final String age;
  final List<String> readings;
  final List<String> images;
  final String condition;
  final String id;
  final String gender;

  TempPatientModel({
    required this.name,
    required this.age,
    required this.readings,
    required this.images,
    required this.condition,
    required this.id,
    required this.gender,
  });
}


class TempTestModel {
  final String id;
  final String date;
  final String readings;
  final String category;
  final String nurse;

  TempTestModel({
    required this.id,
    required this.date,
    required this.readings,
    required this.category,
    required this.nurse,
  });
}

List<TempPatientModel> tempPatientListFull = [
  TempPatientModel(name: "Faith Eakette", age: "23", readings: ["34/233 mmHg", "24/min", "24/min", "23%"], 
  images: [
      "assets/images/bloodLevel_red.png",
      "assets/images/respiRate_green.png",
      "assets/images/heartRate_green.png", 
      "assets/images/oxyLevel_green.png"],
  condition: "NORMAL", id: "0005001", gender: "Male"),
  
  TempPatientModel(name: "Mary Eakette", age: "23", readings: ["34/233 mmHg", "24/min", "24/min", "23%"], 
  images: [
      "assets/images/bloodLevel_green.png",
      "assets/images/respiRate_red.png",
      "assets/images/heartRate_green.png",
      "assets/images/oxyLevel_green.png"],
  condition: "NORMAL", id: "0005002", gender: "Female"),

  TempPatientModel(name: "Victor Thompson", age: "27", readings: ["34/233 mmHg", "24/min", "24/min", "23%"], 
  images: [
      "assets/images/bloodLevel_green.png",
      "assets/images/respiRate_green.png",
      "assets/images/heartRate_green.png",
      "assets/images/oxyLevel_red.png", ],
  condition: "NORMAL", id: "0005003", gender: "Male"),

  TempPatientModel(name: "Gregory Mary", age: "28", readings: ["34/233 mmHg", "24/min", "24/min", "23%"], 
  images: [
      "assets/images/bloodLevel_green.png",
      "assets/images/respiRate_green.png",
      "assets/images/heartRate_green.png",
      "assets/images/oxyLevel_green.png"],
  condition: "NORMAL", id: "0005004", gender: "Male"),

  TempPatientModel(name: "Sammy Quin", age: "33", readings: ["34/233 mmHg", "24/min", "24/min", "23%"], 
  images: [
      "assets/images/bloodLevel_red.png",
      "assets/images/respiRate_green.png",
      "assets/images/heartRate_green.png",
      "assets/images/oxyLevel_green.png"],
  condition: "NORMAL", id: "0005005", gender: "Female"),

  TempPatientModel(name: "Donna Kate", age: "29", readings: ["34/233 mmHg", "24/min", "24/min", "23%"], 
  images: [
      "assets/images/bloodLevel_red.png",
      "assets/images/respiRate_red.png",
      "assets/images/heartRate_red.png", 
      "assets/images/oxyLevel_red.png"],
  condition: "CRITICAL", id: "0005006", gender: "Female"),

  TempPatientModel(name: "Charlie Brown", age: "24", readings: ["34/233 mmHg", "24/min", "24/min", "23%"], 
  images: [
      "assets/images/bloodLevel_green.png",
      "assets/images/respiRate_green.png",
      "assets/images/heartRate_green.png",
      "assets/images/oxyLevel_green.png"],
  condition: "NORMAL", id: "0005007", gender: "Male"),

  TempPatientModel(name: "Selene Dial", age: "56", readings: ["34/233 mmHg", "24/min", "24/min", "23%"], 
  images: [
      "assets/images/bloodLevel_green.png",
      "assets/images/respiRate_green.png",
      "assets/images/heartRate_red.png",
      "assets/images/oxyLevel_green.png"],
  condition: "NORMAL", id: "0005008", gender: "Female"),

  
  TempPatientModel(name: "Micheal Slate", age: "21", readings: ["34/233 mmHg", "24/min", "24/min", "23%"], 
  images: [
      "assets/images/bloodLevel_red.png",
      "assets/images/respiRate_red.png",
      "assets/images/heartRate_red.png",
      "assets/images/oxyLevel_red.png"],
  condition: "CRITICAL", id: "0005009", gender: "Male")
];

List<TempPatientModel> tempPatientListCritical = [
  TempPatientModel(name: "Donna Kate", age: "29", readings: ["34/233 mmHg", "24/min", "24/min", "23%"], 
  images: [
      "assets/images/bloodLevel_red.png",
      "assets/images/respiRate_red.png",
      "assets/images/heartRate_red.png", 
      "assets/images/oxyLevel_red.png"],
  condition: "CRITICAL", id: "0005006", gender: "Female"),
  
  TempPatientModel(name: "Micheal Slate", age: "21", readings: ["34/233 mmHg", "24/min", "24/min", "23%"], 
  images: [
      "assets/images/bloodLevel_red.png",
      "assets/images/respiRate_red.png",
      "assets/images/heartRate_red.png",
      "assets/images/oxyLevel_red.png"],
  condition: "CRITICAL", id: "0005009", gender: "Male")
];

List<TempTestModel> tempTestList = [
  TempTestModel(id: "T078", date: "22 August 2023 12:30am", readings: "34/233", category: "Blood Level Test", nurse: "Nurse Clemont"),
  TempTestModel(id: "T079", date: "23 August 2023 12:30am", readings: "24", category: "Respiratory Test", nurse: "Nurse Clemont"),
  TempTestModel(id: "T080", date: "24 August 2023 12:30am", readings: "24", category: "Heart Rate Test", nurse: "Nurse Clemont"),
  TempTestModel(id: "T081", date: "25 August 2023 12:30am", readings: "24", category: "Respiratory Test", nurse: "Nurse Clemont"),
  TempTestModel(id: "T082", date: "26 August 2023 12:30am", readings: "23", category: "Blood Oxygen Test", nurse: "Nurse Clemont"),
  TempTestModel(id: "T083", date: "27 August 2023 12:30am", readings: "34/233", category: "Blood Level Test", nurse: "Nurse Clemont"),
  TempTestModel(id: "T084", date: "28 August 2023 12:30am", readings: "23", category: "Blood Oxygen Test", nurse: "Nurse Clemont"),
  TempTestModel(id: "T085", date: "29 August 2023 12:30am", readings: "34/233", category: "Blood Level Test", nurse: "Nurse Clemont"),
  TempTestModel(id: "T086", date: "30 August 2023 12:30am", readings: "23", category: "Blood Oxygen Test", nurse: "Nurse Clemont"),
  TempTestModel(id: "T087", date: "31 August 2023 12:30am", readings: "24", category: "Heart Rate Test", nurse: "Nurse Clemont"),
  TempTestModel(id: "T088", date: "1 September 2023 12:30am", readings: "24", category: "Respiratory Test", nurse: "Nurse Clemont"),
];
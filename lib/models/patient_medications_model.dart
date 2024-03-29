class PatientMedicationModel {
  String name;
  String id;
  String doctor;
  String medicationDate;
  String prescription;
  String medicationId;


  PatientMedicationModel(
      {this.id = "",
      this.medicationId = "",
      required this.name,
      required this.medicationDate,
      required this.doctor,
      this.prescription = ""});

  factory PatientMedicationModel.fromJson(Map<String, dynamic> json) {
    return PatientMedicationModel(
        id: json['_id'] as String,
        medicationId: json["id"] as String,
        name: json['name'] as String,
        medicationDate: json['date_prescribed'] as String,
        doctor: json['doctor'] as String,
        prescription: json['prescription'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'doctor': doctor,
      'prescription': prescription,
      'test_date': medicationDate,
    };
  }
}

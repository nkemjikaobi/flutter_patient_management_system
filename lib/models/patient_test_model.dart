class PatientTestModel {
  String name;
  String id;
  String value;
  String testDate;
  String notes;
  String testId;

  PatientTestModel(
      {this.id = "",
      this.testId = "",
      required this.name,
      required this.value,
      required this.testDate,
      this.notes = ""});

  factory PatientTestModel.fromJson(Map<String, dynamic> json) {
    return PatientTestModel(
        id: json['_id'] as String,
        testId: json["id"] as String,
        name: json['name'] as String,
        value: json['value'] as String,
        testDate: json['test_date'] as String,
        notes: json['notes'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'value': value,
      'notes': notes,
      'test_date': testDate,
    };
  }
}

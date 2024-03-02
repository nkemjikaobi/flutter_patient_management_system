class PatientModel {
  String id;
  String firstName;
  String lastName;
  String address;
  String dateOfBirth;
  String department;
  String doctor;
  String status;
  String bloodGroup;
  String email;
  String phoneNumber;
  bool isAdmitted;
  String condition;

  PatientModel({
    this.id = "",
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.dateOfBirth,
    required this.department,
    required this.doctor,
    required this.status,
    required this.condition,
    required this.isAdmitted,
    required this.bloodGroup,
    required this.email,
    required this.phoneNumber,
  });

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      id: json['_id'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      address: json['house_address'] as String,
      dateOfBirth: json['date_of_birth'] as String,
      department: json['department'] as String,
      doctor: json['doctor'] as String,
      status: json['gender'] as String,
      bloodGroup: json['blood_group'] as String,
      email: json['email'] as String,
      phoneNumber: json['phone_number'] as String,
      condition: json['condition'] as String,
      isAdmitted: json['isAdmitted'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'address': address,
      'date_of_birth': dateOfBirth,
      'department': department,
      'doctor': doctor,
      'status': status,
      'isAdmitted': isAdmitted,
      'condition': condition,
      'blood_group': bloodGroup,
      'phone_number': phoneNumber,
    };
  }
}

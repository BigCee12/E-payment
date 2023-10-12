// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AccountInfoModel {
  final String name;
  final String phoneNumber;
  final String occupation;
  final String employer;
  final String email;
  AccountInfoModel({
    required this.name,
    required this.phoneNumber,
    required this.occupation,
    required this.employer,
    required this.email,
  });

  AccountInfoModel copyWith({
    String? name,
    String? phoneNumber,
    String? occupation,
    String? employer,
    String? email,
  }) {
    return AccountInfoModel(
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      occupation: occupation ?? this.occupation,
      employer: employer ?? this.employer,
      email: email ?? this.email,
    );
  }

  AccountInfoModel copyWithMapDisplay(key, value) {
    Map<String, dynamic> data = toMapDisplay();
    data[key] = value;
    return AccountInfoModel.fromMapDisplay(data);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'phoneNumber': phoneNumber,
      'occupation': occupation,
      'employer': employer,
      'email': email,
    };
  }

  Map<String, dynamic> toMapDisplay() {
    return <String, dynamic>{
      'Your name': name,
      'Phone number': phoneNumber,
      'Occupation': occupation,
      'Employer': employer,
      'Email': email,
    };
  }

  factory AccountInfoModel.fromMap(Map<String, dynamic> map) {
    return AccountInfoModel(
        name: map['name'] as String,
        phoneNumber: map['phoneNumber'] as String,
        occupation: map['occupation'] as String,
        employer: (map['employer'] as String),
        email: map['email'] as String);
  }

  factory AccountInfoModel.fromMapDisplay(Map<String, dynamic> map) {
    return AccountInfoModel(
        name: map['Your name'] as String,
        phoneNumber: map['Phone number'] as String,
        occupation: map['Occupation'] as String,
        employer: (map['Employer'] as String),
        email: map['Email'] as String);
  }
  String toJson() => json.encode(toMap());

  factory AccountInfoModel.fromJson(String source) =>
      AccountInfoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AccountInfoModel(name: $name, phoneNumber: $phoneNumber, occupation: $occupation, employer: $employer, email: $email)';
  }

  @override
  bool operator ==(covariant AccountInfoModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.phoneNumber == phoneNumber &&
        other.occupation == occupation &&
        (other.employer == employer) &&
        other.email == email;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        phoneNumber.hashCode ^
        occupation.hashCode ^
        employer.hashCode ^
        email.hashCode;
  }
}

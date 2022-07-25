import 'dart:convert';
import 'package:client/classes/description.dart';
import 'package:client/classes/location.dart';

class User {
  String? id;
  final String phoneNumber;
  final String emailAddress;
  final String password;

  User({
    this.id,
    required this.phoneNumber,
    required this.emailAddress,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        phoneNumber: json["phone_number"],
        emailAddress: json["email_address"],
        password: "this is a secret");
  }
  String toJson() => jsonEncode({
        'email_address': emailAddress,
        'phone_number': phoneNumber,
        "password": password
      });

  @override
  String toString() {
    return "id emailAddress: $emailAddress phone_number: $phoneNumber";
  }
}

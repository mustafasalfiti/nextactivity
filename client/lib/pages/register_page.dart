// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:client/components/normal_field.dart';
import 'package:client/components/password_field.dart';
import 'package:client/pages/register_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/user.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var phoneNumber = TextEditingController();
  var emailAddress = TextEditingController();
  var password = TextEditingController();

  Future<http.Response> _submitForm(
      String phoneNumber, String password, String emailAddress) {
    User user = User(
        emailAddress: emailAddress,
        password: password,
        phoneNumber: phoneNumber);
    var respone = http.post(Uri.parse('http://10.0.2.2:3000/api/user'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: user.toJson());
    print(respone.then((value) => print(value.body)));
    return respone;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.purple,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(top: 150),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Text(
                "Register",
                style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  NormalInput("Phone Number", phoneNumber),
                  NormalInput("Email Address", emailAddress),
                  PasswordInput(password),
                  ElevatedButton(
                    child: Text('Register'),
                    onPressed: () => _submitForm(
                        phoneNumber.text, password.text, emailAddress.text),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

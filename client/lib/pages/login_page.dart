// ignore_for_file: deprecated_member_use

import 'package:client/components/normal_field.dart';
import 'package:client/components/password_field.dart';
import 'package:client/pages/register_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/user.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var phoneNumber = TextEditingController();
  var password = TextEditingController();

  Future<http.Response> _loginForm(String phoneNumber, String password) {
    User user =
        User(password: password, phoneNumber: phoneNumber, emailAddress: "");
    var respone = http.post(Uri.parse('http://10.0.2.2:3000/auth/login'),
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
                "Login",
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
                  NormalInput("Username", phoneNumber),
                  PasswordInput(password),
                  ElevatedButton(
                      onPressed: () =>
                          _loginForm(phoneNumber.text, password.text),
                      child: Text("Login")),
                  ElevatedButton(
                      onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                settings: RouteSettings(name: "/Registerpage"),
                                builder: (context) => RegisterPage()),
                          ).then((value) => print('hello')),
                      child: Text("Register")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text("Login Page"),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.only(top: 60.0),
//               child: Center(
//                 child: Container(
//                     width: 250,
//                     height: 250,
//                     child: Image.asset('assets/dance.jpg')),
//               ),
//             ),
//             SizedBox(
//                 width: 250,
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 15),
//                   child: TextField(
//                     decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: 'E-Mail or Phone Number',
//                         hintText: 'Enter valid E-Mail or Phone Number'),
//                   ),
//                 )),
//             SizedBox(
//                 width: 250,
//                 child: Padding(
//                   padding: const EdgeInsets.only(
//                       left: 15.0, right: 15.0, top: 15, bottom: 0),
//                   child: TextField(
//                     obscureText: true,
//                     decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: 'Password',
//                         hintText: 'Enter secure password'),
//                   ),
//                 )),
//             FlatButton(
//               onPressed: () {
//                 // Forgot Password logic
//                 showAlertDialog(
//                     context, "Alert Message", "Forgot Password clicked!");
//               },
//               child: Text(
//                 'Forgot Password',
//                 style: TextStyle(color: Colors.blue, fontSize: 15),
//               ),
//             ),
//             Container(
//               height: 50,
//               width: 250,
//               decoration: BoxDecoration(
//                   color: Colors.blue, borderRadius: BorderRadius.circular(20)),
//               child: FlatButton(
//                 onPressed: () {
//                   // Login logic here
//                   Navigator.push(
//                       context, MaterialPageRoute(builder: (_) => EventPage()));
//                 },
//                 child: Text(
//                   'Login',
//                   style: TextStyle(color: Colors.white, fontSize: 25),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 130,
//             ),
//             FlatButton(
//               onPressed: () {
//                 // Forgot Password logic here
//                 showAlertDialog(
//                     context, "Alert Message", "Create Account clicked!");
//               },
//               child: Text(
//                 'Create Account',
//                 style: TextStyle(color: Colors.blue, fontSize: 15),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// showAlertDialog(context, String title, String message) {
//   Widget okButton = TextButton(
//       onPressed: () => Navigator.pop(context, 'OK'), child: const Text('OK'));

//   AlertDialog alert = AlertDialog(
//     title: Text(title),
//     content: Text(message),
//     actions: [
//       okButton,
//     ],
//   );

//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }

import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

class PasswordField extends StatefulWidget {
  PasswordField({Key? key}) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "This is a required field";
        }
      },
      maxLength: 5,
      decoration: InputDecoration(
          labelText: "Password field",
          helperText: "",
          hintText: "Description",
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.info_outline),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text("Description"),
              )
            ],
          )),
    );
  }
}

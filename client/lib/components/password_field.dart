import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

class PasswordInput extends StatefulWidget {
  TextEditingController controller;
  PasswordInput(this.controller, {Key? key}) : super(key: key);

  @override
  State<PasswordInput> createState() => PasswordInputState();
}

class PasswordInputState extends State<PasswordInput> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "This is a required field";
        }
      },
      obscureText: obscurePassword,
      keyboardType: TextInputType.visiblePassword,
      controller: widget.controller,
      decoration: InputDecoration(
          labelText: "Password field",
          helperText: "",
          hintText: "Password",
          suffixIcon: IconButton(
            onPressed: () => setState(() {
              obscurePassword = !obscurePassword;
            }),
            icon: Icon(
                obscurePassword ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey[500]),
          )),
    );
  }
}

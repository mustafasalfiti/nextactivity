import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

class NormalInput extends StatefulWidget {
  String hintText;
  TextEditingController controller;
  NormalInput(this.hintText, this.controller, {Key? key}) : super(key: key);

  @override
  State<NormalInput> createState() => _NormalInputState();
}

class _NormalInputState extends State<NormalInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "This is a required field";
        }
      },
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: "${widget.hintText} field",
        helperText: "",
        hintText: widget.hintText,
      ),
    );
  }
}

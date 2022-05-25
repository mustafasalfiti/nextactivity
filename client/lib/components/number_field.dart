import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

class NumberInput extends StatefulWidget {
  String hintText;
  TextEditingController controller;
  NumberInput(this.hintText, this.controller, {Key? key}) : super(key: key);

  @override
  State<NumberInput> createState() => _NumberInputState();
}

class _NumberInputState extends State<NumberInput> {
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
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.allow(
            RegExp(r'[0-9]'),
          ),
        ]);
  }
}

import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

class MultiLineField extends StatefulWidget {
  String hintText;
  TextEditingController controller;
  MultiLineField(this.hintText, this.controller, {Key? key}) : super(key: key);

  @override
  State<MultiLineField> createState() => _MultiLineFieldState();
}

class _MultiLineFieldState extends State<MultiLineField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "This is a required field";
        }
      },
      maxLines: 6,
      controller: widget.controller,
      decoration: InputDecoration(
          helperText: "",
          hintText: widget.hintText,
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.info_outline),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(widget.hintText),
              )
            ],
          )),
    );
  }
}

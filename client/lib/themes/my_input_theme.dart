import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

class MyInputTheme {
  TextStyle _buildTextStyle(Color color, {double size = 16.0}) {
    return TextStyle(color: color, fontSize: size);
  }

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(color: color, width: 1.0),
    );
  }

  InputDecorationTheme theme() => InputDecorationTheme(
        contentPadding: EdgeInsets.all(13),
        // "always" put the label at the top
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // useful for putting TextFields in a row can be wraped with Flexibile
        constraints: BoxConstraints(maxWidth: 150),

        // Borders
        enabledBorder: _buildBorder(Colors.grey[500]!),

        errorBorder: _buildBorder(Colors.red),

        focusedErrorBorder: _buildBorder(Colors.red),
        focusedBorder: _buildBorder(Colors.blue),

        disabledBorder: _buildBorder(Colors.green[200]!),

        // TextStyle
        suffixStyle: _buildTextStyle(Colors.black),
        counterStyle: _buildTextStyle(Colors.grey, size: 12.0),
        floatingLabelStyle: _buildTextStyle(Colors.black),
        errorStyle: _buildTextStyle(Colors.red, size: 12.0),
        helperStyle: _buildTextStyle(Colors.black, size: 12.0),
        hintStyle: _buildTextStyle(Colors.grey),
        labelStyle: _buildTextStyle(Colors.black),
        prefixStyle: _buildTextStyle(Colors.black),
      );
}

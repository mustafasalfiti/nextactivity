import 'dart:convert';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
  ));
  getData();
}

Future getData() async {
  final response = await http.get(Uri.parse(
      'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=51.450832%2C7.013056&radius=1500&type=gym&key=YOUR_API_KEY'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(' !!! Place data is here !!!');
    return jsonDecode(response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load place data');
  }
}

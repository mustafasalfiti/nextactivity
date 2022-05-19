import 'dart:convert';

import 'package:flutter/material.dart';

import 'dart:async';

import 'package:http/http.dart' as http;

import 'MyCard.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          SizedBox(
            height: 15,
          ),
          MyCard("Capoeira Essen", "", "Komm, trainiere ohne Trainer"),
          MyCard("Samurai", "", "Komische Kurse"),
          MyCard("FitX", "", "Schön"),
          MyCard("McFit", "", "War ich lange nicht da"),
          MyCard("MustiFit", "", "Be a Musti"),
          MyCard("HakiFit", "", "Be the Aguia"),
          MyCard("SvenjaYoga", "", "Be ready for the rainbow"),
          MyCard("InesMusic", "", "The best vibes... only for me"),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
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
}

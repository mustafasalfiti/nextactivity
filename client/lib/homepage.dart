import 'package:flutter/material.dart';
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
}

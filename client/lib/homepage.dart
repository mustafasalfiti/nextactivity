import 'package:client/myCard.dart';
import 'package:flutter/material.dart';

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
          myCard("Capoeira Essen", "", "Komm, trainiere ohne Trainer"),
          myCard("Samurai", "", "Komische Kurse"),
          myCard("FitX", "", "Schön"),
          myCard("McFit", "", "War ich lange nicht da"),
          myCard("MustiFit", "", "Be a Musti"),
          myCard("HakiFit", "", "Be the Aguia"),
          myCard("SvenjaYoga", "", "Be ready for the rainbow"),
          myCard("InesMusic", "", "The best vibes... only for me"),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}

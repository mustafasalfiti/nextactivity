import 'package:client/myCard.dart';
import 'package:flutter/material.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            SizedBox(
              height: 15,
            ),
            myCard("Capoeira Essen", "", "Komm, Trainiere ohne Trainer"),
            myCard("Samurai", "", "Komische Kurse"),
            myCard("FitX", "", "Schoen"),
            myCard("McFit", "", "War ich lange nicht da"),
            myCard("MustiFit", "", "Be a Musti"),
            myCard("HakiFit", "", "Be the Aguia"),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}

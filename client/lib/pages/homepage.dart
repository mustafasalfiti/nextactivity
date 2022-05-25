import 'package:client/pages/post.dart';
import 'package:client/shared/mycard.dart';
import 'package:client/shared/mydrawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: MyDrawer(),
      ),
      appBar: AppBar(
        title: Text(
          "Discovery",
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 15,
          ),
          MyPost(),
          SizedBox(
            height: 15,
          ),
          MyPost(),
        ],
      ),
    );
  }
}

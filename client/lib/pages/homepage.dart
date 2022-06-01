import 'dart:convert';

import 'package:client/components/post_card.dart';
import 'package:client/pages/post_page.dart';
import 'package:client/pages/post_template.dart';
import 'package:client/shared/mycard.dart';
import 'package:client/shared/mydrawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/post.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Future<http.Response> fetchPosts() {
    return http.get(Uri.parse('http://10.0.2.2:3000/api/post'));
  }

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
          ElevatedButton(
              onPressed: () => fetchPosts().then((value) {
                    var data = jsonDecode(value.body);
                    List<Post> _posts = data.map((val) => Post.fromJson(data));
                    print(_posts);
                  }),
              child: Text('testme')),
          PostPage()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
              settings: RouteSettings(name: "/HomePage"),
              builder: (context) => PostTemplate()),
        ),
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 173, 34, 211),
        elevation: 0.5,
      ),
    );
  }
}

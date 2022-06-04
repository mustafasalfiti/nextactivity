import 'package:client/futurebuilders/post_futurebuilder.dart';
import 'package:client/templates/post_template.dart';
import 'package:client/shared/mydrawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  Future<http.Response> fetchPosts() {
    return http.get(Uri.parse('http://10.0.2.2:3000/api/post'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Posts",
        ),
      ),
      body: PostFutureBuilder(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
              settings: RouteSettings(name: "/PostPage"),
              builder: (context) => PostTemplate()),
        ),
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 173, 34, 211),
        elevation: 0.5,
      ),
    );
  }
}

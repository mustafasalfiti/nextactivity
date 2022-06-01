import 'dart:convert';

import 'package:client/components/post_card.dart';
import 'package:client/pages/post_template.dart';
import 'package:client/shared/myCard.dart';
import 'package:client/shared/mycard.dart';
import 'package:client/shared/mydrawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/post.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

class PostPage extends StatefulWidget {
  PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  late Future<List<Post>> _fetchPosts;

  @override
  void initState() {
    super.initState();
    _fetchPosts = getData();
    print(getData());
  }

  Future<List<Post>> getData() async {
    var response = await http.get(Uri.parse('http://10.0.2.2:3000/api/post'));
    List<dynamic> data = jsonDecode(response.body);
    List<Post> _posts = data.map((val) => Post.fromJson(val)).toList();
    return _posts;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Post>>(
        future: _fetchPosts,
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.error != null) {
              return Center(
                child: Text('An error occured'),
              );
            } else {
              return ListView(
                children: [
                  snapshot.data.map((e) {
                    return MyCard(e.description.content, "", e.description.content)
                  })
                ],
              );
            }
          }
        });
  }
}

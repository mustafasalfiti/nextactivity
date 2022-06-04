import 'dart:convert';

import 'package:client/components/post_card.dart';
import 'package:client/templates/post_template.dart';
import 'package:client/shared/myCard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/post.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

class PostFutureBuilder extends StatefulWidget {
  PostFutureBuilder({Key? key}) : super(key: key);

  @override
  State<PostFutureBuilder> createState() => _PostFutureBuilderState();
}

class _PostFutureBuilderState extends State<PostFutureBuilder> {
  late Future<List<Post>> _fetchPosts;

  @override
  void initState() {
    super.initState();
    _fetchPosts = getData();
  }

  Future<List<Post>> getData() async {
    var response = await http.get(Uri.parse('http://10.0.2.2:3000/api/post'));
    List<dynamic> data = jsonDecode(response.body);
    List<Post> _posts = data.map((val) => Post.fromJson(val)).toList();
    return _posts;
  }

  Future<void> _onRefresh() {
    setState(() {
      _fetchPosts = getData();
    });
    return Future.delayed(Duration(seconds: 1));
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
              return RefreshIndicator(
                onRefresh: _onRefresh,
                child: ListView(
                    physics: AlwaysScrollableScrollPhysics(),
                    children: snapshot.data
                        ?.map((e) => MyCard(
                            e.description.content, "", e.description.content))
                        .toList() as List<Widget>),
              );
            }
          }
        });
  }
}

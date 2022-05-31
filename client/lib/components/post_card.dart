import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_im
// ignore_for_file: prefer_const_literals_to_create_immutables

class PostCard extends StatelessWidget {
  const PostCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: CircleAvatar(
                          backgroundImage: AssetImage("assets/avatar.jpg")),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Christina Muller"),
                          Text(
                            "heute",
                            style: TextStyle(fontSize: 10),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () => print("nothing")),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(
                "an event will be running today in essen start and ends at everyone is welcome"),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
            child: Image.asset("assets/dance.jpg"),
          ),
          Container(
            child: Row(
              children: [
                IconButton(
                    icon: const Icon(Icons.arrow_upward),
                    onPressed: () => print("nothing")),
                IconButton(
                    icon: const Icon(Icons.arrow_downward),
                    onPressed: () => print("nothing")),
                IconButton(
                    icon: const Icon(Icons.comment),
                    onPressed: () => print("nothing")),
              ],
            ),
          )
        ],
      ),
    );
  }
}

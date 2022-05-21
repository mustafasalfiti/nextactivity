import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 70.0),
          child: Column(
            children: [
              CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage("assets/avatar.jpg")),
              SizedBox(height: 5),
              Text(
                'Christina Muller',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                "Fontend Entwicklerin",
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        // Buttons
        ListTile(
            onTap: () {},
            leading: Icon(
              Icons.person,
              color: Colors.black,
            ),
            title: Text("Your Profile")),
        ListTile(
          onTap: () {},
          leading: Icon(
            Icons.inbox,
            color: Colors.black,
          ),
          title: Text("Your Inbox"),
        ),

        ListTile(
          onTap: () {},
          leading: Icon(
            Icons.assessment,
            color: Colors.black,
          ),
          title: Text("Your Dashboard"),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(
            Icons.assessment,
            color: Colors.black,
          ),
          title: Text("Your Events"),
        ),

        ListTile(
            onTap: () {},
            leading: Icon(
              Icons.event,
              color: Colors.black,
            ),
            title: Text("Settings"))
      ],
    );
  }
}

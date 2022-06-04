import 'package:client/templates/event_template.dart';
import 'package:flutter/material.dart';
import '../futurebuilders/event_futurebuilder.dart';
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

class EventPage extends StatelessWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Events'),
      ),
      body: EventFutureBuilder(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
              settings: RouteSettings(name: "/Eventtemplate"),
              builder: (context) => EventTemplate()),
        ),
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 173, 34, 211),
        elevation: 0.5,
      ),
    );
  }
}

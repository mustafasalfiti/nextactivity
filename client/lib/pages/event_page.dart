import 'dart:convert';
import 'package:client/components/event_card.dart';
import 'package:client/pages/event_template.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/event.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  // create the variables for events should started with _ as a private
  Future<http.Response> fetchEvents() {
    return http.get(Uri.parse('http://10.0.2.2:3000/api/event'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Events'),
      ),
      body: ListView(
        children: [
          ElevatedButton(
              onPressed: () => fetchEvents().then((value) {
                    Event _event = Event.fromJson(jsonDecode(value.body)[0]);
                    print(_event.toString());
                    return _event;
                  }),
              child: Text('testme')),
          EventCard()
        ],
      ),
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

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/event.dart';
import '../shared/myCard.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

class EventFutureBuilder extends StatefulWidget {
  const EventFutureBuilder({Key? key}) : super(key: key);

  @override
  State<EventFutureBuilder> createState() => _EventFutureBuilderState();
}

class _EventFutureBuilderState extends State<EventFutureBuilder> {
  late Future<List<Event>> _fetchEvents;

  // start the page with a fetch from event and save it to state
  // this is a better way to not keep fetching the events everytime something changes
  @override
  void initState() {
    super.initState();
    _fetchEvents = getData();
  }

  // create the variables for events should started with _ as a private

  Future<List<Event>> getData() async {
    var response = await http.get(Uri.parse('http://10.0.2.2:3000/api/event'));
    List<dynamic> data = jsonDecode(response.body);
    List<Event> _events = data.map((val) => Event.fromJson(val)).toList();
    return _events;
  }

  Future<void> _onRefresh() {
    setState(() {
      _fetchEvents = getData();
    });
    return Future.delayed(Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Event>>(
        future: _fetchEvents,
        builder: (BuildContext context, AsyncSnapshot<List<Event>> snapshot) {
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

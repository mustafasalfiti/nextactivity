import 'package:client/classes/Description.dart';
import 'package:client/classes/location.dart';
import 'package:client/shared/httpservice.dart';
import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

class EventTemplate extends StatefulWidget {
  const EventTemplate({Key? key}) : super(key: key);

  @override
  State<EventTemplate> createState() => _EventTemplateState();
}

class _EventTemplateState extends State<EventTemplate> {
  // create the variables for events should started with _ as a private
  String _createdBy = "";
  String _titel = "";
  String _eventType = "";
  Description _description = Description(images: [], content: "");
  Location _location = Location(coordinates: [], type: "");
  int _peopleRequired = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Your Event'),
      ),
      body: ListView(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              icon: Icon(Icons.celebration),
              hintText: 'Event name',
              labelText: 'Name',
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              icon: Icon(Icons.description),
              hintText: 'Event description',
              labelText: 'Description',
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              icon: Icon(Icons.check_box_rounded),
              hintText: 'Event type',
              labelText: 'Type',
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              icon: Icon(Icons.location_city),
              hintText: 'Event location',
              labelText: 'Location',
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              icon: Icon(Icons.calendar_today),
              hintText: 'Event date',
              labelText: 'Date',
            ),
          ),
          Container(
              padding: EdgeInsets.only(left: 150.0, top: 40.0),
              child: ElevatedButton(
                child: Text('Submit'),
                onPressed: () => HttpService().getEvents(),
              )),
        ],
      ),
    );
  }
}

// to create a dropdown button
// DropdownButton(
//   value: _dropdownValue,
//   items: items.map((String item) {
//     return DropdownMenuItem(
//       value: item,
//       child: Text(item),
//     );
//   }).toList(),
//   icon: Icon(Icons.keyboard_arrow_down),
//   onChanged: (String? newValue) {
//     setState(() {
//       _dropdownValue = newValue!;
//     });
//   },
// ),
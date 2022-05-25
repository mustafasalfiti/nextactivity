import 'package:client/classes/description.dart';
import 'package:client/classes/location.dart';
import 'package:client/components/multiline_field.dart';
import 'package:client/components/normal_field.dart';
import 'package:client/components/number_field.dart';
import 'package:client/models/event.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

class EventTemplate extends StatefulWidget {
  const EventTemplate({Key? key}) : super(key: key);

  @override
  State<EventTemplate> createState() => _EventTemplateState();
}

class _EventTemplateState extends State<EventTemplate> {
  // create the variables for events should started with _ as a private
  final _formKey = GlobalKey<FormState>();
  var createdBy = TextEditingController();
  var titel = TextEditingController();
  var eventType = TextEditingController();
  var content = TextEditingController();
  var location = TextEditingController();
  var peopleRequired = TextEditingController();

  Future<http.Response> _submitForm(
      String titel, String eventType, String content, int peopleRequired) {
    Event event = Event(
        titel: titel,
        eventType: eventType,
        description: Description(images: ["empty"], content: content),
        location:
            Location(coordinates: [-110.8571443, 32.4586858], type: "Location"),
        peopleJoined: ["62096f5cbbf77abdf2ee00e4"],
        peopleRequired: peopleRequired);
    return http.post(Uri.parse('http://10.0.2.2:3000/api/event'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: event.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Event'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(20.0),
          children: <Widget>[
            NormalInput("Titel", titel),
            SizedBox(height: 10),
            NormalInput("Event type", eventType),
            SizedBox(height: 10),
            NumberInput("Number of People", peopleRequired),
            SizedBox(height: 10),
            MultiLineField("Description", content),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  _submitForm(titel.text, eventType.text, content.text,
                          int.parse(peopleRequired.text))
                      .then((res) {
                    if (res.statusCode == 200) {
                      Alert(
                        context: context,
                        type: AlertType.success,
                        title: "Success",
                        desc: "Your event was created successfully!",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "Ok",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () => Navigator.popUntil(context,
                                (route) => route.settings.name == "/Eventpage"),
                            width: 120,
                          )
                        ],
                      ).show();
                    } else {
                      Alert(
                        context: context,
                        type: AlertType.error,
                        title: "Failed!",
                        desc: "Something went wrong during creation!",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "Ok",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () => Navigator.popUntil(context,
                                (route) => route.settings.name == "/Eventpage"),
                            width: 120,
                          )
                        ],
                      ).show();
                    }
                  });
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

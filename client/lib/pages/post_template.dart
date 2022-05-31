import 'package:client/classes/description.dart';
import 'package:client/classes/location.dart';
import 'package:client/components/multiline_field.dart';
import 'package:client/models/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

class PostTemplate extends StatefulWidget {
  const PostTemplate({Key? key}) : super(key: key);

  @override
  State<PostTemplate> createState() => _PostTemplateState();
}

class _PostTemplateState extends State<PostTemplate> {
  // create the variables for posts should started with _ as a private
  final _formKey = GlobalKey<FormState>();

  var content = TextEditingController();
  var location = TextEditingController();

  Future<http.Response> _submitForm(String content) {
    Post post = Post(
      description: Description(images: ["empty"], content: content),
      location:
          Location(coordinates: [-110.8571443, 32.4586858], type: "Location"),
      userId: "62096f5cbbf77abdf2ee00e4",
    );
    return http.post(Uri.parse('http://10.0.2.2:3000/api/post'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: post.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create post'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(20.0),
          children: <Widget>[
            MultiLineField("Description", content),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  _submitForm(content.text).then((res) {
                    if (res.statusCode == 200) {
                      Alert(
                        context: context,
                        type: AlertType.success,
                        title: "Success",
                        desc: "Your post was created successfully!",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "Ok",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () => Navigator.popUntil(context,
                                (route) => route.settings.name == "/HomePage"),
                            width: 120,
                          )
                        ],
                      ).show();
                    } else {
                      print(res.body);
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
                                (route) => route.settings.name == "/HomePage"),
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

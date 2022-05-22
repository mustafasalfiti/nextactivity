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
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const EventTemplate()),
          ),
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

class EventTemplate extends StatelessWidget {
  const EventTemplate({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Your Event'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.celebration),
                hintText: 'Event name',
                labelText: 'Name',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.description),
                hintText: 'Event description',
                labelText: 'Description',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.location_city),
                hintText: 'Event location',
                labelText: 'Location',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.calendar_today),
                hintText: 'Event date',
                labelText: 'Date',
              ),
            ),
            new Container(
                padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                child: new RaisedButton(
                  child: const Text('Submit'),
                  onPressed: () =>
                      showPopUp(context, 'Success', 'Your event is created!'),
                  // Navigator.pop(context), // TODO Go back after event creation
                )),
          ],
        ),
      ),
    );
  }
}

showPopUp(context, String title, String content) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}

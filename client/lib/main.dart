import 'package:client/pages/welcome_page.dart';
import 'package:client/themes/my_input_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // themes to be applied to the whole application
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.blueGrey,
          inputDecorationTheme: MyInputTheme().theme()),
      home: WelcomePage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/help.dart';
import 'package:flutter_application_1/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
      routes: {'/help': (context) => HelpPage()},
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/welcome.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: Colors.blue,
      title: Text(
        "help",
        style: TextStyle(color: Colors.white),
      ),
    ));
  }
}

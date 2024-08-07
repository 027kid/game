import 'package:flutter/material.dart';
import 'package:flutter_application_1/falljune.dart';
import 'package:flutter_application_1/help.dart';
import 'package:flutter_application_1/quiz.dart';

import 'package:flutter_application_1/tabrik.dart';
import 'package:flutter_application_1/welcome.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox("my box");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
      routes: {
        '/help': (context) => HelpPage(),
        '/home': (context) => WelcomePage(),
        '/quiz': (context) => QuizPage(),
        '/tabrik': (context) => tabrikPage(),
        '/fall': (context) => fallPage(),
      },
    );
  }
}

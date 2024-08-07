// ignore_for_file: unused_local_variable

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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WelcomePage(),
      routes: {
        '/help': (context) => const HelpPage(),
        '/home': (context) => const WelcomePage(),
        '/quiz': (context) => const QuizPage(),
        '/tabrik': (context) => const tabrikPage(),
        '/fall': (context) => const fallPage(),
      },
    );
  }
}

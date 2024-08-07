import 'dart:math';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:convert';
import 'falljune.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  var questions = [];
  var index = 0;
  int rightAnswercount = 0;
  int fallAnswercount = 0;
  var response;
  int june = 0;
  final _myBox = Hive.box("my Box");
  Future<List<dynamic>> fetchData() async {
    var res = Product['result'] as List<dynamic>;
    setState(() {
      questions.addAll(res);

      index = Random().nextInt(100);
    });
    return res;
  }

  @override
  void initState() {
    _myBox.put('june', 3);
    super.initState();
    response = fetchData();
  }

  void validate(int i) {
    if (index < questions.length) {
      if (questions[index]['answerIndex'] == i) {
        setState(() {
          rightAnswercount++;
        });
      } else {
        setState(() {
          fallAnswercount++;
          // june++;
          _myBox.put('june', _myBox.get('june') - 1);
        });
      }

      if (_myBox.get('june') <= 0) {
        Navigator.pushNamed(context, '/fall', arguments: {
          'right': rightAnswercount,
          'fall': fallAnswercount,
          'total': questions.length,
        });
      } else if (index < questions.length - 1) {
        setState(() {
          index++;
        });
      } else {
        if (rightAnswercount == questions.length) {
          Navigator.pushNamed(context, '/tabrik', arguments: {
            'right': rightAnswercount,
            'fall': fallAnswercount,
            'total': questions.length,
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: FutureBuilder(
          future: response,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Text(_myBox.get('june').toString());
            } else {
              return const Text("در حال دریافت اطلاعات ...");
            }
          },
        ),
      ),
      body: FutureBuilder(
        future: response,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Container(
                  decoration: const ShapeDecoration(
                    shape: Border(),
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.deepPurple],
                    ),
                  ),
                  width: double.infinity,
                  height: size.height * 0.5,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(size.width * 0.05),
                      child: Text(
                        questions[index]['question'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.05,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    color: Colors.black87,
                    child: Column(
                      children: [
                        SizedBox(height: size.height * 0.05),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: size.height * 0.1,
                              width: size.width * 0.4,
                              child: ElevatedButton(
                                onPressed: () {
                                  validate(0);
                                },
                                child: Text(
                                  (questions[index]['options'] as List).first,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.width * 0.04,
                                  ),
                                ),
                                style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.blue),
                                  foregroundColor:
                                      MaterialStatePropertyAll(Colors.black),
                                ),
                              ),
                            ),
                            SizedBox(width: size.width * 0.05),
                            SizedBox(
                              height: size.height * 0.1,
                              width: size.width * 0.4,
                              child: ElevatedButton(
                                onPressed: () {
                                  validate(1);
                                },
                                child: Text(
                                  (questions[index]['options'] as List)[1],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.width * 0.04,
                                  ),
                                ),
                                style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.blue),
                                  foregroundColor:
                                      MaterialStatePropertyAll(Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: size.height * 0.1,
                              width: size.width * 0.4,
                              child: ElevatedButton(
                                onPressed: () {
                                  validate(2);
                                },
                                child: Text(
                                  (questions[index]['options'] as List)[2],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.width * 0.04,
                                  ),
                                ),
                                style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.blue),
                                  foregroundColor:
                                      MaterialStatePropertyAll(Colors.black),
                                ),
                              ),
                            ),
                            SizedBox(width: size.width * 0.05),
                            SizedBox(
                              height: size.height * 0.1,
                              width: size.width * 0.4,
                              child: ElevatedButton(
                                onPressed: () {
                                  validate(3);
                                },
                                child: Text(
                                  (questions[index]['options'] as List)[3],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.width * 0.04,
                                  ),
                                ),
                                style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.blue),
                                  foregroundColor:
                                      MaterialStatePropertyAll(Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

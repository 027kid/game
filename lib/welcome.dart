import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:session_next/session_next.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var session = SessionNext();

    final _myBox = Hive.box("my Box");
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.blue,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.blue, Colors.deepPurple]),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(height: size.height * 0.05), // فاصله از بالا
                SizedBox(
                  height: constraints.maxWidth * 0.4,
                  width: constraints.maxWidth * 0.4,
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(constraints.maxWidth * 0.2),
                    child: Image.asset(
                      "assets/download (1).png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.05), // فاصله بین تصویر و متن
                Text(
                  "Welcome To Quiz Game",
                  style: TextStyle(
                    fontSize: constraints.maxWidth * 0.08,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                    height: size.height * 0.05), // فاصله بین متن و تصویر دوم
                SizedBox(
                  height: constraints.maxWidth * 0.4,
                  width: constraints.maxWidth * 0.4,
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(constraints.maxWidth * 0.2),
                    child: Image.asset(
                      "assets/download.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),

                Column(
                  children: [
                    Container(
                      width: constraints.maxWidth * 0.8,
                      height: size.height * 0.08,
                      decoration: const ShapeDecoration(
                        shape: StadiumBorder(
                          side: BorderSide(color: Colors.black),
                        ),
                        gradient: LinearGradient(
                          colors: [Colors.black, Colors.white],
                        ),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/quiz');
                        },
                        child: Text(
                          "Play",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: constraints.maxWidth * 0.06,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02, // فاصله بین دکمه‌ها
                    ),
                    Container(
                      width: constraints.maxWidth * 0.8,
                      height: size.height * 0.08,
                      decoration: const ShapeDecoration(
                        shape: StadiumBorder(
                          side: BorderSide(color: Colors.black),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 217, 0, 255),
                            Color.fromARGB(255, 242, 240, 240),
                          ],
                        ),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/help');
                        },
                        child: Text(
                          "How to play",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: constraints.maxWidth * 0.06,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Text(
                      "made by mamad.alj",
                      style: TextStyle(fontSize: constraints.maxWidth * 0.05),
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

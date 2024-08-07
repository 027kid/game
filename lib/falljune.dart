import 'package:flutter/material.dart';

class fallPage extends StatelessWidget {
  const fallPage({super.key});

  @override
  Widget build(BuildContext context) {
    // دریافت داده‌ها از arguments
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final rightAnswercount = args?['right'] ?? 0;

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 163, 163, 163),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(size.width * 0.07),
                bottomRight: Radius.circular(size.width * 0.07),
              ),
              child: Container(
                width: double.infinity,
                height: size.height * 0.8,
                color: const Color.fromARGB(255, 186, 23, 23),
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.1),
                    Text(
                      "You Lose!",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.08,
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Padding(
                      padding: EdgeInsets.all(size.width * 0.05),
                      child: Text(
                        "You could not answer all the questions correctly :( ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width * 0.05,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(size.width * 0.05),
                      child: Image.asset(
                        "assets/sad1.png",
                        width: size.width * 0.5,
                        height: size.width * 0.5,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Text(
                      "Please try again!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width * 0.05,
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Text(
                      "Your number of correct answers: $rightAnswercount",
                      style: TextStyle(
                        fontSize: size.width * 0.05,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: const Color.fromARGB(255, 163, 163, 163),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: size.width * 0.6,
                      height: size.height * 0.08,
                      decoration: ShapeDecoration(
                        shape: StadiumBorder(
                          side: BorderSide(color: Colors.black),
                        ),
                        gradient: LinearGradient(
                          colors: [Colors.black, Colors.white],
                        ),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                        child: Text(
                          "Play Again",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.06,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

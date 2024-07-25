import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        decoration: const ShapeDecoration(
            shape: StadiumBorder(),
            gradient: LinearGradient(colors: [Colors.blue, Colors.deepPurple])),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
              ),
              SizedBox(
                height: 200,
                width: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(300),
                  child: Image.asset(
                    "assets/download (1).png",
                    width: 300,
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                child: Text(
                  "Welcom To Quize Game",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(300),
                child: Image.asset(
                  "assets/download.png",
                  width: 300,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 300,
                height: 70,
                decoration: ShapeDecoration(
                    shape: StadiumBorder(side: BorderSide(color: Colors.black)),
                    gradient:
                        LinearGradient(colors: [Colors.black, Colors.white])),
                child: MaterialButton(
                  onPressed: () {},
                  child: Text(
                    "Play",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 300,
                height: 70,
                child: Container(
                  decoration: ShapeDecoration(
                      shape:
                          StadiumBorder(side: BorderSide(color: Colors.black)),
                      gradient: LinearGradient(colors: [
                        const Color.fromARGB(255, 217, 0, 255),
                        Colors.white
                      ])),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/help');
                    },
                    child: Text(
                      "how to play",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

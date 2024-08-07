import 'package:flutter/material.dart';
import 'quiz.dart';

class tabrikPage extends StatefulWidget {
  const tabrikPage({super.key});

  @override
  State<tabrikPage> createState() => _tabrikPageState();
}

class _tabrikPageState extends State<tabrikPage> {
  @override
  Widget build(BuildContext context) {
    var data;
    data = ModalRoute.of(context)!.settings.arguments;

    if (data['right'] >= 2) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 163, 163, 163),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              child: Container(
                width: double.infinity,
                height: 500,
                color: const Color.fromARGB(255, 23, 186, 29),
                child: Column(
                  children: [
                    SizedBox(
                      height: 70,
                    ),
                    Text(
                      "Congratulations!",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 35),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "You completed the questions :) ",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(child: Image.asset("assets/ax.png"))),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "You Win!",
                      style: TextStyle(color: Colors.white, fontSize: 20),
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
                    width: 300,
                    height: 70,
                    decoration: ShapeDecoration(
                        shape: StadiumBorder(
                            side: BorderSide(color: Colors.black)),
                        gradient: LinearGradient(
                            colors: [Colors.black, Colors.white])),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      child: Text(
                        "Play Again",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                ],
              ),
            )),
          ],
        )),
      );
    } else {
      return Scaffold();
    }
  }
}

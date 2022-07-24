import 'dart:async';

import 'package:flutter/material.dart';
import 'package:homely_meals2/authentication/auth_screen.dart';

class Mysplashscreen extends StatefulWidget {
  Mysplashscreen({Key? key}) : super(key: key);

  @override
  State<Mysplashscreen> createState() => _MysplashscreenState();
}

class _MysplashscreenState extends State<Mysplashscreen> {
  startTimer() {
    Timer(const Duration(seconds: 3), () async {
      Navigator.push(context, MaterialPageRoute(builder: (c) => AuthScreen()));
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      color: Colors.black,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/splash_screen.png"),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Welcome",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white10,
                  fontSize: 40,
                  fontFamily: "Schyler",
                  letterSpacing: 3,
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

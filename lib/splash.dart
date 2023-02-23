import 'dart:async';
import 'package:flutter/material.dart';

import 'Page/Onboarding/onboarding.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<StatefulWidget> createState() {
    return LunchState();
  }
}

class LunchState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(),
    );
  }

  startTime() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const onBoarding(),
        ));
  }

  initScreen() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
              color: Color(0xFF30986A),
              gradient: LinearGradient(
                  colors: [(Color(0xFF30986A)), Color.fromARGB(255, 32, 119, 80)])),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
             SizedBox(
              height: 150.0,
              width: 150.0,
            ),
             Padding(padding: EdgeInsets.only(top: 20.0)),
             Text(
              "My Health",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
             Padding(padding: EdgeInsets.only(top: 20)),
             CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
            )
          ],
        )
      ],
    );
  }
}

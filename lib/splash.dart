import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhealth/utils/constant.dart';

import 'Page/Onboarding/onboarding.dart';
import 'utils/size_config.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LunchState();
  }
}

class LunchState extends State<Splash> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // initialise la fonction SizeConfig
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: initScreen(),
    );
  }

  startTime() async {
    var duration = const Duration(seconds: 9);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OnBoarding(),
        ));
  }

  initScreen() {
    return Center(
      child: Text(
        'MyHealth',
        style: GoogleFonts.poppins(
          fontSize: getProportionateScreenWidth(35),
          color: kTextColor2,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:untitle/Page/Onboarding/component/body.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Doc_Page extends StatelessWidget {
  const Doc_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(),
    );
  }
}

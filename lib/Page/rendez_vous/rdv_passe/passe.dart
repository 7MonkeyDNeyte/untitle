import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../utils/constant.dart';
import '../../component/defaultDocpage.dart';

class Rdv_passe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            DefaultDocPage(
              svgPicture: 'assets/image/calendars.svg',
              text1: "Aucun rendez-vous passé",
              text2: '',
            ),
            SizedBox(
              height: 35,
            ),
          ],
        ),
      ),
    );
  }
}

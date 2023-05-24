import 'package:flutter/material.dart';

import '../../../utils/constant.dart';
import '../../component/defaultdocpage.dart';

class Rdv_passe extends StatelessWidget {
  const Rdv_passe({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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

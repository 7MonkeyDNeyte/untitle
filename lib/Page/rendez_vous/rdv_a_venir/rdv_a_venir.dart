import 'package:flutter/material.dart';
import 'package:untitle/Page/documents/documentPage/documentpage.dart';

import '../../component/defaultDocpage.dart';

class Rdv_Futur extends StatelessWidget {
  const Rdv_Futur({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            DefaultDocPage(
              svgPicture: 'assets/image/calendars.svg',
              text1: "Aucun rendez-vous  à venir",
              text2:
                  "Trouvez un praticien et prenez rendez-vous en ligne à\ntout moment.",
            ),
          ],
        ),
      ),
    );
  }
}

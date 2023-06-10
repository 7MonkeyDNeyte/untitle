import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/size_config.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    super.key,
    required this.text,
    required this.image,
  });

  final String text, image;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: <Widget>[
        const Spacer(),
        Text(
          "My Health",
          style: GoogleFonts.poppins(
            fontSize: getProportionateScreenWidth(36),
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text,
          style: GoogleFonts.poppins(color: Colors.black),
          textAlign: TextAlign.center,
        ),
        const Spacer(
          flex: 2,
        ),
        Image.asset(
          image,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenHeight(235),
        )
      ],
    );
  }
}

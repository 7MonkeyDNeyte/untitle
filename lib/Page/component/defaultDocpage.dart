import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/size_config.dart';

class DefaultDocPage extends StatelessWidget {
  const DefaultDocPage({
    super.key,
    required this.svgPicture,
    required this.text1,
    required this.text2,
  });

  final String svgPicture;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SvgPicture.asset(
            svgPicture,
            height: getProportionateScreenWidth(90),
            width: getProportionateScreenWidth(90),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            text1,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 19,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            text2,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

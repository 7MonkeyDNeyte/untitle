import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitle/utils/size_config.dart';

import 'constant.dart';

// card help, les card avec des conseils et astuces

class HelpCard extends StatelessWidget {
  final String text;
  final String image;
  const HelpCard({super.key, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenHeight(20)),
      child: Container(
        width: 300,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: kPrimaryColor,
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 150,
              child: Text(
                text,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                ),
                maxLines: 8,
              ),
            ),
            SvgPicture.asset(
              image,
              height: getProportionateScreenWidth(60),
            ),
          ],
        ),
      ),
    );
  }
}

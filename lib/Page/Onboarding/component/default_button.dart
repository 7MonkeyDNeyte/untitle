import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/constant.dart';
import '../../../utils/size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.text,
    required this.press,
  });

  final String text;
  final void Function()? press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 56,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 1,
              backgroundColor: kPrimaryColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(26))),
          onPressed: press,
          child: Text(
            text,
            style:
                GoogleFonts.poppins(fontSize: getProportionateScreenWidth(15)),
          )),
    );
  }
}

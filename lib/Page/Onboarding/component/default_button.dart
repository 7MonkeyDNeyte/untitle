import 'package:flutter/material.dart';
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
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 15,
              backgroundColor: kPrimaryColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(26))),
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(fontSize: getProportionateScreenWidth(18)),
          )),
    );
  }
}

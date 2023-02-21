import 'package:flutter/material.dart';
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
    return Column(
      children: <Widget>[
        const Spacer(),
        Text(
          "MarketZone",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(36),
            color: Colors.orange,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text,
          style: const TextStyle(color: Colors.black),
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

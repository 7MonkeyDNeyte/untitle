import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/size_config.dart';

class SliderCard extends StatelessWidget {
  final String label;
  final String illustration;
  const SliderCard(
      {super.key, required this.label, required this.illustration});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 1, 128, 255),
            Color(0xFF00407A),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text(label),
            ),
          ),
          SizedBox(
            child: SvgPicture.asset(illustration),
          ),
        ],
      ),
    );
  }
}

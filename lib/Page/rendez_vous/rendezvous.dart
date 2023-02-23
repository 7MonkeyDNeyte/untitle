import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class RendezvousScreen extends StatelessWidget {
  const RendezvousScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("1"),
        Icon(
          IconlyLight.calendar,
        )
      ],
    );
  }
}

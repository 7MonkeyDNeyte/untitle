import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class CompteScreen extends StatelessWidget {
  const CompteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("3"),
        Icon(
          IconlyLight.profile,
        )
      ],
    );
  }
}

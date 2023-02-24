import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class CompteScreen extends StatelessWidget {
  const CompteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text("3"),
        Icon(
          IconlyLight.profile,
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class AcceuilScreen extends StatelessWidget {
  const AcceuilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("0"),
        Icon(
          IconlyLight.home,
        )
      ],
    );
  }
}

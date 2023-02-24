import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class DocumentScreen extends StatelessWidget {
  const DocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text("2"),
        Icon(
          IconlyLight.folder,
        )
      ],
    );
  }
}

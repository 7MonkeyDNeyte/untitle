import 'package:flutter/material.dart';
class Doc {
  String name;
  String type;
  String image;

  Doc({
    required this.name,
    required this.type,
    required this.image,
  });
}

final List<Doc> allDoc = [
  Doc(
    name: 'Carnet ophtamologie',
    type: 'Analyse médicale',
    image: 'assets/docteur.png',
  ),
];

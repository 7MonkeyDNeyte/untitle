import 'package:flutter/material.dart';
import 'package:untitle/splash.dart';

// Couleur principale du mode sombre
const Color darkBlue = Color.fromARGB(255, 27, 42, 49);

// Couleur secondaire du mode sombre
const Color darkBlack = Color.fromARGB(255, 48, 48, 48);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hy Heath',
      theme: ThemeData(
        // Definit le theme global de l'application
        brightness: Brightness.light,
      ),
      home: const Splash(),
    );
  }
}

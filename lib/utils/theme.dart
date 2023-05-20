import 'package:flutter/material.dart';

// Couleur pour le theme clair
const Color kLightBackgroundColor = Colors.white;
const Color kLightTextColor = Colors.black;

// Couleurs pour le theme sombre
final Color kDarkBackgroundColor = Color(0xFF263238);
final Color kDarkTextColor = Colors.grey;

ThemeData theme(bool isDarkMode) {
  return ThemeData(
    // Couleur de fond et de text en fonction du theme selectionne
    scaffoldBackgroundColor:
        isDarkMode ? kDarkBackgroundColor : kLightBackgroundColor,
    textTheme: isDarkMode ? _darkTextTheme() : _lightTextTheme(),

    // Definit le theme de l'app bar
    // appBarTheme: appBarTheme(isDarkMode),

    // Definit la densite visuelle adaptative pour le theme
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

TextTheme _lightTextTheme() {
  return const TextTheme(
    bodyText1: TextStyle(color: kLightTextColor),
    bodyText2: TextStyle(color: kLightTextColor),
  );
}

TextTheme _darkTextTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: kDarkTextColor),
    bodyText2: TextStyle(color: kDarkTextColor),
  );
}

// AppBarTheme appBarTheme(bool isDarkMode) {
//   return AppBarTheme(
//     color: isDarkMode ? kDarkBackgroundColor : kLightBackgroundColor,
//     elevation: 0,
//     brightness: isDarkMode ? Brightness.dark : Brightness.light,
//     iconTheme: IconThemeData(
//       color: isDarkMode ? kDarkTextColor : kLightTextColor,
//     ),
//     textTheme: TextTheme(
//       headline6: TextStyle(
//         color: isDarkMode ? kDarkTextColor : kLightTextColor,
//       ),
//     ),
//   );
// }
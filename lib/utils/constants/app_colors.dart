import 'package:flutter/material.dart';

///this file holds all the color codes required in the app

class AppColors {
  static const primary = Color(0xFF5396E3);
  static const primaryLight = Color(0xFFEEF6FF);
  static const secondary = Color(0xFF83991A);
  static const tertiary = Color(0xFFC1C7D0);

  static MaterialColor mainColor = MaterialColor(
    primary.value,
    const <int, Color>{
      50: Color.fromRGBO(83, 150, 227, 0.1),
      100: Color.fromRGBO(83, 150, 227, 0.2),
      200: Color.fromRGBO(83, 150, 227, 0.3),
      300: Color.fromRGBO(83, 150, 227, 0.4),
      400: Color.fromRGBO(83, 150, 227, 0.5),
      500: Color.fromRGBO(83, 150, 227, 0.6),
      600: Color.fromRGBO(83, 150, 227, 0.7),
      700: Color.fromRGBO(83, 150, 227, 0.8),
      800: Color.fromRGBO(83, 150, 227, 0.9),
      900: Color.fromRGBO(83, 150, 227, 1),
    },
  );

  //Appbar
  static const Color appBarIconColor = Colors.black87;
  static const Color appBarTextColor = Colors.black87;
  static Color appBarBgColor = Colors.grey.shade200;
  static Color backgroundColorGrey = Colors.grey.shade200;

  //Containers and scaffolds
  static Color backgroundColorWhite = Colors.white;
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color red = Colors.redAccent;
  static const Color green = Colors.greenAccent;
  static const Color grey = Colors.grey;
  static const Color inputFieldColor = Color(0xFFEEF6FF);

  static const Color textColor = Color(0xFF10164A);
  static const Color hintColor = Color(0xFFAFAFAF);
  static const Color textColorRed = Color(0xFFDE4040);
  static const Color darkRed = Color(0xffde4040);
  static const Color softButtonColor = Color(0xffEEF6FF);
}

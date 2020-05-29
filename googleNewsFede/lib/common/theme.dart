import 'package:flutter/material.dart';

final appTheme = ThemeData(
  fontFamily: "Bimby",
  primarySwatch: Colors.green,
  primaryColor: _colorFromHex('#009a3d'),
  accentColor: _colorFromHex('#113c2b'),
  textTheme: TextTheme(
      headline1: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.black,
      ),
      headline2: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: _colorFromHex('#009a3d'),
      ),
      headline3: TextStyle(
          fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black),
      headline4: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: _colorFromHex('#009a3d')),
      headline5: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
      headline6: TextStyle(
          fontWeight: FontWeight.normal, fontSize: 16, color: Colors.white),
      bodyText1: TextStyle(
          fontWeight: FontWeight.normal, fontSize: 12, color: _colorFromHex('#009a3d')),
      bodyText2: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
      subtitle1: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 17,
        color: _colorFromHex('#113c2b'),
      ),
      subtitle2: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black)),
);

Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

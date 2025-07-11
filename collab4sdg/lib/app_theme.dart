import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primarySwatch: Colors.teal,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.teal,
    accentColor: Colors.lightGreen,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.teal,
    foregroundColor: Colors.white,
    elevation: 2,
  ),
  scaffoldBackgroundColor: Colors.grey[50],
  cardTheme: CardThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    elevation: 2,
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
  ),
); 
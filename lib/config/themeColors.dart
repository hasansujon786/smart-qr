import 'package:flutter/material.dart';
import 'package:smart_qr/config/config.dart';

class ThemeColors {
  static final lightTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    canvasColor: Palette.appBackground,

    colorScheme: const ColorScheme.light(),
    primaryColor: Palette.bandColor,

    ////////////// Light Mode //////////////////
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Palette.bandColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      hintStyle: TextStyle(color: Colors.grey.shade400),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(Constants.fieldRounded)),
      enabledBorder: borderStyle(Colors.grey.shade200),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(fontWeight: FontWeight.w700, color: Palette.textDark),
      titleSmall: TextStyle(color: Palette.textDark),
      labelLarge: TextStyle(color: Palette.text),
    ),
    iconTheme: IconThemeData(color: Palette.textDark),
    shadowColor: Palette.softWhite,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
    ),

    // buttonTheme: const ButtonThemeData(
    //   buttonColor: Palette.darkerGrey,
    //   textTheme: ButtonTextTheme.primary,
    // ),
  );

  static final darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(),
    primaryColor: Palette.bandColor,

    ////////////// Dark Mode //////////////////
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Palette.bandColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[800],
      hintStyle: TextStyle(color: Colors.grey.shade600),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(Constants.fieldRounded)),
      enabledBorder: borderStyle(Colors.grey[700]),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(fontWeight: FontWeight.w700, color: Colors.grey[200]),
      titleSmall: TextStyle(color: Colors.grey[200]),
      labelLarge: TextStyle(color: Colors.grey[500]),
    ),
    iconTheme: IconThemeData(color: Palette.softWhite),
    shadowColor: Colors.grey.shade900,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.grey[900],
    ),
  );
}

OutlineInputBorder borderStyle(Color? color) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: color ?? Colors.white),
    borderRadius: BorderRadius.circular(Constants.fieldRounded),
  );
}

import 'package:flutter/material.dart';
import 'package:smart_qr/config/config.dart';

class ThemeColors {
  static final lightTheme = ThemeData(
    // cardColor: Colors.red,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    canvasColor: Palette.appBackground,
    // primaryColor: Palette.darkerGrey,
    // buttonTheme: const ButtonThemeData(
    //   buttonColor: Palette.darkerGrey,
    //   textTheme: ButtonTextTheme.primary,
    // ),
    // primary: Colors.black,
    // secondary: Colors.redAccent,
    primaryColor: Palette.bandColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Palette.bandColor,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(fontWeight: FontWeight.w700, color: Palette.textDark),
      titleSmall: TextStyle(color: Palette.textDark),
      labelLarge: TextStyle(color: Palette.text),
    ),
    iconTheme: IconThemeData(color: Palette.textDark),
    colorScheme: const ColorScheme.light(),
    shadowColor: Palette.softWhite,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
    ),
  );

  static final darkTheme = ThemeData(
    primaryColor: Palette.bandColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Palette.bandColor,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(fontWeight: FontWeight.w700, color: Colors.grey[200]),
      titleSmall: TextStyle(color: Colors.grey[200]),
      labelLarge: TextStyle(color: Colors.grey[500]),
    ),
    iconTheme: IconThemeData(color: Palette.softWhite),
    colorScheme: const ColorScheme.dark(),
    shadowColor: Colors.grey.shade900,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.grey[900],
    ),
  );
}

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
    primaryColor: Color(hexColor('#6200ED')),
    textTheme: TextTheme(
      titleLarge: TextStyle(fontWeight: FontWeight.w700, color: Palette.textDark),
      titleSmall: TextStyle(color: Palette.textDark),
    ),
    iconTheme: IconThemeData(color: Palette.textDark),
    colorScheme: const ColorScheme.light(),
    shadowColor: Palette.softWhite,
  );

  static final darkTheme = ThemeData(
    primaryColor: Color(hexColor('#6200ED')),
    textTheme: TextTheme(
      titleLarge: TextStyle(fontWeight: FontWeight.w700, color: Colors.grey[200]),
      titleSmall: TextStyle(color: Colors.grey[200]),
    ),
    iconTheme: IconThemeData(color: Palette.softWhite),
    colorScheme: const ColorScheme.dark(),
    shadowColor: Colors.grey.shade900,
  );
}

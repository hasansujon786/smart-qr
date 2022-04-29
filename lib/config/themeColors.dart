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
    colorScheme: const ColorScheme.light(),
  );

  static final darkTheme = ThemeData(
    // cardColor: Colors.blue,
    // brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(),
  );
}

import 'package:flutter/material.dart';

// primary: '#9966FF',
// primaryDark: 'purple.600',
class Palette {
  static final Color? darkerGrey = Colors.grey[600];
  static const Color lightGrey = Color(0xffE5E5E5);
  static const Color lightBlue = Color(0xffC1F1EB);

  static final appBackground = Colors.grey[100];
  static const appBackgroundLight = Color(0xfffafafa);
  static final mutedBorder = Colors.grey.shade200;
  static final textDark = Colors.blueGrey[700];
  static final text = Colors.blueGrey[600];
  static final textMuted = Colors.blueGrey[300];
}

int hexColor(String color) {
  //adding prefix
  String newColor = '0xff' + color;
  //removing # sign
  newColor = newColor.replaceAll('#', '');
  //converting it to the integer
  int finalColor = int.parse(newColor);
  return finalColor;
}

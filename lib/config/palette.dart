import 'package:flutter/material.dart';

// primary: '#9966FF',
// primaryDark: 'purple.600',
class Palette {
  static final Color? darkerGrey = Colors.grey[600];
  static const Color lightGrey = Color(0xffE5E5E5);
  static const Color lightBlue = Color(0xffC1F1EB);

  static final appBackground = Colors.grey[100];
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

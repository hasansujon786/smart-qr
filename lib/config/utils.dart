import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

String getDate(datetime) {
  return formatDate(datetime, [h, ':', nn, ' ', am, '  ', dd, '/', m, '/', yyyy]);
}

bool isDarkMode(BuildContext context) {
  return MediaQuery.of(context).platformBrightness == Brightness.dark;
}

bool isLightMode(BuildContext context) {
  return MediaQuery.of(context).platformBrightness == Brightness.light;
}

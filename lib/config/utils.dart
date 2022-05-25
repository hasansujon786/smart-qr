import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

String getDate(datetime) {
  return formatDate(datetime, [h, ':', nn, ' ', am, '  ', dd, '/', m, '/', yyyy]);
}

bool isDarkMode() {
  return SchedulerBinding.instance.window.platformBrightness == Brightness.dark;
}

bool isLightMode() {
  return SchedulerBinding.instance.window.platformBrightness == Brightness.light;
}

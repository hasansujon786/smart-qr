import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import 'package:flutter/material.dart';

const String hiveBoxMyAppSettings = 'my_app_settings';

class MyAppSettings {
  MyAppSettings({
    required this.currentTheme,
  });

  @HiveField(0)
  ThemeMode currentTheme;

  get isDarkMode => currentTheme == ThemeMode.dark;
  get isLightMode => currentTheme == ThemeMode.light;

  static ThemeMode themeModeAsEnum(string) {
    return ThemeMode.values.firstWhere((e) => describeEnum(e) == string);
  }
}

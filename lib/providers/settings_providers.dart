import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingsProvider = StateNotifierProvider<SettingsNotifier, MyAppSettings>((ref) {
  return SettingsNotifier();
});

class SettingsNotifier extends StateNotifier<MyAppSettings> {
  SettingsNotifier() : super(MyAppSettings(currentTheme: ThemeMode.system));

  void updateTheme(newTheme) => state = MyAppSettings(currentTheme: newTheme);
}

class MyAppSettings {
  ThemeMode currentTheme;

  MyAppSettings({
    required this.currentTheme,
  });
}

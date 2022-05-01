import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/models.dart';

// saved keys on hiveBoxMyAppSettings
const _keyThemeMode = 'ThemeMode';

final settingsProvider = StateNotifierProvider<SettingsNotifier, MyAppSettings>((ref) {
  final box = Hive.box(hiveBoxMyAppSettings);
  final String? theme = box.get(_keyThemeMode);
  final currentTheme = theme != null ? MyAppSettings.themeModeAsEnum(theme) : ThemeMode.system;

  return SettingsNotifier(MyAppSettings(currentTheme: currentTheme));
});

class SettingsNotifier extends StateNotifier<MyAppSettings> {
  SettingsNotifier(initialState) : super(initialState);

  final box = Hive.box(hiveBoxMyAppSettings);

  void updateTheme(ThemeMode? newTheme) {
    if (newTheme == null) return;

    state = MyAppSettings(currentTheme: newTheme);
    box.put(_keyThemeMode, newTheme.name);
  }
}

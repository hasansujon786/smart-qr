import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';
import 'domain/settings/settings_controller.dart';
import 'domain/settings/settings_service.dart';
import 'models/models.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // set up hive
  await Hive.initFlutter();
  Hive.registerAdapter(QrHistoryAdapter());
  await Hive.openBox<QrHistory>(hiveBoxQrHistory);

  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(ProviderScope(
    child: MyApp(settingsController: settingsController),
  ));
}

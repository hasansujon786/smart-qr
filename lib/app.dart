import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'domain/settings/settings_controller.dart';
import 'pages/home/home.dart';
import 'pages/qr_create/qr_create.dart';
import 'pages/qr_decode/qr_decode.dart';
import 'pages/qr_result/qr_result.dart';
import 'pages/qr_view/qr_view.dart';
import 'pages/sample_items/sample_items.dart';
import 'pages/settings/settings.dart';
import 'providers/providers.dart';

/// The Widget that configures your application.
class MyApp extends ConsumerWidget {
  final SettingsController settingsController;

  const MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appSettings = ref.watch(settingsProvider);
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'app',
          // themeMode: settingsController.themeMode,
          themeMode: appSettings.currentTheme,
          theme: ThemeColors.lightTheme,
          darkTheme: ThemeColors.darkTheme,
          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SettingsPage.routeName:
                    return SettingsPage(controller: settingsController);
                  case SampleItemsPage.routeName:
                    return const SampleItemsPage();
                  case SampleItemDetailsPage.routeName:
                    return const SampleItemDetailsPage();
                  case QrDecode.routeName:
                    return const QrDecode();
                  // ****** main features ****** //
                  case QrView.routeName:
                    return const QrView();
                  case QrCreatePage.routeName:
                    return const QrCreatePage();
                  case QrResultPage.routeName:
                    return const QrResultPage();
                  case QrHistoryDetailsPage.routeName:
                    return const QrHistoryDetailsPage();
                  case HomePage.routeName:
                  default:
                    return const HomePage();
                }
              },
            );
          },
        );
      },
    );
  }
}

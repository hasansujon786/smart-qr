import 'package:flutter/material.dart';

import 'config/config.dart';
import 'domain/settings/settings_controller.dart';
import 'pages/home/home.dart';
import 'pages/qr_create/qr_create.dart';
import 'pages/qr_decode/qr_decode.dart';
import 'pages/qr_result/qr_result.dart';
import 'pages/qr_view/qr_view.dart';
import 'pages/sample_items/sample_items.dart';
import 'pages/settings/settings.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
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
          theme: ThemeData(
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
          ),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,

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

  // gallery_saver
  // path_provider
  // qr_code_scanner
  // qr_flutter

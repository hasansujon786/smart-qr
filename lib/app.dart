import 'package:flutter/material.dart';

import 'config/palette.dart';
import 'domain/settings/settings_controller.dart';
import 'pages/home/home.dart';
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
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'app',
          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsController to display the correct theme.
          // theme: ThemeData(),
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            canvasColor: Palette.lightGrey,
            primaryColor: Palette.darkerGrey,
            buttonTheme: const ButtonThemeData(
              buttonColor: Palette.darkerGrey,
              textTheme: ButtonTextTheme.primary,
            ),
            colorScheme: const ColorScheme.light(
              primary: Colors.black, //flat button text color
              secondary: Palette.lightBlue,
            ),
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

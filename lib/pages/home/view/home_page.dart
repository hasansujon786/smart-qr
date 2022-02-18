import 'package:flutter/material.dart';

import '../../sample_items/sample_items.dart';
import '../../settings/settings.dart';

/// Displays detailed information about a SampleItem.
class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsPage.routeName);
            },
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.restorablePushNamed(context, SampleItemsPage.routeName);
          },
          child: const Text('View Sample Items'),
        ),
      ),
    );
  }
}

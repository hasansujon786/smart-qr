import 'package:flutter/material.dart';

import '../widgets/widgets.dart';
import '../../../config/config.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final radius = Constants.borderRadius;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: BottomNavBarPadding(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 34),
          child: Column(
            children: [
              const AppInfo(),
              Card(
                margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
                shadowColor: Colors.grey.withOpacity(0.3),
                // elevation: 0.3,
                child: Column(children: [
                  const SizedBox(height: 12),
                  buileSettingItem(
                    icon: Icons.share,
                    title: 'Share app',
                  ),
                  buileSettingItem(
                    title: 'Rate the app',
                  ),
                  buileSettingItem(
                    icon: Icons.apps,
                    title: 'More apps',
                  ),
                  buileSettingItem(
                    title: 'About',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 14),
                    child: Text(
                      'Version 1.0.0',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Palette.textMuted),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buileSettingItem({required String title, IconData icon = Icons.info, bool lastItem = false}) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            print('foo');
          },
          contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          leading: buildIcon(icon),
          title: Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Palette.textDark)),
        ),
        const Divider(height: 0, indent: 24, endIndent: 24)
      ],
    );
  }

  buildIcon(IconData icon) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        color: Colors.grey[100],
      ),
      padding: const EdgeInsets.all(10),
      child: Icon(icon, color: Palette.textDark),
    );
  }
}

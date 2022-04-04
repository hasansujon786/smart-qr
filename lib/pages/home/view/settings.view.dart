import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../config/config.dart';
import '../../../ui/ui.dart';
import '../widgets/widgets.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  void _launchMoreApps() async {
    if (!await launch(playStoreMoreAppsLink)) throw 'Could not launch';
  }

  void _shareAppLink() {
    // Share.share('Scan QR & Barcode with $appName. Download from $playStoreAppLink');
    Share.share('Scan QR & Barcode with $appName.');
  }

  void _showAbout(context) {
    showDialog(
      context: context,
      builder: (ctx) {
        return const AppAboutDialog();
      },
    );
  }

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
          child: Column(children: [
            const AppInfo(),
            Card(
              margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
              shadowColor: Colors.grey.withOpacity(0.3),
              child: Column(children: [
                const SizedBox(height: 12),
                SettingItem(icon: Icons.share, title: 'Share app', onPress: _shareAppLink),
                SettingItem(icon: Icons.star_rounded, title: 'Rate the app', onPress: _launchMoreApps),
                SettingItem(icon: Icons.apps_rounded, title: 'More apps', onPress: _launchMoreApps),
                SettingItem(title: 'About', onPress: () => _showAbout(context)),
                buildVersionName(context),
              ]),
            ),
          ]),
        ),
      ),
    );
  }

  Widget buildVersionName(context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 14),
      child: Text(
        'Version $appVersion',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Palette.textMuted),
      ),
    );
  }
}

class SettingItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPress;

  const SettingItem({
    Key? key,
    required this.title,
    this.icon = Icons.info,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onPress,
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

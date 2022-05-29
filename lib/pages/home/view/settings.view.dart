import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../config/config.dart';
import '../../../ui/ui.dart';
import '../widgets/widgets.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  void _launcLink(String link) async {
    if (!await launchUrlString(link, mode: LaunchMode.externalApplication)) throw 'Could not launch';
  }

  void _shareAppLink() {
    Share.share('Scan & Create QR Code with $appName. \nDownload from $playStoreAppLink');
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
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(children: [
            const AppInfo(),
            Card(
              margin: const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 32),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
              shadowColor: Colors.grey.withOpacity(0.3),
              child: Column(children: [
                const ThemeSelectorMenu(),
                SettingItem(
                  icon: Icons.share,
                  title: 'Share app',
                  onPress: _shareAppLink,
                ),
                SettingItem(
                  icon: Icons.star_rounded,
                  title: 'Rate the app',
                  onPress: () => _launcLink(playStoreAppLink),
                ),
                SettingItem(
                  icon: Icons.apps,
                  title: 'More apps',
                  onPress: () => _launcLink(playStoreMoreAppsLink),
                ),
                SettingItem(
                  title: 'About',
                  onPress: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => const AppAboutDialog(),
                    );
                  },
                ),
                const Divider(height: 0, indent: 24, endIndent: 24),
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

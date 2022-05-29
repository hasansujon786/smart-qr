import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/providers.dart';

class ThemeSelectorMenu extends ConsumerWidget {
  const ThemeSelectorMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appSettings = ref.watch(settingsProvider);

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      leading: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19),
          color: Theme.of(context).canvasColor,
        ),
        padding: const EdgeInsets.all(10),
        child: Icon(Icons.dark_mode, color: Theme.of(context).iconTheme.color),
      ),
      title: DropdownButton<ThemeMode>(
        style: Theme.of(context).textTheme.titleSmall,
        isExpanded: true,
        icon: const Icon(Icons.chevron_right),
        iconEnabledColor: Theme.of(context).dividerColor,
        underline: const SizedBox(),
        value: appSettings.currentTheme,
        onChanged: ref.read(settingsProvider.notifier).updateTheme,
        items: const [
          DropdownMenuItem(
            value: ThemeMode.system,
            child: Text('System Theme'),
          ),
          DropdownMenuItem(
            value: ThemeMode.light,
            child: Text('Light Theme'),
          ),
          DropdownMenuItem(
            value: ThemeMode.dark,
            child: Text('Dark Theme'),
          )
        ],
      ),
    );
  }
}

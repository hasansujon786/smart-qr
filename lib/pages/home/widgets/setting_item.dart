import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onPress;

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
        const Divider(height: 0, indent: 24, endIndent: 24),
        ListTile(
          onTap: onPress,
          contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          leading: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19),
              color: Theme.of(context).canvasColor,
            ),
            padding: const EdgeInsets.all(10),
            child: Icon(icon, color: Theme.of(context).iconTheme.color),
          ),
          title: Text(title, style: Theme.of(context).textTheme.titleSmall),
        ),
      ],
    );
  }
}

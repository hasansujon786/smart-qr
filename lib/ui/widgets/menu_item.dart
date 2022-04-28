import 'package:flutter/material.dart';

class PmItemChild extends StatelessWidget {
  final IconData icon;
  final String text;

  const PmItemChild({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      minLeadingWidth: 0,
      leading: Icon(icon),
      title: Text(text),
    );
  }
}

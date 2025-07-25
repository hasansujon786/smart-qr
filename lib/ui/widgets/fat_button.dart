import 'package:flutter/material.dart';

import '../../config/config.dart';

class FatButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final IconData icon;
  const FatButton({
    Key? key,
    this.text = 'Press me',
    required this.onPressed,
    this.onLongPress,
    this.icon = Icons.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size.fromHeight(50),
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Constants.borderRadius)),
        ),
        onLongPress: onLongPress,
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(text, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}

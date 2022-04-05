import 'package:flutter/material.dart';

class FatButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData icon;
  const FatButton({Key? key, this.text = 'Press me', required this.onPressed, this.icon = Icons.info})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(text, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}

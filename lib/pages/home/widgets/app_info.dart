import 'package:flutter/material.dart';

import '../../../config/config.dart';

class AppInfo extends StatelessWidget {
  const AppInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 18),
        Container(
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey[100],
            boxShadow: [BoxShadow(color: Colors.grey.shade400, blurRadius: 2)],
          ),
          child: const Center(
            child: Icon(Icons.qr_code_scanner, size: 32),
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          appName,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.indigo),
        ),
        const SizedBox(height: 4),
        Text(
          'Version $appVersionShort',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Palette.textMuted),
        ),
      ],
    );
  }
}

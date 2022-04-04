import 'package:flutter/material.dart';

import '../../../config/config.dart';

class AppInfo extends StatelessWidget {
  const AppInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 18),
        AppIcon(),
        SizedBox(height: 4),
        Text(
          appName,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.indigo),
        ),
      ],
    );
  }
}

class AppIcon extends StatelessWidget {
  const AppIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 1)],
      ),
      child: const Center(
        child: Icon(Icons.qr_code_scanner, size: 32),
      ),
    );
  }
}

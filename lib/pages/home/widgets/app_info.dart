import 'package:flutter/material.dart';

import '../../../config/config.dart';

class AppInfo extends StatelessWidget {
  const AppInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 18),
        const AppIcon(),
        const SizedBox(height: 4),
        Text(
          appName,
          style: TextStyle(
            shadows: [Shadow(color: Theme.of(context).shadowColor, blurRadius: 3, offset: const Offset(1, 2))],
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
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
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Theme.of(context).shadowColor, blurRadius: 2)],
      ),
      child: Image.asset('assets/images/app-icon-sm.png'),
    );
  }
}

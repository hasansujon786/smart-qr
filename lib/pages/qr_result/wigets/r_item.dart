import 'package:flutter/material.dart';

import '../../../config/config.dart';

class QrResultItem extends StatelessWidget {
  final String title;
  final String content;
  const QrResultItem({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.subtitle2?.copyWith(color: Palette.text)),
        const SizedBox(height: 2),
        Text(
          content,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.w500, color: Colors.grey.shade800),
        ),
        const Divider(thickness: 1.5, height: 8),
        const SizedBox(height: 10),
      ],
    );
  }
}

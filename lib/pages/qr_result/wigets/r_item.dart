import 'package:flutter/material.dart';

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
        Text(title, style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: 4),
        Text(content, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500)),
        const Padding(
          padding: EdgeInsets.only(top: 4, bottom: 10),
          child: Divider(thickness: 1.5, height: 8),
        ),
      ],
    );
  }
}

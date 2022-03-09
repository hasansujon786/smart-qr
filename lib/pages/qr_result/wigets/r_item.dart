import 'package:flutter/material.dart';

class RItem extends StatelessWidget {
  const RItem({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.subtitle2?.copyWith(color: Colors.grey.shade600)),
        Text(
          content,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.w500, color: Colors.grey.shade800),
        ),
        Divider(color: Colors.grey.shade400, thickness: 1.5, height: 8),
        const SizedBox(height: 8),
      ],
    );
  }
}

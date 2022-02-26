import 'package:flutter/material.dart';

class QrFormField extends StatelessWidget {
  final String label;
  final Function(String?)? onSaved;

  const QrFormField({
    Key? key,
    required this.label,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 8),
        TextFormField(
          onSaved: onSaved,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            // labelText: label,
          ),
        )
      ],
    );
  }
}

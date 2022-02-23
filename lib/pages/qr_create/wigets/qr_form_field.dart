import 'package:flutter/material.dart';

class QrFormField extends StatelessWidget {
  final String label;
  // final TextEditingController textController;

  const QrFormField(
    {
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            // labelText: label,
          ),
          // controller: textController,
          // onSubmitted: _updateQrView,
        )
      ],
    );
  }
}

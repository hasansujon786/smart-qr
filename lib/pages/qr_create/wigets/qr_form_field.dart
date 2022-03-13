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
    return TextFormField(
      onSaved: onSaved,
      decoration: InputDecoration(
        label: Text(label),
        border: const OutlineInputBorder(),
        // labelText: label,
      ),
    );
  }
}

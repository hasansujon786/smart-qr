import 'package:flutter/material.dart';

class QrFormField extends StatelessWidget {
  final String label;
  final String hintText;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final bool isLastField;
  final String? initialValue;

  const QrFormField({
    Key? key,
    required this.label,
    this.hintText = 'Enter text here',
    this.isLastField = false,
    this.onSaved,
    this.validator,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.only(left: 1),
          child: Text(label, style: Theme.of(context).textTheme.labelLarge),
        ),
        const SizedBox(height: 6),
        TextFormField(
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          decoration: InputDecoration(hintText: hintText),
          textInputAction: isLastField ? TextInputAction.done : TextInputAction.next,
        ),
      ],
    );
  }
}

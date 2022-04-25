import 'package:flutter/material.dart';

import '../../../config/config.dart';

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
          child: Text(
            label,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade700,
                ),
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          textInputAction: isLastField ? TextInputAction.done : TextInputAction.next,
          onSaved: onSaved,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: Colors.white,
            hintStyle: TextStyle(color: Colors.grey.shade400),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(Constants.fieldRounded)),
            enabledBorder: borderStyle(Colors.grey.shade200),
            errorBorder: borderStyle(Theme.of(context).errorColor.withOpacity(0.6)),
            focusedBorder: borderStyle(Theme.of(context).colorScheme.primary, width: 2),
            focusedErrorBorder: borderStyle(Theme.of(context).errorColor, width: 2),
          ),
        ),
      ],
    );
  }
}

OutlineInputBorder borderStyle(Color color, {double width = 1}) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: color, width: width),
    borderRadius: BorderRadius.circular(Constants.fieldRounded),
  );
}

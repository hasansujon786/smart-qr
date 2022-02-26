import 'package:flutter/material.dart';
import './wigets.dart';

class QrInputText extends StatelessWidget {
  const QrInputText({
    Key? key,
    required this.updateFormData,
  }) : super(key: key);

  final Function updateFormData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QrFormField(
          label: 'Enter text',
          onSaved: (val) {
            updateFormData('text', val);
          },
        ),
      ],
    );
  }
}

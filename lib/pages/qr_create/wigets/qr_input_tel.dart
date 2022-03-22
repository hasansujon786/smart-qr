import 'package:flutter/material.dart';
import './wigets.dart';

class QrInputTel extends StatelessWidget {
  const QrInputTel({
    Key? key,
    required this.updateFormData,
  }) : super(key: key);

  final Function updateFormData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QrFormField(
          label: 'Your phone number',
          hintText: 'Enter number here',
          isLastField: true,
          onSaved: (val) {
            updateFormData('tel', val);
          },
        ),
      ],
    );
  }
}

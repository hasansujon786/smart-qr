import 'package:flutter/material.dart';
import './wigets.dart';

class QrInputEmail extends StatelessWidget {
  const QrInputEmail({
    Key? key,
    required this.updateFormData,
  }) : super(key: key);

  final Function updateFormData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QrFormField(
          label: 'Email',
          hintText: 'Enter Email here',
          onSaved: (val) {
            updateFormData('email', val);
          },
        ),
        const SizedBox(height: 8),
        QrFormField(
          label: 'Subject',
          hintText: 'Enter Subject here',
          onSaved: (val) {
            updateFormData('subject', val);
          },
        ),
        const SizedBox(height: 8),
        QrFormField(
          label: 'Your Message',
          isLastField: true,
          hintText: 'Enter Message here',
          onSaved: (val) {
            updateFormData('message', val);
          },
        )
      ],
    );
  }
}




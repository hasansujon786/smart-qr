import 'package:flutter/material.dart';
import './wigets.dart';

class QrInputSms extends StatelessWidget {
  const QrInputSms({
    Key? key,
    required this.updateFormData,
  }) : super(key: key);

  final Function updateFormData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QrFormField(
          label: 'Phone number',
          onSaved: (val) {
            updateFormData('phoneNumber', val);
          },
        ),
        const SizedBox(height: 8),
        QrFormField(
          label: 'Message',
          onSaved: (val) {
            updateFormData('message', val);
          },
        ),
      ],
    );
  }
}



import 'package:flutter/material.dart';
import './wigets.dart';

class QrInputWifi extends StatelessWidget {
  const QrInputWifi({
    Key? key,
    required this.updateFormData,
  }) : super(key: key);

  final Function updateFormData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QrFormField(
          label: 'SSID',
          onSaved: (val) {
            updateFormData('ssid', val);
          },
        ),
        const SizedBox(height: 8),
        QrFormField(
          label: 'Password',
          onSaved: (val) {
            updateFormData('pass', val);
            updateFormData('type', 'WPA');
          },
        ),
      ],
    );
  }
}


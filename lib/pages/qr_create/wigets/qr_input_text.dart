import 'package:flutter/material.dart';
import './wigets.dart';

class QrInputText extends StatelessWidget {
  const QrInputText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        QrFormField(label: 'Enter text'),
      ],
    );
  }
}

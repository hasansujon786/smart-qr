import 'package:flutter/material.dart';
import './wigets.dart';

class QrInputTel extends StatelessWidget {
  const QrInputTel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        QrFormField(label: 'Enter your number'),
      ],
    );
  }
}


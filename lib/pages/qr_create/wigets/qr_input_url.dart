import 'package:flutter/material.dart';
import './wigets.dart';

class QrInputUrl extends StatelessWidget {
  const QrInputUrl({
    Key? key,
    required this.updateFormData,
  }) : super(key: key);

  final Function updateFormData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QrFormField(
          label: 'Enter website URL',
          hintText: 'Enter URL here',
          isLastField: true,
          onSaved: (val) {
            updateFormData('url', val);
          },
        ),
      ],
    );
  }
}

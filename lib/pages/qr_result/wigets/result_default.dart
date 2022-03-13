import 'package:barcode_parser/barcode_parser.dart';
import 'package:flutter/material.dart';

import './wigets.dart';

class ResultDefault extends StatelessWidget {
  const ResultDefault(this.barcodeText, {Key? key}) : super(key: key);
  final Barcode barcodeText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RItem(title: '', content: barcodeText.rawValue),
      ],
    );
  }
}

import 'package:barcode_parser/barcode_parser.dart';
import 'package:flutter/material.dart';

import './wigets.dart';

class ResultPhone extends StatelessWidget {
  const ResultPhone(this.barcodePhone, {Key? key}) : super(key: key);
  final BarcodePhone barcodePhone;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RItem(title: 'Number', content: barcodePhone.number ?? ''),
      ],
    );
  }
}

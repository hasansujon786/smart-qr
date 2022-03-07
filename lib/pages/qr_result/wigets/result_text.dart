import 'package:barcode_parser/barcode_parser.dart';
import 'package:flutter/material.dart';

class ResultText extends StatelessWidget {
  const ResultText(this.barcodeText, {Key? key}) : super(key: key);
  final BarcodeText barcodeText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(barcodeText.rawValue),
      ],
    );
  }
}


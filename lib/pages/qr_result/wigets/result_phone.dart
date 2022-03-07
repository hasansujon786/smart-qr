import 'package:barcode_parser/barcode_parser.dart';
import 'package:flutter/material.dart';

class ResultPhone extends StatelessWidget {
  const ResultPhone(this.barcodePhone, {Key? key}) : super(key: key);
  final BarcodePhone barcodePhone;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(barcodePhone.number ?? ''),
      ],
    );
  }
}

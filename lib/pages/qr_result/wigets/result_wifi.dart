import 'package:barcode_parser/barcode_parser.dart';
import 'package:flutter/material.dart';

class ResultWifi extends StatelessWidget {
  const ResultWifi(this.barcodeWifi, {Key? key}) : super(key: key);
  final BarcodeWifi barcodeWifi;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(barcodeWifi.ssid ?? ''),
        Text(barcodeWifi.password ?? ''),
      ],
    );
  }
}

import 'package:barcode_parser/barcode_parser.dart';
import 'package:flutter/material.dart';

import './wigets.dart';

class ResultWifi extends StatelessWidget {
  const ResultWifi(this.barcodeWifi, {Key? key}) : super(key: key);
  final BarcodeWifi barcodeWifi;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RItem(title: 'SSID', content: barcodeWifi.ssid ?? ''),
        RItem(title: 'Password', content: barcodeWifi.password ?? ''),
      ],
    );
  }
}

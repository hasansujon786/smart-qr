import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:barcode_parser/barcode_parser.dart';
import 'package:scan/scan.dart';

import '../../../domain/qr_tools/qr_tools.dart' as qr_tools;
import '../pages/qr_result/qr_result.dart';

String getDate(datetime) {
  return formatDate(datetime, [h, ':', nn, ' ', am, '  ', dd, '/', m, '/', yyyy]);
}

bool isDarkMode(BuildContext context) {
  return MediaQuery.of(context).platformBrightness == Brightness.dark;
}

bool isLightMode(BuildContext context) {
  return MediaQuery.of(context).platformBrightness == Brightness.light;
}

showQrResultPage(context, {required String data, required ScanController controller, bool filterProductQr = true}) {
  final Barcode qrcode = qr_tools.parse(data);
  if (filterProductQr && qrcode.valueType == BarcodeValueType.product) {
    // FloatingSnackBar.showFloatingSnackBar(context, message: 'Found Product QR Code', width: 180);
    controller.resume();
    return;
  }

  Navigator.pushNamed(
    context,
    QrResultPage.routeName,
    arguments: qrcode,
  ).then((value) {
    controller.resume();
  });
}

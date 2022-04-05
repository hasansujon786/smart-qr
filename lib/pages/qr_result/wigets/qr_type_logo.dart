import 'package:barcode_parser/barcode_parser.dart';
import 'package:flutter/material.dart';
import 'package:smart_qr/models/models.dart';

class QrTypeLogo extends StatelessWidget {
  final QrType qrType;
  const QrTypeLogo(this.qrType, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey[300],
        boxShadow: [BoxShadow(color: Colors.grey.shade400, blurRadius: 3)],
      ),
      child: Center(
        child: FittedBox(
          child: Text(getQrIcon(qrType.type), style: const TextStyle(fontSize: 32)),
        ),
      ),
    );
  }
}

String getQrIcon(BarcodeValueType valueType) {
  switch (valueType) {
    // case BarcodeValueType.contactInfo:
    // case BarcodeValueType.location:
    // case BarcodeValueType.calendarEvent:
    // case BarcodeValueType.driverLicense:

    // icon: Icons.description,
    // icon: Icons.phone_iphone,
    // icon: Icons.wifi,
    // icon: Icons.message,
    // icon: Icons.email,
    // icon: Icons.mouse,

    case BarcodeValueType.email:
      return 'Email';
    case BarcodeValueType.sms:
      return 'SMS';
    case BarcodeValueType.product:
      return 'Product';
    case BarcodeValueType.url:
      return 'URL';
    case BarcodeValueType.wifi:
      return 'Wifi';
    case BarcodeValueType.phone:
      return 'Tel';
    case BarcodeValueType.text:
      return 'Text';
    default:
      return 'QR';
  }
}

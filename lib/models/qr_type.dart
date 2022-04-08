import 'package:barcode_parser/barcode_parser.dart';
import 'package:flutter/material.dart';

import '../../../config/config.dart';

class QrType {
  const QrType({
    required this.name,
    required this.type,
    required this.icon,
    required this.color,
  });

  final String name;
  final BarcodeValueType type;
  final IconData icon;
  final Color? color;
}

const unknownQrType = QrType(
  type: BarcodeValueType.unknown,
  name: 'QR',
  icon: Icons.info_outline,
  color: Colors.teal,
);

final qrCodeTypes = [
  QrType(
    type: BarcodeValueType.text,
    name: 'Text',
    icon: Icons.description_outlined,
    color: Color(hexColor('#B485FE')),
  ),
  QrType(
    type: BarcodeValueType.phone,
    name: 'Phone Number',
    icon: Icons.phone_iphone_outlined,
    color: Color(hexColor('#FF9B97')),
  ),
  QrType(
    type: BarcodeValueType.wifi,
    name: 'Wi-Fi',
    icon: Icons.wifi_outlined,
    color: Color(hexColor('#F2CD41')),
  ),
  QrType(
    type: BarcodeValueType.sms,
    name: 'SMS',
    icon: Icons.sms_outlined,
    color: Color(hexColor('#75CFFE')),
  ),
  QrType(
    type: BarcodeValueType.email,
    name: 'Email',
    icon: Icons.email_outlined,
    color: Color(hexColor('#64DC9B')),
  ),
  QrType(
    type: BarcodeValueType.url,
    name: 'Website URL',
    icon: Icons.mouse_outlined,
    color: Color(hexColor('#6ADCCC')),
  ),
];

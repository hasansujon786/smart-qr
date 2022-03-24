import 'package:barcode_parser/barcode_parser.dart';
import 'package:flutter/material.dart';

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

final qrCodeTypes = [
  QrType(
    type: BarcodeValueType.text,
    name: 'Text',
    icon: Icons.description,
    color: Colors.lime.shade200,
  ),
  QrType(
    type: BarcodeValueType.phone,
    name: 'Phone number',
    icon: Icons.phone_iphone,
    color: Colors.green.shade200,
  ),
  QrType(
    type: BarcodeValueType.wifi,
    name: 'Wifi',
    icon: Icons.wifi,
    color: Colors.amber.shade200,
  ),
  QrType(
    type: BarcodeValueType.sms,
    name: 'SMS',
    icon: Icons.sms,
    color: Colors.pink.shade200,
  ),
  QrType(
    type: BarcodeValueType.email,
    name: 'Email',
    icon: Icons.email,
    color: Colors.red.shade200,
  ),
  QrType(
    type: BarcodeValueType.url,
    name: 'Website URL',
    icon: Icons.mouse,
    color: Colors.indigo.shade200,
  ),
];

import 'package:barcode_parser/barcode_parser.dart';
import 'package:flutter/material.dart';

class QrType {
  const QrType({
    required this.name,
    required this.type,
    required this.icon,
  });

  final String name;
  final BarcodeValueType type;
  final IconData icon;
}

const qrCodeTypes = [
  QrType(
    type: BarcodeValueType.text,
    name: 'Text',
    icon: Icons.description,
  ),
  QrType(
    type: BarcodeValueType.phone,
    name: 'Phone',
    icon: Icons.phone_iphone,
  ),
  QrType(
    type: BarcodeValueType.wifi,
    name: 'Wifi',
    icon: Icons.wifi,
  ),
  QrType(
    type: BarcodeValueType.sms,
    name: 'SMS',
    icon: Icons.message,
  ),
  QrType(
    type: BarcodeValueType.email,
    name: 'Email',
    icon: Icons.email,
  ),
  QrType(
    type: BarcodeValueType.url,
    name: 'Url',
    icon: Icons.mouse,
  ),
];

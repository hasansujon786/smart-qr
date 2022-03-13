import 'package:flutter/material.dart';

import '../../../domain/qr_tools/qr_tools.dart';

class QrType {
  const QrType({
    required this.name,
    required this.type,
    required this.icon,
  });

  final String name;
  final QrcodeValueType type;
  final IconData icon;
}

const qrCodeTypes = [
  QrType(
    type: QrcodeValueType.text,
    name: 'Text',
    icon: Icons.description,
  ),
  QrType(
    type: QrcodeValueType.phone,
    name: 'Phone',
    icon: Icons.phone_iphone,
  ),
  QrType(
    type: QrcodeValueType.wifi,
    name: 'Wifi',
    icon: Icons.wifi,
  ),
];

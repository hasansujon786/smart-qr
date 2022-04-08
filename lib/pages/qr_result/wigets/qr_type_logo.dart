import 'package:flutter/material.dart';

import '../../../config/config.dart';
import '../../../models/models.dart';
import '../../../ui/ui.dart';

class QrTypeLogo extends StatelessWidget {
  final QrType qrType;
  const QrTypeLogo({Key? key, QrType? qrType})
      : qrType = qrType ?? unknownQrType,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: WrapperCard(
        blurRadius: 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            QrIcon(
              color: qrType.color,
              icon: qrType.icon,
            ),
            const SizedBox(height: 6),
            FittedBox(
              child: Text(
                qrType.name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Palette.text),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// String getQrIcon(BarcodeValueType valueType) {
//   switch (valueType) {
//     // case BarcodeValueType.contactInfo:
//     // case BarcodeValueType.location:
//     // case BarcodeValueType.calendarEvent:
//     // case BarcodeValueType.driverLicense:

//     // icon: Icons.description,
//     // icon: Icons.phone_iphone,
//     // icon: Icons.wifi,
//     // icon: Icons.message,
//     // icon: Icons.email,
//     // icon: Icons.mouse,

//     case BarcodeValueType.email:
//       return 'Email';
//     case BarcodeValueType.sms:
//       return 'SMS';
//     case BarcodeValueType.product:
//       return 'Product';
//     case BarcodeValueType.url:
//       return 'URL';
//     case BarcodeValueType.wifi:
//       return 'Wifi';
//     case BarcodeValueType.phone:
//       return 'Tel';
//     case BarcodeValueType.text:
//       return 'Text';
//     default:
//       return 'QR';
//   }
// }

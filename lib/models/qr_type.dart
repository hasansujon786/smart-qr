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
  // QrType(
  //   type: BarcodeValueType.contactInfo,
  //   name: 'Contact',
  //   icon: Icons.contacts,
  //   color: Color(hexColor('#6ADCCC')),
  // ),
];

// url,
// email,
// sms,
// wifi,
// phone,
// text,

// location,              geo:lat,long,alt
// contactInfo,
// unknown,
// product,
// calendarEvent,
// driverLicense,
// whatsapp,
// twitter,
// instagram,
// linkedin,
// facebook,


// BEGIN:VCARD
// VERSION:3.0
// N:;Apu;;;
// FN:Apu
// TEL;TYPE=CELL:016-860-61547
// TEL;TYPE=HOME:017-996-36991
// TEL;TYPE=HOME:+8801974518582
// NICKNAME:Sister
// NICKNAME:Sister
// BDAY:1990-04-08
// END:VCARD


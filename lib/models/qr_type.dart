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

  static QrType findByValueType(BarcodeValueType type) {
    return allKnownQrTypes.firstWhere((e) => e.type == type, orElse: () => unknownQrType);
  }
}

const unknownQrType = QrType(
  type: BarcodeValueType.unknown,
  name: 'Unknown',
  icon: Icons.info_outline,
  color: Colors.teal,
);

final supportedCreateQrTypes = [
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
  QrType(
    type: BarcodeValueType.location,
    name: 'Location',
    icon: Icons.location_pin,
    color: Color(hexColor('#B485FE')),
  ),
];

final allKnownQrTypes = [
  ...supportedCreateQrTypes,
  unknownQrType,
  QrType(
    type: BarcodeValueType.contactInfo,
    name: 'Contact',
    icon: Icons.person,
    color: Color(hexColor('#6ADCCC')),
  ),
  QrType(
    type: BarcodeValueType.product,
    name: 'Product',
    icon: Icons.shopping_bag_outlined,
    color: Color(hexColor('#6ADCCC')),
  ),
  QrType(
    type: BarcodeValueType.calendarEvent,
    name: 'Event',
    icon: Icons.event_outlined,
    color: Color(hexColor('#6ADCCC')),
  ),
  QrType(
    type: BarcodeValueType.driverLicense,
    name: 'Driver License',
    icon: Icons.car_rental,
    color: Color(hexColor('#6ADCCC')),
  ),
  QrType(
    type: BarcodeValueType.whatsapp,
    name: 'WhatsApp',
    icon: Icons.chat_bubble, // TODO: update this icon
    color: Color(hexColor('#6ADCCC')),
  ),
  QrType(
    type: BarcodeValueType.facebook,
    name: 'Facebook',
    icon: Icons.facebook,
    color: Color(hexColor('#6ADCCC')),
  ),
  QrType(
    type: BarcodeValueType.instagram,
    name: 'Instagram',
    icon: Icons.mouse_outlined,
    color: Color(hexColor('#6ADCCC')),
  ),
  QrType(
    type: BarcodeValueType.twitter,
    name: 'Twitter',
    icon: Icons.mouse_outlined,
    color: Color(hexColor('#6ADCCC')),
  ),
  QrType(
    type: BarcodeValueType.linkedin,
    name: 'Linkedin',
    icon: Icons.mouse_outlined,
    color: Color(hexColor('#6ADCCC')),
  ),
];

// location,
// url,
// email,
// sms,
// wifi,
// phone,
// text,

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


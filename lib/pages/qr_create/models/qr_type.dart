import 'package:smart_qr/domain/qr_tools/qr_tools.dart';

class QrType {
  final String name;
  final QrcodeValueType type;
  const QrType({
    required this.name,
    required this.type,
  });
}

const qrCodeTypes = [
  QrType(
    type: QrcodeValueType.text,
    name: 'Text',
  ),
  QrType(
    type: QrcodeValueType.phone,
    name: 'Phone',
  ),
  QrType(
    type: QrcodeValueType.wifi,
    name: 'Wifi',
  ),
];

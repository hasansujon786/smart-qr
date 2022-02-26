class QrType {
  final String name;
  final String type;
  const QrType({
    required this.name,
    required this.type,
  });
}

const qrCodeTypes = [
  QrType(
    type: 'text',
    name: 'Text',
  ),
  QrType(
    type: 'tel',
    name: 'Telephone',
  ),
  QrType(
    type: 'wifi',
    name: 'Wifi',
  ),
];

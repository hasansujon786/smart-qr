String textToQrCode(qrType, valueObj) {
  switch (qrType) {
    case 'wifi':
      final ssid = valueObj['ssid'];
      final type = valueObj['type'];
      final pass = valueObj['pass'];
      return 'WIFI:S:$ssid;T:$type;P:$pass;;';
    case 'tel':
      return 'tel:' + valueObj['tel'];
    case 'text':
    default:
      return valueObj['text'];
  }
}

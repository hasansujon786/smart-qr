String textToQrCode(qrType, valueObj) {
  switch (qrType) {
    case 'tel':
    case 'text':
    default:
      return valueObj['text'];
  }
}

import 'dart:io';

import 'package:flutter_qr_scan/flutter_qr_scan.dart';
import 'package:image_picker/image_picker.dart';

parseFromImage(callback) async {
  var image = await ImagePicker().getImage(source: ImageSource.gallery);
  if (image == null) return null;
  var code = await FlutterQrReader.imgScan(File(image.path));
  callback(code, 'parsed_img');
}


String convertTextToQrCode(qrType, valueObj) {
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

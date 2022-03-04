import 'dart:io';

import 'package:flutter_qr_scan/flutter_qr_scan.dart';
import 'package:image_picker/image_picker.dart';

parseFromImage(callback) async {
  var image = await ImagePicker().getImage(source: ImageSource.gallery);
  if (image == null) return null;
  var code = await FlutterQrReader.imgScan(File(image.path));
  callback(code, 'parsed_img');
}


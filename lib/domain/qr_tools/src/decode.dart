import 'package:images_picker/images_picker.dart';
import 'package:scan/scan.dart';

Future<String?> decodeFromImage() async {
  // var image = await ImagePicker().getImage(source: ImageSource.gallery);
  // if (image == null) return null;
  // var code = await FlutterQrReader.imgScan(File(image.path));
  // callback(code, 'parsed_img');

  List<Media>? img = await ImagesPicker.pick();
  if (img == null) return null;
  return await Scan.parse(img[0].path);
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

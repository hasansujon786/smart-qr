import 'package:barcode_parser/barcode_parser.dart';
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

/// Parse qrcode from raw value
Barcode parse(String rawValue) {
  BarcodeParser barcodeParser = BarcodeParser();
  return barcodeParser.parse(rawValue);
}


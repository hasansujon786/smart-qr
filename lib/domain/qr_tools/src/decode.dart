import 'package:barcode_parser/barcode_parser.dart';
import 'package:images_picker/images_picker.dart';
import 'package:scan/scan.dart';

Future<String?> decodeFromImage(Media img) async {
  return await Scan.parse(img.path);
}

/// Parse qrcode from raw value
Barcode parse(String rawValue) {
  BarcodeParser barcodeParser = BarcodeParser();
  return barcodeParser.parse(rawValue);
}

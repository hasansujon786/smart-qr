import 'package:barcode_parser/barcode_parser.dart';
import 'package:images_picker/images_picker.dart';
// import 'package:scan/scan.dart';

Future<String?> decodeFromImage(Media img) async {
  return "get_path"; // TODO: replace snan
}

/// Parse qrcode from raw value
Barcode parse(String rawValue) {
  BarcodeParser barcodeParser = BarcodeParser();
  return barcodeParser.parse(rawValue);
}

# smart_qr
Image.network(
              'https://tinyurl.com/2p8zr2ze',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            )

TODO: check models from barcodeParser
import 'package:barcode_parser/models.dart';


# Useful CLI commands
## Update hive classes
flutter packages pub run build_runner build
## Update icon & splash screen
flutter pub run icons_launcher:main
flutter pub run flutter_native_splash:create

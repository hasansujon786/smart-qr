import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

Future<void> writeToFile(ByteData data, String path) async {
  final buffer = data.buffer;
  await File(path).writeAsBytes(buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
}

Future<String> createQrPicture(String qrText, Color? foregroundColor, Color? backgroundColor) async {
  // https://medium.com/codex/exporting-qr-codes-in-flutter-dd30220fcba4
  final qrValidationResult = QrValidator.validate(
    data: qrText,
    version: QrVersions.auto,
    errorCorrectionLevel: QrErrorCorrectLevel.L,
  );

  if (qrValidationResult.status != QrValidationStatus.valid) {
    // qrValidationResult.error
    return '';
  }
  final qrCode = qrValidationResult.qrCode;
  if (qrCode == null) {
    return '';
  }

  final painter = QrPainter.withQr(
    qr: qrCode,
    color: foregroundColor,
    emptyColor: backgroundColor,
    gapless: true,
    embeddedImageStyle: null,
    embeddedImage: null,
  );

  Directory tempDir = await getTemporaryDirectory();
  String tempPath = tempDir.path;
  final ts = DateTime.now().millisecondsSinceEpoch.toString();
  String path = '$tempPath/$ts.png';

  final picData = await painter.toImageData(2048, format: ui.ImageByteFormat.png);
  if (picData == null) {
    return '';
  }
  await writeToFile(picData, path);
  return path;
}

void downloadQrPicture(String qrText, BuildContext context, Color? foregroundColor, Color? backgroundColor) async {
  String path = await createQrPicture(qrText, foregroundColor, backgroundColor);

  final success = await GallerySaver.saveImage(path);
  if (success == null) return;

  print('======================');
  print('downloaded..');
  print('======================');
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: success ? const Text('Image saved to Gallery') : const Text('Error saving image'),
  ));
}

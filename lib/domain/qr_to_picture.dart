import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

const imageSize = 2048.00;

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

  final image = await QrPainter.withQr(
    qr: qrCode,
    color: foregroundColor,
    emptyColor: backgroundColor,
    gapless: true,
    embeddedImageStyle: null,
    embeddedImage: null,
  ).toImage(imageSize, format: ui.ImageByteFormat.png);

  ByteData? picData = await CodePainter(qrImage: image, color: backgroundColor).toImageData(imageSize);

  if (picData == null) {
    return '';
  }

  Directory tempDir = await getTemporaryDirectory();
  String tempPath = tempDir.path;
  final ts = DateTime.now().millisecondsSinceEpoch.toString();
  String path = '$tempPath/$ts.png';

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

class CodePainter extends CustomPainter {
  final double margin;
  final ui.Image qrImage;
  late Paint _paint;
  final Color? color;

  CodePainter({required this.qrImage, this.margin = 10, this.color}) {
    _paint = Paint()
      ..color = color ?? Colors.red
      ..style = ui.PaintingStyle.fill;
  }

  //***************************** PUBLIC METHODS *************************** //
  @override
  void paint(Canvas canvas, Size size) {
    // Draw everything in white.
    final rect = Rect.fromPoints(Offset.zero, Offset(size.width, size.height));
    canvas.drawRect(rect, _paint);

    // Draw the image in the center.
    canvas.drawImage(qrImage, Offset(margin, margin), Paint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  ui.Picture toPicture(double size) {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    paint(canvas, Size(size, size));
    return recorder.endRecording();
  }

  Future<ui.Image> toImage(double size, {ui.ImageByteFormat format = ui.ImageByteFormat.png}) async {
    return await toPicture(size).toImage(size.toInt(), size.toInt());
  }

  Future<ByteData?> toImageData(double originalSize, {ui.ImageByteFormat format = ui.ImageByteFormat.png}) async {
    final image = await toImage(originalSize + margin * 2, format: format);
    return image.toByteData(format: format);
  }
}

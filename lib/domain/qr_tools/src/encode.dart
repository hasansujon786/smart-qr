import 'dart:io';
import 'dart:ui' as ui;
import 'package:barcode_parser/barcode_parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../qr_tools.dart';

const imageSize = 1080.00;
const imageMargin = 10.00;

Future<bool?> downloadQrAsPng(String qrText, {Color? fg, Color? bg, required String albumName}) async {
  String? path = await _createQrPicture(qrText, fg, bg);
  if (path == null) return false;

  return await GallerySaver.saveImage(path, albumName: albumName);
}

Future<void> _writeToFile(ByteData data, String path) async {
  final buffer = data.buffer;
  await File(path).writeAsBytes(buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
}

Future<String?> _createQrPicture(String qrText, Color? foregroundColor, Color? backgroundColor) async {
  // https://medium.com/codex/exporting-qr-codes-in-flutter-dd30220fcba4
  final qrValidationResult = QrValidator.validate(
    data: qrText,
    version: QrVersions.auto,
    errorCorrectionLevel: QrErrorCorrectLevel.L,
  );

  if (qrValidationResult.status != QrValidationStatus.valid) {
    // qrValidationResult.error
    return null;
  }
  final qrCode = qrValidationResult.qrCode;
  if (qrCode == null) {
    return null;
  }

  final image = await QrPainter.withQr(
    qr: qrCode,
    color: foregroundColor,
    emptyColor: backgroundColor,
    gapless: true,
    embeddedImageStyle: null,
    embeddedImage: null,
  ).toImage(imageSize, format: ui.ImageByteFormat.png);

  ByteData? picData = await CodePainter(
    qrImage: image,
    color: backgroundColor,
    margin: imageMargin,
  ).toImageData(imageSize);

  if (picData == null) {
    return null;
  }

  Directory tempDir = await getTemporaryDirectory();
  String tempPath = tempDir.path;
  final ts = DateTime.now().millisecondsSinceEpoch.toString();
  String path = '$tempPath/$ts.png';

  await _writeToFile(picData, path);
  return path;
}

/// Adds margin to qr img
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

String encodeToBarCode(BarcodeValueType qrcodeType, Map formState) {
  switch (qrcodeType) {
    case BarcodeValueType.location:
      return GenerageBarcodeLocation(
        latitude: double.parse(formState['lat']),
        longitude: double.parse(formState['long']),
      ).toString();

    case BarcodeValueType.url:
      return formState['url'];

    case BarcodeValueType.email:
      return MeCard.email(
        email: formState['email'],
        message: formState['message'],
        subject: formState['subject'],
      ).toString();

    case BarcodeValueType.sms:
      return GenerateSms(
        phoneNumber: formState['phoneNumber'],
        message: formState['message'],
      ).toString();

    case BarcodeValueType.wifi:
      return MeCard.wifi(
        ssid: formState['ssid'],
        password: formState['pass'],
        type: formState['type'],
      ).toString();

    case BarcodeValueType.phone:
      return GeneratePhoneNumber(
        phoneNumber: formState['tel'],
      ).toString();

    case BarcodeValueType.text:
    default:
      return formState['text'];
  }
}

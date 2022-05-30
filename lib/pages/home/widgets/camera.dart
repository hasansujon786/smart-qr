import 'package:barcode_parser/barcode_parser.dart';
import 'package:flutter/material.dart';
import 'package:scan/scan.dart';

import '../../../domain/qr_tools/qr_tools.dart' as qr_tools;
import '../../qr_result/qr_result.dart';
import './widgets.dart';

class Camera extends StatelessWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScanController _controller = ScanController();

    void onCapture(String data) {
      final Barcode qrcode = qr_tools.parse(data);
      if (qrcode.valueType == BarcodeValueType.product) {
        // FloatingSnackBar.showFloatingSnackBar(context, message: 'Found Product QR Code', width: 180);
        _controller.resume();
        return;
      }

      Navigator.pushNamed(
        context,
        QrResultPage.routeName,
        arguments: qrcode,
      ).then((value) {
        _controller.resume();
      });
    }

    return Stack(
      children: [
        ScanView(
          controller: _controller,
          scanAreaScale: .7,
          scanLineColor: Colors.red.shade400,
          onCapture: onCapture,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 80),
            child: CameraControls(controller: _controller),
          ),
        ),
      ],
    );
  }
}

// import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:scan/scan.dart';

import '../../qr_result/qr_result.dart';
import './widgets.dart';

class Camera extends StatelessWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScanController _controller = ScanController();

    void onCapture(data) {
      Navigator.pushNamed(context, QrResultPage.routeName, arguments: {
        'qrcodeRawValue': data,
      }).then((value) {
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

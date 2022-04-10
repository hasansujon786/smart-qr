// import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:scan/scan.dart';

import '../../../domain/qr_tools/qr_tools.dart' as qr_tools;
import '../../qr_result/qr_result.dart';
import './widgets.dart';

class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> with WidgetsBindingObserver {
  final ScanController _controller = ScanController();

  void openGalery() async {
    // TODO: fix flush button
    // _controller.toggleTorchMode();
    final reslult = await qr_tools.decodeFromImage();
    if (reslult == null) return;

    _controller.pause();
    Navigator.pushNamed(context, QrResultPage.routeName, arguments: {
      'qrcodeRawValue': reslult,
    }).then((value) {
      _controller.resume();
    });
  }

  void toggleFlash(isFlashOn) {
    _controller.toggleTorchMode();
  }

  @override
  Widget build(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    // var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;
    // var scanArea = (width < 400 || height < 400) ? 250.0 : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller

    return Stack(
      children: [
        ScanView(
          controller: _controller,
          scanAreaScale: .7,
          scanLineColor: Colors.red.shade400,
          onCapture: (data) {
            Navigator.pushNamed(context, QrResultPage.routeName, arguments: {
              'qrcodeRawValue': data,
            }).then((value) {
              _controller.resume();
            });
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 80),
            child: ButtonsControlls(onOpenGalery: openGalery, onToggleFlash: toggleFlash),
          ),
        ),
      ],
    );
  }

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    _controller.pause();
    Future.delayed(const Duration(seconds: 1), (() {
      _controller.resume();
    }));
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    _controller.pause();
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _controller.pause();
      print('paused =================================');
    } else if (state == AppLifecycleState.resumed) {
      _controller.resume();
      print('resumed =================================');
    }
    // else if (state == AppLifecycleState.inactive) {}
    super.didChangeAppLifecycleState(state);
  }
}

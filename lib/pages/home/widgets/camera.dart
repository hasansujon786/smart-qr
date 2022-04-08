// import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:scan/scan.dart';

import '../../../domain/qr_tools/qr_tools.dart' as qr_tools;
import '../../../ui/ui.dart';
import '../../qr_result/qr_result.dart';

class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  final ScanController controller = ScanController();

  @override
  Widget build(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var scanArea = (width < 400 || height < 400) ? 250.0 : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return Stack(
      children: [
        ScanView(
          controller: controller,
          scanAreaScale: .7,
          scanLineColor: Colors.red.shade400,
          onCapture: (data) {
            Navigator.pushNamed(context, QrResultPage.routeName, arguments: {
              'qrcodeRawValue': data,
            }).then((value) {
              controller.resume();
            });
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 80),
            child: ButtonsControlls(toggleFlash: () {
              controller.toggleTorchMode();
            }),
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
    controller.pause();
    Future.delayed(const Duration(seconds: 1), (() {
      controller.resume();
    }));
  }

  @override
  void dispose() {
    controller.pause();
    super.dispose();
  }
}

class ButtonsControlls extends StatefulWidget {
  final Function toggleFlash;
  const ButtonsControlls({
    Key? key,
    required this.toggleFlash,
  }) : super(key: key);

  @override
  _ButtonsControllsState createState() => _ButtonsControllsState();
}

class _ButtonsControllsState extends State<ButtonsControlls> {
  bool isFlashOn = false;

  @override
  Widget build(BuildContext context) {
    return GlassMorphism(
      borderRadius: 20,
      blur: 10,
      opacity: 0.2,
      child: SizedBox(
        width: 145,
        height: 48,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                widget.toggleFlash();
                setState(() => isFlashOn = !isFlashOn);
              },
              icon: Icon(isFlashOn ? Icons.flash_on : Icons.flash_off, color: Colors.white, size: 24),
            ),
            Text('|', style: TextStyle(color: Colors.white.withOpacity(0.1), fontSize: 22)),
            IconButton(
              onPressed: () {
                // TODO: disable camera before scan
                qr_tools.decodeFromImage().then((reslult) {
                  if (reslult == null) return;
                  Navigator.pushNamed(context, QrResultPage.routeName, arguments: {
                    'qrcodeRawValue': reslult,
                  });
                });
              },
              icon: const Icon(Icons.image_outlined, color: Colors.white, size: 24),
            )
          ],
        ),
      ),
    );
  }
}

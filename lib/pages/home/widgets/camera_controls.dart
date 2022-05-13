import 'package:flutter/material.dart';
import 'package:scan/scan.dart';

import '../../../domain/qr_tools/qr_tools.dart' as qr_tools;
import '../../qr_result/qr_result.dart';
import '../../../ui/ui.dart';

class CameraControls extends StatefulWidget {
  final ScanController controller;
  const CameraControls({Key? key, required this.controller}) : super(key: key);

  @override
  _CameraControlsState createState() => _CameraControlsState();
}

class _CameraControlsState extends State<CameraControls> with WidgetsBindingObserver {
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
                widget.controller.toggleTorchMode();
                setState(() => isFlashOn = !isFlashOn);
              },
              icon: Icon(isFlashOn ? Icons.flash_on : Icons.flash_off, color: Colors.white, size: 24),
            ),
            Text('|', style: TextStyle(color: Colors.white.withOpacity(0.1), fontSize: 22)),
            IconButton(
              onPressed: () async {
                // toggle flush & pause camera
                if (isFlashOn) {
                  widget.controller.toggleTorchMode();
                  setState(() => isFlashOn = false);
                }
                widget.controller.pause();

                // if no img is selected
                final reslult = await qr_tools.decodeFromImage();
                if (reslult == null) return;

                // show result page
                widget.controller.pause();
                Navigator.pushNamed(context, QrResultPage.routeName, arguments: {
                  'qrcodeRawValue': reslult,
                }).then((value) {
                  widget.controller.resume();
                });
              },
              icon: const Icon(Icons.image_outlined, color: Colors.white, size: 24),
            )
          ],
        ),
      ),
    );
  }

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    widget.controller.pause();
    Future.delayed(const Duration(seconds: 1), (() {
      widget.controller.resume();
    }));
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    widget.controller.pause();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      if (isFlashOn) {
        widget.controller.toggleTorchMode();
        setState(() => isFlashOn = false);
      }
      widget.controller.pause();
      print('paused =================================');
    } else if (state == AppLifecycleState.resumed) {
      widget.controller.resume();
      print('resumed =================================');
    }
    // else if (state == AppLifecycleState.inactive) {}
    super.didChangeAppLifecycleState(state);
  }
}

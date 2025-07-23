import 'package:flutter/material.dart';
import 'package:images_picker/images_picker.dart';
// import 'package:scan/scan.dart';
import 'package:smart_qr/config/config.dart';

import '../../../domain/qr_tools/qr_tools.dart' as qr_tools;
import '../../../ui/ui.dart';

class CameraControls extends StatefulWidget {
  final dynamic controller;
  const CameraControls({Key? key, required this.controller}) : super(key: key);

  @override
  _CameraControlsState createState() => _CameraControlsState();
}

class _CameraControlsState extends State<CameraControls> with WidgetsBindingObserver {
  bool isFlashOn = false;

  void openImgPicker() async {
    // trun off flush & pause camera
    if (isFlashOn) switchFlashOff();
    widget.controller.pause();

    List<Media>? img = await ImagesPicker.pick();
    // if no img is selected
    if (img == null) return;

    final reslult = await qr_tools.decodeFromImage(img[0]);
    if (reslult == null) {
      FloatingSnackBar.showFloatingSnackBar(context, message: 'No QR found.');
      return;
    }

    // show result page
    widget.controller.pause();
    showQrResultPage(context, data: reslult, controller: widget.controller, filterProductQr: false);
  }

  void toggleFlash() {
    widget.controller.toggleTorchMode();
    setState(() => isFlashOn = !isFlashOn);
  }

  void switchFlashOff() {
    widget.controller.toggleTorchMode();
    setState(() => isFlashOn = false);
  }

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
            buildIconButton(isFlashOn ? Icons.flash_on : Icons.flash_off, toggleFlash),
            Text('|', style: TextStyle(color: Colors.white.withOpacity(0.1), fontSize: 22)),
            buildIconButton(Icons.image_outlined, openImgPicker)
          ],
        ),
      ),
    );
  }

  Widget buildIconButton(IconData icon, VoidCallback onPress) {
    return IconButton(onPressed: onPress, icon: Icon(icon, color: Colors.white, size: 24));
  }

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  // @override
  // void reassemble() {
  //   super.reassemble();
  //   widget.controller.pause();
  //   Future.delayed(const Duration(seconds: 1), (() {
  //     widget.controller.resume();
  //   }));
  // }

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

  // Crontroll the camera while the app goes to background
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      if (isFlashOn) switchFlashOff();
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

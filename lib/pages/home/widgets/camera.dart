// import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:scan/scan.dart';
import 'package:smart_qr/pages/qr_result/view/qr_result.page.dart';

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
          scanLineColor: Colors.red,
          onCapture: (data) {
            Navigator.pushNamed(context, QrResultPage.routeName, arguments: {
              'code': data,
            }).then((value) {
              controller.resume();
            });
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconButtonRounded(
                  const Icon(Icons.flash_on, color: Colors.white),
                  onPressed: () {
                    controller.toggleTorchMode();
                  },
                ),
              ],
            ),
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

Widget iconButtonRounded(icon, {required onPressed}) {
  // TODO: Glassmorphism Button
  // https://www.youtube.com/watch?v=ZVW2NR52KLc&list=TLPQMTkwMjIwMjLv1wY_Upj8Yg&index=2
  return TextButton(
    style: TextButton.styleFrom(
      fixedSize: const Size(56, 56),
      backgroundColor: Colors.redAccent,
      shape: const CircleBorder(),
    ),
    child: icon,
    onPressed: onPressed,
  );
}

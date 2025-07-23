import 'package:flutter/material.dart';
// import 'package:scan/scan.dart';
// import 'package:smart_qr/config/config.dart';

// import './widgets.dart';

class Camera extends StatelessWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final ScanController _controller = ScanController();

    return const Center(
      child: Text("ScanView"),
    );

    // return Stack(
    //   children: [
    //     ScanView(
    //       controller: _controller,
    //       scanAreaScale: .7,
    //       scanLineColor: Colors.red.shade400,
    //       onCapture: (String data) {
    //         showQrResultPage(context, data: data, controller: _controller);
    //       },
    //     ),
    //     Align(
    //       alignment: Alignment.bottomCenter,
    //       child: Padding(
    //         padding: const EdgeInsets.only(bottom: 80),
    //         child: CameraControls(controller: _controller),
    //       ),
    //     ),
    //   ],
    // );
  }
}

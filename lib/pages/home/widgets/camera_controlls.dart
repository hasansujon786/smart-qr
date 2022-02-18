import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../qr_decode/qr_decode.dart';

class CameraController extends StatefulWidget {
  const CameraController(this.controller, {Key? key}) : super(key: key);

  final QRViewController? controller;

  @override
  State<CameraController> createState() => _CameraControllerState();
}

class _CameraControllerState extends State<CameraController> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            /* if (result != null) */
            /*   Text( */
            /*       'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}') */
            /* else */
            /*   const Text('Scan a code'), */
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () async {
                      await widget.controller?.toggleFlash();
                      setState(() {});
                    },
                    child: FutureBuilder(
                      future: widget.controller?.getFlashStatus(),
                      builder: (context, snapshot) {
                        return Text('Flash: ${snapshot.data}');
                      },
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () async {
                      await widget.controller?.flipCamera();
                      setState(() {});
                    },
                    child: FutureBuilder(
                      future: widget.controller?.getCameraInfo(),
                      builder: (context, snapshot) {
                        if (snapshot.data != null) {
                          return Text('Camera facing ${describeEnum(snapshot.data!)}');
                        } else {
                          return const Text('loading');
                        }
                      },
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.restorablePushNamed(context, QrDecode.routeName);
                    },
                    child: const Text('Image Gallery'),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Container(
//   margin: const EdgeInsets.all(8),
//   child: ElevatedButton(
//     onPressed: () async {
//       await widget.controller?.pauseCamera();
//     },
//     child: const Text('pause', style: TextStyle(fontSize: 20)),
//   ),
// ),
// Container(
//   margin: const EdgeInsets.all(8),
//   child: ElevatedButton(
//     onPressed: () async {
//       await widget.controller?.resumeCamera();
//     },
//     child: const Text('resume', style: TextStyle(fontSize: 20)),
//   ),
// ),

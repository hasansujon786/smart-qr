import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class CameraController extends StatefulWidget {
  const CameraController(this.controller, {Key? key}) : super(key: key);

  final QRViewController? controller;

  @override
  State<CameraController> createState() => _CameraControllerState();
}

class _CameraControllerState extends State<CameraController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          roundedIcon(
            FutureBuilder(
              future: widget.controller?.getFlashStatus(),
              builder: (context, snapshot) {
                // return Text('Flash: ${snapshot.data}');
                if (snapshot.data == null || snapshot.data == false) {
                  return const Icon(Icons.flash_on, color: Colors.white);
                } else {
                  return const Icon(Icons.flash_off, color: Colors.white);
                }
              },
            ),
            onPressed: () async {
              await widget.controller?.toggleFlash();
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}

Widget roundedIcon(icon, {required onPressed}) {
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

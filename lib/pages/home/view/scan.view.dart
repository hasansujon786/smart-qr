// import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../domain/qr_tools/qr_tools.dart' as qr_tools;
import '../../qr_result/qr_result.dart';
import '../widgets/widgets.dart';

class ScanView extends StatefulWidget {
  const ScanView({Key? key}) : super(key: key);

  @override
  State<ScanView> createState() => _ScanViewState();
}

class _ScanViewState extends State<ScanView> {
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  bool _foundQr = false;
  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      if (!_foundQr) {
        _foundQr = true;
        Future.delayed(const Duration(seconds: 2), () => _foundQr = false);

        _gotoResultPage(scanData.code, describeEnum(scanData.format));
      }
    });
  }

  void _gotoResultPage(String? result, String? format) {
    Navigator.restorablePushNamed(context, QrResultPage.routeName, arguments: <String, String?>{
      'code': result,
      'format': format,
    });
  }

  @override
  Widget build(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var scanArea = (width < 400 || height < 400) ? 250.0 : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart QR'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.flip_camera_ios),
          onPressed: () async {
            await controller?.flipCamera();
            setState(() {});
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.image),
            onPressed: () {
              qr_tools.parseFromImage((result, format) {
                if (result == null) return;
                _gotoResultPage(result, format);
              });
            },
          ),
          const SizedBox(width: 4)
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: Colors.red,
              borderRadius: 10,
              borderLength: 30,
              borderWidth: 10,
              cutOutSize: scanArea,
            ),
            onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
          ),
          CameraController(controller),
        ],
      ),
    );
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    // log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    controller!.pauseCamera();
    Future.delayed(const Duration(seconds: 1), (() {
      controller!.resumeCamera();
    }));
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

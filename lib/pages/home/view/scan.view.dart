import 'package:flutter/material.dart';

import '../../../domain/qr_tools/qr_tools.dart' as qr_tools;
import '../../qr_result/qr_result.dart';
import '../widgets/widgets.dart';

class ScanView extends StatefulWidget {
  const ScanView({Key? key}) : super(key: key);

  @override
  State<ScanView> createState() => _ScanViewState();
}

class _ScanViewState extends State<ScanView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Smart QR'),
        centerTitle: true,
        // leading: IconButton(
        //   icon: const Icon(Icons.menu),
        //   onPressed: () {},
        // ),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.image),
        //     onPressed: () {
        //       qr_tools.decodeFromImage().then((reslult) {
        //         if (reslult == null) return;
        //         Navigator.pushNamed(context, QrResultPage.routeName, arguments: {
        //           'qrcodeRawValue': reslult,
        //         });
        //       });
        //     },
        //   ),
        //   const SizedBox(width: 4)
        // ],
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 25),
        color: Colors.black,
        child: const Camera(),
      ),
    );
  }
}

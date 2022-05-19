import 'package:flutter/material.dart';

import '../widgets/widgets.dart';
import '../../../config/config.dart';

class ScanView extends StatelessWidget {
  const ScanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(appName),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 25),
        color: Colors.black,
        child: const Camera(),
      ),
    );
  }
}

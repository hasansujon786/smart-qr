import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class ScanView extends StatefulWidget {
  const ScanView({Key? key}) : super(key: key);

  @override
  State<ScanView> createState() => _ScanViewState();
}

class _ScanViewState extends State<ScanView> {

  @override
  Widget build(BuildContext context) {
    return const Camera();
  }
}

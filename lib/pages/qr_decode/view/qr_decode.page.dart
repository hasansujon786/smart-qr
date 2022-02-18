import 'package:flutter/material.dart';

class QrDecode extends StatelessWidget {
  const QrDecode({Key? key}) : super(key: key);

  static const routeName = '/qr_decode';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QrDecode'),
      ),
      body: const Center(
        child: Text('Hello World'),
      ),
    );
  }
}

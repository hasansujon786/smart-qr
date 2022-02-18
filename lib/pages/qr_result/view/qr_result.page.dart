import 'package:flutter/material.dart';

class QrResultPage extends StatelessWidget {
  const QrResultPage({Key? key}) : super(key: key);
  static const routeName = '/qr_result';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
    final code = args['code'] ?? '';
    final format = args['format'] ?? '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('ResultScreen'),
      ),
      body: Center(
        child: Expanded(
          flex: 1,
          child: Center(child: Text('Barcode Type: $format Data: $code')),
        ),
      ),
    );
  }
}


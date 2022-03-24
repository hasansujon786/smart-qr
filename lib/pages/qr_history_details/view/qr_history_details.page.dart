import 'package:flutter/material.dart';

import '../../../domain/qr_tools/qr_tools.dart' as qr_tools;
import '../../../models/models.dart';
import '../../../pages/qr_result/qr_result.dart';

class QrHistoryDetailsPage extends StatelessWidget {
  const QrHistoryDetailsPage({Key? key}) : super(key: key);

  static const routeName = '/qr_history_details';
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final hitory = args['history'] as QrHistory;
    final rawCode = hitory.rawValue;
    final qrcode = qr_tools.parse(rawCode);

    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Details'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context, true),
            icon: const Icon(Icons.delete),
          )
        ],
      ),
      body: ResultView(qrcode: qrcode, rawCode: rawCode),
    );
  }
}

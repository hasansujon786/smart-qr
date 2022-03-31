import 'package:flutter/material.dart';

import '../../../domain/qr_tools/qr_tools.dart' as qr_tools;
import '../../../pages/qr_result/qr_result.dart';

class QrHistoryDetailsPage extends StatelessWidget {
  const QrHistoryDetailsPage({Key? key}) : super(key: key);

  static const routeName = '/qr_history_details';
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final qrId = args['qr_id'] as String;
    final rawCode = args['rawcode'] as String;
    final isFavPage = args['is_fav_page'] as bool;
    final qrcode = qr_tools.parse(rawCode);

    return Scaffold(
      appBar: AppBar(
        title: Text(isFavPage ? 'QR Details' : 'QR History'),
        centerTitle: true,
        actions: [
          if (!isFavPage)
            IconButton(
              onPressed: () => Navigator.pop(context, true),
              icon: const Icon(Icons.delete),
            ),
          AddToFav(qrcode: qrcode, qrId: qrId)
        ],
      ),
      body: ResultView(qrcode: qrcode, rawCode: rawCode),
    );
  }
}
